---
layout: post
title:  "如何解决git squash merge冲突"
date:   2019-03-07 00:00:00 +0800
categories: gitlab
---

# 如何解决git squash merge冲突

## 背景

公司项目使用了git大仓库管理代码，同一个仓库下会有多个业务代码。平日里近百个开发在里面提交变更，为了保证master的commit记录整洁，就开启了‘Squash commits when merge request is accepted’。

当有多部门系统开发时，有时会出现多部门同时基于一个非稳定分支开发（为了保持快速业务迭代）。这里标记为：dev_base，在目录dev/app/base下coding。
当dev_base完成基础api开发，后部门A基于dev_base checkout一个分支：dev_a，在目录dev/app/a下coding，会引用dev/app/base的api。
后续dev_base和dev_a并行开发。

但是当dev_base开发完成，使用squash commits功能合并了master后。
这时dev_a合并master时，会在目录dev/app/base下存在大量冲突，然而他们从未变更过这个目录。

## 如何正确解决这个冲突：

先给出答案：

> git merge --squash dev_base
> git pull origin master
> git push origin dev_a  

## 这里发生了什么？
