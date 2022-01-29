---
layout: default
title:  "在golang中如何保障一个func只会执行一次"
date:   2022-01-29 00:00:00 +0800
categories: golang
---

# 在golang中如何保障一个func只会执行一次

## 背景

在项目开发中，会遇到这样的场景：

1. 使用单例模式初始化一些开销比较大的资源

遇到这样的问题时，打击第一个想法就是使用sync.Once或者atomic.Value



### 如何使用atomic保障原子执行

大家都知道atomic使用CAS机制保障了操作的原子性，那么使用cas能够保障func只执行一次吗？如下面示例：

```golang
package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

var (
	done uint32
	wg   sync.WaitGroup
)

func main() {
	wg.Add(2)
	go oncedo()
	go oncedo()
	wg.Wait()
}

func oncedo() {
	defer wg.Done()
	if atomic.CompareAndSwapUint32(&done, 0, 1) {
		f()
	}
}

func f() {
	fmt.Println("func run")
}
```

f()正常执行下这个逻辑是没有问题的。但是如果并发执行时，第一个抢到执行机会的goruntine在执行过程中f()，会导致后续的goroutine立即返回抢占失败；如果这里是初始化db链接，没有抢占到执行的函数返回后，业务还需要感知db是否可用。

那么能否保证所有的goroutine在返回时都能保证f()是被调用完成呢？可否使用sync.Once来保障？可以的话sync.Once又是如何处理的呢？

打开sync.Once的源码，我们可以看到它是用了两端提交的思想来保证的。

1. 首先，检查done是否已经执行过
2. 如果没有执行过，加锁执行f()
3. 后续goroutine进来后，如果f()未执行完成，会被mutex同步阻塞
4. 执行成功后，把done置为1，然后再释放锁

```go
func (o *Once) Do(f func()) {
	if atomic.LoadUint32(&o.done) == 0 {
		o.doSlow(f)
	}
}

func (o *Once) doSlow(f func()) {
	o.m.Lock()
	defer o.m.Unlock()
	if o.done == 0 {
		defer atomic.StoreUint32(&o.done, 1)
		f()
	}
}

```

