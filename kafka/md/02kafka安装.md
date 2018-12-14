# 1  安装JDK



```
sudo rpm -ivh jdk-8u161-linux-x64.rpm
```

安装到/usr/java/jdk1.8.0_161目录下

修改系统环境变量文件
sudo vim /etc/profile

```
JAVA_HOME=/usr/java/jdk1.8.0_161
JRE_HOME=/usr/java/jdk1.8.0_161/jre
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export JAVA_HOME JRE_HOME PATH CLASSPATH
```

执行source /etc/profile

# 2  安装Zookeeper

​	可使用kafaka 自带的kafka

3  安装Kafka Server

a)  下载最新版http://kafka.apache.org/downloads

```
sudo wget http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.1.0/kafka_2.12-2.1.0.tgz

tar -zxf kafka_2.12-2.1.0.tgz

mv  kafka_2.12-2.1.0 kafka
```

b)  服务参数配置文件

```
############################## 服务基础配置 #############################
# kafka 的代理id。必须为每个代理设置一个唯一的整数。
broker.id=0
############################## kafka 网络通信设置 #############################
# 服务器用于接收来自网络的请求的线程数量，并向网络发送响应
num.network.threads=3
# 服务器用于处理请求的线程数量，可能包括磁盘输入流/输出流
num.io.threads=8
# 服务器使用的发送缓冲区(SNDBUF)大小
socket.send.buffer.bytes=102400
# 服务器使用的接收缓冲区(即RCVBUF)大小
socket.receive.buffer.bytes=102400
# 服务器将接受的请求的最大大小
socket.request.max.bytes=104857600
############################# 日志基础配置 #############################
# 指定用来存储 kafka 日志文件目录
log.dirs=/home/temp/kafka_logs
# 默认的分区数，如果设置过多的分区进行平行消费，会导致产生 brokers
num.partitions=1
# 在启动时用于日志恢复和关闭时刷新的每个数据目录的线程数
num.recovery.threads.per.data.dir=1
############################# 日志保留策略 #############################
# 一个日志文件保留的最小时长（单位：小时）
log.retention.hours=168
# kafka 日志段文件的最大大小。当达到这个大小时，将创建一个新的日志段
log.segment.bytes=1073741824
# 检查 kafka 产生日志段的时间间隔时长，以确定是否可以删除这些日志段
log.retention.check.interval.ms=300000
############################# Zookeeper 配置 #############################
# 设置对应的 ZK 服务器，格式为 Host:Port ，当有多个 ZK 服务时，使用逗号隔开
zookeeper.connect=192.168.78.141:2181
# 连接到 zookeeper 最大超时时长（单位：毫秒）
zookeeper.connection.timeout.ms=6000
############################# kafka 的组织协调器设置 #############################
# 设置延迟初始化消费平衡（单位：毫秒），这里设置为 0 便于测试
# 在实际生产环境中设置为 3 秒为适，这样，应用程序在启动时，有效的避免了不必要的再平衡
group.initial.rebalance.delay.ms=0

```



实际修改内容

```
# kafka 的服务监听 IP 和 端口
host.name=10.100.1.113
port=9092
#  kafka 日志存放目录
log.dirs=/home/temp/kafka_logs
# 修改 zookeeper IP 和 端口
zookeeper.connect=192.168.78.141:2181
```



c) 启动

先启动zookeeper，再启动kafka-server

```
zookeeper-server-start.sh -daemon config/zookeeper.properties
kafka-server-start.sh  config/server.properties
```

d)  停止

```
kafka-server-stop.sh  config/server.properties
zookeeper-server-stop.sh  config/server.properties
```



# 3   验证Kafka使用

1、创建一个主题

```
kafka-topics.sh --create --zookeeper 192.168.78.141:2181 --replication-factor 1 --partitions 1 --topic msg
```

2、查看所有创建主题

```
kafka-topics.sh --list --zookeeper 192.168.78.141:2181
```

3、删除主题 topic

```
kafka-topics.sh --delete --zookeeper 192.168.78.141:2181 --topic msg
```

4、使用 kafka producer 生产消息

```
kafka-console-producer.sh --broker-list 192.168.78.141:9092 --topic msg
```

5、使用 kafka consumer 消费消息

```
kafka-console-consumer.sh --zookeeper 192.168.78.141:2181 --topic msg --from-beginning 
```



参考：

1、kafka单机安装https://blog.csdn.net/Hello_World_QWP/article/details/79340295

2、kafka集群安装[https://blog.csdn.net/Hello_World_QWP/article/details/79340295]

