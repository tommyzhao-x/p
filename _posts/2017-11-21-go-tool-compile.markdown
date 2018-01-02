---
layout: post
title:  "Golang compile tool"
date:   2017-11-21 20:34:38 +0800
categories: go
---

# Golang compile tool

## Command
go tool compile -m -importmap go-common/log=tlog/vendor/go-common/log -D /Users/tommy/work/src/tlog  -I /Users/tommy/work/pkg/darwin_amd64  -S  main.go > test/test1.s