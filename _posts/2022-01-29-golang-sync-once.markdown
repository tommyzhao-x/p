---
layout: default
title:  "在golang中如何保障一个func只会执行一次"
date:   2021-01-29 00:00:00 +0800
categories: golang
---

# 在golang中如何保障一个func只会执行一次

## 背景

在项目开发中，会遇到这样的场景：

1. 使用单例模式初始化一些开销比较大的资源
2. 分布式锁

## 如何正确解决这个冲突：

先给出答案：

> git merge --squash dev_base   
> git pull origin master    
> git push origin dev_a 


## 这里发生了什么？

todo