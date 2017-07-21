---
layout: post
title:  "Kafka中有两种consumer接口"
date:   2017-04-27 20:34:38 +0800
categories: kafka
---

# Kafka consumer

Kafka中有两种consumer接口，分别为Low-level API和High-levelAPI

## Low-level API  SimpleConsumer
> 这套接口比较复杂的，使用者必须要考虑很多事情，优点就是对Kafka可以有完全的控制。  

## High-level API ZookeeperConsumerConnector
> High-level API使用比较简单，已经封装了对partition和offset的管理，默认是会定期自动commit offset，这样可能会丢数据的，因为consumer可能拿到数据没有处理完crash。 High-level API接口的特点，自动管理，使用简单，但是对Kafka的控制不够灵活。
