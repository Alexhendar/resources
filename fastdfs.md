---
typora-root-url: ./
---

# 1  FastDFS介绍

## 1.1  简介

> FastDFS is an open source high performance distributed file system (DFS). It's major functions include: file storing, file syncing and file accessing, and design for high capacity and load balance.

译文：FastDFS 是一个开源的高性能分布式文件系统（DFS）。 它的主要功能包括：文件存储，文件同步和文件访问，以及高容量和负载平衡

### 1.1.1  设计理念

	FastDFS是为互联网应用量身定做的分布式文件系统，充分考虑了冗余备份、负载均衡、线性扩容等机制，并注重高可用、高性能等指标。和现有的类Google FS分布式文件系统相比，FastDFS的架构和设计理念有其独到之处，主要体现在轻量级、分组方式和对等结构三个方面。



	主要解决了海量数据存储问题，特别适合以中小文件（建议范围：4KB < file_size <500MB）为载体的在线服务。
	
	FastDFS 系统有三个角色：跟踪服务器(Tracker Server)、存储服务器(Storage Server)和客户端(Client)。

　　**Tracker Server**：跟踪服务器，主要做调度工作，起到均衡的作用；负责管理所有的 storage server和 group，每个 storage 在启动后会连接 Tracker，告知自己所属 group 等信息，并保持周期性心跳。

　　**Storage Server**：存储服务器，主要提供容量和备份服务；以 group 为单位，每个 group 内可以有多台 storage server，数据互为备份。

　　**Client**：客户端，上传下载数据的服务器，也就是我们自己的项目所部署在的服务器。

![fastdfsarchitect](/imgs/fastdfs/fastdfsarchitect.png)

## 1.2  FastDFS的存储策略

	为了支持大容量，存储节点（服务器）采用了分卷（或分组）的组织方式。存储系统由一个或多个卷组成，卷与卷之间的文件是相互独立的，所有卷的文件容量累加就是整个存储系统中的文件容量。一个卷可以由一台或多台存储服务器组成，一个卷下的存储服务器中的文件都是相同的，卷中的多台存储服务器起到了冗余备份和负载均衡的作用。
	
	在卷中增加服务器时，同步已有的文件由系统自动完成，同步完成后，系统自动将新增服务器切换到线上提供服务。当存储空间不足或即将耗尽时，可以动态添加卷。只需要增加一台或多台服务器，并将它们配置为一个新的卷，这样就扩大了存储系统的容量。

## 1.3  FastDFS的上传过程

	FastDFS向使用者提供基本文件访问接口，比如upload、download、append、delete等，以客户端库的方式提供给用户使用。
	
	Storage Server会定期的向Tracker Server发送自己的存储信息。当Tracker Server Cluster中的Tracker Server不止一个时，各个Tracker之间的关系是对等的，所以客户端上传时可以选择任意一个Tracker。
	
	当Tracker收到客户端上传文件的请求时，会为该文件分配一个可以存储文件的group，当选定了group后就要决定给客户端分配group中的哪一个storage server。当分配好storage server后，客户端向storage发送写文件请求，storage将会为文件分配一个数据存储目录。然后为文件分配一个fileid，最后根据以上的信息生成文件名存储文件。

![fastdfsuploadprocess](/imgs/fastdfs/fastdfsuploadprocess.png)

## 1.4  FastDFS的文件同步

	写文件时，客户端将文件写至group内一个storage server即认为写文件成功，storage server写完文件后，会由后台线程将文件同步至同group内其他的storage server。
	
	每个storage写文件后，同时会写一份binlog，binlog里不包含文件数据，只包含文件名等元信息，这份binlog用于后台同步，storage会记录向group内其他storage同步的进度，以便重启后能接上次的进度继续同步；进度以时间戳的方式进行记录，所以最好能保证集群内所有server的时钟保持同步。
	
	storage的同步进度会作为元数据的一部分汇报到tracker上，tracke在选择读storage的时候会以同步进度作为参考。

## 1.5  FastDFS的文件下载

	客户端uploadfile成功后，会拿到一个storage生成的文件名，接下来客户端根据这个文件名即可访问到该文件。

![fastdfsdownloadprocess](/imgs/fastdfs/fastdfsdownloadprocess.png)

	跟upload file一样，在downloadfile时客户端可以选择任意tracker server。tracker发送download请求给某个tracker，必须带上文件名信息，tracke从文件名中解析出文件的group、大小、创建时间等信息，然后为该请求选择一个storage用来服务读请求。

# 2  安装FastDFS环境

## 2.1  前言

	操作环境：CentOS7 X64，以下操作都是单机环境。
	
	先做一件事，修改hosts，将文件服务器的ip与域名映射(单机TrackerServer环境)，因为后面很多配置里面都需要去配置服务器地址，ip变了，就只需要修改hosts即可。

```
# vim /etc/hosts

增加如下一行，这是我的IP
192.168.51.128 file.ljzsg.com

如果要本机访问虚拟机，在C:\Windows\System32\drivers\etc\hosts中同样增加一行
```

## 2.2  下载安装 libfastcommon

	libfastcommon是从 FastDFS 和 FastDHT 中提取出来的公共 C 函数库，基础环境，安装即可 。

1、下载libfastcommon

```
sudo wget https://github.com/happyfish100/libfastcommon/archive/V1.0.39.tar.gz
```

2、解压

```
sudo tar zxvf V1.0.39.tar.gz
cd libfastcommon-1.0.39
```

3、编译、安装

```
sudo  ./make.sh
sudo ./make.sh install
```

4、libfastcommon.so 安装到了/usr/lib64/libfastcommon.so，但是FastDFS主程序设置的lib目录是/usr/local/lib，所以需要创建软链接。

```
sudo ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so
sudo ln -s /usr/lib64/libfastcommon.so /usr/lib/libfastcommon.so
sudo ln -s /usr/lib64/libfdfsclient.so /usr/local/lib/libfdfsclient.so
sudo ln -s /usr/lib64/libfdfsclient.so /usr/lib/libfdfsclient.so
```

## 2.3  下载安装FastDFS

1、下载FastDFS

```
sudo wget https://github.com/happyfish100/fastdfs/archive/V5.11.tar.gz
```

2、解压

```
sudo tar -zxvf V5.11.tar.gz
cd fastdfs-5.11
```

3、编译、安装

```
sudo ./make.sh
sudo ./make.sh install
```

4、默认安装方式安装后的相应文件与目录

	A、服务脚本

```
执行脚本
sudo cp init.d/* /etc/init.d/

/etc/init.d/fdfs_storaged
/etc/init.d/fdfs_tracker
```

	B、配置文件（这三个是作者给的样例配置文件） :

```
/etc/fdfs/client.conf.sample
/etc/fdfs/storage.conf.sample
/etc/fdfs/tracker.conf.sample
```

	C、命令工具在 /usr/bin/ 目录下：

```
fdfs_appender_test
fdfs_appender_test1
fdfs_append_file
fdfs_crc32
fdfs_delete_file
fdfs_download_file
fdfs_file_info
fdfs_monitor
fdfs_storaged
fdfs_test
fdfs_test1
fdfs_trackerd
fdfs_upload_appender
fdfs_upload_file
stop.sh
restart.sh
```

5、FastDFS 服务脚本设置的 bin 目录是 /usr/local/bin， 但实际命令安装在 /usr/bin/ 下。

	两种方式：

　　A、 一是修改FastDFS 服务脚本中相应的命令路径，也就是把 /etc/init.d/fdfs_storaged 和 /etc/init.d/fdfs_tracker 两个脚本中的 /usr/local/bin 修改成 /usr/bin。

```
vim fdfs_trackerd
```

	使用查找替换命令进统一修改:%s+/usr/local/bin+/usr/bin

```
vim fdfs_storaged
```

　　　　使用查找替换命令进统一修改:%s+/usr/local/bin+/usr/bin

	B、二是建立 /usr/bin 到 /usr/local/bin 的软链接，我是用这种方式。

```
# ln -s /usr/bin/fdfs_trackerd   /usr/local/bin
# ln -s /usr/bin/fdfs_storaged   /usr/local/bin
# ln -s /usr/bin/stop.sh         /usr/local/bin
# ln -s /usr/bin/restart.sh      /usr/local/bin
```



## 2.4  配置FastDFS跟踪器(Tracker)

配置文件详细说明参考：[FastDFS 配置文件详解](http://bbs.chinaunix.net/forum.php?mod=viewthread&tid=1941456&extra=page%3D1%26filter%3Ddigest%26digest%3D1)

1、 进入 /etc/fdfs，复制 FastDFS 跟踪器样例配置文件 tracker.conf.sample，并重命名为 tracker.conf。

```
# cd /etc/fdfs
# cp tracker.conf.sample tracker.conf
# vim tracker.conf
```

2、编辑tracker.conf ，标红的需要修改下，其它的默认即可。

```
# 配置文件是否不生效，false 为生效
disabled=false

# 提供服务的端口
port=22122

# Tracker 数据和日志目录地址(根目录必须存在,子目录会自动创建)
base_path=/home/zjy/fastdfs/tracker

# HTTP 服务端口
http.server_port=80
```

3、创建tracker基础数据目录，即base_path对应的目录

```
mkdir -p /home/zjy/fastdfs/tracker
```

4、防火墙中打开跟踪端口（默认的22122）

```
# vim /etc/sysconfig/iptables

添加如下端口行：
-A INPUT -m state --state NEW -m tcp -p tcp --dport 22122 -j ACCEPT

重启防火墙：
# service iptables restart
```

5、启动Tracker

初次成功启动，会在 /ljzsg/fdfsdfs/tracker/ (配置的base_path)下创建 data、logs 两个目录。

```
可以用这种方式启动
# /etc/init.d/fdfs_trackerd start

也可以用这种方式启动，前提是上面创建了软链接，后面都用这种方式
# service fdfs_trackerd start
```

查看 FastDFS Tracker 是否已成功启动 ，22122端口正在被监听，则算是Tracker服务安装成功。

```
# netstat -unltp|grep fdfs
```

> 补充截图

关闭Tracker命令：

```

```

6、设置Tracker开机启动

```

```

7、tracker server 目录及文件结构 

Tracker服务启动成功后，会在base_path下创建data、logs两个目录。目录结构如下：

```
${base_path}
  |__data
  |   |__storage_groups.dat：存储分组信息
  |   |__storage_servers.dat：存储服务器列表
  |__logs
  |   |__trackerd.log： tracker server 日志文件
```





**同步机制**

•采用binlog文件记录更新操作，根据binlog进行文件同步

•同一组内的storage server之间是对等的，文件上传、删除等操作可以在任意一台storage server上进行；

•文件同步只在同组内的storage server之间进行，采用push方式，即源服务器同步给目标服务器；

•源头数据才需要同步，备份数据不需要再次同步，否则就构成环路了；

•上述第二条规则有个例外，就是新增加一台storage server时，由已有的一台storage server将已有的所有数据（包括源头数据和备份数据）同步给该新增服务器。

Storage server中由专门的线程根据binlog进行文件同步。为了最大程度地避免相互影响以及出于系统简洁性考虑，Storage server对组内除自己以外的每台服务器都会启动一个线程来进行文件同步。

文件同步采用增量同步方式，系统记录已同步的位置（binlog文件偏移量）到标识文件中。标识文件名格式：{dest storage IP}_{port}.mark，例如：192.168.1.14_23000.mark。



**文件同步延迟部分没看懂**



**分组存储**

FastDFS采用了分组存储方式。集群由一个或多个组构成，集群存储总容量为集群中所有组的存储容量之和。一个组由一台或多台存储服务器组成，同组内的多台Storage server之间是互备关系，同组存储服务器上的文件是完全一致的。文件上传、下载、删除等操作可以在组内任意一台Storage server上进行。类似木桶短板效应，一个组的存储容量为该组内存储服务器容量最小的那个，由此可见组内存储服务器的软硬件配置最好是一致的。

采用分组存储方式的好处是灵活、可控性较强。比如上传文件时，可以由客户端直接指定上传到的组。一个分组的存储服务器访问压力较大时，可以在该组增加存储服务器来扩充服务能力（纵向扩容）。当系统容量不足时，可以增加组来扩充存储容量（横向扩容）。采用这样的分组存储方式，可以使用FastDFS对文件进行管理，使用主流的Web server如Apache、nginx等进行文件下载。

**对等结构**

FastDFS集群中的Tracker server也可以有多台，Tracker server和Storage server均不存在单点问题。Tracker server之间是对等关系，组内的Storage server之间也是对等关系。传统的Master-Slave结构中的Master是单点，写操作仅针对Master。如果Master失效，需要将Slave提升为Master，实现逻辑会比较复杂。和Master-Slave结构相比，对等结构中所有结点的地位是相同的，每个结点都是Master，不存在单点问题。



**小文件合并存储**

将[小文件合并存储](http://blog.yunnotes.net/index.php/losf_problem/)主要解决如下几个问题：

```
1. 本地文件系统inode数量有限，从而存储的小文件数量也就受到限制。 2. 多级目录+目录里很多文件，导致访问文件的开销很大（可能导致很多次IO） 3. 按小文件存储，备份与恢复的效率低
```

FastDFS在V3.0版本里[引入小文件合并存储](http://www.open-open.com/doc/view/ab5701d57e5b49a8b6255df1ae7d5a97)的机制，可将多个小文件存储到一个大的文件（trunk file），为了支持这个机制，FastDFS生成的文件fileid需要额外增加16个字节

```
1. trunk file id 2. 文件在trunk file内部的offset 3. 文件占用的存储空间大小 （字节对齐及删除空间复用，文件占用存储空间>=文件大小）
```

每个trunk file由一个id唯一标识，trunk file由group内的trunk server负责创建（trunk server是tracker选出来的），并同步到group内其他的storage，文件存储合并存储到trunk file后，根据其offset就能从trunk file读取到文件。

文件在trunk file内的offset编码到文件名，决定了其在trunk file内的位置是不能更改的，也就不能通过compact的方式回收trunk file内删除文件的空间。但当trunk file内有文件删除时，其删除的空间是可以被复用的，比如一个100KB的文件被删除，接下来存储一个99KB的文件就可以直接复用这片删除的存储空间。

**HTTP访问支持**

FastDFS的tracker和storage都内置了http协议的支持，客户端可以通过http协议来下载文件，tracker在接收到请求时，通过http的redirect机制将请求重定向至文件所在的storage上；除了内置的http协议外，FastDFS还提供了通过[apache或nginx扩展模块](http://wenku.baidu.com/view/145b4d6ab84ae45c3b358c57)下载文件的支持。

![fastdfs_http](/imgs/fastdfs/fastdfs_http.jpg)

**其他特性**

FastDFS提供了设置/获取文件扩展属性的接口（setmeta/getmeta)，扩展属性以key-value对的方式存储在storage上的同名文件（拥有特殊的前缀或后缀），比如/group/M00/00/01/some_file为原始文件，则该文件的扩展属性存储在/group/M00/00/01/.some_file.meta文件（真实情况不一定是这样，但机制类似），这样根据文件名就能定位到存储扩展属性的文件。

以上两个接口作者不建议使用，额外的meta文件会进一步“放大”海量小文件存储问题，同时由于meta非常小，其存储空间利用率也不高，比如100bytes的meta文件也需要占用4K（block_size）的存储空间。

FastDFS还提供appender file的支持，通过upload_appender_file接口存储，appender file允许在创建后，对该文件进行append操作。实际上，appender file与普通文件的存储方式是相同的，不同的是，appender file不能被合并存储到trunk file。

**问题讨论**

从FastDFS的整个设计看，基本上都已简单为原则。比如以机器为单位备份数据，简化了tracker的管理工作；storage直接借助本地文件系统原样存储文件，简化了storage的管理工作；文件写单份到storage即为成功、然后后台同步，简化了写文件流程。但简单的方案能解决的问题通常也有限，FastDFS目前尚存在如下问题（欢迎探讨）。

数据安全性

- 写一份即成功：从源storage写完文件至同步到组内其他storage的时间窗口内，一旦源storage出现故障，就可能导致用户数据丢失，而数据的丢失对存储系统来说通常是不可接受的。
- 缺乏自动化恢复机制：当storage的某块磁盘故障时，只能换存磁盘，然后手动恢复数据；由于按机器备份，似乎也不可能有自动化恢复机制，除非有预先准备好的热备磁盘，缺乏自动化恢复机制会增加系统运维工作。
- 数据恢复效率低：恢复数据时，只能从group内其他的storage读取，同时由于小文件的访问效率本身较低，按文件恢复的效率也会很低，低的恢复效率也就意味着数据处于不安全状态的时间更长。
- 缺乏多机房容灾支持：目前要做多机房容灾，只能额外做工具来将数据同步到备份的集群，无自动化机制。

存储空间利用率

- 单机存储的文件数受限于inode数量
- 每个文件对应一个storage本地文件系统的文件，平均每个文件会存在block_size/2的存储空间浪费。
- 文件合并存储能有效解决上述两个问题，但由于合并存储没有空间回收机制，删除文件的空间不保证一定能复用，也存在空间浪费的问题

负载均衡

- group机制本身可用来做负载均衡，但这只是一种静态的负载均衡机制，需要预先知道应用的访问特性；同时group机制也导致不可能在group之间迁移数据来做动态负载均衡。



参考：

1、[用FastDFS一步步搭建文件管理系统](https://www.cnblogs.com/chiangchou/p/fastdfs.html)

2、[FASTDFS](https://www.jianshu.com/p/1c71ae024e5e)

3、https://github.com/happyfish100/fastdfs

4、[分布式文件系统FastDFS架构剖析](http://history.programmer.com.cn/4380/)

5、[分布式文件系统FastDFS设计原理](http://blog.chinaunix.net/uid-20196318-id-4058561.html)

6、[分布式文件系统FastDFS架构剖析](http://history.programmer.com.cn/4380/)

7、https://github.com/hellmonky/note/blob/master/%E9%9A%8F%E7%AC%94/fastDFS%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.md





