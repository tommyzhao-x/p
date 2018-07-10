---
layout: post
title:  "Java项目问题排查规则"
date:   2018-07-10 09:34:38 +0800
categories: mvn
---

## 问题分类

1. CPU占用率高
2. 内存泄露

## CPU占用率高

1. 在容器内执行top命令，找到cpu使用率高的pid
2. 执行top -pid xxx，查看当前pid2的具体信息
3. 按照cpu占用率排序，找到占有率最高的pid
4. 使用jstack pid打印当前java线程的执行情况
5. 命令行printf %0x pid2查看对应的16进制nid
6. 这jstack的thread dump中观察对应的栈信息

## 内存使用率高

1. jps -lvm找到当前容器运行的java线程
2. 找到对应问题的线程后执行，jmap -heap:format=b file=mem.bin pid
3. 使用mat或者jprofiler导入dump后，分析
4. 观察占用率较高的对象分布，基本可以确定问题
