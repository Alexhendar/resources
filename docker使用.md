# 1  Docker介绍

## 1.1  什么是Docker

	Docker 是一个开源项目， 诞生于 2013 年初， 最初是 dotCloud 公司内部的一个业余项目。 它基于 Google公司推出的 Go 语言实现。 项目后来加入了 Linux 基金会， 遵从了 Apache 2.0 协议， 项目代码在 GitHub上进行维护。
	Docker 自开源后受到广泛的关注和讨论， 以至于 dotCloud 公司后来都改名为 Docker Inc。 Redhat 已经在其 RHEL6.5 中集中支持 Docker；Google 也在其 PaaS 产品中广泛应用。
	Docker 项目的目标是实现轻量级的操作系统虚拟化解决方案。 Docker 的基础是 Linux 容器（LXC） 等技术。在 LXC 的基础上 Docker 进行了进一步的封装， 让用户不需要去关心容器的管理， 使得操作更为简便。 用户操作 Docker 的容器就像操作一个快速轻量级的虚拟机一样简单。下面的图片比较了 Docker 和传统虚拟化方式的不同之处， 可见容器是在操作系统层面上实现虚拟化， 直接复用本地主机的操作系统， 而传统方式则是在硬件层面实现。

![docker_vms](imgs/docker/docker_vms.png)



	Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。



## 1.2 为什么要使用Docker

	作为一种新兴的虚拟化方式， Docker 跟传统的虚拟化方式相比具有众多的优势。
	首先， Docker 容器的启动可以在秒级实现， 这相比传统的虚拟机方式要快得多。 
	其次， Docker 对系统资源的利用率很高， 一台主机上可以同时运行数千个 Docker 容器。容器除了运行其中应用外， 基本不消耗额外的系统资源， 使得应用的性能很高， 同时系统的开销尽量小。
	传统虚拟机方式运行 10 个不同的应用就要起 10 个虚拟机， 而Docker 只需要启动 10 个隔离的应用即可。
具体说来， Docker 在如下几个方面具有较大的优势。

	1、更快速的交付和部署  
	
	对开发和运维（devop） 人员来说， 最希望的就是一次创建或配置， 可以在任意地方正常运行。开发者可以使用一个标准的镜像来构建一套开发容器， 开发完成之后， 运维人员可以直接使用这个容器来部署代码。 Docker 可以快速创建容器， 快速迭代应用程序， 并让整个过程全程可见， 使团队中的其他成员更容易理解应用程序是如何创建和工作的。 Docker 容器很轻很快！容器的启动时间是秒级的， 大量地节约开发、 测试、 部署的时间。
	
	2、更高效的虚拟化
	
	Docker 容器的运行不需要额外的 hypervisor 支持， 它是内核级的虚拟化， 因此可以实现更高的性能和效率。
	
	3、更轻松的迁移和扩展
	
	Docker 容器几乎可以在任意的平台上运行， 包括物理机、 虚拟机、 公有云、 私有云、 个人电脑、 服务器等。 这种兼容性可以让用户把一个应用程序从一个平台直接迁移到另外一个。
	
	4、更简单的管理
	
	使用 Docker， 只需要小小的修改， 就可以替代以往大量的更新工作。 所有的修改都以增量的方式被分发和更新， 从而实现自动化并且高效的管理。
	
	对比传统虚拟机总结  

| 特性       | 容器               | 虚拟机     |
| ---------- | ------------------ | ---------- |
| 启动       | 秒级               | 分钟级     |
| 硬盘使用   | 一般为 MB          | 一般为 GB  |
| 性能       | 接近原生           | 弱于       |
| 系统支持量 | 单机支持上千个容器 | 一般几十个 |

## 1.3  基本概念

Docker 包括三个基本概念 

> 1. 镜像（Image） 
> 2. 容器（Container） 
> 3. 仓库（Repository） 

理解了这三个概念， 就理解了 Docker 的整个生命周期  

### 1.3.1 Docker 镜像  

	Docker 镜像就是一个只读的模板。 
	
	例如：一个镜像可以包含一个完整的 ubuntu 操作系统环境， 里面仅安装了 Apache 或用户需要的其它应用 程序。 
	
	镜像可以用来创建 Docker 容器。 Docker 提供了一个很简单的机制来创建镜像或者更新现有的镜像， 用户甚至可以直接从其他人那里下载一 个已经做好的镜像来直接使用。  

### 1.3.2  Docker 容器  

	Docker 利用容器来运行应用。 
	
	容器是从镜像创建的运行实例。 它可以被启动、 开始、 停止、 删除。 每个容器都是相互隔离的、 保证安全 的平台。 
	
	可以把容器看做是一个简易版的 Linux 环境（包括root用户权限、 进程空间、 用户空间和网络空间等） 和运 行在其中的应用程序。 

*注：镜像是只读的， 容器在启动的时候创建一层可写层作为最上层。  

### 1.3.3 Docker 仓库  

	仓库是集中存放镜像文件的场所。 有时候会把仓库和仓库注册服务器（Registry） 混为一谈， 并不严格区 分。 实际上， 仓库注册服务器上往往存放着多个仓库， 每个仓库中又包含了多个镜像， 每个镜像有不同的 标签（tag） 。 
	
	仓库分为公开仓库（Public） 和私有仓库（Private） 两种形式。 
	
	最大的公开仓库是 Docker Hub， 存放了数量庞大的镜像供用户下载。 国内的公开仓库包括 Docker Pool 等， 可以提供大陆用户更稳定快速的访问。 
	
	当然， 用户也可以在本地网络内创建一个私有仓库。 当用户创建了自己的镜像之后就可以使用 push 命令将它上传到公有或者私有仓库， 这样下次在另外一台 机器上使用这个镜像时候， 只需要从仓库上 pull 下来就可以了。 
	
	*注：Docker 仓库的概念跟 Git 类似， 注册服务器可以理解为 GitHub 这样的托管服务。  

# 2、安装

	官方网站上有各种环境下的 安装指南， 这里主要介绍下CentOS7的安装。  

## 2.1  yum安装

step 1: 安装必要的一些系统工具

```
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
```

Step 2: 添加软件源信息

```
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
```

Step 3: 更新并安装 Docker-CE

```
sudo yum makecache fast
sudo yum -y install docker-ce
```

Step 4: 开启Docker服务

```
sudo systemctl start docker
```

Step 5:  验证

```
sudo docker info


Containers: 0
 Running: 0
 Paused: 0
 Stopped: 0
Images: 0
Server Version: 18.06.1-ce
Storage Driver: overlay2
 Backing Filesystem: xfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 468a545b9edcd5932818eb9de8e72413e616e86e
runc version: 69663f0bd4b60df09991c08812a60108003fa340
init version: fec3683
Security Options:
 seccomp
  Profile: default
Kernel Version: 3.10.0-693.11.6.el7.x86_64
Operating System: CentOS Linux 7 (Core)
OSType: linux
Architecture: x86_64
CPUs: 4
Total Memory: 3.701GiB
Name: app-0003.novalocal
ID: OH2C:4Q6Z:NCMB:XFK7:MCRK:ZN6J:HJWG:LNVX:Z4BB:EZFK:JSGR:FQBE
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false

WARNING: bridge-nf-call-iptables is disabled
WARNING: bridge-nf-call-ip6tables is disabled
```

Step 6  : 处理警告

sudo  vim /etc/sysctl.conf，添加

```
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-arptables = 1
```

sudo shutdown -r now，

Step 7 : 添加自动启动

```
sudo systemctl enable docker
```



Step 8 : 查看Docker 版本

```
$ sudo docker version
Client:
 Version:           18.06.1-ce
 API version:       1.38
 Go version:        go1.10.3
 Git commit:        e68fc7a
 Built:             Tue Aug 21 17:23:03 2018
 OS/Arch:           linux/amd64
 Experimental:      false

Server:
 Engine:
  Version:          18.06.1-ce
  API version:      1.38 (minimum version 1.12)
  Go version:       go1.10.3
  Git commit:       e68fc7a
  Built:            Tue Aug 21 17:25:29 2018
  OS/Arch:          linux/amd64
  Experimental:     false
```



## 2.2  卸载

```
sudo yum remove docker-ce
```

清除缓存内容

```
sudo rm -rf /var/lib/docker/
sudo rm -rf /etc/docker
sudo rm -f /run/docker
```



# 3  Docker三大基础组件

## 3.1  Docker 镜像  

	在之前的介绍中， 我们知道镜像是 Docker 的三大组件之一。 
	
	Docker 运行容器前需要本地存在对应的镜像， 如果镜像不存在本地， Docker 会从镜像仓库下载（默认是 Docker Hub 公共注册服务器中的仓库） 。 
	
	本章将介绍更多关于镜像的内容， 包括： 从仓库获取镜像； 管理本地主机上的镜像； 介绍镜像实现的基本原理。  

### 3.1.1 获取镜像  

	可以使用 docker pull 命令来从仓库获取所需要的镜像。  
	
	下面的例子将从 Docker Hub 仓库下载一个 Ubuntu 12.04 操作系统的镜像。  

```
$ sudo docker pull ubuntu:12.04
Pulling repository ubuntu
ab8e2728644c: Pulling dependent layers
511136ea3c5a: Download complete
5f0ffaa9455e: Download complete
a300658979be: Download complete
904483ae0c30: Download complete
ffdaafd1ca50: Download complete
d047ae21eeaf: Download complete
```

	下载过程中， 会输出获取镜像的每一层信息。
	
	 该命令实际上相当于 $ sudo docker pull registry.hub.docker.com/ubuntu:12.04 命令， 即从注册服 务器 registry.hub.docker.com 中的 ubuntu 仓库来下载标记为 12.04 的镜像。 
	
	有时候官方仓库注册服务器下载较慢， 可以从其他仓库下载。 从其它仓库下载时需要指定完整的仓库注册 服务器地址。 例如  

```
$ sudo docker pull dl.dockerpool.com:5000/ubuntu:12.04
Pulling dl.dockerpool.com:5000/ubuntu
ab8e2728644c: Pulling dependent layers
511136ea3c5a: Download complete
5f0ffaa9455e: Download complete
a300658979be: Download complete
904483ae0c30: Download complete
ffdaafd1ca50: Download complete
d047ae21eeaf: Download complete
```

	完成后， 即可随时使用该镜像了， 例如创建一个容器， 让其中运行 bash 应用。  

```
$ sudo docker run -t -i ubuntu:12.04 /bin/bash
root@fe7fc4bd8fc9:/#
```

### 3.1.2列出本地镜像  

	使用 docker images 显示本地已有的镜像。  

```

```

在列出信息中， 可以看到几个字段信息 

> 1. 来自于哪个仓库， 比如 ubuntu 
> 2. 镜像的标记， 比如 14.04 
> 3. 它的 ID 号（唯一） 
> 4. 创建时间 
> 5. 镜像大小 

	其中镜像的 ID 唯一标识了镜像， 注意到 ubuntu:14.04 和 ubuntu:trusty 具有相同的镜像 ID ， 说明 它们实际上是同一镜像。  
	
	TAG 信息用来标记来自同一个仓库的不同镜像。 例如 ubuntu 仓库中有多个镜像， 通过 TAG 信息来区分 发行版本， 例如 10.04 、 12.04 、 12.10 、 13.04 、 14.04 等。 例如下面的命令指定使用镜像 ubuntu:14.04 来启动一个容器。  

```

```

	如果不指定具体的标记， 则默认使用 latest 标记信息。  

### 3.1.3 创建镜像  

	创建镜像有很多方法， 用户可以从 Docker Hub 获取已有镜像并更新， 也可以利用本地文件系统创建一 个。  

#### 3.1.3.1 修改已有镜像  

	先使用下载的镜像启动容器。  

```
$ sudo docker run -t -i training/sinatra /bin/bash
root@0b2616b0e5a8:/#
```

	注意：记住容器的 ID， 稍后还会用到。 
	
	在容器中添加 json 和 gem 两个应用。  

```
root@0b2616b0e5a8:/# gem install json
```

	当结束后， 我们使用 exit 来退出， 现在我们的容器已经被我们改变了， 使用 docker commit 命令来提交 更新后的副本。  

```
$ sudo docker commit -m "Added json gem" -a "Docker Newbee" 0b2616b0e5a8 ouruser/sinatra:v2
4f177bd27a9ff0f6dc2a830403925b5360bfe0b93d476f7fc3231110e7f71b1c
```

	其中， -m 来指定提交的说明信息， 跟我们使用的版本控制工具一样； -a 可以指定更新的用户信息；之 后是用来创建镜像的容器的 ID；最后指定目标镜像的仓库名和 tag 信息。 创建成功后会返回这个镜像的 ID 信息。  
	
	使用 docker images 来查看新创建的镜像。  

```
$ sudo docker images
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
training/sinatra latest 5bc342fa0b91 10 hours ago 446.7 MB
ouruser/sinatra v2 3c59e02ddd1a 10 hours ago 446.7 MB
ouruser/sinatra latest 5db5f8471261 10 hours ago 446.7 MB
```

	之后， 可以使用新的镜像来启动容器  

```
$ sudo docker run -t -i ouruser/sinatra:v2 /bin/bash
root@78e82f680994:/#
```

#### 3.1.3.2 利用 Dockerfile 来创建镜像  

	使用 docker commit 来扩展一个镜像比较简单， 但是不方便在一个团队中分享。 我们可以使用 docker build 来创建一个新的镜像。 为此， 首先需要创建一个 Dockerfile， 包含一些如何创建镜像的指令  
	
	新建一个目录和一个 Dockerfile  

```
$ mkdir sinatra
$ cd sinatra
$ touch Dockerfile
```

Dockerfile 中每一条指令都创建镜像的一层， 例如：  

```
# This is a comment
FROM ubuntu:14.04
MAINTAINER Docker Newbee <newbee@docker.com>
RUN apt-get -qq update
RUN apt-get -qqy install ruby ruby-dev
RUN gem install sinatra
```

Dockerfile 基本的语法是  

> - 使用 # 来注释
> - FROM 指令告诉 Docker 使用哪个镜像作为基础
> - 接着是维护者的信息
> - RUN 开头的指令会在创建中运行， 比如安装一个软件包， 在这里使用 apt-get 来安装了一些软件

编写完成 Dockerfile 后可以使用 docker build 来生成镜像。  

```
$ sudo docker build -t="ouruser/sinatra:v2" .
Uploading context 2.56 kB
Uploading context
Step 0 : FROM ubuntu:14.04
---> 99ec81b80c55
Step 1 : MAINTAINER Newbee <newbee@docker.com>
---> Running in 7c5664a8a0c1
---> 2fa8ca4e2a13
Removing intermediate container 7c5664a8a0c1
Step 2 : RUN apt-get -qq update
---> Running in b07cc3fb4256
---> 50d21070ec0c
Removing intermediate container b07cc3fb4256
Step 3 : RUN apt-get -qqy install ruby ruby-dev
---> Running in a5b038dd127e
Selecting previously unselected package libasan0:amd64.
(Reading database ... 11518 files and directories currently installed.)
Preparing to unpack .../libasan0_4.8.2-19ubuntu1_amd64.deb ...
Setting up ruby (1:1.9.3.4) ...
Setting up ruby1.9.1 (1.9.3.484-2ubuntu1) ...
Processing triggers for libc-bin (2.19-0ubuntu6) ...
---> 2acb20f17878
Removing intermediate container a5b038dd127e
Step 4 : RUN gem install sinatra
---> Running in 5e9d0065c1f7

Successfully installed rack-protection-1.5.3
Successfully installed sinatra-1.4.5
4 gems installed
---> 324104cde6ad
Removing intermediate container 5e9d0065c1f7
Successfully built 324104cde6ad
```

	其中 -t 标记来添加 tag， 指定新的镜像的用户信息。 “.” 是 Dockerfile 所在的路径（当前目录） ， 也可以 替换为一个具体的 Dockerfile 的路径。 
	
	可以看到 build 进程在执行操作。 它要做的第一件事情就是上传这个 Dockerfile 内容， 因为所有的操作都要 依据 Dockerfile 来进行。 然后， Dockfile 中的指令被一条一条的执行。 每一步都创建了一个新的容器， 在 容器中执行指令并提交修改（就跟之前介绍过的 docker commit 一样） 。 当所有的指令都执行完毕之 后， 返回了最终的镜像 id。 所有的中间步骤所产生的容器都被删除和清理了。
	
	 *注意一个镜像不能超过 127 层  
	
	此外， 还可以利用 ADD 命令复制本地文件到镜像；用 EXPOSE 命令来向外部开放端口；用 CMD 命令来 描述容器启动后运行的程序等。 例如  

```
# put my local web site in myApp folder to /var/www
ADD myApp /var/www
# expose httpd port
EXPOSE 80
# the command to run
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
```

	现在可以利用新创建的镜像来启动一个容器。  

```
$ sudo docker run -t -i ouruser/sinatra:v2 /bin/bash root@8196968dac35:/#  
```

	还可以用 docker tag 命令来修改镜像的标签。  

```
$ sudo docker tag 5db5f8471261 ouruser/sinatra:devel
$ sudo docker images ouruser/sinatra
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
ouruser/sinatra latest 5db5f8471261 11 hours ago 446.7 MB
ouruser/sinatra devel 5db5f8471261 11 hours ago 446.7 MB
ouruser/sinatra v2 5db5f8471261 11 hours ago 446.7 MB
```

	*注：更多用法， 请参考 Dockerfile 章节。 

#### 3.1.3.3 从本地文件系统导入  

	要从本地文件系统导入一个镜像， 可以使用 openvz（容器虚拟化的先锋技术） 的模板来创建： openvz 的 模板下载地址为 templates 。  

比如， 先下载了一个 ubuntu-14.04 的镜像， 之后使用以下命令导入：  

```
sudo cat ubuntu-14.04-x86_64-minimal.tar.gz |docker import - ubuntu:14.04
```

	然后查看新导入的镜像。   

```
docker images
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
ubuntu 14.04 05ac7c0b9383 17 seconds ago 215.5 MB
```

### 3.1.4  上传镜像 

	用户可以通过 docker push 命令， 把自己创建的镜像上传到仓库中来共享。 例如， 用户在 Docker Hub 上 完成注册后， 可以推送自己的镜像到仓库中。   

```
$ sudo docker push ouruser/sinatra
The push refers to a repository [ouruser/sinatra] (len: 1)
Sending image list
Pushing repository ouruser/sinatra (3 tags)
```

### 3.1.5 存出和载入镜像  

#### 3.1.5.1 存出镜像  

	如果要导出镜像到本地文件， 可以使用 docker save 命令。  

```
$ sudo docker images
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
ubuntu 14.04 c4ff7513909d 5 weeks ago 225.4 MB
...
$sudo docker save -o ubuntu_14.04.tar ubuntu:14.04
```

#### 3.1.5.2 载入镜像  

	可以使用 docker load 从导出的本地文件中再导入到本地镜像库， 例如  

```
$ sudo docker load --input ubuntu_14.04.tar
```

或者是

```

```

	这将导入镜像以及其相关的元数据信息（包括标签等） 。  

### 3.1.6 移除本地镜像  

	如果要移除本地的镜像， 可以使用 docker rmi 命令。 注意 docker rm 命令是移除容器。  

```
$ sudo docker rmi training/sinatra
Untagged: training/sinatra:latest
Deleted: 5bc342fa0b91cabf65246837015197eecfa24b2213ed6a51a8974ae250fedd8d
Deleted: ed0fffdcdae5eb2c3a55549857a8be7fc8bc4241fb19ad714364cbfd7a56b22f
Deleted: 5c58979d73ae448df5af1d8142436d81116187a7633082650549c52c3a2418f0
```

*注意：在删除镜像之前要先用 docker rm 删掉依赖于这个镜像的所有容器。  

### 3.1.7 镜像的实现原理  

	Docker 镜像是怎么实现增量的修改和维护的？ 每个镜像都由很多层次构成， Docker 使用 Union FS 将这 些不同的层结合到一个镜像中去。 
	
	通常 Union FS 有两个用途, 一方面可以实现不借助 LVM、 RAID 将多个 disk 挂到同一个目录下,另一个更 常用的就是将一个只读的分支和一个可写的分支联合在一起， Live CD 正是基于此方法可以允许在镜像不 变的基础上允许用户在其上进行一些写操作。 Docker 在 AUFS 上构建的容器也是利用了类似的原理。  

## 3.2 Docker 容器  

	容器是 Docker 又一核心概念。 
	
	简单的说， 容器是独立运行的一个或一组应用， 以及它们的运行态环境。 对应的， 虚拟机可以理解为模拟 运行的一整套操作系统（提供了运行态环境和其他系统环境） 和跑在上面的应用。 
	
	本章将具体介绍如何来管理一个容器， 包括创建、 启动和停止等。  

### 3.2.1 启动容器  

	启动容器有两种方式， 一种是基于镜像新建一个容器并启动， 另外一个是将在终止状态（stopped） 的容器 重新启动。
	
	 因为 Docker 的容器实在太轻量级了， 很多时候用户都是随时删除和新创建容器。  

### 3.2.2 新建并启动  

	所需要的命令主要为 docker run 。 
	
	例如， 下面的命令输出一个 “Hello World”， 之后终止容器。  

```
$ sudo docker run ubuntu:14.04 /bin/echo 'Hello world'
Hello world
```

	这跟在本地直接执行 /bin/echo 'hello world' 几乎感觉不出任何区别。 下面的命令则启动一个 bash 终端， 允许用户进行交互。  

```
$ sudo docker run -t -i ubuntu:14.04 /bin/bash
root@af8bae53bdd3:/#
```

	其中， -t 选项让Docker分配一个伪终端（pseudo-tty） 并绑定到容器的标准输入上， -i 则让容器的标 准输入保持打开。 
	
	在交互模式下， 用户可以通过所创建的终端来输入命令， 例如  

```
root@af8bae53bdd3:/# pwd
/
root@af8bae53bdd3:/# ls
bin boot dev etc home lib lib64 media mnt opt proc root run sbin srv sys tmp usr var
```

	当利用 docker run 来创建容器时， Docker 在后台运行的标准操作包括：  

> - 检查本地是否存在指定的镜像， 不存在就从公有仓库下载
> - 利用镜像创建并启动一个容器
> - 分配一个文件系统， 并在只读的镜像层外面挂载一层可读写层
> - 从宿主主机配置的网桥接口中桥接一个虚拟接口到容器中去
> - 从地址池配置一个 ip 地址给容器
> - 执行用户指定的应用程序
> - 执行完毕后容器被终止

### 3.2.3 启动已终止容器 

	可以利用 docker start 命令， 直接将一个已经终止的容器启动运行。 容器的核心为所执行的应用程序， 所需要的资源都是应用程序运行所必需的。 除此之外， 并没有其它的资 源。 可以在伪终端中利用 ps 或 top 来查看进程信息。 

```
root@ba267838cc1b:/# ps
PID TTY TIME CMD
1 ? 00:00:00 bash
11 ? 00:00:00 ps
```

 	可见， 容器中仅运行了指定的 bash 应用。 这种特点使得 Docker 对资源的利用率极高， 是货真价实的轻量 级虚拟化。  

### 3.2.4 守护态运行  

	更多的时候， 需要让 Docker 容器在后台以守护态（Daemonized） 形式运行。 此时， 可以通过添加 -d 参 数来实现。  
	
	例如下面的命令会在后台运行容器。  

```
$ sudo docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"
1e5535038e285177d5214659a068137486f96ee5c2e85a4ac52dc83f2ebe4147
```

	容器启动后会返回一个唯一的 id， 也可以通过 docker ps 命令来查看容器信息。   

```
$ sudo docker ps
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
1e5535038e28 ubuntu:14.04 /bin/sh -c 'while tr 2 minutes ago Up 1 minute insane_babb
```

	要获取容器的输出信息， 可以通过 docker logs 命令。  

```
$ sudo docker logs insane_babbage
hello world
hello world
hello world
. . .
```

### 3.2.5 终止容器  

	可以使用 docker stop 来终止一个运行中的容器。 此外， 当Docker容器中指定的应用终结时， 容器也自动终止。 例如对于上一章节中只启动了一个终端的容 器， 用户通过 exit 命令或 Ctrl+d 来退出终端时， 所创建的容器立刻终止。 终止状态的容器可以用 docker ps -a 命令看到。 例如  

```
sudo docker ps -a
CONTAINER ID IMAGE COMMAND CREATED STATUS
ba267838cc1b ubuntu:14.04 "/bin/bash" 30 minutes ago Exited (0) Ab
98e5efa7d997 training/webapp:latest "python app.py" About an hour ago Exi
```

	处于终止状态的容器， 可以通过 docker start 命令来重新启动。
	
	此外， docker restart 命令会将一个运行态的容器终止， 然后再重新启动它。  

### 3.2.6  进入容器  

	在使用 -d 参数时， 容器启动后会进入后台。 某些时候需要进入容器进行操作， 有很多种方法， 包括使用 docker attach 命令或 nsenter 工具等。  

#### 3.2.6.1 attach 命令  

	docker attach 是Docker自带的命令。 下面示例如何使用该命令。  

```
$ sudo docker run -idt ubuntu
243c32535da7d142fb0e6df616a3c3ada0b8ab417937c853a9e1c251f499f550
$ sudo docker ps
CONTAINER ID IMAGE COMMAND CREATED STATUS P
243c32535da7 ubuntu:latest "/bin/bash" 18 seconds ago Up 17 seconds
$sudo docker attach nostalgic_hypatia
root@243c32535da7:/#
```

	但是使用 attach 命令有时候并不方便。 当多个窗口同时 attach 到同一个容器的时候， 所有窗口都会同步 显示。 当某个窗口因命令阻塞时,其他窗口也无法执行操作了。  

#### 3.2.6.2  nsenter 命令

	**安装**  
	
	nsenter 工具在 util-linux 包2.23版本后包含。 如果系统中 util-linux 包没有该命令， 可以按照下面的方法 从源码安装。  

```

```

	**使用**
	
	nsenter 可以访问另一个进程的名字空间。 nsenter 要正常工作需要有 root 权限。 很不幸， Ubuntu 14.04 仍然使用的是 util-linux 2.20。 安装最新版本的 util-linux（2.24） 版， 请按照以下步骤：  

```
$ wget https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.gz; tar xzvf util-
$ cd util-linux-2.24
$ ./configure --without-ncurses && make nsenter
$ sudo cp nsenter /usr/local/bin
```

	为了连接到容器， 你还需要找到容器的第一个进程的 PID， 可以通过下面的命令获取。  
	
	**进入容器**  
	
	PID=$(docker inspect --format "{{ .State.Pid }}" <container>)  
	
	通过这个 PID， 就可以连接到这个容器：  

```
$ nsenter --target $PID --mount --uts --ipc --net --pid
```

	下面给出一个完整的例子。  

```
$ sudo docker run -idt ubuntu
243c32535da7d142fb0e6df616a3c3ada0b8ab417937c853a9e1c251f499f550
$ sudo docker ps
CONTAINER ID IMAGE COMMAND CREATED STATUS P
243c32535da7 ubuntu:latest "/bin/bash" 18 seconds ago Up 17 seconds
$ PID=$(docker-pid 243c32535da7)
10981
$ sudo nsenter --target 10981 --mount --uts --ipc --net --pid
root@243c32535da7:/#
```

	更简单的， 建议大家下载 .bashrc_docker， 并将内容放到 .bashrc 中。  

```
$ wget -P ~ https://github.com/yeasy/docker_practice/raw/master/_local/.bashrc_docker;
$ echo "[ -f ~/.bashrc_docker ] && . ~/.bashrc_docker" >> ~/.bashrc; source ~/.bashrc
```

	这个文件中定义了很多方便使用 Docker 的命令， 例如 docker-pid 可以获取某个容器的 PID；而 docker-enter 可以进入容器或直接在容器内执行命令  

```
$ echo $(docker-pid <container>)
$ docker-enter <container> ls
```

### 3.2.7  导出和导入容器  

#### 3.2.7.1  导出容器  

	如果要导出本地某个容器， 可以使用 docker export 命令。  

```
$ sudo docker ps -a
CONTAINER ID IMAGE COMMAND CREATED STATUS
7691a814370e ubuntu:14.04 "/bin/bash" 36 hours ago Exited (0) 21 hours a
$ sudo docker export 7691a814370e > ubuntu.tar
```

	这样将导出容器快照到本地文件。  



	**导出 的意义是什么？**

#### 3.2.7.2 导入容器快照  

	可以使用 docker import 从容器快照文件中再导入为镜像， 例如  

```
$ cat ubuntu.tar | sudo docker import - test/ubuntu:v1.0
$ sudo docker images
REPOSITORY TAG IMAGE ID CREATED VIRTUAL SIZE
test/ubuntu v1.0 9d37a6082e97 About a minute ago 171.3 MB
```

	此外， 也可以通过指定 URL 或者某个目录来导入， 例如  

```
$sudo docker import http://example.com/exampleimage.tgz example/imagerepo
```

*注：用户既可以使用 docker load 来导入镜像存储文件到本地镜像库， 也可以使用 docker import 来 导入一个容器快照到本地镜像库。 这两者的区别在于容器快照文件将丢弃所有的历史记录和元数据信息 （即仅保存容器当时的快照状态） ， 而镜像存储文件将保存完整记录， 体积也要大。 此外， 从容器快照文 件导入时可以重新指定标签等元数据信息。  

### 3.2.8 删除容器  

	可以使用 docker rm 来删除一个处于终止状态的容器。 例如  

```
$sudo docker rm trusting_newton
trusting_newton
```

  	如果要删除一个运行中的容器， 可以添加 -f 参数。 Docker 会发送 SIGKILL 信号给容器。  

## 3.3 仓库  

	仓库（Repository） 是集中存放镜像的地方。 
	
	一个容易混淆的概念是注册服务器（Registry） 。 实际上注册服务器是管理仓库的具体服务器， 每个服务器 上可以有多个仓库， 而每个仓库下面有多个镜像。 从这方面来说， 仓库可以被认为是一个具体的项目或目 录。 例如对于仓库地址 dl.dockerpool.com/ubuntu 来说， dl.dockerpool.com 是注册服务器地 址， ubuntu 是仓库名。 
	
	大部分时候， 并不需要严格区分这两者的概念。  

### 3.3.1  Docker Hub 

	目前 Docker 官方维护了一个公共仓库 Docker Hub， 其中已经包括了超过 15,000 的镜像。 大部分需求，都可以通过在 Docker Hub 中直接下载镜像来实现。

#### 3.3.1.1登录  

	可以通过执行 docker login 命令来输入用户名、 密码和邮箱来完成注册和登录。 注册成功后， 本地用户 目录的 .dockercfg 中将保存用户的认证信息。  

#### 基本操作  

	用户无需登录即可通过 docker search 命令来查找官方仓库中的镜像， 并利用 docker pull 命令来将 它下载到本地。  