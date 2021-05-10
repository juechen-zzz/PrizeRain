# 红包雨

> 模拟企业年会下的红包雨场景，设计一套红包雨项目，在某段时间内随机发放不同的礼品

## 一、系统描述及要求

**并发性：**

* 抽奖系统比如涉及到访问量大的问题。系统涉及所面临的第一关。怎样设计系统以达到如此高并发情况下的及时响应是本项目的重中之重。

**库存控制：**

* 抽奖面临的必然是奖品。数量控制是必须要做到精准吻合。不允许出现设置了5个奖品，最终6人中奖这种类似的问题出现。其中的本质是奖品库存的控制。

**投放策略：**

* 在活动时间段内，管理员设置好的一堆奖品如何投放？红包何时出现？年会奖品什么时候可以被抽中？这些都涉及到投放策略。 

**边界控制：**

* 活动何时开始？何时结束？倒计时如何控制。这涉及到活动的边界。开始前要提防用户提前进入抽奖。结束后要及时反馈结果给用户，告知活动已结束。

**活动自由配置：**

* 活动的配置由后台管理员完成，可以自由配置活动的开始结束时间，主题、活动简介、有哪些奖品、不同等级的用户中奖的策略。这就要求系统必须具备足够的业务灵活度。

**中奖策略：**

* 每个用户参与抽奖后，要遵从后台管理员所设定的中奖策略，典型的场景是针对用户设置最大中奖数。一旦用户中奖后，要进入计数，达到最大中奖数后，即使活动未结束，用户继续参与，也不能再让其中奖。而是将奖品机会倾向于其他参与者。下面的章节中会为大家展示如何根据后台策略精确控制用户中奖数量。



## 二、中间件

### 2.1 zookeeper

> Zookeeper是一个分布式服务框架，是Apache Hadoop的一个子项目，主要是用来解决分布式应用中经常遇到的一些数据管理问题。如：统一命名服务、状态同步服务、集群管理、分布式应用配置项的管理等。

**节点类型**

* 临时节点：临时节点的生命周期和客户端会话绑定在一起，客户端会话失效，则这个节点就会被自动清除
* 永久节点：该数据节点被创建后，就会一直存在于zookeeper服务器上，直到有删除操作来主动删除这个节点。

**使用场景**

* 配置中心：将配置数据写到zk节点上，供各个分布式机器获取配置，同时监听自己对应的节点，实现配置信息的集中式管理和动态更新。
* 命名服务：在分布式系统中，通过使用命名服务
	* 客户端应用能够根据指定名字来获取资源或服务的地址、提供者信息。
	* 被命名的实体通常可以是集群中的机器，提供的服务地址、远程对象等，这些都可以统称为名字（Name）。
	* 通过调用zk提供的创建节点的API，能够创建一个全局唯一的path，这个path就可以称为一个名称。
* 分布式通知：zk的watcher注册与异步通知机制，能够很好的实现分布式环境下不同系统之间的通知与协调，实现对数据变更的实时处理。不同系统都对zk上同一个znode进行注册，监听znode的变化（包括znode本身内容及子节点的），其中一个系统update了znode，那么另一个系统能够收到通知，并作出相应处理。
* 选主：利用zk的一致性，能保证高并发场景下节点创建的全局唯一性。即，同时有多个客户端请求创建/currentMaster节点，最终一定只有一个客户端请求能够创建成功。利用这个特性，就能很轻松的在分布式环境中进行集群选取。
* 分布式锁：zk保证了数据的一致性，主要得益于zk的节点创建和事件监听机制。锁服务可以分为两类，一个是保持独占，另一个是控制时序。 

**高可用**

集群与选主：以5台机器启动时场景为主，过程如下：

1. 服务器1启动，此时只有它一台服务器启动了，它发出去的报没有任何响应，所以它的选举状态一直是LOOKING状态。
2. 服务器2启动，它与最开始启动的服务器1进行通信，互相交换自己的选举结果，由于两者都没有历史数据，所以id值较大的服务器2胜出，但是由于没有达到超过半数以上的服务器都同意选举它（这个例子中的半数以上是3），所以服务器1，2还是继续保持LOOKING状态。
3. 服务器3启动，根据前面的理论分析，服务器3成为服务器1，2，3中的老大，而与上面不同的是，此时有三台服务器选举了它，所以它成为了这次选举的leader。
4. 服务器4启动，根据前面的分析，理论上服务器4应该是服务器1，2，3，4中最大的，但是由于前面已经有半数以上的服务器选举了服务器3，状态是following，所以它只能接收当小弟的命了。
5. 服务器5启动，同4一样，当小弟。

 

### 2.2 nginx

> Nginx是一款轻量级的Web服务器/反向代理服务器及电子邮件(IMAP/POP3)代理服务器，在BSD-like协议下发行。特点是占用内存少，并发能力强。

**动静分离**

<img src="http://static.komorebi.top/image-20210412183516801.png" alt="image-20210412183516801" style="zoom:50%;" />

* 静态资源：由Nginx作为web服务器身份，直接返回
* 动态资源：Nginx将请求转发出去，交给后端应用服务器处理

**负载均衡**

​		当并发量较高时，需要多台服务器集群提升并行处理能力。



## 三、系统设计

<img src="http://static.komorebi.top/image-20210420192732052.png" alt="image-20210420192732052" style="zoom:50%;" />

### 3.1 数据库设计

1. 会员表（card_user）
	![image-20210420194003114](http://static.komorebi.top/image-20210420194003114.png)

2. 奖品表（card_product）
	![image-20210420201216486](http://static.komorebi.top/image-20210420201216486.png)

3. 活动表（card_game）
	![image-20210420201918118](http://static.komorebi.top/image-20210420201918118.png)

4. 活动-奖品关联表（card_game_product）
	![image-20210420203410610](http://static.komorebi.top/image-20210420203410610.png)

5. 规则表（card_game_rules）
	![image-20210420203510793](http://static.komorebi.top/image-20210420203510793.png)

6. 用户-活动关联表（card_user_game）
	![image-20210420203546318](http://static.komorebi.top/image-20210420203546318.png)

7. 用户-中奖记录表（card_user_hit）
	![image-20210420203908137](http://static.komorebi.top/image-20210420203908137.png)

8. 新建五个视图，后续使用

	```sql
	-- view_game_productnum
	select `c`.`gameid` AS `gameid`,sum(`c`.`amount`) AS `num` from `card_game_product` `c` group by `c`.`gameid`
	-- view_user_hitnum
	select `h`.`userid` AS `userid`,count(`h`.`id`) AS `num` from `card_user_hit` `h` group by `h`.`userid`
	-- view_game_hitnum
	select `h`.`gameid` AS `gameid`,count(`h`.`id`) AS `num` from `card_user_hit` `h` group by `h`.`gameid`
	-- view_game_curinfo
	select `g`.`id` AS `id`,`g`.`title` AS `title`,`g`.`starttime` AS `starttime`,`g`.`endtime` AS `endtime`,`sd2`.`dict_value` AS `type`,`cgp`.`num` AS `total`,`h`.`num` AS `hit` from (((`card_game` `g` left join `view_game_productnum` `cgp` on((`g`.`id` = `cgp`.`gameid`))) left join `view_game_hitnum` `h` on((`g`.`id` = `h`.`gameid`))) join `sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = 'card_game_type'))))
	-- view_card_user_hit
	select `h`.`id` AS `id`,`g`.`title` AS `title`,`sd2`.`dict_value` AS `type`,`u`.`uname` AS `uname`,`u`.`realname` AS `realname`,`u`.`idcard` AS `idcard`,`u`.`phone` AS `phone`,`sd1`.`dict_value` AS `level`,`p`.`name` AS `name`,`p`.`price` AS `price`,`h`.`gameid` AS `gameid`,`h`.`userid` AS `userid`,`h`.`productid` AS `productid`,`h`.`hittime` AS `hittime` from (((((`card_game` `g` join `card_product` `p`) join `card_user` `u`) join `card_user_hit` `h`) join `sys_dict` `sd1` on(((`u`.`level` = `sd1`.`dict_key`) and (`sd1`.`dict_type` = 'card_user_level')))) join `sys_dict` `sd2` on(((`g`.`type` = `sd2`.`dict_key`) and (`sd2`.`dict_type` = 'card_game_type')))) where ((`h`.`gameid` = `g`.`id`) and (`h`.`userid` = `u`.`id`) and (`h`.`productid` = `p`.`id`))
	```

9. 创建字典表（sys_dict）
	![image-20210420211345192](http://static.komorebi.top/image-20210420211345192.png)

10. 录入字典表
	![image-20210420212029481](http://static.komorebi.top/image-20210420212029481.png)

11. 日志表（sys_oplog）
	![image-20210421163521126](http://static.komorebi.top/image-20210421163521126.png)



### 3.2 系统概要

<img src="http://static.komorebi.top/image-20210426191152044.png" alt="image-20210426191152044" style="zoom: 50%;" />



### 3.3 软件架构

<img src="http://static.komorebi.top/image-20210426191533586.png" alt="image-20210426191533586" style="zoom:50%;" />

1. 动静分离
	1. 静态文件分离，Nginx直接响应，不用再绕后台应用机器
2. 微服务化
	1. 将模块细粒度拆分，微服务化
	2. 借助Docker swarm的容器管理功能，实现不同服务的副本部署，滚动更新
	3. 部署3份api，以适应前端的高并发
3. 负载均衡
	1. 多个实例之间通过Nginx做负载均衡，提升并发性能
	2. 项目展示的模块部署在一台节点，生产环境涉及多态机器，用upstream实现
4. 异步消息
	1. 中奖后，中奖人及奖品信息持久化到数据库。引入RabbitMQ，将抽奖操作与数据库操作异步隔离
	2. 中奖后，只需要将中奖信息放入RabbitMQ，并立即返回中奖信息给前端用户
	3. 后端msg模块消费RabbitMQ消息，缓慢处理
5. 缓存预热
	1. 每隔一分钟扫描一次活动表，查询未来一分钟内将要开始的活动
	2. 将扫到的活动加载进Redis，包括活动详细信息、中奖策略信息、奖品信息和抽奖令牌

### 3.4 交互序列图

![image-20210430152104885](http://static.komorebi.top/image-20210430152104885.png)

### 3.5 Redis缓存体系

缓存体系概览图

![image-20210430153655018](http://static.komorebi.top/image-20210430153655018.png)

1. 活动基本信息（k-v，以活动ID为key，活动对象为value，永不超时）

	```java
	redisUtil.set(RedisKeys.INFO + game.getId(), game, -1);
	```

2. 活动策略信息（hash，以活动ID为key，用户等级为field，策略值为value）

	```java
	redisUtil.hset(RedisKeys.MAXGOAL + game.getId(), r.getUserLevel() + "", r.getGoalTimes());
	redisUtil.hset(RedisKeys.MAXEnter + game.getId(), r.getUserLevel() + "", r.getEnterTimes());
	```

3. 抽奖令牌桶（双端队列，以活动ID为key，在活动时间段内，随机生成时间戳做令牌，从小到大排序后从右侧入队）

	```java
	redisUtil.rightPushAll(RedisKeys.TOKENS + game.getId(), tokenList);
	```

4. 奖品映射信息（k-v，以活动ID_令牌为key，奖品信息为value。如果令牌有效，则用令牌token值，获取奖品详细信息）

	```java
	redisUtil.set(RedisKeys.TOKEN + game.getId() + "_" + token, productMap.get(cgp.getProductid()), expire);
	```

5. 令牌设计技巧
	若时间间隔太短，奖品数量太多，会可能产生重复时间戳
	**解决方案：额外再附加一个随机因子，将（时间戳 * 1000 + 3位随机数）作为令牌**。抽奖时再除以1000还原时间戳。

	```java
	long duration = end - start;
	long rnd = start + new Random().nextInt((int)duration);
	long token = rnd * 1000 + new Random().nextInt(999);
	```

6. 中奖计数（k-v，以活动id_用户id作为key，中奖数为value，利用redis原子性，中奖后incr增加计数）

	```java
	redisUtil.incr(RedisKeys.USERHIT + gameId + "_" + user.getId(), 1);
	```

7. 中奖逻辑判断：抽奖时，从令牌桶左侧出队和当前时间比较，如果令牌时间戳小于等于当前时间，令牌有效，表示中奖。大于当前时间，则令牌无效，将令牌还回，从左侧压入队列

