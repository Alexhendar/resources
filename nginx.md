---
typora-root-url: ./
---

# 1  nginx介绍

## 1.1  什么是nginx

nginx（发音为“engine x”）是由俄罗斯软件工程师Igor Sysoev为俄罗斯最大的门户网站── Rambler Media(www.rambler.ru) 编写的免费开源Web服务器。自2004年公开发布以来，nginx一直专注于高性能，高并发性和低内存使用。Web服务器功能之上的其他功能，如负载平衡，缓存，访问和带宽控制，以及与各种应用程序高效集成的能力，有助于使nginx成为现代网站架构的良好选择。 

## 1.2 nginx 特点

##### 	1、高并发

	官方测试能够支撑5万并发连接，在实际生产环境中跑到2～3万并发连接数 。

##### 	2、高性能

![rpsforhttprequest](/imgs/rpsforhttprequest.jpg)

![NGINX-HTTP-RPS](/imgs/NGINX-HTTP-RPS.png)



	nginx 官方性能数据： https://www.nginx.com/blog/testing-the-performance-of-nginx-and-nginx-plus-web-servers/
	
	Tengine benchmark : http://tengine.taobao.org/document/benchmark.html
	
	OpenResty benchmark : http://openresty.org/cn/benchmark.html

##### 	3、低内存

	在3万并发连接下，开启的10个Nginx 进程才消耗150M内存（15M*10=150M）。

##### 4、稳定性高 

	在互联网架构，企业应用系统中，稳定性无疑很重要。再好的性能，如果没有稳定性的保证，也没有什么市场价值。用于反向代理，宕机的概率微乎其微。 

5、配置文件灵活

	配置语法、格式和定义遵循一个所谓的C风格协定。这种构建配置文件的方法以及在开源软件和商业软件中广泛的应用。通过设计，C风格配置很适合嵌套描述，富有逻辑性，易于创建、读取和维护，深受广大工程师喜欢。同时nginx的C风格配置也易于自动化。

6、支持Rewrite重写 

	能够根据域名、URL的不同，将http请求分到不同的后端服务器群组。 

7、内置的健康检查功能 

	如果NginxProxy后端的某台Web服务器宕机了，不会影响前端的访问。 

8、节省带宽 

	支持GZIP压缩，可以添加浏览器本地缓存的Header头。 

9、支持热部署 

	Nginx支持热部署，它的部署特别容易，可以热加载配置文件，并且，可以7天*24小时不间断的运行，即使，运行数个月也不需要重新启动，还能够在不间断服务的情况下，对软件版本进行升级。 

## 1.3  市场趋势

![market_share](/imgs/market_share.jpg)

															~图片来源：https://news.netcraft.com/~
	
	虽然全球还有 50% Web 服务器是在用 Apache，但已有 1/3 的在使用 Nginx，并且两者之间的差距正在迅速缩小



![mktsharetop10000](/imgs/mktsharetop10000.png)

													图片来源：http://top.jobbole.com/36597/
	
	在全球前 10000 高流量网站当中，Nginx 的份额高达 58.4%。在前 1 百万网站中，Apache 份额是 42.8%，但 Nginx 是 39.7%。很明显可以看出这个趋势，**流量越高的网站，使用nginx的越多**。

# 2  nginx入门

	学习nginx，首先得学会准备环境，安装使用，我们先从安装开始学习nginx的使用。

## 2.1  nginx安装

	不同的系统环境，有不同的安装方法。一般的Linux系统，可以通过系统的包管理器进行安装，比如Redhat/CentOS可以通过配置yum源后使用yum install 安装；Debian/Ubuntu添加完nginx_signing.key后可以通过apt-get install nginx安装，其他系统也有相应的通过包管理器安装办法。

### 2.1.1  yum安装

	这里以CentOS系统为例。
	
	首先设置yum源，新建文件/etc/yum.repos.d/nginx.repo，并添加文件内容如下：

```
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/OS/OSRELEASE/$basearch/
gpgcheck=0
enabled=1
```

	根据当前系统不同，将OS替换为rhel或者centos，并设置“`OSRELEASE`”为具体系统的版本，比如6.x的系统可以设置为"6"，"7.x"的系统可以设置为"7"。

```
sudo yum install nginx
```

	设置完yum源后执行上述命令，安装nginx软件。

```
sudo systemctl start nginx
```

	启动nginx服务，没有异常信息说明启动成功。可以访问80端口加以验证。

![nginxinstallverify](/imgs/nginxinstallverify.png)

	出现上述页面，表示nginx安装成功，可以继续使用了。

### 2.1.2  源码编译安装

如果需要一些包管理器提供的nginx没有提供的功能，可以通过源码编译的方式进行安装。虽然这种方式灵活方便，但相对于nginx新手来说，这种方式稍微有点复杂。这里提供一个简单介绍，更详细的可以参考：http://nginx.org/en/docs/configure.html

1、安装依赖，源码下载

```
sudo yum install gcc-c++ pcre pcre-devel zlib zlib-devel openssl openssl-devel

sudo wget http://nginx.org/download/nginx-1.15.3.tar.gz
```

地址从http://nginx.org/en/download.html页面获取，获取最新版本下载链接即可。

2、创建用户和组

```
sudo groupadd nginx
sudo useradd  -g nginx nginx
# 第一个nginx是组名，第二nginx是用户
```

3、执行配置

```
./configure 
--prefix=/etc/nginx 
--sbin-path=/usr/sbin/nginx 
--modules-path=/usr/lib64/nginx/modules 
--conf-path=/etc/nginx/nginx.conf  
--error-log-path=/var/log/nginx/error.log 
--http-log-path=/var/log/nginx/access.log 
--pid-path=/var/run/nginx.pid 
--http-client-body-temp-path=/var/cache/nginx/client_temp 
--http-proxy-temp-path=/var/cache/nginx/proxy_temp 
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp 
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp 
--http-scgi-temp-path=/var/cache/nginx/scgi_temp 
--user=nginx 
--group=nginx 
--with-compat 
--with-file-aio 
--with-threads
--with-http_stub_status_module 
--with-http_realip_module 
--with-http_ssl_module 
--with-http_gzip_static_module
```

	4、安装

```
sudo make

sudo make install
```

	5、启动

```
nginx 
```

	6、添加nginx到系统服务。创建nginx启动命令脚本

```
	vim /etc/init.d/nginx
```

	插入以下内容，注意修改PATH和NAME字段, 匹配自己的安装路径

```
#! /bin/bash
# chkconfig: - 85 15
PATH=/usr
DESC="nginx daemon"
NAME=nginx
DAEMON=$PATH/sbin/$NAME
CONFIGFILE=/etc/nginx/nginx.conf
PIDFILE=/var/run/nginx.pid
SCRIPTNAME=/etc/init.d/$NAME
set -e
[ -x "$DAEMON" ] || exit 0
do_start() {
  $DAEMON -c $CONFIGFILE || echo -n "nginx already running"
}
do_stop() {
  $DAEMON -s stop || echo -n "nginx not running"
}
do_reload() {
  $DAEMON -s reload || echo -n "nginx can't reload"
}
case "$1" in
start)
echo -n "Starting $DESC: $NAME"
do_start
echo "."
;;
stop)
echo -n "Stopping $DESC: $NAME"
do_stop
echo "."
;;
reload|graceful)
echo -n "Reloading $DESC configuration..."
do_reload
echo "." ;;
restart)
echo -n "Restarting $DESC: $NAME"
do_stop
do_start
echo "."
;;
*)
echo "Usage: $SCRIPTNAME {start|stop|reload|restart}" >&2
exit 3
;;
esac
exit 0
```

设置执行权限，并注册成服务，添加开机启动

```
chmod a+x /etc/init.d/nginx
// 注册成服务
chkconfig --add nginx
// 添加开机启动
chkconfig nginx on	  
```

对nginx服务执行停止/启动/重新读取配置文件操作

```
#启动nginx服务
systemctl start nginx.service
#停止nginx服务
systemctl stop nginx.service
#重启nginx服务
systemctl restart nginx.service
#重新读取nginx配置(这个最常用, 不用停止nginx服务就能使修改的配置生效)
systemctl reload nginx.service
```

7、日志切割

	linux日志文件如果不定期清理，会填满整个磁盘。这样会很危险，因此日志管理是系统管理员日常工作之一。我们可以使用"logrotate"来管理linux日志文件，它可以实现日志的自动滚动，日志归档等功能。下面以nginx日志文件来讲解下logrotate的用法
	
	新建/etc/logrotate.d/nginx

```
/var/log/nginx/*.log {                                      
        daily                                               
        missingok                                           
        rotate 52                                           
        compress                                            
        delaycompress                                       
        notifempty                                          
        create 640 nginx adm                                
        sharedscripts                                       
        postrotate                                          
                if [ -f /var/run/nginx.pid ]; then          
                        kill -USR1 `cat /var/run/nginx.pid` 
                fi                                          
        endscript                                           
}                                                           
```

	让logrotate每天进行一次滚动,在crontab中添加一行定时脚本，每天23点59分进行日志滚动。

```
#crontab -e
59 23 * * *  /usr/sbin/logrotate -f /etc/logrotate.d/nginx
```

	配置文件说明

```
daily：日志文件每天进行滚动
rotate：保留最5次滚动的日志
notifempty：日志文件为空不进行滚动
sharedscripts：运行postrotate脚本
下面是一个脚本

postrotate
    if [ -f /usr/local/nginx/logs/nginx.pid ]; then
        kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
    fi
endscript
```



## 2.2  信号控制

在命令行输入nginx -h，看到如下输出

```
nginx version: nginx/1.14.0
Usage: nginx [-?hvVtTq][-s signal] [-c filename][-p prefix] [-g directives]

Options:
  -?,-h         : this help
  -v            : show version and exit
  -V            : show version and configure options then exit
  -t            : test configuration and exit
  -T            : test configuration, dump it and exit
  -q            : suppress non-error messages during configuration testing
  -s signal     : send signal to a master process: stop, quit, reopen, reload
  -p prefix     : set prefix path (default: /etc/nginx/)
  -c filename   : set configuration file (default: /etc/nginx/nginx.conf)
  -g directives : set global directives out of configuration file
```

可以看到可以通过-s 参数向master进程发送stop，quit，reopen，reload信号，每种信号的所代表的含义其实通过单词语义可以很好理解，在这里不进行详细解释。需要解释的是，当master接受到信号之后，nginx了做了哪些操作。

在你向nginx发出信号的前提就是nginx必须是已经启动起来的，这样它接受到信号的时候才可以执行相应操作，否则就会报错。因为它在执行信号处理相关逻辑的时候需要打开一些文件，而nginx不启动的时候这些文件是不存在的，就会导致打开文件错误。除此之外，也只有nginx在启动之后才可以一直监听具体接受到什么信号。如果不启动，系统根本不知如何处理。 

参考：	1、https://www.nginx.com/resources/wiki/start/topics/tutorials/commandline/

		2、http://nginx.org/en/docs/control.html

## 2.3  动态模块

NGINX 1.9.11开始增加加载动态模块支持，从此不再需要替换nginx文件即可增加第三方扩展。目前官方只有几个模块支持动态加载，第三方模块需要升级支持才可编译成模块。


​	

```
# ./configure --help|grep dynamic
  --with-http_xslt_module=dynamic    enable dynamic ngx_http_xslt_module
  --with-http_image_filter_module=dynamic
                                     enable dynamic ngx_http_image_filter_module
  --with-http_geoip_module=dynamic   enable dynamic ngx_http_geoip_module
  --with-http_perl_module=dynamic    enable dynamic ngx_http_perl_module
  --with-mail=dynamic                enable dynamic POP3/IMAP4/SMTP proxy module
  --with-stream=dynamic              enable dynamic TCP/UDP proxy module
  --with-stream_geoip_module=dynamic enable dynamic ngx_stream_geoip_module
  --add-dynamic-module=PATH          enable dynamic external module
  --with-compat                      dynamic modules compatibility
```

如上可看出官方支持5个动态模块编译，需要增加第三方模块，使用参数--add-dynamic-module=即可。

NGINX动态模块语法

```
load_module

Default: —

配置段: main

说明：版本必须>=1.9.11

实例：load_module modules/ngx_mail_module.so;
```

## 2.4  配置文件简略

Nginx配置系统来自于Igor Sysoev使用Apache的经验。他认为可扩展的配置系统是web服务器的基础。当维护庞大复杂的包括大量的虚拟服务器、目录、位置和数据集等配置时，会遇到可伸缩性问题。对于一个相对大点的网站，系统管理员如果没有在应用层进行恰当的配置，那么这将会是一个噩梦。

所以，nginx配置为简化日常维护而设计，并且提供了简单的手段用于web服务器将来的扩展。

配置文件是一些文本文件，通常位于`/usr/local/etc/nginx`或`/etc/nginx`。主配置文件通常命名为`nginx.conf`。为了保持整洁，部分配置可以放到单独的文件中，再自动地被包含到主配置文件。但应该注意的是，nginx目前不支持Apache风格的分布式配置文件（如.htaccess文件），所有和nginx行为相关的配置都应该位于一个集中的配置文件目录中。

Master进程启动时读取和校验这些配置文件。由于worker进程是从master进程派生的，所以可以使用一份编译好、只读的配置信息。配置信息结构通过常见的虚拟内存管理机制自动共享。

nginx.conf配置文件结构

```
...              #全局块
events {         #events块
   ...
}
http      #http块
{
    ...   #http全局块
    server        #server块
    { 
        ...       #server全局块
        location [PATTERN]   #location块
        {
            ...
        }
        location [PATTERN] 
        {
            ...
        }
    }
    server
    {
      ...
    }
    ...     #http全局块
}
```

1、全局块：配置影响nginx全局的指令。一般有运行nginx服务器的用户组，nginx进程pid存放路径，日志存放路径，配置文件引入，允许生成worker process数等。

2、events块：配置影响nginx服务器或与用户的网络连接。有每个进程的最大连接数，选取哪种事件驱动模型处理连接请求，是否允许同时接受多个网路连接，开启多个网络连接序列化等。

3、http块：可以嵌套多个server，配置代理，缓存，日志定义等绝大多数功能和第三方模块的配置。如文件引入，mime-type定义，日志自定义，是否使用sendfile传输文件，连接超时时间，单连接请求数等。

4、server块：配置虚拟主机的相关参数，一个http中可以有多个server。

5、location块：配置请求的路由，以及各种页面的处理情况。

<!--注意：每个指令必须有分号结束。-->

## 2.5  location指令

	Nginx 允许用户定义 Location block ，并指定一个匹配模式（pattern）匹配特定的 URI。除了简单的字符串（比如文件系统路径），还允许使用更为复杂的匹配模式（pattern）。
Location block 的基本语法形式是：

```
location [=|~|~*|^~|@] pattern { ... }
```

	[=|~|~*|^~|@] 被称作 location modifier ，这会定义 Nginx 如何去匹配其后的 pattern ，以及该 pattern 的最基本的属性（简单字符串或正则表达式）。
	
	location正则写法

```
location  = / {
  # 精确匹配 / ，主机名后面不能带任何字符串
  [ configuration A ] 
}

location  / {
  # 因为所有的地址都以 / 开头，所以这条规则将匹配到所有请求
  # 但是正则和最长字符串会优先匹配
  [ configuration B ] 
}

location /documents/ {
  # 匹配任何以 /documents/ 开头的地址，匹配符合以后，还要继续往下搜索
  # 只有后面的正则表达式没有匹配到时，这一条才会采用这一条
  [ configuration C ] 
}

location ~ /documents/Abc {
  # 匹配任何以 /documents/ 开头的地址，匹配符合以后，还要继续往下搜索
  # 只有后面的正则表达式没有匹配到时，这一条才会采用这一条
  [ configuration CC ] 
}

location ^~ /images/ {
  # 匹配任何以 /images/ 开头的地址，匹配符合以后，停止往下搜索正则，采用这一条。
  [ configuration D ] 
}

location ~* \.(gif|jpg|jpeg)$ {
  # 匹配所有以 gif,jpg或jpeg 结尾的请求
  # 然而，所有请求 /images/ 下的图片会被 config D 处理，因为 ^~ 到达不了这一条正则
  [ configuration E ] 
}

location /images/ {
  # 字符匹配到 /images/，继续往下，会发现 ^~ 存在
  [ configuration F ] 
}

location /images/abc {
  # 最长字符匹配到 /images/abc，继续往下，会发现 ^~ 存在
  # F与G的放置顺序是没有关系的
  [ configuration G ] 
}

location ~ /images/abc/ {
  # 只有去掉 config D 才有效：先最长匹配 config G 开头的地址，继续往下搜索，匹配到这一条正则，采用
    [ configuration H ] 
}

location ~* /js/.*/\.js
```

> - 已=开头表示精确匹配
> - 如 A 中只匹配根目录结尾的请求，后面不能带任何字符串。
> - ^~ 开头表示uri以某个常规字符串开头，不是正则匹配
> - ~ 开头表示区分大小写的正则匹配;
> - ~* 开头表示不区分大小写的正则匹配
> - / 通用匹配, 如果没有其它匹配,任何请求都会匹配到

**顺序 优先级： (location =) > (location 完整路径) > (location ^~ 路径) > (location ~,~* 正则顺序) > (location 部分起始路径) > (/)**

上面的匹配结果 按照上面的location写法，以下的匹配示例成立：

> - **/ -> configuration A**
>   精确完全匹配，即使/index.html也匹配不了
> - **/downloads/download.html -> configuration B**
>   匹配B以后，往下没有任何匹配，采用B
> - **/images/1.gif -> configuration D**
>   匹配到F，往下匹配到D，停止往下
> - **/images/abc/def -> configuration D**
>   最长匹配到G，往下匹配D，停止往下
>   你可以看到 任何以/images/开头的都会匹配到D并停止，FG写在这里是没有任何意义的，H是永远轮不到的，这里只是为了说明匹配顺序
> - **/documents/document.html -> configuration**  **C**
>   匹配到C，往下没有任何匹配，采用C
> - **/documents/1.jpg -> configuration E**
>   匹配到C，往下正则匹配到E
> - **/documents/Abc.jpg -> configuration CC**
>   最长匹配到C，往下正则顺序匹配到CC，不会往下到E



### 2.5.1 Named Location

​	location 的语法中，可以有“= ”，“^~ ”，“~ ”和“~* ”前缀，或者干脆没有任何前缀，还有“@ ”前缀。

​	这里介绍下“＠”的用途，“@ ”是用来定义“Named Location ”的（你可以理解为独立于“普通location （location using literal strings ）”和“正则location （location using regular expressions ）”之外的第三种类型），这种“Named Location ”不是用来处理普通的HTTP 请求的，它是专门用来处理“内部重定向（internally redirected ）”请求的。注意：这里说的“内部重定向（internally redirected ）”或许说成“forward ”会好点，以为内internally redirected 是不需要跟浏览器交互的，纯粹是服务端的一个转发行为



# 3 nginx原理分析

	传统基于进程或线程的模型使用单独的进程或线程处理并发连接，因而会阻塞于网络或I/O操作。根据不同的应用，就内存和CPU而言，这是非常低效的。派生进程或线程需要准备新的运行环境，包括在内存上分配堆和栈、生成一个新的运行上下文。创建这些东西还需要额外的CPU时间，而且过度的上下文切换引起的线程抖动最终会导致性能低下。所有这些复杂性在如Apache web服务器的老架构上一览无遗。在提供丰富的通用应用功能和优化服务器资源使用之间需要做一个权衡。
	
	最早的时候，nginx希望为动态增长的网站获得更好的性能，并且密集高效的使用服务器资源，所以其使用了另外一个模型。受不断发展的在不同操作系统上开发基于事件模型的技术驱动，最终一个模块化，事件驱动，异步，单线程，非阻塞架构成为nginx代码的基础。
	
	Nginx大量使用多路复用和事件通知，并且给不同的进程分配不同的任务。数量有限的工作进程（Worker）使用高效的单线程循环处理连接。每个worker进程每秒可以处理数千个并发连接、请求。
	
	Nginx在Linux、Solaris和BSD系统上使用kqueue、epoll和event ports等技术，通过事件通知机制来处理网络连接和内容获取，包括接受、处理和管理连接，并且大大增强了磁盘IO性能。目的在于尽可能的提供操作系统建议的手段，用于从网络进出流量，磁盘操作，套接字读取和写入，超时等事件中及时异步地获取反馈。Nginx为每个基于Unix的操作系统大量优化了这些多路复用和高级I/O操作的方法。

## 3.1进程模型

![nginx进程模型](/imgs/nginx进程模型.png)

							Nginx整体框架结构图
	
	nginx不为每个连接派生进程或线程，而是由worker进程通过监听共享套接字接受新请求，并且使用高效的循环来处理数千个连接。Nginx不使用仲裁器或分发器来分发连接，这个工作由操作系统内核机制完成。监听套接字在启动时就完成初始化，worker进程通过这些套接字接受、读取请求和输出响应。

事件处理循环是nginx worker代码中最复杂的部分，它包含复杂的内部调用，并且严重依赖异步任务处理的思想。异步操作通过模块化、事件通知、大量回调函数以及微调定时器等实现。总的来说，基本原则就是尽可能做到非阻塞。Nginx worker进程唯一会被阻塞的情形是磁盘性能不足。

由于nginx不为每个连接派生进程或线程，所以内存使用在大多数情况下是很节约并且高效的。同时由于不用频繁的生成和销毁进程或线程，所以nginx也很节省CPU时间。Nginx所做的就是检查网络和存储的状态，初始化新连接并添加到主循环，异步处理直到请求结束才从主循环中释放并删除。兼具精心设计的系统调用和诸如内存池等支持接口的精确实现，nginx在极端负载的情况下通常能做到中低CPU使用率。

nginx派生多个worker进程处理连接，所以能够很好的利用多核CPU。通常一个单独的worker进程使用一个处理器核，这样能完全利用多核体系结构，并且避免线程抖动和锁。在一个单线程的worker进程内部不存在资源匮乏，并且资源控制机制是隔离的。这个模型也允许在物理存储设备之间进行扩展，提高磁盘利用率以避免磁盘I/O导致的阻塞。将工作负载分布到多个worker进程上最终能使服务器资源被更高效的利用。

针对某些磁盘使用和CPU负载的模式，nginx worker进程数应该进行调整。这里的规则比较基本，系统管理员应根据负载多尝试几种配置。通常推荐：如果负载模式是CPU密集型，例如处理大量TCP/IP协议，使用SSL，或者压缩数据等，nginx worker进程应该和CPU核心数相匹配；如果是磁盘密集型，例如从存储中提供多种内容服务，或者是大量的代理服务，worker的进程数应该是1.5到2倍的CPU核心数。一些工程师基于独立存储单元的数目来决定worker进程数，虽然这个方法的有效性取决于磁盘存储配置的类型。

### 3.1.1 nginx进程角色

	Nginx的进程模型和现在大多数后台服务程序一样，按职责将进程分成监控进程和工作进程两类，启动Nginx的主进程将充当监控进程，而主进程fork出来的子进程则充当工作进程。工作进程的任务自然是完成具体的业务逻辑，而监控进程充当整个进程组与用户的交互接口，同时对工作进程进行监护，比如如果某个工作进程意外退出，监控进程将重新fork()生成一个新的工作进程。
	
	Nginx也可以由单进程模型执行，在这种进程模型下，主进程就是工作进程，此时没有监控进程。单进程模型比较简单，官方建议仅开发和测试使用。
	
	监控进程就是常说的Master进程，工作进程即Worker进程，Master进程使用root用户权限运行，其他进程使用非特权用户权限运行。

master进程负责下列工作:

> - 读取和校验配置文件
> - 创建、绑定、关闭套接字
> - 启动、终止、维护所配置数目的worker进程
> - 不中断服务刷新配置文件
> - 不中断服务升级程序（启动新程序或在需要时回滚）
> - 重新打开日志文件
> - 编译嵌入Perl脚本

	Worker进程接受、处理来自客户端的连接，提供反向代理和过滤功能以及其他nginx所具有的所有功能。由于worker进程是web服务器每日操作的实际执行者，所以对于监控nginx实例行为，系统管理员应该保持关注worker进程。
	
	缓存加载进程负责检查磁盘上的缓存数据并且在内存中维护缓存元数据的数据库。基本上，缓存加载进程使用特定分配好的目录结构来管理已经存储在磁盘上的文件，为nginx提供准备，它会遍历目录，检查缓存内容元数据，当所有数据可用时就更新相关的共享内存项。
	
	缓存管理进程主要负责缓存过期和失效。它在nginx正常工作时常驻内存中，当有异常则由master进程重启。

可以通过ps 命令查看nginx进程的父子结构

![processtreestruct](/imgs/processtreestruct.png)

### 3.1.2 Cache加载进程

	nginx启动时会启动cache加载进程(loader)，但在一段时间以后，Cache加载进程将消失，这是因为Cache加载进程的功能是在Nginx正常启动后(具体是60秒)将磁盘中上次缓存的对象加载到内存中。这个过程是一次性的，所以当Cache加载进程完成它的缓存加载任务后也就自动退出了。

### 3.1.3 进程间通信

	Nginx的子进程并没有像父进程发送任何消息，子进程之间也没有相互通信的逻辑。Nginx目前的进程模型中只有master向worker进程有通信需求，通过共享内存的方式进行通信。

## 3.2  模块

	Nginx由内核和模块组成，从官方文档[http://nginx.org/en/docs/](http://nginx.org/)下的Modules reference可以看到一些比较重要的模块，一般分为核心、基础模块以及第三方模块，第三方模块意味着你也可以按照nginx标准去开发符合自己业务的模块插件，核心主要用于提供Web Server的基本功能，以及Web和Mail反向代理的功能；还用于启用网络协议，创建必要的运行时环境以及确保不同的模块之间平滑地进行交互。不过，大多跟协议相关的功能和某应用特有的功能都是由nginx的模块实现的。这些功能模块大致可以分为事件模块、阶段性处理器、输出过滤器、变量处理器、协议、upstream和负载均衡几个类别，这些共同组成了nginx的http功能。事件模块主要用于提供OS独立的(不同操作系统的事件机制有所不同)事件通知机制如kqueue或epoll等。协议模块则负责实现nginx通过http、tls/ssl、smtp、pop3以及imap与对应的客户端建立会话。在Nginx内部，进程间的通信是通过模块的pipeline或chain实现的；换句话说，每一个功能或操作都由一个模块来实现。例如，压缩、通过FastCGI或uwsgi协议与upstream服务器通信，以及与memcached建立会话等。
	
	虽然Nginx模块很多，并且每个模块实现的功能各不相同，但是根据模块的主要功能性质，大体可以将他们分为四类：

```
1、handlers

协同完成客户端请求的处理、产生响应数据，比如ngx_http_rewrite_module模块，用于处理客户端地址的重写，ngx_http_static_module负责处理客户端静态页面请求；ngx_http_log_module，负责记录请求访问日志。

2、filters

对handlers产生的响应数据做各种过滤处理，比如模块ngx_http_not_modified_filter_module，对待响应产生数据进行过滤检测，如果通过时间戳判断出前后两次请求的响应数据没有发生实质变化，那么直接返回响应"304 Not Modified"状态标识，让客户端使用本地缓存即可，而原本待发送的响应数据将被清除掉。

3、upstream

如果存在后端真实服务器，nginx可利用upstream模块充当反向代理(Reverse Proxy)的角色，对客户端发起的请求只负责进行转发(当然也包括对后端服务器响应数据的回转)，比如ngx_http_proxy_module就是标准的 upstream模块。

4、load-balance

Nginx充当中间代理角色时，由于后端真实服务器往往多于一个，对于某一次客户端的请求来说，如何选择对应的后端服务器来进行处理，有类似于ngx_http_upstream_ip_hash_module这样的load module模块来实现具体的负载均衡策略。后续我们会分析这些负载均衡策略。
```



### 3.2.1 内置模块

nginx内置的功能模块涵盖了我们平常使用的大部分功能，所有模块参加官网地址：http://nginx.org/en/docs/，以下列出常见的几个功能模块：

```
1、ngx_http_stub_status_module 
2、ngx_http_core_module
3、ngx_http_access_module
	访问控制模块，实现基于ip的访问控制功能
	allow address | CIDR | unix: | all;
  	deny address | CIDR | unix: | all;
  	http, server, location, limit_except
  	自上而下检查，一旦匹配，将生效，条件严格的置前
4、ngx_http_log_module
	日志记录模块
5、ngx_http_gzip_module
	请求压缩模块
6、ngx_http_ssl_module
	支持https访问模块
7、ngx_http_rewrite_module
	重定向
8、ngx_http_referer_module
9、ngx_http_proxy_module
	反向代理模块
10、ngx_http_upstream_module
	代理池模块
```

### 3.2.2  第三方模块

如果内置的功能模块不能满足我们的业务需求，我们可以自己在nginx基础上定制开发或者是使用nginx的第三方模块，官方网站给出的第三方模块列表地址为：https://www.nginx.com/resources/wiki/modules/

常用的第三方模块：

```
1、Cache Purge
	缓存清理模块，https://github.com/FRiCKLE/ngx_cache_purge
	
2、	Concat
	文件拼接模块，https://github.com/alibaba/nginx-http-concat
	
3、UpStreamConsistent Hash
	根据一致性Hash令牌环选择后台的服务实例，https://github.com/replay/ngx_http_consistent_hash
	
4、Dynamic Upstream
	根据restful API动态调整upstream,https://github.com/yzprofile/ngx_http_dyups_module
	
5、Dynamic limit
	动态锁定IP和释放IP限制，https://github.com/limithit/ngx_dynamic_limit_req_module
	
6、Upstream Fair Balancer
	根据后台服务实例的负载情况分发请求，https://github.com/gnosek/nginx-upstream-fair
	
7、HTTP Healthcheck
	upstream内服务实例的健康检查，https://github.com/cep21/healthcheck_nginx_upstreams
	
8、Traffic Accounting
	实时流量统计，https://github.com/Lax/traffic-accounting-nginx-module
	
9、SlowFS Cache
	静态文件缓存，http://labs.frickle.com/nginx_ngx_slowfs_cache
	
10、SysGuard
	提供高流量、高负载的保护模块，https://github.com/vozlt/nginx-module-sysguard

11、NGINX Upload Progress Module
	追踪报告上传进度，https://github.com/masterzen/nginx-upload-progress-module
```

## 3.3  事件驱动及IO模型

	事件驱动模型是Nginx服务器保障完整功能和具有良好性能的重要机制之一。

### 3.3.1  事件驱动模型概述

	实际上，事件驱动并不是计算机编程领域的专业词汇，它是一种比较古老的响应事件的模型，在计算机编程、公共关系、经济活动等领域均有很广泛的应用。顾名思义，事件驱动就是在持续事务管理过程中，由当前时间点上出现的事件引发的调动可用资源执行相关任务，解决不断出现的问题，防止事务堆积的一种策略。在计算机编程领域，事件驱动模型对应一种程序设计方式，Event-driven programming，即事件驱动程序设计。
	事件驱动模型一般是由`事件收集器`，`事件发送器`，`事件处理器`三部分基本单元组成。

 	其中， `事件收集器`专门负责收集所有的事件，包括来自用户的（如鼠标单击事件、键盘输入事件等）、来自硬件的（如时钟事件等）和来自软件的（如操作系统、应用程序本身等）。

	`事件发送器`负责将收集器收集到的事件分发到目标对象中。目标对象就是事件处理器所处的位置。
	
	`事件处理器`主要负责具体事件的响应工作，它往往要到实现阶段才完全确定。
 	在程序设计过程中，对事件驱动机制的实现方式有多种，这里介绍batch programming，即批次程序设计。批次的程序设计是一种比较初级的程序设计方式。使用批次程序设计的软件，其流程是由程序设计师在实际编码过程中决定的，也就是说，在程序运行的过程中，事件的发生、事件的发送和事件的处理都是预先设计好的。由此可见，事件驱动程序设计更多的关注了事件产生的随机性，使得应用程序能够具备相当的柔性，可以应付种种来自用户、硬件和系统的离散随机事件，这在很大程度上增强了用户和软件的交互性和用户操作的灵活性。
​	事件驱动程序可以由任何编程语言来实现，只是难易程度有别。如果一个系统是以事件驱动程序模型作为编程基础的，那么，它的架构基本上是这样的：预先设计一个事件循环所形成的程序，这个事件循环程序构成了“事件收集器”，它不断地检查目前要处理的事件信息，然后使用“事件发送器”传递给“事件处理器”。“事件处理器”一般运用虚函数机制来实现。

### 3.3.2  Nginx中的事件驱动模型

	Nginx服务器响应和处理Web请求的过程，就是基于事件驱动模型的，它也包含事件收集器、事件发送器和事件处理器等三部分基本单元。Nginx的“事件收集器”和“事件发送器”的实现没有太大的特点，重点介绍一下它的“事件处理器”。
通常，我们在编写服务器处理模型的程序时，基于事件驱动模型，“目标对象”中的“事件处理器”可以有以下几种实现办法：

- “事件发送器”每传递过来一个请求，“目标对象”就创建一个新的进程，调用“事件处理器”来处理该请求。
- “事件发送器”每传递过来一个请求，“目标对象”就创建一个新的线程，调用“事件处理器”来处理该请求。
- “事件发送器”每传递过来一个请求，“目标对象”就将其放入一个待处理事件的列表，使用非阻塞I/O方式调用“事件处理器”来处理该请求。

以上的三种处理方式，各有特点，第一种方式，由于创建新的进程的开销比较大，会导致服务器性能比较差，但其实现相对来说比较简单。
第二种方式，由于要涉及到线程的同步，故可能会面临死锁、同步等一系列问题，编码比较复杂。
第三种方式，在编写程序代码时，逻辑比前面两种都复杂。大多数网络服务器采用了第三种方式，逐渐形成了所谓的“事件驱动处理库”。
事件驱动处理库又被称为多路IO复用方法，最常见的包括以下三种：select模型，poll模型和epoll模型。Nginx服务器还支持rtsig模型、kqueue模型、dev/poll模型和eventport模型等。通过Nginx配置可以使得Nginx服务器支持这几种事件驱动处理模型。这里详细介绍以下它们。

### 3.3.3  多路IO复用方法

	IO复用解决的就是并发行的问题，比如多个用户并发访问一个WEB网站，对于服务端后台而言就会产生多个请求，处理多个请求对于中间件就会产生多个IO流对于系统的读写。那么对于IO流请求操作系统内核有并行处理和串行处理的概念，串行处理的方式是一个个处理，前面的发生阻塞，就没办法完成后面的请求。这个时候我们必须考虑并行的方式完成整个IO流的请求来实现最大的并发和吞吐，这时候就是用到IO复用技术。IO复用就是让一个Socket来作为复用完成整个IO流的请求。当然实现整个IO流的请求多线程的方式就是其中一种。
	
	举个栗子：在教室里面有一个老师同时给学生出一道题目，检查每个学生做的是否正确，这时候老师可以选择一个一个学生的去问学生是否做完。如果A学生没做完，那么再问B学生,B学生没做完再问C学生，挨个问下去，如果发现问道某一个学生，某一个学生说做完的时候，这时候再给当下学生解答。那么这时候会发现，如果一个学生发生了阻塞，阻塞在一个学生下，其他学生就会耽误了，这时候对整个课堂效率就底下。这就是串行请求类处理。
	
	再举一个：也是这个场景，给学生出题让学生解答。这个老师学会了分身术，每个老师对每个学生进行监听，看学生是否答题完并作出解答，这样效率就高了。这就是多线程进行IO流处理，那么多线程IO流就会产生一定的消耗，资源问题的存在。
	
	IO多路复用模型是建立在内核提供的多路分离函数select基础之上的，使用select函数可以避免同步非阻塞IO模型中轮询等待的问题。

![iomultiple](/imgs/iomultiple.png)

	如图所示，用户首先将需要进行IO操作的socket添加到select中，然后阻塞等待select系统调用返回。当数据到达时，socket被激活，select函数返回。用户线程正式发起read请求，读取数据并继续执行。
	
	从流程上来看，使用select函数进行IO请求和同步阻塞模型没有太大的区别，甚至还多了添加监视socket，以及调用select函数的额外操作，效率更差。但是，使用select以后最大的优势是用户可以在一个线程内同时处理多个socket的IO请求。用户可以注册多个socket，然后不断地调用select读取被激活的socket，即可达到在**同一个线程内同时处理多个IO请求的目的**。而在同步阻塞模型中，必须通过多线程的方式才能达到这个目的。

### 3.3.3 Select 库

	select库，是各个版本的Linux和Windows平台都支持的基本事件驱动模型库，并且在接口的定义上也基本相同，只是部分参数的含义略有差异。使用select库的步骤一般是：
	首先，创建所关注事件的描述符集合。对于一个描述符，可以关注其上面的（Read)事件、写（Write)事件以及异常发送（Exception）事件，所以要创建三类事件描述符集合，分别用来收集读事件的描述符、写事件的描述符和异常事件的描述符。
 	其次，调用底层提供的select()函数，等待事件发生。这里需要注意的一点是，select的阻塞与是否设置非阻塞I/O是没有关系的。
 	然后，轮询所有事件描述符集合中的每一个事件描述符，检查是否有相应的事件发生，如果有，就进行处理。
 	Nginx服务器在编译过程中如果没有为其指定其他高性能事件驱动模型库，它将自动编译该库。我们可以使用--with-select_module和--without-select_module两个参数强制Nginx是否编译该库。

### 3.3.4 poll库

	poll库，作为Linux平台上的基本事件驱动模型，实在Linux2.1.23中引入的。Windows平台不支持poll库。
	poll与select的基本工作方式是相同的，都是现创建一个关注事件的描述符集合，再去等待这些事件发生，然后在轮询描述符集合，检查有没有事件发生，如果有，就进行处理。
	poll库与select库的主要区别在于，select库需要为读事件、写事件和异常事件分别创建一个描述符集合，因此在最后轮询的时候，需要分别轮询这三个集合。而poll库只需要创建一个集合，在每个描述符对应的结构上分别设置读事件、写事件或者异常事件，最后轮询的时候，可以同时检查这三种事件是否发生。可以说，poll库是select库的优化实现。
	Nginx服务器在编译过程中如果没有为其制定其他高性能事件驱动模型库，它将自动编译该库。我们可以使用--with-poll_module和--without-poll_module两个参数强制Nginx是否编译该库。

### 3.3.5  epoll库

	epoll库是Nginx服务器支持的高性能事件驱动库之一，它是公认的非常优秀的事件驱动模型，和poll库及select库有很大的不同。epoll属于poll库的一个变种，是在Linux 2.5.44中引入的，在Linux 2.6以上的版本都可以使用它。poll库和select库在实际工作中，最大的区别在于效率。
	从前面的介绍我们知道，它们的处理方式都是创建一个待处理事件列表，然后把这个列表发给内核，返回的时候，再去轮询检查这个列表，以判断事件是否发生。这样在描述符比较多的应用中，效率就显得比较低下了。一种比较好的做法是，把描述符列表的管理交给内核负责，一旦有某种事件发生，内核把发生事件的描述符列表通知给进程，这样就避免了轮询整个描述符列表。epoll库就是这样一种模型。
	首先，epoll库通过相关调用通知内核创建一个由N个描述符的事件列表。然后，给这些描述符设置所关注的事件，并把它添加到内核的事件列表中去，在具体的编码过程中也可以通过相关调用对事件列表中的描述符进行修改和删除。
	完成设置之后，epoll库就开始等待内核通知事件发生了。某一事件发生后，内核将发生事件的描述符列表上报给epoll库。得到事件列表的epoll库，就可以进行事件处理了。
	epoll库在Linux平台上是最高效的。它支持一个进程打开大数目的事件描述符，上限是系统可以打开文件的最大数目。同时，epoll库的IO效率不随描述符数目增加而线性下降，因为它只会对内核上报的“活跃”的描述符进行操作。

### 3.3.6  rtsig模型

	rtsig是Real-Time Signal的缩写，是实时信号的意思。从严格意义上说，rtsig模型并不是常用的事件驱动模型，但Nginx服务器使用了使用实时信号对事件进行响应的支持，官方文档中将rtsig模型与其他的事件驱动模型并列。
	使用rtsig模型时，工作进程会通过系统内核建立一个rtsig队列用于存放标记事件发生（在Nginx服务器应用中特指客户端请求发生）的信号。每个事件发生时，系统内核就会产生一个信号存放到rtsig队列中等待工作进程的处理。
	需要指出的是，rtsig队列有长度限制，超过该长度后就会发生溢出。默认情况下，Linux系统事件信号队列的最大长度设置为1024，也就是同时最多可以存放1024个发生事件的信号。在Linux 2.6.6-mm2之前的版本中，系统各个进程的事件信号队列是由内核统一管理的，用户可以通过修改内核参数/proc/sys/kernel/rtsig-max/来自定义该长度设置。在Linux 2.6.6-mm2之后的版本中，该内核参数被取消，系统各个进程分别拥有各自的事件信号队列，这个队列的大小由Linux系统的RLIMT_SIGPENGIND参数定义，在执行setrlimit()系统调用时确定该大小。Nginx提供了worker_rlimit_sigpending参数用于调节这种情况下的事件信号队列长度。
	当rtsig队列发生溢出时，Nginx将暂时停止使用rtsig模型，而调用poll库处理未处理的事件，直到rgsit信号队列全部清空，然后再次启动rtsig模型，以防止新的溢出发生。
	Nginx在配置文件中提供了相关参数对rtsig模型的使用配置。编译Nginx服务器时，使用--with-rtsig_module配置选项来启用rtsig模型的编译。

### 3.3.7  其他事件驱动模型

除了以上四种主要的事件驱动模型，Nginx服务器针对特定的Linux平台提供了响应的事件驱动模型支持。目前实现的主要有kqueue模型、/dev/poll模型和eventport模型等。

- kqueue模型，是用于支持BSD系列平台的高效事件驱动模型，主要用在FreeBSD 4.1及以上版本、OpenBSD 2.9及以上版本、NetBSD 2.0及以上版本以及Mac OS X平台上。该模型也是poll库的一个变种，其和epoll库的处理方式没有本质上的区别，都是通过避免轮询操作提供效率。该模型同时支持条件触发（level-triggered,也叫水平触发，只要满足条件就触发一个事件）和边缘触发（edge-triggered，每当状态变化时，触发一个事件）。如果大家在这些平台下使用Nginx服务器，建议选在该模型用于请求处理，以提高Nginx服务器的处理性能。
- /dev/poll模型，适用于支持Unix衍生平台的高效事件驱动模型，其主要在Solaris711/99及以上版本、HP/UX 11.22及以上版本、IRIX 6.5.15及以上版本和Tru64 UNIX 5.1A及以上版本的平台中使用。该模型是Sun公司在开发Solaris系列平台时提出的用于完成事件驱动机制的方案，它使用了虚拟的/dev/poll设备，开发人员可以将要监视的文件描述符加入这个设备，然后通过ioctl()调用来获取事件通知。在以上提到的平台中，建议使用该模型处理请求。

- eventport模型，适用于支持Solaris 10及以上版本平台的高效事件驱动模型。该模型也是Sun公司在开发Solaris系列平台时提出的用于完成事件驱动机制的方案，它可以有效防止内核崩溃情况的发生。Nginx服务器为此提供了支持。

以上就是Nginx服务器支持的事件驱动库。可以看到，Nginx服务器针对不同的Linux或Unix衍生平台提供了多种事件驱动模型的处理，尽量发挥系统平台本身的优势，最大程度地提高处理客户端请求事件的能力。在实际工作中，我们需要根据具体情况和应用情景选择使用不同的事件驱动模型，以保证Nginx服务器的高效运行。

## 3.4  异步非阻塞

	异步方式是和多进程方式及多线程方式完全不同的一种处理客户端请求的方式。在介绍改方式之前 ，我们先复习下同步、异步以及阻塞、非阻塞的概念。

### 3.4.1  同步与异步

	网络通信中的同步机制和异步机制是描述通信模块的概念。同步机制，是指发送方发送请求后，需要等待接收到接收方发回的响应后，才接着发送下一个请求；异步机制，和同步机制正好相反，在异步机制中，发送方发出一个请求后，不等待接收方响应这个请求，就继续发送下个请求。在同步机制中，所有的请求在服务器端得到同步，发送方和接收方对请求的处理步调是一致的；在异步机制中，所有来着发送方的请求形成一个队列，接收方处理完成后通知发送方。

### 3.4.2  阻塞与非阻塞

	阻塞和非阻塞用来描述进程处理调用的方式，在网络通信中，主要指网络套接字Socket的阻塞和非阻塞方式，而Socket的实质也是IO操作，Socket的阻塞调用方式为，调用结果返回之前，当前线程从运行状态被挂起，一直等到调用结果返回之后，才进行就绪状态，获取CPU后继续执行；Socket的非阻塞调用方式和阻塞方式调用方式正好相反，在非阻塞方式中，如果调用结果不能马上返回，当前线程也不会被挂起，而是立即返回执行下一个调用。

　　在网络通信中，经常可以看到有人讲同步和阻塞等同、异步和非阻塞等同。事实上，这两对概念有一定的区别，不能混淆。两对概念的组合，就会产生四个新的概念，同步阻塞、异步阻塞、同步非阻塞、异步非阻塞。

> - 同步阻塞方式，发送方向接收方发送请求后，一直等待响应；接收方处理请求是进行的IO操作如果不能马上得到结果，就一直等到返回结果后，才响应发送方，期间不能进行其他工作。比如、在超时排队付账时，客户（发送方）想收款员（接收方）付款（发送请求）后需要等待收款员找零，期间不能做其他的事情；而收款员要等待收款机返回结果（IO操作）后才能把零钱取出来交给客户（响应请求），期间也只能等待，不能做其他的事情。这种方式实现简单，但是效率不高。
> - 同步非阻塞方式，发送方向接收方发送请求后，一直等待响应；接收方处理请求时进行的IO操作如果不能马上得到结果，就立即返回，去做其他事情，但由于没有得到请求处理结果，不响应发送方，发送方一直在等待，一直等IO操作完成后，接收方获得结果响应发送方后，接收方才进入下一次请求过程。在实际中不使用这种方式。
> - 异步阻塞方法，发送方向接收方发送请求后，不用等待响应，可以继续其他工作；接收方处理请求是进行的IO操作如果不能马上得到结果，就一直等到返回结果后，才响应发送方，期间不能进行其他工作。这种方式在实际中也不使用。
> - 异步非阻塞方式，发送方向接收方发送请求后，不用等待响应，可以继续其他工作；接收方处理请求时进行的IO操作富国不能马上得到结果，也不等待，而是马上返回去做其他事情。当IO操作完成以后，将完成状态和结果通知接收方，接收方再响应发送方。继续使用在超市付账排队的例子。客户（发送方）想收款员（接收方）付款（发送请求）后在等待收款员找零的过程中，还可以做其他事情，比如打电话、聊天等；而收款员在等待收款机处理交易（IO操作）的过程中可以帮助客户将商品打包，当收款机产生结果后，收款员给客户结账（响应请求）。在四种方式中，这种方式是发送方和接收方通信效率最高的一种。



## 3.5  Nginx 处理阶段

	nginx实际把请求处理流程划分为了11个阶段，这样划分的原因是将请求的执行逻辑细分，各阶段按照处理时机定义了清晰的执行语义，开发者可以很容易分辨自己需要开发的模块应该定义在什么阶段，其定义在http/ngx_http_core_module.h中有定义

```
typedef enum {
    NGX_HTTP_POST_READ_PHASE = 0,

    NGX_HTTP_SERVER_REWRITE_PHASE,

    NGX_HTTP_FIND_CONFIG_PHASE,
    NGX_HTTP_REWRITE_PHASE,
    NGX_HTTP_POST_REWRITE_PHASE,

    NGX_HTTP_PREACCESS_PHASE,

    NGX_HTTP_ACCESS_PHASE,
    NGX_HTTP_POST_ACCESS_PHASE,

    NGX_HTTP_PRECONTENT_PHASE,

    NGX_HTTP_CONTENT_PHASE,

    NGX_HTTP_LOG_PHASE
} ngx_http_phases;
```

	各阶段大致描述如下：

```
NGX_HTTP_POST_READ_PHASE:
接收完请求头之后的第一个阶段，它位于uri重写之前，实际上很少有模块会注册在该阶段，默认的情况下，该阶段被跳过

NGX_HTTP_SERVER_REWRITE_PHASE:
server级别的uri重写阶段，也就是该阶段执行处于server块内，location块外的重写指令，在读取请求头的过程中nginx会根据host及端口找到对应的虚拟主机配置

NGX_HTTP_FIND_CONFIG_PHASE:
寻找location配置阶段，该阶段使用重写之后的uri来查找对应的location，值得注意的是该阶段可能会被执行多次，因为也可能有location级别的重写指令

NGX_HTTP_REWRITE_PHASE:
location级别的uri重写阶段，该阶段执行location基本的重写指令，也可能会被执行多次

NGX_HTTP_POST_REWRITE_PHASE:
location级别重写的后一阶段，用来检查上阶段是否有uri重写，并根据结果跳转到合适的阶段

NGX_HTTP_PREACCESS_PHASE:
访问权限控制的前一阶段，该阶段在权限控制阶段之前，一般也用于访问控制，比如限制访问频率，链接数等

NGX_HTTP_ACCESS_PHASE:
访问权限控制阶段，比如基于ip黑白名单的权限控制，基于用户名密码的权限控制等

NGX_HTTP_POST_ACCESS_PHASE:
问权限控制的后一阶段，该阶段根据权限控制阶段的执行结果进行相应处理

NGX_HTTP_PRECONTENT_PHASE
这个阶段本身也是 1.13.4 版本刚刚加入到 Nginx 中的,取消了NGX_HTTP_TRY_FILES_PHASE。当主请求的处理流程进行到 PRECONTENT 阶段时，Nginx 会检查是否需要复制当前请求，决定是否复制请求包体和创建「后台子请求」开始流 量复制流程。
【The phase is added instead of the try_files phase.  Unlike the old phase, the
new one supports registering multiple handlers.  The try_files implementation is
moved to a separate ngx_http_try_files_module, which now registers a precontent
phase handler.】
https://github.com/nginx/nginx/commit/129b06dc5dfab7b4513a4f274b3778cd9b8a6a22

-- NGX_HTTP_TRY_FILES_PHASE:
-- try_files指令的处理阶段，如果没有配置try_files指令，则该阶段被跳过

NGX_HTTP_CONTENT_PHASE:
内容生成阶段，该阶段产生响应，并发送到客户端

NGX_HTTP_LOG_PHASE:
日志记录阶段，该阶段记录访问日志


```

## 3.6 Nginx如何处理一个请求

### 3.6.1 基于名字的虚拟主机

	Nginx首先选定由哪一个*虚拟主机*来处理请求。让我们从一个简单的配置（其中全部3个虚拟主机都在端口*：80上监听）开始：

```
server {
    listen      80;
    server_name example.org www.example.org;
    ...
}

server {
    listen      80;
    server_name example.net www.example.net;
    ...
}

server {
    listen      80;
    server_name example.com www.example.com;
    ...
}
```

	在这个配置中，nginx仅仅检查请求的“Host”头以决定该请求应由哪个虚拟主机来处理。如果Host头没有匹配任意一个虚拟主机，或者请求中根本没有包含Host头，那nginx会将请求分发到定义在此端口上的默认虚拟主机。在以上配置中，第一个被列出的虚拟主机即nginx的默认虚拟主机——这是nginx的默认行为。而且，可以显式地设置某个主机为默认虚拟主机，即在"`listen`"指令中设置"`default_server`"参数：

```
server {
    listen      80 default_server;
    server_name example.net www.example.net;
    ...
}
```

"`default_server`"参数从0.8.21版开始可用。在之前的版本中，应该使用"`default`"参数代替。

请注意"`default_server`"是监听端口的属性，而不是主机名的属性。后面会对此有更多介绍。

### 3.6.2 如何防止处理未定义主机名的请求

	如果不允许请求中缺少“Host”头，可以定义如下主机，丢弃这些请求：

```
server {
    listen       80;
    server_name  "";
    return       444;
}
```

在这里，我们设置主机名为空字符串以匹配未定义“Host”头的请求，而且返回了一个nginx特有的，非http标准的返回码444，它可以用来关闭连接。

> 从0.8.48版本开始，这已成为主机名的默认设置，所以可以省略`server_name ""`。而之前的版本使用机器的*hostname*作为主机名的默认值。

### 3.6.3 基于域名和IP混合的虚拟主机

下面让我们来看一个复杂点的配置，在这个配置里，有几个虚拟主机在不同的地址上监听：

```
server {
    listen      192.168.1.1:80;
    server_name example.org www.example.org;
    ...
}

server {
    listen      192.168.1.1:80;
    server_name example.net www.example.net;
    ...
}

server {
    listen      192.168.1.2:80;
    server_name example.com www.example.com;
    ...
}

```

这个配置中，nginx首先测试请求的IP地址和端口是否匹配某个server配置块中的listen指令配置。接着nginx继续测试请求的Host头是否匹配这个server块中的某个server_name的值。如果主机名没有找到，nginx将把这个请求交给默认虚拟主机处理。例如，一个从192.168.1.1:80端口收到的访问www.example.com的请求将被监听192.168.1.1:80端口的默认虚拟主机处理，本例中就是第一个服务器，因为这个端口上没有定义名为www.example.com的虚拟主机。

默认服务器是监听端口的属性，所以不同的监听端口可以设置不同的默认服务器：

```
server {
    listen      192.168.1.1:80;
    server_name example.org www.example.org;
    ...
}

server {
    listen      192.168.1.1:80 default_server;
    server_name example.net www.example.net;
    ...
}

server {
    listen      192.168.1.2:80 default_server;
    server_name example.com www.example.com;
    ...
}
```

### 3.6.4  一个简单PHP站点配置

	现在我们来看在一个典型的，简单的PHP站点中，nginx怎样为一个请求选择*location*来处理：

```
server {
    listen      80;
    server_name example.org www.example.org;
    root        /data/www;

    location / {
        index   index.html index.php;
    }

    location ~* \.(gif|jpg|png)$ {
        expires 30d;
    }

    location ~ \.php$ {
        fastcgi_pass  localhost:9000;
        fastcgi_param SCRIPT_FILENAME
                      $document_root$fastcgi_script_name;
        include       fastcgi_params;
    }
}
```

	首先，nginx使用前缀匹配找出最准确的location，这一步nginx会忽略location在配置文件出现的顺序。上面的配置中，唯一的前缀匹配location是"`/`"，而且因为它可以匹配任意的请求，所以被作为最后一个选择。接着，nginx继续按照配置中的顺序依次匹配正则表达式的location，匹配到第一个正则表达式后停止搜索。匹配到的location将被使用。如果没有匹配到正则表达式的location，则使用刚刚找到的最准确的前缀匹配的location。
	
	请注意所有location匹配测试只使用请求的URI部分，而不使用参数部分。这是因为写参数的方法很多，比如：

> ```
> /index.php?user=john&page=1
> /index.php?page=1&user=john
> ```

除此以外，任何人在请求串中都可以随意添加字符串：

> ```
> /index.php?page=1&something+else&user=john
> ```

现在让我们来看使用上面的配置，请求是怎样被处理的：

- 请求"`/logo.gif`"首先匹配上location "`/`"，然后匹配上正则表达式"`\.(gif|jpg|png)$`"。因此，它将被后者处理。根据"`root /data/www`"指令，nginx将请求映射到文件`/data/www/logo.gif`"，并发送这个文件到客户端。
- 请求"`/index.php`"首先也匹配上location "`/`"，然后匹配上正则表达式"`\.(php)$`"。 因此，它将被后者处理，进而被发送到监听在localhost:9000的FastCGI服务器。[fastcgi_param](http://tengine.taobao.org/nginx_docs/cn/docs/http/ngx_http_fastcgi_module.html#fastcgi_param)指令将FastCGI的参数`SCRIPT_FILENAME`的值设置为"`/data/www/index.php`"，接着FastCGI服务器执行这个文件。变量`$document_root`等于[root](http://tengine.taobao.org/nginx_docs/cn/docs/http/ngx_http_core_module.html#root)指令设置的值，变量`$fastcgi_script_name`的值是请求的uri，"`/index.php`"。
- 请求"`/about.html`"仅能匹配上location "`/`"，因此，它将使用此location进行处理。根据"`root /data/www`"指令，nginx将请求映射到文件"`/data/www/about.html`"，并发送这个文件到客户端。
- 请求"`/`"的处理更为复杂。它仅能匹配上location "`/`"，因此，它将使用此location进行处理。然后，[index](http://tengine.taobao.org/nginx_docs/cn/docs/http/ngx_http_index_module.html#index)指令使用它的参数和"`root /data/www`"指令所组成的文件路径来检测对应的文件是否存在。如果文件`/data/www/index.html`不存在，而`/data/www/index.php`存在，此指令将执行一次内部重定向到"`/index.php`"，接着nginx将重新寻找匹配"`/index.php`"的location，就好像这次请求是从客户端发过来一样。正如我们之前看到的那样，这个重定向的请求最终交给FastCGI服务器来处理。



# 4  常用案例学习

## 4.1  Rewrite

	URL重写有利于网站首选域的确定，对于同一资源页面多条路径的301重定向有助于URL权重的集中。
	
	nginx重写规则说起来挺简单的，做起来就难，重点在于正则表达式，同时，还需要考虑到nginx执行顺序。

### 4.1.1  Nginx URL重写（rewrite）介绍

	和apache等web服务软件一样，rewrite的组要功能是实现RUL地址的重定向。Nginx的rewrite功能需要PCRE软件的支持，即通过perl兼容正则表达式语句进行规则匹配的。默认参数编译nginx就会支持rewrite的模块，但是也必须要PCRE的支持
	
	rewrite是实现URL重写的关键指令，根据regex（正则表达式）部分内容，重定向到replacement，结尾是flag标记。

### 4.1.2  rewrite语法格式及参数语法说明

>     rewrite    <regex>    <replacement>    [flag];
>
>     关键字      正则        	替代内容          	   flag标记
>
>     关键字：其中关键字rewrite不能改变
>
>     正则：perl兼容正则表达式语句进行规则匹配
>
>     替代内容：将正则匹配的内容替换成replacement
>
>     flag标记：rewrite支持的flag标记



	1、regex 常用正则表达式说明

| 字符      | 描述                                                         |
| --------- | ------------------------------------------------------------ |
| \         | 将后面接着的字符标记为一个特殊字符或一个原义字符或一个向后引用。如“\n”匹配一个换行符，而“\$”则匹配“$” |
| ^         | 匹配输入字符串的起始位置                                     |
| $         | 匹配输入字符串的结束位置                                     |
| *         | 匹配前面的字符零次或多次。如“ol*”能匹配“o”及“ol”、“oll”      |
| +         | 匹配前面的字符一次或多次。如“ol+”能匹配“ol”及“oll”、“oll”，但不能匹配“o” |
| ?         | 匹配前面的字符零次或一次，例如“do(es)?”能匹配“do”或者“does”，"?"等效于"{0,1}" |
| .         | 匹配除“\n”之外的任何单个字符，若要匹配包括“\n”在内的任意字符，请使用诸如“[.\n]”之类的模式。 |
| (pattern) | 匹配括号内pattern并可以在后面获取对应的匹配，常用$0...$9属性获取小括号中的匹配内容，要匹配圆括号字符需要\(Content\) |

	在rewrite中，如果使用小括号()，那么在小括号之间匹配的内容，可以在后面通过$1来引用，$2表示的是前面第二个()里的内容，后面会说到。
	
	2、flag标记说明：
	
	last  #本条规则匹配完成后，继续向下匹配新的location URI规则
	
	break  #本条规则匹配完成即终止，不再匹配后面的任何规则
	
	redirect  #返回302临时重定向，浏览器地址会显示跳转后的URL地址
	
	permanent  #返回301永久重定向，浏览器地址栏会显示跳转后的URL地址



	3、rewrite参数的标签段位置

```
server,location,if
```

### 4.1.3  Rewrite模块指令

	1、break

```
Syntax: break;
Default:—
Context:server, location, if
```

此指令的意思是停止执行当前虚拟主机的后续rewrite指令集。使用示例如下：

```
if ($slow) {
     set $id $1             #处于break指令之前，配置有效
     break;
     limit_rate 10k;      #处于break指令之后，配置无效
}
```

	2、if

```
Syntax: if (condition) { ... }
Default:—
Context:server, location
```

对给定的条件（condition）进行判断，如果条件为真，大括号内的rewrite指令将被执行。

条件(conditon)可以是如下任何操作：

> 1. 当表达式只是一个变量时，如果值为空或任何以0开头的字符串都会当做false；
>
> 2. 使用“=”和“!=”比较一个变量和字符串；
>
> 3. 使用“~”做正则表达式匹配，“~*”做不区分大小写的正则匹配，“!~”做区分大小写的正则不匹配；
>
> 4. 使用“-f”和“!-f” 检查一个文件是否存在；
>
> 5. 使用“-d”和“!-d”检查一个目录是否存在；
>
> 6. 使用“-e”和“!-e”检查一个文件、目录、符号链接是否存在；
>
> 7. 使用“-x”和“ !-x”检查一个文件是否可执行；

使用示例如下：

```

```

	可以用作if判断的全局变量

```
$args               #这个变量等于请求行中的参数，同$query_string;
$content_length     #请求头中的Content-length字段;
$content_type       #请求头中的Content-Type字段;
$document_root      #当前请求在root指令中指定的值，如:root /var/www/html;
$host               #请求主机头字段，否则为服务器名称;
$http_user_agent    #客户端agent信息;
$http_cookie        #客户端cookie信息;
$limit_rate         #这个变量可以限制连接速率;
$request_method     #客户端请求的动作，通常为GET或POST;
$remote_addr        #客户端的IP地址;
$remote_port        #客户端的端口;
$remote_user        #已经经过Auth Basic Module验证的用户名;
$request_filename   #当前请求的文件路径，由root或alias指令与URI请求生成;
$scheme             #HTTP方法（如http，https）;
$server_protocol    #请求使用的协议，通常是HTTP/1.0或HTTP/1.1;
$server_addr        #服务器地址，在完成一次系统调用后可以确定这个值;
$server_name        #服务器名称;
$server_port        #请求到达服务器的端口号;
$request_uri        #包含请求参数的原始URI，不包含主机名，如：”/foo/bar.php?arg=baz”;
$uri                #不带请求参数的当前URI，$uri不包含主机名，如”/foo/bar.html”;
$document_uri       #与$uri相同,例：http://localhost:88/test1/test2/test.php;
```

	3、return

```

```

	停止处理并为客户端返回状态码，非标准的444状态码将关闭连接，不发送任何响应头。可以使用的状态码有：204，400，402-406，408，410, 411, 413, 416与500-504。如果状态码附带文字段落，该文本将被放置在响应主体。相反，如果状态码后面是一个URL，该URL将成为location头部值。没有状态码的URL将被视为一个302状态码。
	
	4、rewrite
	
	如上4.1.2节选
	
	5、set

```
Syntax: set $variable value;
Default:—
Context:server, location, if
```

定义一个变量并赋值，值可以是文本，变量或者文本变量混合体。

	6、rewrite_log

```
Syntax: rewrite_log on | off;
Default:rewrite_log off;
Context:http, server, location, if
```

	开启或关闭以notice级别打印rewrite处理日志到error log文件。nginx打开rewrite log的例子如下：

```
rewrite_log on;                        //打开rewrite log
error_log logs/xxx.error.log notice;   //把error log的级别调整为notice
```

	7、uninitialized_variable_warn

```
Syntax: uninitialized_variable_warn on | off;
Default:uninitialized_variable_warn on;
Context:http, server, location, if
```

	控制是否输出未初始化的变量到日志。

### 4.1.3  企业应用场景

	Nginx的rewrite功能在企业里应用非常广泛：

> - 可以调整用户浏览的URL，看起来更规范，合乎开发及产品人员的需求。
> - 为了让搜索引擎搜录网站内容及用户体验更好，企业会将动态URL地址伪装成静态地址提供服务。
> - 网址换新域名后，让旧的访问跳转到新的域名上。例如，访问京东的360buy.com会跳转到jd.com
> 	 根据特殊变量、目录、客户端的信息进行URL调整等	

### 4.1.4  Nginx配置rewrite过程示例

	1、编辑nginx.conf内容如下：

```
 server {                                                    
     listen       80;                                        
     server_name  alex.com master.alex.com;                  
                                                             
     if ( $host != 'master.alex.com'  ) {                    
         rewrite ^/(.*) http://master.alex.com/$1 permanent; 
     }                                                       
                                                             
     location / {                                            
         root   html;                                        
         index  index.html index.htm;                        
     }                                                       
}
```

	2、重启服务

> nginx -t
>
> \#结果显示ok和success没问题便可重启
>
> nginx -s reload



	3、查看跳转效果

打开浏览器访问alex.com

页面打开后，URL地址栏的abc.com变成了master.alex.com说明URL重写成功。

	亦或是

```
λ curl -I http://alex.com/a/img
HTTP/1.1 301 Moved Permanently
Server: nginx/1.15.2
Date: Thu, 23 Aug 2018 00:55:07 GMT
Content-Type: text/html
Content-Length: 185
Connection: keep-alive
Location: http://master.alex.com/a/img
```

	参考：nginx 自动重定向，添加/，参考地址：https://www.cnblogs.com/zeoblog/p/6046144.html

> 在某些情况下（具体可参考 wiki.nginx.org），Nginx 内部重定向规则会被启动，例如，当 URL 指向一个目录并且在最后没有包含“/”时，Nginx 内部会自动的做一个 301 重定向，这时会有两种情况： 1、server_name_in_redirect on，URL 重定向为： server_name 中的第一个域名 + 目录名 + /； 2、server_name_in_redirect off（默认），URL 重定向为： 原 URL 中的域名 + 目录名 + /。
>
> 从nginx 0.8.48起server_name_in_redirect已经默认为off了

## 4.2  反向代理

	在计算机世界，代理可分为正向代理和反向代理，比如著名的梯子软件Lantern、Shadowsocks就是一款正向代理软件，全世界前1000的高流量网站都在用的Web服务器Nginx作为反向代理服务器，那么两者之间究竟有什么区别？

### 4.2.1 正向代理

	正向代理类似一个跳板机，代理访问外部资源。
	
	![zhengxiangproxy](/zhengxiangproxy.png)



举个例子：

	我是一个用户，我访问不了某网站，但是我能访问一个代理服务器，这个代理服务器呢,他能访问那个我不能访问的网站，于是我先连上代理服务器,告诉他我需要那个无法访问网站的内容，代理服务器去取回来,然后返回给我。从网站的角度，只在代理服务器来取内容的时候有一次记录，有时候并不知道是用户的请求，也隐藏了用户的资料，这取决于代理告不告诉网站。
	
	**客户端必须设置正向代理服务器，当然前提是要知道正向代理服务器的IP地址，还有代理程序的端口。**

例如之前使用过这类软件例如CCproxy，[http://www.ccproxy.com](http://www.ccproxy.com/)/ 需要在浏览器中配置代理的地址。

![proxyconfiguration](/imgs/proxyconfiguration.png)

	总结来说：正向代理 是一个位于客户端和原始服务器(origin server)之间的服务器，为了从原始服务器取得内容，客户端向代理发送一个请求并指定目标(原始服务器)，然后代理向原始服务器转交请求并将获得的内容返回给客户端。客户端必须要进行一些特别的设置才能使用正向代理。

**正向代理的用途：**

> （1）访问原来无法访问的资源，如google
>
> （2） 可以做缓存，加速访问资源
>
> （3）对客户端访问授权，上网进行认证
>
> （4）代理可以记录用户访问记录（上网行为管理），对外隐藏用户信息

### 4.2.2  反向代理

	反向代理（Reverse Proxy）方式是指以代理服务器来接受internet上的连接请求，然后将请求转发给内部网络上的服务器，并将从服务器上得到的结果返回给internet上请求连接的客户端，此时代理服务器对外就表现为一个反向代理服务器。
	
	客户端是无感知代理的存在的，反向代理对外都是透明的，访问者者并不知道自己访问的是一个代理。因为客户端不需要任何配置就可以访问。反向代理（Reverse Proxy）实际运行方式是指以代理服务器来接受internet上的连接请求，然后将请求转发给内部网络上的服务器，并将从服务器上得到的结果返回给internet上请求连接的客户端，此时代理服务器对外就表现为一个服务器。
	
	反向代理的作用：
	
	1、保证内网的安全，可以使用反向代理提供WAF功能，阻止web攻击

大型网站，通常将反向代理作为公网访问地址，Web服务器是内网。

![reverseproxy](/imgs/reverseproxy.png)

	2、负载均衡，通过反向代理服务器来优化网站的负载

![reverseandloadbalance](/imgs/reverseandloadbalance.png)

### 4.2.3 Nginx反向代理

	nginx作为web服务器一个重要的功能就是反向代理，通过反向代理实现网站的负载均衡。nginx通过proxy_pass_http 配置代理站点，upstream实现负载均衡。
	
	修改nginx.conf文件如下

```
server {
    listen 80;
    server_name alex.com master.alex.com;

    location / {
        proxy_pass http://127.0.0.1:8080 ;
    }
}
```

	后台8080端口映射的是一个Java程序，返回一个JSON数据，程序示例如下：

```
@RestController
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	@GetMapping("/")
	public Map<String,Object> index(){
		logger.info("index request processing");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("index","Proxy Index");
		map.put("code", 200);
		map.put("state", "UP");
		return map;
	}
}
```

	此时，我们再次访问master.alex.com，

![reverseProxy_sample1](/imgs/reverseProxy_sample1.jpg)

## 4.3  upstream池

	如果Nginx只能提供反向代理的能力，当一台服务示例挂掉，服务也就挂掉了，没有任何高可用价值。nginx的upstream模块，为nginx提供了跨越单机的横向处理能力，完成网络数据的接收、处理和转发，使nginx摆脱只能为终端节点提供单一功能的限制，而使它具备了网路应用级别的拆分、封装和整合的战略功能。在云模型大行其道的今天，数据转发是nginx有能力构建一个网络应用的关键组件。
	
	从本质上说，upstream属于handler，只是他不产生自己的内容，而是通过请求后端服务器得到内容，所以才称为upstream（上游）。请求并取得响应内容的整个过程已经被封装到nginx内部，所以upstream模块只需要开发若干回调函数，完成构造请求和解析响应等具体的工作。

### 4.3.1  upstream示例

添加upstream块

```
upstream user-backend { 
      server 172.22.46.40:8080; 
      server 172.22.46.42:8080; 
}
```

修改location块

```
location / {
    proxy_pass http://user-backend/ ;
}
```

	如今负载均衡初步完毕了。upstream依照轮询（默认）方式进行负载，每一个请求按时间顺序逐一分配到不同的后端服务器。假设后端服务器down掉。能自己主动剔除。尽管这样的方式简便、成本低廉。但缺点是：可靠性低和负载分配不均衡。除此之外， 除此之外，upstream还有其他的分配策略，我们再下一节讲解。

### 4.3.2  后端节点健康检查

	严格来说，nginx自带是没有针对负载均衡后端节点的健康检查的，但是可以通过默认自带的 ngx_http_proxy_module 模块 和ngx_http_upstream_module模块中的相关指令来完成当后端节点出现故障时，自动切换到健康节点来提供访问。

#### 4.3.2.1 ngx_http_proxy_module 

这里列出这两个模块中相关的指令：

ngx_http_proxy_module 模块中的  proxy_connect_timeout 指令、 proxy_read_timeout指令和proxy_next_upstream指令

```
语法:		 proxy_connect_timeout time;
默认值:	proxy_connect_timeout 60s;
上下文:	http, server, location
```

	设置与后端服务器建立连接的超时时间。应该注意这个超时一般不可能大于75秒。



```
语法:		 proxy_read_timeout time;
默认值:	proxy_read_timeout 60s;
上下文:	http, server, location
```

	定义从后端服务器读取响应的超时。此超时是指相邻两次读操作之间的最长时间间隔，而不是整个响应传输完成的最长时间。如果后端服务器在超时时间段内没有传输任何数据，连接将被关闭。

```
语法:		 proxy_next_upstream error | timeout | invalid_header | http_500 | http_502 | http_503 | http_504 |http_404 | off ...;
默认值:	proxy_next_upstream error timeout;
上下文:	http, server, location
```

指定在何种情况下一个失败的请求应该被发送到下一台后端服务器：

> ```
> error      # 和后端服务器建立连接时，或者向后端服务器发送请求时，或者从后端服务器接收响应头时，出现错误
> timeout    # 和后端服务器建立连接时，或者向后端服务器发送请求时，或者从后端服务器接收响应头时，出现超时
> invalid_header  # 后端服务器返回空响应或者非法响应头
> http_500   # 后端服务器返回的响应状态码为500
> http_502   # 后端服务器返回的响应状态码为502
> http_503   # 后端服务器返回的响应状态码为503
> http_504   # 后端服务器返回的响应状态码为504
> http_404   # 后端服务器返回的响应状态码为404
> off        # 停止将请求发送给下一台后端服务器
> ```

	需要理解一点的是，只有在没有向客户端发送任何数据以前，将请求转给下一台后端服务器才是可行的。也就是说，如果在传输响应到客户端时出现错误或者超时，这类错误是不可能恢复的。

范例如下：

```
http {
	proxy_next_upstream http_502 http_504 http_404 error timeout invalid_header;
}
```

#### 4.3.2.2  ngx_http_upstream_module

```
语法:		 server address [parameters];
默认值:	―
上下文:	upstream
```

范例如下：

```
upstream name {
    server 10.1.1.110:8080 max_fails=1 fail_timeout=10s;
    server 10.1.1.122:8080 max_fails=1 fail_timeout=10s;
}
```

下面是每个指令的介绍：

> ```
> 	max_fails=number      # 设定Nginx与服务器通信的尝试失败的次数。在fail_timeout参数定义的时间段内，如果失败的次数达到此值，Nginx就认为服务器不可用。在下一个fail_timeout时间段，服务器不会再被尝试。 失败的尝试次数默认是1。设为0就会停止统计尝试次数，认为服务器是一直可用的。 你可以通过指令proxy_next_upstream、fastcgi_next_upstream和 memcached_next_upstream来配置什么是失败的尝试。 默认配置时，http_404状态不被认为是失败的尝试。
> 	fail_timeout=time       # 设定服务器被认为不可用的时间段以及统计失败尝试次数的时间段。在这段时间中，服务器失败次数达到指定的尝试次数，服务器就被认为不可用。默认情况下，该超时时间是10秒。
> 	在实际应用当中，如果你后端应用是能够快速重启的应用，比如nginx的话，自带的模块是可以满足需求的。但是需要注意。如果后端有不健康节点，负载均衡器依然会先把该请求转发给该不健康节点，然后再转发给别的节点，这样就会浪费一次转发。
> 	可是，如果当后端应用重启时，重启操作需要很久才能完成的时候就会有可能拖死整个负载均衡器。此时，由于无法准确判断节点健康状态，导致请求handle住，出现假死状态，最终整个负载均衡器上的所有节点都无法正常响应请求。由于公司的业务程序都是java开发的，因此后端主要是nginx集群和tomcat集群。由于tomcat重启应部署上面的业务不同，有些业务启动初始化时间过长，就会导致上述现象的发生，因此不是很建议使用该模式。
> 	并且ngx_http_upstream_module模块中的server指令中的max_fails参数设置值，也会和ngx_http_proxy_module 模块中的的proxy_next_upstream指令设置起冲突。比如如果将max_fails设置为0，则代表不对后端服务器进行健康检查，这样还会使fail_timeout参数失效（即不起作用）。此时，其实我们可以通过调节ngx_http_proxy_module 模块中的 proxy_connect_timeout 指令、		proxy_read_timeout指令，通过将他们的值调低来发现不健康节点，进而将请求往健康节点转移。
> ```

	以上两节就是nginx自带的两个和后端健康检查相关的模块。

#### 4.3.2.3 nginx_upstream_check_module

	参考：http://tengine.taobao.org/document_cn/http_upstream_check_cn.html
	
	除了自带的上述模块，还有一个更专业的模块，来专门提供负载均衡器内节点的健康检查的。这个就是淘宝技术团队开发的 nginx 模块 nginx_upstream_check_module，通过它可以用来检测后端 realserver 的健康状态。如果后端 realserver 不可用，则所以的请求就不会转发到该节点上。
	
	在淘宝自己的 tengine 上是自带了该模块的，大家可以访问淘宝tengine的官网来获取该版本的nginx，官方地址： [http://tengine.taobao.org/ ](http://tengine.taobao.org/)。
	
	如果我们没有使用淘宝的 tengine 的话，可以通过补丁的方式来添加该模块到我们自己的 nginx 中。我们业务线上就是采用该方式进行添加的。

1、下载nginx_upstream_check_module模块

```
wget https://codeload.github.com/yaoweibin/nginx_upstream_check_module/zip/master
unzip master
```

2、为nginx打补丁

```
cd nginx-1.15.2 # 进入nginx的源码目录
sudo patch -p1 < ../nginx_upstream_check_module-master/check_1.14.0+.patch

./configure 
--prefix=/etc/nginx 
--sbin-path=/usr/sbin/nginx 
--modules-path=/usr/lib64/nginx/modules 
--conf-path=/etc/nginx/nginx.conf  
--error-log-path=/var/log/nginx/error.log 
--http-log-path=/var/log/nginx/access.log 
--pid-path=/var/run/nginx.pid 
--http-client-body-temp-path=/var/cache/nginx/client_temp 
--http-proxy-temp-path=/var/cache/nginx/proxy_temp 
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp 
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp 
--http-scgi-temp-path=/var/cache/nginx/scgi_temp 
--user=nginx 
--group=nginx 
--with-compat 
--with-file-aio 
--with-threads
--with-http_stub_status_module 
--with-http_realip_module 
--with-http_ssl_module 
--with-http_gzip_static_module
--add-module=../nginx_upstream_check_module-master/
--add-module=../ngx_cache_purge-2.3

make
mv /usr/sbin/nginx /usr/sbin/nginx_bak
cp objs/nginx /usr/sbin/

```

3、在nginx.conf配置文件里面的upstream加入健康检查，如下

```
upstream name {
    server 192.168.0.21:80;
    server 192.168.0.22:80;
    check interval=3000 rise=2 fall=5 timeout=1000 type=http;

}
```

	对name这个负载均衡条目中的所有节点，每个3秒检测一次，请求2次正常则标记 realserver状态为up，如果检测 5 次都失败，则标记 realserver的状态为down，超时时间为1秒。
	
	这里列出 nginx_upstream_check_module 模块所支持的指令意思：

```
Syntax: check interval=milliseconds [fall=count] [rise=count] [timeout=milliseconds] [default_down=true|false] [type=tcp|http|ssl_hello|mysql|ajp] [port=check_port]

Default: 如果没有配置参数，默认值是：interval=30000 fall=5 rise=2 timeout=1000
default_down=true type=tcp
Context: upstream
```

	该指令可以打开后端服务器的健康检查功能
	
	指令后面的参数意义是：

> ```
>   - interval：向后端发送的健康检查包的间隔。
>   - fall(fall_count): 如果连续失败次数达到fall_count，服务器就被认为是down。
>   - rise(rise_count): 如果连续成功次数达到rise_count，服务器就被认为是up。
>   - timeout: 后端健康请求的超时时间。
>   - default_down: 设定初始时服务器的状态，如果是true，就说明默认是down的，如果是false，就是up的。默认值是true，也就是一开始服务器认为是不可用，要等健康检查包达到一定成功次数以后才会被认为是健康的。
>   - type：健康检查包的类型，现在支持以下多种类型
>     - tcp：简单的tcp连接，如果连接成功，就说明后端正常。
>     - ssl_hello：发送一个初始的SSL hello包并接受服务器的SSL hello包。
>     - http：发送HTTP请求，通过后端的回复包的状态来判断后端是否存活。
>     - mysql: 向mysql服务器连接，通过接收服务器的greeting包来判断后端是否存活。
>     - ajp：向后端发送AJP协议的Cping包，通过接收Cpong包来判断后端是否存活。
>   - port: 指定后端服务器的检查端口。你可以指定不同于真实服务的后端服务器的端口，比如后端提供的是443端口的应用，你可以去检查80端口的状态来判断后端健康状况。默认是0，表示跟后端server提供真实服务的端口一样。该选项出现于Tengine-1.4.0。
> ```



其它指令：

	该指令可以配置一个连接发送的请求数，其默认值为1，表示Tengine完成1次请求后即关闭连接。

	该指令可以配置http健康检查包发送的请求内容。为了减少传输数据量，推荐采用"HEAD"方法。
	
	当采用长连接进行健康检查时，需在该指令中添加keep-alive请求头，如："HEAD / HTTP/1.1\r\nConnection: keep-alive\r\n\r\n"。 同时，在采用"GET"方法的情况下，请求uri的size不宜过大，确保可以在1个interval内传输完成，否则会被健康检查模块视为后端服务器或网络异常。

	该指令指定HTTP回复的成功状态，默认认为2XX和3XX的状态是健康的。

	所有的后端服务器健康检查状态都存于共享内存中，该指令可以设置共享内存的大小。默认是1M，如果你有1千台以上的服务器并在配置的时候出现了错误，就可能需要扩大该内存的大小。



	显示服务器的健康状态页面。该指令需要在http块中配置。

在Tengine-1.4.0以后，你可以配置显示页面的格式。支持的格式有: html、csv、 json。默认类型是html。

你也可以通过请求的参数来指定格式，假设‘/status’是你状态页面的URL， format参数改变页面的格式，比如：

```

```

同时你也可以通过status参数来获取相同服务器状态的列表，比如：

```

```

下面是一个状态也配置的范例：

```

```

配置完毕后，重启nginx。此时通过访问定义好的路径，就可以看到当前 realserver 实时的健康状态啦。

realserver 都正常的状态：

![realserverallup](/imgs/realserverallup.jpeg)

一台 realserver 故障的状态：

![realserverdown](/imgs/realserverdown.jpeg)



注意点：

> 	1、主要定义好type。由于默认的type是tcp类型，因此假设你服务启动，不管是否初始化完毕，它的端口都会起来，所以此时前段负载均衡器为认为该服务已经可用，其实是不可用状态。
>
> 	2、注意check_http_send值的设定。由于它的默认值是"GET / HTTP/1.0\r\n\r\n"。假设你的应用是通过http://ip/name访问的，那么这里你的 check_http_send值就需要更改为 "GET /name HTTP/1.0\r\n\r\n"才可以。针对采用长连接进行检查的， 这里增加 keep-alive请求 头，即"HEAD /name HTTP/1.1\r\nConnection: keep-alive\r\n\r\n"。如果你后端的tomcat是基于域名的多虚拟机，此时你需要通过 check_http_send定义host，不然每次访问都是失败，范例：check_http_send "GET /mobileapi HTTP/1.0\r\n HOST  [www.redhat.sx\r\n\r\n";](http://www.tuicool.com/articles/vuiQry#)



## 4.4  负载均衡策略及演示

http://nginx.org/en/docs/http/load_balancing.html

跨多个应用程序实例的负载平衡是一种常用技术，用于优化资源利用率，最大化吞吐量，减少延迟并确保容错配置。

可以使用nginx作为非常有效的HTTP负载平衡器，将流量分配到多个应用程序服务器，并使用nginx提高Web应用程序的性能，可伸缩性和可靠性。

负载均衡方法

nginx支持以下负载平衡机制（或方法）：

- 轮训。对应用程序服务器的请求以循环方式分发，
- 最少连接 - 下一个请求被分配给活动连接数最少的服务器，
- ip-hash - 哈希函数用于确定应为下一个请求选择哪个服务器（基于客户端的IP地址）。

### 4.4.1  轮询(默认)

每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器down掉，能自动剔除。

```
upstream backserver {
	server 192.168.0.14;
	server 192.168.0.15;
}
```

### 4.4.2  指定权重

	指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的情况。

```
upstream backserver {
	server 192.168.0.14 weight=10;
	server 192.168.0.15 weight=10;
}
```

### 4.4.3  ip_hash

	每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。

```
upstream backserver {
	ip_hash;
	server 192.168.0.14:88;
	server 192.168.0.15:80;
}
```

### 4.4.4  fair（第三方）

	按后端服务器的响应时间来分配请求，响应时间短的优先分配。

```
upstream backserver {
	server server1;
	server server2;
	fair;
}
```

#### 模块介绍

The Nginx fair proxy balancer enhances the standard round-robin load balancer provided
with Nginx so that it will track busy back end servers (e.g. Thin, Ebb, Mongrel)
and balance the load to non-busy server processes.

简单翻译一下，fair采用的不是内建负载均衡使用的轮换的均衡算法，而是可以根据页面大小、加载时间长短智能的进行负载均衡。
下载地址：[nginx-upstream-fair](https://github.com/gnosek/nginx-upstream-fair?spm=a2c4e.11153940.blogcont73621.10.752155b93ao5QM)

解压：

```
unzip  nginx-upstream-fair-master.zip
```

#### 模块安装

#### 未安装Nginx

切换到Nginx目录执行一下操作
配置：

```
./configure --prefix=/usr/local/nginx  --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid  --add-module=/home/nginx-upstream-fair-master
```

编译安装

```
make && make intstall
```

#### 安装过Nginx

切换到Nginx目录执行一下操作

配置

```
./configure --prefix=/usr/local/nginx  --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid  --add-module=/home/nginx-upstream-fair-master
```

编译

```
make
```

复制Nginx

```
 cp objs/nginx /usr/local/nginx/nginx
```

#### 配置实现

```
upstream backserver { 
fair; 
server 192.168.0.14; 
server 192.168.0.15; 
} 
```

#### 注意事项

已安装Nginx，配置第三方模块时，只需要--add-module=/第三方模块目录，然后make编译一下就可以，不要 make install 安装。编译后复制objs下面的Nginx到指定目录下。

配置中path自行定义即可。

### 4.4.5  url_hash（第三方）

	按访问url的hash结果来分配请求，使每个url定向到同一个后端服务器，后端服务器为缓存时比较有效。

```
upstream backserver {
server squid1:3128;
server squid2:3128;
hash $request_uri;
hash_method crc32;
}
```

此模块从Nginx 1.7.2开始已过时

参考：

	1、https://github.com/evanmiller/nginx_upstream_hash

### 4.4.6 Upstream Consistent Hash (第三方)

使用内部一致性哈希环来选择正确的后端节点，常用于后端缓存。

```
upstream somestream {
	consistent_hash $request_uri;
    server 10.50.1.3:11211;
    server 10.50.1.4:11211;
    server 10.50.1.5:11211;
}
```

参考：https://www.nginx.com/resources/wiki/modules/consistent_hash/

## 4.5  统计信息

### 4.5.1  日志统计

做网站的都知道，平常经常要查询下网站PV、UV等网站的访问数据，当然如果网站做了CDN的话，nginx本地的日志就没什么意义了，下面就对nginx网站的日志访问数据做下统计；

**概念：**

> - UV(Unique Visitor)：独立访客，将每个独立上网电脑（以cookie为依据）视为一位访客，一天之内（00:00-24:00），访问您网站的访客数量。一天之内相同cookie的访问只被计算1次
> - PV（Page View）：访问量,即页面浏览量或者点击量,用户每次对网站的访问均被记录1次。用户对同一页面的多次访问，访问量值累计
> - 统计独立IP：00:00-24:00内相同IP地址只被计算一次,做[网站优化](http://laoleo.blog.techweb.com.cn/wp-admin/http;//www.sem120.cn)的朋友最关心这个



```
 log_format  main  '$remote_addr - [$time_local]  "$request" '
                        ' - $status "User_Cookie:$guid" ';
```

**PV统计**

可统计单个链接地址访问量：

```
`[root@localhost logs]``# grep index.shtml host.access.log | wc -l`
```

**总PV量**：

```
`[root@localhost logs]``# awk '{print $6}' host.access.log | wc -l`
```

**独立IP**　

```
`[root@localhost logs]``# awk '{print $1}' host.access.log | sort -r |uniq -c | wc -l`
```

**UV统计**

```
`[root@localhost logs]``# awk '{print $10}' host.access.log | sort -r |uniq -c |wc -l`
```



### 4.5.2  realip获取

	Nginx反向代理后，Servlet应用通过request.getRemoteAddr()取到的IP是Nginx的IP地址，并非客户端真实IP，通过request.getRequestURL()获取的域名、协议、端口都是Nginx访问Web应用时的域名、协议、端口，而非客户端浏览器地址栏上的真实域名、协议、端口。
	
	Nginx的反向代理实际上是客户端和真实的应用服务器之间的一个桥梁，客户端（一般是浏览器）访问Nginx服务器，Nginx再去访问Web应用服务器。对于Web应用来说，这次HTTP请求的客户端是Nginx而非真实的客户端浏览器，如果不做特殊处理的话，Web应用会把Nginx当作请求的客户端，获取到的客户端信息就是Nginx的一些信息。

解决这个问题要从两个方面来解决： 

```
1、由于Nginx是代理服务器，所有客户端请求都从Nginx转发到Tomcat，如果Nginx不把客户端真实IP、域名、协议、端口告诉Tomcat，那么Tomcat应用是永远不会知道这些信息的，所以需要Nginx配置一些HTTP Header来将这些信息告诉被代理的Tomcat； 

2、Tomcat这一端，不能再傻乎乎的获取直接和它连接的客户端（也就是Nginx）的信息，而是要从Nginx传递过来的HTTP Header中获取客户端信息。
```

Nginx
在代理的每个location处添加以下配

```
proxy_set_header Host $http_host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
proxy_set_header X-Forwarded-Proto $scheme;
```

解释以下上面的配置，以上配置是在Nginx反向代理的时候，添加一些请求Header。 
1. Host包含客户端真实的域名和端口号； 
2. X-Forwarded-Proto表示客户端真实的协议（http还是https）； 
3. X-Real-IP表示客户端真实的IP； 
4. X-Forwarded-For这个Header和X-Real-IP类似，但它在多层代理时会包含真实客户端及中间每个代理服务器的IP。

#### 4.5.3.1 Servlet中获取真实IP

	网上给出的解决方案大多是通过获取HTTP请求头request.getHeader("X-Forwarded-For")或request.getHeader("X-Real-IP")来实现，也就是上面在Nginx上配置的Header，这种方案获取的结果的确是正确的，但觉得并不优雅。

因为既然Servlet API提供了request.getRemoteAddr()方法获取客户端IP，那么无论有没有用反向代理对于代码编写者来说应该是透明的。下面介绍一种更加优雅的方式。


使用Tomcat作为应用服务器，可以通过配置Tomcat的server.xml文件，在Host元素内最后加入：即可

```
<Valve className="org.apache.catalina.valves.RemoteIpValve" />
```

#### 4.5.3.2  nginx获取真实IP

在 http 模块 加

```
set_real_ip_from 172.17.10.125;
# real_ip_header X-Forwarded-For;
real_ip_recursive on;
```

即可！

```
1、set_real_ip_from 是指接受从哪个信任前代理处获得真实用户ip

2、real_ip_header 是指从接收到报文的哪个http首部去获取前代理传送的用户ip

3、real_ip_recursive 是否递归地排除直至得到用户ip（默认为off） 
```

首先，real_ip_header 指定一个http首部名称，默认是X-Real-Ip，假设用默认值的话，nginx在接收到报文后，会查看http首部X-Real-Ip。

（1）如果有1个IP，它会去核对，发送方的ip是否在set_real_ip_from指定的信任ip列表中。如果是被信任的，它会去认为这个X-Real-Ip中的IP值是前代理告诉自己的，用户的真实IP值，于是，它会将该值赋值给自身的$remote_addr变量；如果不被信任，那么将不作处理，那么$remote_addr还是发送方的ip地址。

（2）如果X-Real-Ip有多个IP值，比如前一方代理是这么设置的：proxy_set_header X-Real-Ip $proxy_add_x_forwarded_for , 得到的是一串IP，那么此时real_ip_recursive 的值就至关重要了。nginx将会从ip列表的右到左，去比较set_real_ip_from 的信任列表中的ip。如果real_ip_recursive为off，那么，当最右边一个IP，发现是信任IP，即认为下一个IP（右边第二个）就是用户的真正IP；如果real_ip_recursive为on，那么将从右到左依次比较，知道找到一个不是信任IP为止。然后同样把IP值复制给$remote_addr。

#### 4.5.3.3 三种在CDN环境下获取用户IP方法总结

1 CDN自定义header头

- 优点：获取到最真实的用户IP地址,用户绝对不可能伪装IP
- 缺点：需要CDN厂商提供

2 获取forwarded-for头

- 优点：可以获取到用户的IP地址
- 缺点：程序需要改动,以及用户IP有可能是伪装的

3 使用realip获取

- 优点：程序不需要改动，直接使用remote_addr即可获取IP地址
- 缺点：ip地址有可能被伪装，而且需要知道所有CDN节点的ip地址或者ip段

参考：

https://www.centos.bz/2017/03/nginx-using-set_real_ip_from-get-client-ip/

### 4.5.3  nginx_status

1、启用nginx status配置

在默认主机里面加上location或者你希望能访问到的主机里面

```
server {
    listen  *:80 default_server;
    server_name _;
    location /ngx_status 
    {
        stub_status on;
        access_log off;
        #allow 127.0.0.1;
        #deny all;
    }
}
```

2、重启后访问Nginx

```
# curl http://127.0.0.1/ngx_status
Active connections: 11921 
server accepts handled requests
 11989 11989 11991 
Reading: 0 Writing: 7 Waiting: 42
```

3、**nginx status详解**

> active connections – 活跃的连接数量
> server accepts handled requests — 总共处理了11989个连接 , 成功创建11989次握手, 总共处理了11991个请求
> reading — 读取客户端的连接数.
> writing — 响应数据到客户端的数量
> waiting — 开启 keep-alive 的情况下,这个值等于 active – (reading+writing), 意思就是 Nginx 已经处理完正在等候下一次请求指令的驻留连接.

4、可以结合zabbix或者是Grafana显示统计信息。

## 4.6  限速

	我们经常遇到这种情况,客户使用生产环境进行了压力测试，大量的请求，导致其他客户的请求未能响应。
	
	服务器资源有限,但是客户端来的请求在不断的上涨, 为了保证一部分的请求能够正常相应, 不得不放弃一些客户端来的请求, 这个时候我们会选择行的进行一些NGINX的限流操作, 这种操作可以很大程度上缓解服务器的压力, 使其他正常的请求能够得到正常响应。

### 4.6.1  常见限流算法

	常见的限流算法有：计数器、漏桶和令牌桶算法。

#### 4.6.1.1  计数器

	计数器是最简单粗暴的算法。比如某个服务最多只能每秒钟处理100个请求。我们可以设置一个1秒钟的滑动窗口，窗口中有10个格子，每个格子100毫秒，每100毫秒移动一次，每次移动都需要记录当前服务请求的次数。内存中需要保存10次的次数。可以用数据结构LinkedList来实现。格子每次移动的时候判断一次，当前访问次数和LinkedList中最后一个相差是否超过100，如果超过就需要限流了。

![nginx_limit_calculator](/imgs/nginx_limit_calculator.png)

很明显，当滑动窗口的格子划分的越多，那么滑动窗口的滚动就越平滑，限流的统计就会越精确。

```
//服务访问次数，可以放在Redis中，实现分布式系统的访问计数
Long counter = 0L;
//使用LinkedList来记录滑动窗口的10个格子。
LinkedList<Long> ll = new LinkedList<Long>();

public static void main(String[] args)
{
    Counter counter = new Counter();

    counter.doCheck();
}

private void doCheck()
{
    while (true)
    {
        ll.addLast(counter);
        
        if (ll.size() > 10)
        {
            ll.removeFirst();
        }
        
        //比较最后一个和第一个，两者相差一秒
        if ((ll.peekLast() - ll.peekFirst()) > 100)
        {
            //To limit rate
        }
        
        Thread.sleep(100);
    }
}
```

#### 4.6.1.2 漏桶算法

	漏桶算法即leaky bucket是一种非常常用的限流算法，可以用来实现流量整形（Traffic Shaping）和流量控制（Traffic Policing）。

![nginx_limit_leaky_bucket](/imgs/nginx_limit_leaky_bucket.png)

漏桶算法的主要概念如下：

- 一个固定容量的漏桶，按照常量固定速率流出水滴；
- 如果桶是空的，则不需流出水滴；
- 可以以任意速率流入水滴到漏桶；
- 如果流入水滴超出了桶的容量，则流入的水滴溢出了（被丢弃），而漏桶容量是不变的。

 

漏桶算法比较好实现，在单机系统中可以使用队列来实现（.Net中TPL DataFlow可以较好的处理类似的问题，你可以在[这里](http://www.cnblogs.com/haoxinyue/archive/2013/03/01/2938959.html)找到相关的介绍），在分布式环境中消息中间件或者Redis都是可选的方案。

#### 4.6.1.3  令牌桶算法

	令牌桶算法是一个存放固定容量令牌（token）的桶，按照固定速率往桶里添加令牌。令牌桶算法基本可以用下面的几个概念来描述：

- 令牌将按照固定的速率被放入令牌桶中。比如每秒放10个。
- 桶中最多存放b个令牌，当桶满时，新添加的令牌被丢弃或拒绝。
- 当一个n个字节大小的数据包到达，将从桶中删除n个令牌，接着数据包被发送到网络上。
- 如果桶中的令牌不足n个，则不会删除令牌，且该数据包将被限流（要么丢弃，要么缓冲区等待）。

如下图：

![nginx_limit_bulket](/imgs/nginx_limit_bulket.jpg)

令牌算法是根据放令牌的速率去控制输出的速率。也就是后续透过去的请求速率。



**漏桶和令牌桶的比较**

	令牌桶可以在运行时控制和调整数据处理的速率，处理某时的突发流量。放令牌的频率增加可以提升整体数据处理的速度，而通过每次获取令牌的个数增加或者放慢令牌的发放速度和降低整体数据处理速度。而漏桶不行，因为它的流出速率是固定的，程序处理速度也是固定的。
	
	整体而言，令牌桶算法更优，但是实现更为复杂一些。

### 4.6.2  限制连接数

	基于ngx_http_limit_conn_module模块，使用limit_conn_zone 指令设置限制

```

http{
    limit_conn_zone $binary_remote_addr zone=one:10m;
    server
    {
         ......
        limit_conn   one  10;
        ......
    }
}
```

	其中“limit_conn one 10”既可以放在server层对整个server有效，也可以放在location中只对单独的location有效。
	
	该配置表明：同一客户端的并发连接数只能是10个。

### 4.6.3  限制访问频率

	参考：http://nginx.org/en/docs/http/ngx_http_limit_req_module.html
	
	基于ngx_http_limit_req_module模块，限制server或服务访问频率，特别是从一个单一的IP地址的请求的处理速率。使用“漏桶”方法进行限制。

```
http{
    limit_req_zone  $binary_remote_addr  zone=req_one:10m rate=1r/s;
    server
    {
         ......
        limit_req   zone=req_one  burst=120;
        ......
    }
}

```

	其中“limit_req zone=req_one burst=120”既可以放在server层对整个server有效，也可以放在location中只对单独的location有效。
	
	rate=1r/s的意思是每个地址每秒只能请求一次，也就是说令牌桶burst=120一共有120块令牌，并且每秒钟只新增1块令牌，
	
	120块令牌发完后，多出来的请求就会返回503.。
	
	需要注意的是，使用的不是`$remote_addr`，而是 `$binary_remote_addr`变量。`$binary_remote_addr`对于IPv4地址，变量的大小始终为4个字节，对于IPv6地址，变量的大小始终为16个字节。存储状态在32位平台上总是占用64个字节，在64位平台上占用128个字节。一兆字节区域可以保留大约16,000个64字节状态或大约8千个128字节状态。
	
	如果区域存储耗尽，则删除最近最少使用的状态。即便在此之后无法创建新状态，该请求也会因[错误](http://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_status)而终止。
	
	速率以每秒请求数（r / s）指定。如果需要每秒少于一个请求的速率，则在每分钟请求（r / m）中指定。例如，每秒半请求为30r / m。

```
句法：	limit_req zone=name [burst=number] [nodelay];
默认：	-
语境：	http，server，location
```

设置共享内存区域和请求的最大突发大小。如果请求速率超过为区域配置的速率，则延迟其处理，以便以定义的速率处理请求。过多的请求被延迟，直到它们的数量超过最大突发大小，在这种情况下请求以[错误](http://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_status)终止 。默认情况下，最大突发大小等于零。例如，指令

```
limit_req_zone $ binary_remote_addr zone = one：10m rate = 1r / s;

server {
    location / search / {
        limit_req zone = one burst = 5;
    }
}
```

允许每秒平均不超过1个请求，突发不超过5个请求。

如果不希望在请求受限的情况下延迟过多请求，`nodelay`则应使用以下参数：

```
limit_req zone = one burst = 5 nodelay;
```

	可能有几个`limit_req`指令。例如，以下配置将限制来自单个IP地址的请求的处理速率，同时限制虚拟服务器的请求处理速率：

```
limit_req_zone $ binary_remote_addr zone = perip：10m rate = 1r / s;
limit_req_zone $ server_name zone = perserver：10m rate = 10r / s;

server{
    ...
    limit_req zone = perip burst = 5 nodelay;
    limit_req zone = perserver burst = 10;
}
```

	**当且仅当`limit_req` 当前级别没有指令时，这些指令才从前一级继承 **

```
句法：	limit_req_log_level info | notice | warn | error;
默认：	limit_req_log_level错误;
语境：	http，server，location
该指令出现在0.8.18版本中。
```

	为服务器因速率超过或延迟请求处理而拒绝处理请求的情况设置所需的日志记录级别。延迟的记录水平比拒绝的记录水平低一个点; 例如，如果`limit_req_log_level notice`指定了“ ”，则会记录与`info`级别的延迟。

```
句法：	limit_req_status code;
默认：	
limit_req_status 503;
语境：	http，server，location
该指令出现在1.3.15版本中。
```

设置要响应拒绝的请求而返回的状态代码。

### 4.6.4  后端服务限流

	ngx_http_upstream_module模块，作为优秀的负载均衡模块，目前是我工作中用到最多的。其实，该模块是提供了我们需要的后端限流功能的。通过官方文档介绍，该模块有一个参数：max_conns可以对服务端进行限流，可惜在商业版nginx中才能使用。然而，在nginx1.11.5版本以后，官方已经将该参数从商业版中脱离出来了，也就是说只要我们将生产上广泛使用的nginx1.9.12版本和1.10版本升级即可使用（通过测试可以看到，在旧版本的nginx中，如果加上该参数，nginx服务是无法启动的）

```
upstream xxxx{
    server 127.0.0.1:8080 max_conns=10;
    server 127.0.0.1:8081 max_conns=10;
}
```



> 注：还有很重要的几点。max_conns是针对upstream中的单台server的，不是所有；nginx有个参数：worker_processes，max_conns是针对每个worker_processes的；

# 5  缓存处理

	一个web缓存坐落于客户端和“原始服务器（origin server）”中间，它保留了所有可见内容的拷贝。如果一个客户端请求的内容在缓存中存储，则可以直接在缓存中获得该内容而不需要与服务器通信。这样一来，由于web缓存距离客户端“更近”，就可以提高响应性能，并更有效率的使用应用服务器，因为服务器不用每次请求都进行页面生成工作。 
在浏览器和应用服务器之间，存在多种“潜在”缓存，如：客户端浏览器缓存、中间缓存、内容分发网络（CDN）和服务器上的负载平衡和反向代理。缓存，仅在反向代理和负载均衡的层面，就对性能提高有很大的帮助。

　　Nginx从0.7.48版本开始，支持了类似Squid的缓存功能。这个缓存是把URL及相关组合当作Key，用md5编码哈希后保存在硬盘上，所以它可以支持任意URL链接，同时也支持404/301/302这样的非200状态码。虽然目前官方的Nginx Web缓存服务只能为指定URL或状态码设置过期时间，不支持类似Squid的PURGE指令，手动清除指定缓存页面，但是，通过一个第三方的Nginx模块，可以清除指定URL的缓存。

　　Nginx的Web缓存服务主要由proxy_cache相关指令集和fastcgi_cache相关指令集构成，前者用于反向代理时，对后端内容源服务器进行缓存，后者主要用于对FastCGI的动态程序进行缓存。两者的功能基本上一样。

　　最新的Nginx 0.8.32版本，proxy_cache和fastcgi_cache已经比较完善，加上第三方的ngx_cache_purge模块（用于清除指定URL的缓存），已经可以完全取代Squid。我们已经在生产环境使用了 Nginx 的 proxy_cache 缓存功能超过两个月，十分稳定，速度不逊于 Squid。

　　在功能上，Nginx已经具备Squid所拥有的Web缓存加速功能、清除指定URL缓存的功能。而在性能上，Nginx对多核CPU的利用，胜过Squid不少。另外，在反向代理、负载均衡、健康检查、后端服务器故障转移、Rewrite重写、易用性上，Nginx也比Squid强大得多。这使得一台Nginx可以同时作为“负载均衡服务器”与“Web缓存服务器”来使用。

## 5.1  Nginx缓存处理原理

	Nginx在文件系统上使用分层数据存储实现缓存。缓存主键可配置，并且可使用不同特定请求参数来控制缓存内容。缓存主键和元数据存储在共享内存段中，缓存加载进程、缓存管理进程和worker进程都能访问。**目前不支持在内存中缓存文件**，但可以用操作系统的虚拟文件系统机制进行优化。每个缓存的响应存储到文件系统上的不同文件，Nginx配置指令控制存储的层级（分几级和命名方式）。如果响应需要缓存到缓存目录，就从URL的MD5哈希值中获取缓存的路径和文件名。
	
	将响应内容缓存到磁盘的过程如下：当nginx从后端服务器读取响应时，响应内容先写到缓存目录之外的一个临时文件。nginx完成请求处理后，就将这个临时文件重命名并移到缓存目录。如果用于代理功能的临时目录位于另外一个文件系统，则临时文件会被拷贝一次，所以建议将临时目录和缓存目录放到同一个文件系统上。如果需要清除缓存目录，也可以很安全的删除文件。一些第三方扩展可以远程控制缓存内容，而且整合这些功能到主发布版的工作已经列入计划。

## 5.2  代理缓存

nginx的http_proxy模块，可以实现类似于Squid的缓存功能。Nginx对客户已经访问过的内容在Nginx服务器本地建立副本，这样在一段时间内再次访问该数据，就不需要通过Ｎginx服务器再次向后端服务器发出请求，所以能够减少Ｎginx服务器与后端服务器之间的网络流量，减轻网络拥塞，同时还能减小数据传输延迟，提高用户访问速度。同时，当后端服务器宕机时，Nginx服务器上的副本资源还能够回应相关的用户请求，这样能够提高后端服务器的鲁棒性

---------------------
```
proxy_cache_path /path/to/cache levels=1:2 keys_zone=my_cache:10m max_size=10g inactive=60m use_temp_path=off;
server {
    set $upstream http://ip:port
    location / {
    proxy_cache my_cache;
    proxy_pass $upstream;
}
```



```
/path/to/cache  #本地路径，用来设置Nginx缓存资源的存放地址
levels          #默认所有缓存文件都放在同一个/path/to/cache下，但是会影响缓存的性能，因此通常会在/path/to/cache下面建立子目录用来分别存放不同的文件。假设levels=1:2，Nginx为将要缓存的资源生成的key为f4cd0fbc769e94925ec5540b6a4136d0，那么key的最后一位0，以及倒数第2-3位6d作为两级的子目录，也就是该资源最终会被缓存到/path/to/cache/0/6d目录中
key_zone        #在共享内存中设置一块存储区域来存放缓存的key和metadata（类似使用次数），这样nginx可以快速判断一个request是否命中或者未命中缓存，1m可以存储8000个key，10m可以存储80000个key
max_size        #最大cache空间，如果不指定，会使用掉所有disk space，当达到配额后，会删除最少使用的cache文件
inactive        #未被访问文件在缓存中保留时间，本配置中如果60分钟未被访问则不论状态是否为expired，缓存控制程序会删掉文件。inactive默认是10分钟。需要注意的是，inactive和expired配置项的含义是不同的，expired只是缓存过期，但不会被删除，inactive是删除指定时间内未被访问的缓存文件
use_temp_path   #如果为off，则nginx会将缓存文件直接写入指定的cache文件中，而不是使用temp_path存储，official建议为off，避免文件在不同文件系统中不必要的拷贝
proxy_cache     #启用proxy cache，并指定key_zone。另外，如果proxy_cache off表示关闭掉缓存。

```





## 5.3  静态资源缓存

	第三方ngx_slowfs_cache模块来实现本地站点静态文件缓存，同时还为低速的存储设备创建快速缓存，【但据查 ngx_slowfs_cache好像就支持到nginx 1.3 ,后面在没更新,不知道是不是新版nginx已经不支持了】



# 6  Nginx高可用

## 6.1  高可用介绍

### 6.1.1  什么是高可用

	高可用HA（High Availability）是分布式系统架构设计中必须考虑的因素之一，它通常是指，通过设计减少系统不能提供服务的时间。
	
	假设系统一直能够提供服务，我们说系统的可用性是100%。
	
	如果系统每运行100个时间单位，会有1个时间单位无法提供服务，我们说系统的可用性是99%。
	
	很多公司的高可用目标是4个9，也就是99.99%，这就意味着，系统的年停机时间为8.76个小时。
	
	百度的搜索首页，是业内公认高可用保障非常出色的系统，甚至人们会通过www.baidu.com 能不能访问来判断“网络的连通性”，百度高可用的服务让人留下啦“网络通畅，百度就能访问”，“百度打不开，应该是网络连不上”的印象，这其实是对百度HA最高的褒奖。

### 6.1.2  如何保障系统的高可用

	我们都知道，单点是系统高可用的大敌，单点往往是系统高可用最大的风险和敌人，应该尽量在系统设计的过程中避免单点。方法论上，高可用保证的原则是“集群化”，或者叫“冗余”：只有一个单点，挂了服务会受影响；如果有冗余备份，挂了还有其他backup能够顶上。
	
	保证系统高可用，架构设计的核心准则是：冗余。
	
	有了冗余之后，还不够，每次出现故障需要人工介入恢复势必会增加系统的不可服务实践。所以，又往往是通过“自动故障转移”来实现系统的高可用。
	
	接下来我们看下典型互联网架构中，如何通过冗余+自动故障转移来保证系统的高可用特性。

![layerarchitect](/imgs/layerarchitect.png)

常见互联网分布式架构如上，分为：

（1）客户端层：典型调用方是浏览器browser或者手机应用APP

（2）反向代理层：系统入口，反向代理

（3）站点应用层：实现核心应用逻辑，返回html或者json

（4）服务层：如果实现了服务化，就有这一层

（5）数据-缓存层：缓存加速访问存储

（6）数据-数据库层：数据库固化数据存储

整个系统的高可用，又是通过每一层的冗余+自动故障转移来综合实现的。

#### 6.1.3 分层高可用架构实践

	【客户端层->反向代理层】的高可用

![kavip](/imgs/kavip.png)

【客户端层】到【反向代理层】的高可用，是通过反向代理层的冗余来实现的。以nginx为例：有两台nginx，一台对线上提供服务，另一台冗余以保证高可用，常见的实践是keepalived存活探测，相同virtual IP提供服务。

![kafailover](/imgs/kafailover.png)

自动故障转移：当nginx挂了的时候，keepalived能够探测到，会自动的进行故障转移，将流量自动迁移到shadow-nginx，由于使用的是相同的virtual IP，这个切换过程对调用方是透明的。 

### 6.1.4 高可用总结

	高可用HA（High Availability）是分布式系统架构设计中必须考虑的因素之一，它通常是指，通过设计减少系统不能提供服务的时间。
	
	方法论上，高可用是通过冗余+自动故障转移来实现的。
	
	整个互联网分层系统架构的高可用，又是通过每一层的冗余+自动故障转移来综合实现的，具体的：
	
	（1）【客户端层】到【反向代理层】的高可用，是通过反向代理层的冗余实现的，常见实践是keepalived + virtual IP自动故障转移
	
	（2）【反向代理层】到【站点层】的高可用，是通过站点层的冗余实现的，常见实践是nginx与web-server之间的存活性探测与自动故障转移
	
	（3）【站点层】到【服务层】的高可用，是通过服务层的冗余实现的，常见实践是通过service-connection-pool来保证自动故障转移
	
	（4）【服务层】到【缓存层】的高可用，是通过缓存数据的冗余实现的，常见实践是缓存客户端双读双写，或者利用缓存集群的主从数据同步与sentinel保活与自动故障转移；更多的业务场景，对缓存没有高可用要求，可以使用缓存服务化来对调用方屏蔽底层复杂性
	
	（5）【服务层】到【数据库“读”】的高可用，是通过读库的冗余实现的，常见实践是通过db-connection-pool来保证自动故障转移
	
	（6）【服务层】到【数据库“写”】的高可用，是通过写库的冗余实现的，常见实践是keepalived + virtual IP自动故障转移



## 6.2  Keepalived介绍

	Keepalived 是一种高性能的服务器高可用或热备解决方案， Keepalived 可以用来防止服务器单点故障的发生，通过配合 Nginx 可以实现 web 前端服务的高可用。
	
	Keepalived 以 VRRP 协议为实现基础，用 VRRP 协议来实现高可用性(HA)。 VRRP(Virtual RouterRedundancy Protocol)协议是用于实现路由器冗余的协议， VRRP 协议将两台或多台路由器设备虚拟成一个设备，对外提供虚拟路由器 IP(一个或多个)，而在路由器组内部，如果实际拥有这个对外 IP 的路由器如果工作正常的话就是 MASTER，或者是通过算法选举产生， MASTER 实现针对虚拟路由器 IP 的各种网络功能，如 ARP 请求， ICMP，以及数据的转发等；其他设备不拥有该虚拟 IP，状态是 BACKUP，除了接收 MASTER 的VRRP 状态通告信息外，不执行对外的网络功能。当主机失效时， BACKUP 将接管原先 MASTER 的网络功能。VRRP 协议使用多播数据来传输 VRRP 数据， VRRP 数据使用特殊的虚拟源 MAC 地址发送数据而不是自身网卡的 MAC 地址， VRRP 运行时只有 MASTER 路由器定时发送 VRRP 通告信息，表示 MASTER 工作正常以及虚拟路由器 IP(组)， BACKUP 只接收 VRRP 数据，不发送数据，如果一定时间内没有接收到 MASTER 的通告信息，各 BACKUP 将宣告自己成为 MASTER，发送通告信息，重新进行 MASTER 选举状态。

vrrp协议的相关术语：

```
    虚拟路由器：Virtual Router 
    虚拟路由器标识：VRID(0-255)
    物理路由器：
        master  ：主设备
        backup  ：备用设备
        priority：优先级
    VIP：Virtual IP 
    VMAC：Virutal MAC (00-00-5e-00-01-VRID)
    GraciousARP
```

安全认证：

```
简单字符认证、HMAC机制，只对信息做认证
MD5（leepalived不支持）
```

工作模式：

```
主/备：单虚拟路径器；
主/主：主/备（虚拟路径器），备/主（虚拟路径器）
```

工作类型:

```
抢占式：当出现比现有主服务器优先级高的服务器时，会发送通告抢占角色成为主服务器
非抢占式：
```



注意点：

1. 各节点时间必须同步
2. 确保各节点的用于集群服务的接口支持MULTICAST通信（组播）；

## 6.3 Keepalived 安装

### 6.3.1 安装依赖环境准备

```
sudo  yum install curl gcc openssl-devel libnl3-devel libnfnetlink-devel
```

### 6.3.2  源码下载安装

```
sudo wget http://www.keepalived.org/software/keepalived-2.0.6.tar.gz

sudo tar zxvf keepalived-2.0.6.tar.gz

cd keepalived-2.0.6

sudo ./configure --prefix=/usr/local/keepalived --mandir=/usr/local/share/man/
```

![keepalived_configure](/imgs/keepalived_configure.png)

```
sudo make 

sudo make install
```

检查安装：

```
cd /usr/local/keepalived

sudo sbin/keepalived -v 
```

![keepalived_version_check](/imgs/keepalived_version_check.png)

### 6.3.3 安装成服务

	在源文件的目录/usr/local/soft/keepalived-2.0.6/keepalived/etc/下有两个快捷启动文件和生成/usr/local/keepalived目录下一个配置文件需要复制

```
sudo cp /usr/local/soft/keepalived-2.0.6/keepalived/etc/init.d/keepalived  /etc/init.d/

sudo mkdir -p /etc/keepalived

sudo cp /usr/local/keepalived/etc/keepalived/keepalived.conf /etc/keepalived/

sudo cp /usr/local/soft/keepalived-2.0.6/keepalived/etc/sysconfig/keepalived  /etc/sysconfig/keepalived
```

	为/usr/local/keepalived/sbin/keepalived建立一个软连接，并设置开机启动

```
sudo ln -s /usr/local/keepalived/sbin/keepalived /usr/sbin/keepalived
sudo systemctl enable keepalived
```

sudo service keepalived start

![keepalived_start_check](/imgs/keepalived_start_check.png)

看到上图提示，说明启动成功

## 6.4 KeepAlived 双主热备高可用

6.4.1 方案规划



### 6.4.1 方案规划

| VIP          | IP           | 主机名          | Nginx端口 | 默认主从 |
| ------------ | ------------ | --------------- | --------- | -------- |
| 172.22.46.41 | 172.22.46.40 | master.alex.com | 80        | MASTER   |
| 172.22.46.45 | 172.22.46.42 | slave.alex.com  | 80        | MASTER   |

CentOS Linux release 7.4.1708

keepalived-2.0.6.tar.gz

nginx-1.14.0.tar.g

### 6.4.2 修改两个主机首页显示

	为了区分两个机器的访问情况，这里将每个机器的nginx访问首页内容做修改，分别加入Master和Slave字样，如图所示

![master_nginx](/imgs/master_nginx.jpg)

### 6.4.3 配置keepalived

	打开/etc/keepalived/keepalived.conf，设置内容如下

```
! Configuration File for keepalived
global_defs {
    ## keepalived 自带的邮件提醒需要开启 sendmail 服务。 建议用独立的监控或第三方 SMTP
    router_id master.alex.com ## 标识本节点的字条串，通常为 hostname
    vrrp_skip_check_adv_addr
    #vrrp_strict
    vrrp_garp_interval 0
    vrrp_gna_interval 0
}
## keepalived 会定时执行脚本并对脚本执行的结果进行分析，动态调整 vrrp_instance 的优先级。如果脚本执行结果为 0，并且 weight 配置的值大于
 0，则优先级相应的增加。如果脚本执行结果非 0，并且 weight配置的值小于 0，则优先级相应的减少。其他情况，维持原本配置的优先级，即配置文件
中 priority 对应的值。
vrrp_script chk_nginx {
    script "/etc/keepalived/nginx_check.sh" ## 检测 nginx 状态的脚本路径
    interval 2 ## 检测时间间隔
    weight -20 ## 如果条件成立，权重-20
}

## 定义虚拟路由， VI_1 为虚拟路由的标示符，自己定义名称
vrrp_instance VI_1 {
    state MASTER ## 主节点为 MASTER， 对应的备份节点为 BACKUP
    interface eth0 ## 绑定虚拟 IP 的网络接口，与本机 IP 地址所在的网络接口相同， 我的是 eth0
    virtual_router_id 33 ## 虚拟路由的 ID 号， 两个节点设置必须一样， 可选 IP 最后一段使用, 相同的 VRID 为一个组，他将决定多播的 MAC 地
址
    mcast_src_ip 172.22.46.40 ## 本机 IP 地址
    priority 100 ## 节点优先级， 值范围 0-254， MASTER 要比 BACKUP 高
    nopreempt ## 优先级高的设置 nopreempt 解决异常恢复后再次抢占的问题
    advert_int 1 ## 组播信息发送间隔，两个节点设置必须一样， 默认 1s
    ## 设置验证信息，两个节点必须一致
    authentication {
      auth_type PASS
      auth_pass 1111 ## 真实生产，按需求对应该过来
    }
    # 虚拟 IP 池, 两个节点设置必须一样
    virtual_ipaddress {
      172.22.46.41/28 ## 虚拟 ip，可以定义多个
    }
    ## 将 track_script 块加入 instance 配置块
    track_script {
      chk_nginx ## 执行 Nginx 监控的服务
    }
}

vrrp_instance VI_2 {
    state BACKUP 
    interface eth0 
    virtual_router_id 33
    mcast_src_ip 172.22.46.40 
    priority 80 
    nopreempt
    advert_int 1
    authentication {
      auth_type PASS
      auth_pass 1111 
    }
    virtual_ipaddress {
      172.22.46.45/28
    }
    track_script {
      chk_nginx
    }
}
```

新建/etc/keepalived/nginx_check.sh，并设置内容如下：

```
#!/bin/bash
A=`ps -C nginx --no-headers |wc -l`
#if [ $A -eq 0 ];then
    #systemctl start nginx
#sleep 2
if [ `ps -C nginx --no-headers |wc -l` -eq 0 ];then
    systemctl stop keepalived
fi
#fi
```

注意点：

  A、keepalived.conf区别配置项

    router_id
    
    vrrp_instance的state、mcast_src_ip、priority

  B、nginx_check.sh 脚本执行权限

  C、virtual_ipaddress划分得跟当前机器IP在同一网段，不然出现添加vip成功，但是无法访问的情况

  D、vrrp_instance的nopreempt设置

      state为MASTER时，不管有没有设置nopreempt,异常恢复启动后都会抢占vip
    
      state为BACKUP时，异常恢复启动后不会抢占vip
    
      引发思考：在主备方案时，为了防止出现Master异常恢复后由于抢占vip导致的网络切换，可以设置两个机器都为BACKUP，两个启动后争抢MASTER
    
      在双主热备时，如果两个机器都是BACKUP，异常恢复后不抢占vip，则可能会出现，所有的vip都在同一个机器上，
    
      所有的流量也都会访问该机器，双机热备负载均衡的方案失效

### 6.4.4 验证高可用

	高可用的方案配置好了，此时访问情况应该是访问172.22.46.41显示Master；访问172.22.46.45显示Slave，我们设计几种意外场景，验证一下高可用的方案。
	
	1、停掉172.22.46.40上的nginx,systemctl stop nginx，此时访问172.22.46.41，因为Master挂掉了，页面应该显示Slave说明高可用方案已经起作用。
	
	2、启动172.22.46.40上的nginx，此时访问172.22.46.41，因为Master已恢复，页面应该重新显示Master，说明机器恢复后抢占VIP成功。
	
	3、让Master机器关机，此时Keepalived和nginx服务全部停掉，两个VIP全漂移到172.22.46.42(Slave)的机器上，这时候我们访问172.22.46.45，发现页面显示slave
	
	4、重新让Master开机，此时Keepalived和nginx服务全部恢复，172.22.46.41又被Master抢占，再次访问又重新显示Master。
	
	补充：
	
	1、上述举例可以反证，比如停掉slave上的nginx，访问172.22.46.45，页面显示Master说明高可用方案在起作用。
	
	2、验证高可用方案的另一种方式是用ip addr查看每个机器上的IP列表，随不同场景，发现两个vip在master和slave之间切换，即说明高可用方案有效。

# 7  Nginx优化

## 7.1  nginx 配置优化

```
一般来说nginx配置文件中对优化比较有作用的为以下几项：
worker_processes 8;

nginx进程数，建议按照cpu数目来指定，一般为它的倍数。
worker_cpu_affinity 00000001 00000010 00000100 00001000 00010000 00100000 01000000 10000000;
为每个进程分配cpu，上例中将8个进程分配到8个cpu，当然可以写多个，或者将一个进程分配到多个cpu。

worker_rlimit_nofile 102400;

这个指令是指当一个nginx进程打开的最多文件描述符数目，理论值应该是最多打开文件数（ulimit -n）与nginx进程数相除，但是nginx分配请求并不是那么均匀，所以最好与ulimit -n的值保持一致。

use epoll;

使用epoll的I/O模型，这个不用说了吧。

multi_accept on;

#告诉nginx收到一个新连接通知后接受尽可能多的连接

worker_connections 102400;

每个进程允许的最多连接数，理论上每台nginx服务器的最大连接数为worker_processes*worker_connections。

keepalive_timeout 60;

keepalive超时时间。

client_header_buffer_size 4k;

客户端请求头部的缓冲区大小，这个可以根据你的系统分页大小来设置，一般一个请求的头部大小不会超过1k，不过由于一般系统分页都要大于1k，所以这里设置为分页大小。分页大小可以用命令getconf PAGESIZE取得。

open_file_cache max=102400 inactive=20s;

这个将为打开文件指定缓存，默认是没有启用的，max指定缓存数量，建议和打开文件数一致，inactive是指经过多长时间文件没被请求后删除缓存。

open_file_cache_valid 30s;

这个是指多长时间检查一次缓存的有效信息。

open_file_cache_min_uses 1;

open_file_cache指令中的inactive参数时间内文件的最少使用次数，如果超过这个数字，文件描述符一直是在缓存中打开的，如上例，如果有一个文件在inactive时间内一次没被使用，它将被移除。

server_tokens off;
#隐藏 Nginx 的版本号，提高安全性。

#开启高效文件传输模式，sendfile 指令指定 Nginx 是否调用sendfile 函数来输出文件，对于普通应用设为 on，如果用来进行下载等应用磁盘 IO 重负载应用，可设置为 off，以平衡磁盘与网络 I/O 处理速度，降低系统的负载。
sendfile on;
 
#是否开启目录列表访问，默认关闭。
autoindex off;
 
#告诉 Nginx 在一个数据包里发送所有头文件，而不一个接一个的发送
tcp_nopush on;
 
#告诉 Nginx 不要缓存数据，而是一段一段的发送--当需要及时发送数据时，就应该给应用设置这个属性，这样发送一小块数据信息时就不能立即得到返回值。Nginx 默认会始终工作在 tcp nopush 状态下。但是当开启前面的 sendfile on; 时，它的工作特点是 nopush 的最后一个包会自动转转换到 nopush off。为了减小那200ms的延迟，开启 nodelay on; 将其很快传送出去。结论就是 sendfile on; 开启时，tcp_nopush 和 tcp_nodelay 都是on 是可以的。
tcp_nodelay on;
```

## 7.2 内核优化

​	

```
net.ipv4.tcp_max_tw_buckets = 6000

timewait的数量，默认是180000。(Deven:因此如果想把timewait降下了就要把tcp_max_tw_buckets值减小)

net.ipv4.ip_local_port_range = 1024     65000

允许系统打开的端口范围。

net.ipv4.tcp_tw_recycle = 1

启用timewait快速回收。

net.ipv4.tcp_tw_reuse = 1

开启重用。允许将TIME-WAIT sockets重新用于新的TCP连接。

net.ipv4.tcp_syncookies = 1

开启SYN Cookies，当出现SYN等待队列溢出时，启用cookies来处理。

net.core.somaxconn = 262144

web应用中listen函数的backlog默认会给我们内核参数的net.core.somaxconn限制到128，而nginx定义的NGX_LISTEN_BACKLOG默认为511，所以有必要调整这个值。

net.core.netdev_max_backlog = 262144

每个网络接口接收数据包的速率比内核处理这些包的速率快时，允许送到队列的数据包的最大数目。

net.ipv4.tcp_max_orphans = 262144

系统中最多有多少个TCP套接字不被关联到任何一个用户文件句柄上。如果超过这个数字，孤儿连接将即刻被复位并打印出警告信息。这个限制仅仅是为了防止简单的DoS攻击，不能过分依靠它或者人为地减小这个值，更应该增加这个值(如果增加了内存之后)。

net.ipv4.tcp_max_syn_backlog = 262144

记录的那些尚未收到客户端确认信息的连接请求的最大值。对于有128M内存的系统而言，缺省值是1024，小内存的系统则是128。

net.ipv4.tcp_timestamps = 0

时间戳可以避免序列号的卷绕。一个1Gbps的链路肯定会遇到以前用过的序列号。时间戳能够让内核接受这种“异常”的数据包。这里需要将其关掉。

net.ipv4.tcp_synack_retries = 1

为了打开对端的连接，内核需要发送一个SYN并附带一个回应前面一个SYN的ACK。也就是所谓三次握手中的第二次握手。这个设置决定了内核放弃连接之前发送SYN+ACK包的数量。

net.ipv4.tcp_syn_retries = 1

在内核放弃建立连接之前发送SYN包的数量。

net.ipv4.tcp_fin_timeout = 1

如 果套接字由本端要求关闭，这个参数 决定了它保持在FIN-WAIT-2状态的时间。对端可以出错并永远不关闭连接，甚至意外当机。缺省值是60秒。2.2 内核的通常值是180秒，你可以按这个设置，但要记住的是，即使你的机器是一个轻载的WEB服务器，也有因为大量的死套接字而内存溢出的风险，FIN- WAIT-2的危险性比FIN-WAIT-1要小，因为它最多只能吃掉1.5K内存，但是它们的生存期长些。

net.ipv4.tcp_keepalive_time = 30

当keepalive起用的时候，TCP发送keepalive消息的频度。缺省是2小时。
```

# 8  Ngxin安全



https://www.cnblogs.com/studyskill/p/6972680.html

https://www.cnblogs.com/chenpingzhao/p/5785416.html

## 8.1 控制缓冲区溢出攻击

	编辑和设置所有客户端缓冲区的大小限制如下：

```
client_body_buffer_size  1K;
client_header_buffer_size 1k;
client_max_body_size 1k;
large_client_header_buffers 2 1k;
```

- client_body_buffer_size 1k（默认8k或16k）这个指令可以指定连接请求实体的缓冲区大小。如果连接请求超过缓存区指定的值，那么这些请求实体的整体或部分将尝试写入一个临时文件。
- client_header_buffer_size 1k-指令指定客户端请求头部的缓冲区大小。绝大多数情况下一个请求头不会大于1k，不过如果有来自于wap客户端的较大的cookie它可能会大于 1k，Nginx将分配给它一个更大的缓冲区，这个值可以在large_client_header_buffers里面设置。
- client_max_body_size 1k-指令指定允许客户端连接的最大请求实体大小，它出现在请求头部的Content-Length字段。如果请求大于指定的值，客户端将收到一个”Request Entity Too Large” (413)错误。记住，浏览器并不知道怎样显示这个错误。
- large_client_header_buffers-指定客户端一些比较大的请求头使用的缓冲区数量和大小。请求字段不能大于一个缓冲区大小，如果客户端发送一个比较大的头，nginx将返回”Request URI too large” (414)
- 同样，请求的头部最长字段不能大于一个缓冲区，否则服务器将返回”Bad request” (400)。缓冲区只在需求时分开。默认一个缓冲区大小为操作系统中分页文件大小，通常是4k或8k，如果一个连接请求最终将状态转换为keep- alive，它所占用的缓冲区将被释放。

你还需要控制超时来提高服务器性能并与客户端断开连接。按照如下编辑：

```
client_body_timeout   10;
client_header_timeout 10;
keepalive_timeout     5 5;
send_timeout          10;
```

- client_body_timeout 10;-指令指定读取请求实体的超时时间。这里的超时是指一个请求实体没有进入读取步骤，如果连接超过这个时间而客户端没有任何响应，Nginx将返回一个”Request time out” (408)错误。

- client_header_timeout 10;-指令指定读取客户端请求头标题的超时时间。这里的超时是指一个请求头没有进入读取步骤，如果连接超过这个时间而客户端没有任何响应，Nginx将返回一个”Request time out” (408)错误。

- keepalive_timeout 5 5; – 参数的第一个值指定了客户端与服务器长连接的超时时间，超过这个时间，服务器将关闭连接。参数的第二个值（可选）指定了应答头中Keep-Alive: timeout=time的time值，这个值可以使一些浏览器知道什么时候关闭连接，以便服务器不用重复关闭，如果不指定这个参数，nginx不会在应 答头中发送Keep-Alive信息。（但这并不是指怎样将一个连接“Keep-Alive”）参数的这两个值可以不相同。

- send_timeout 10; 指令指定了发送给客户端应答后的超时时间，Timeout是指没有进入完整established状态，只完成了两次握手，如果超过这个时间客户端没有任何响应，nginx将关闭连接。


## 8.2  控制并发连接

	考虑到网络访问速度问题，我们中间可能会有各种 网络加速（CDN）。考虑到网站的安全性和访问加速，我们的架构是：
	
	普通用户浏览器 —–> 360网站卫士加速（CDN，360防 CC,DOS攻击） ——> 阿里云加速服务器（我们自己建的CDN，阿里云盾） —-> 源服务器（PHP 程序部署在这里，iptables, nginx 安全配置）
	
	可以看到，我们的网站中间经历了好几层的透明加速和安全过滤， 这种情况下，我们就不能用上面的“普通配置”。因为上面基于 源IP的限制 结果就是，我们把 360网站卫士 或者 阿里云盾 给限制了，因为这里“源IP”地址不再是 普通用户的IP，而是中间 网络加速服务器 的IP地址。我们需要限制的是 最前面的普通用户，而不是中间为我们做加速的 加速服务器。
	
	现在我们面对的最直接的问题就是， 经过这么多层加速，我怎么得到“最前面普通用户的 IP 地址”呢？(这里只说明结果，不了解 Http 协议的人请自行 Google 或者 Wikipedia <http://zh.wikipedia.org/zh-cn/X-Forwarded-For> )。

 当一个 CDN 或者透明代理服务器把用户的请求转到后面服务器的时候，这个 CDN 服务器会在 Http 的头中加入 一个记录

X-Forwarded-For : 用户IP, 代理服务器IP

如果中间经历了不止一个 代理服务器，这个 记录会是这样

X-Forwarded-For : 用户IP, 代理服务器1-IP, 代理服务器2-IP, 代理服务器3-IP, ….

可以看到经过好多层代理之后， 用户的真实IP 在第一个位置， 后面会跟一串 中间代理服务器的IP地址，从这里取到用户真实的IP地址，针对这个 IP 地址做限制就可以了



可以使用NginxHttpLimitZone模块来限制指定的会话或者一个IP地址的特殊情况下的并发连接。编辑nginx.conf:

```
## 这里取得原始用户的IP地址
map $http_x_forwarded_for  $clientRealIp {
    ""  $remote_addr;
    ~^(?P<firstAddr>[0-9\.]+),?.*$	$firstAddr;
}

## 针对原始用户 IP 地址做限制
limit_conn_zone $clientRealIp zone=TotalConnLimitZone:20m ;
limit_conn  TotalConnLimitZone  50;
limit_conn_log_level notice;

## 针对原始用户 IP 地址做限制
limit_req_zone $clientRealIp zone=ConnLimitZone:20m  rate=10r/s;
#limit_req zone=ConnLimitZone burst=10 nodelay;
limit_req_log_level notice;
```

上面表示限制每个远程IP地址的客户端同时打开连接不能超过5个。

## 8.3  拒绝爬虫

	可以很容易地阻止User-Agents,如扫描器，机器人以及滥用你服务器的垃圾邮件发送者。

```
## Block download agents ##
if ($http_user_agent ~* LWP::Simple|BBBike|wget) {
    return 403;
}
```

阻止Soso和有道的机器人：

```
## Block some robots ##
if ($http_user_agent ~* Sosospider|YodaoBot) {
    return 403;
}
```

## 8.4  目录限制

	你可以对指定的目录设置访问权限。所有的网站目录应该一一的配置，只允许必须的目录访问权限。 通过IP地址限制访问 你可以通过IP地址来限制访问目录/admin/:

```
location /docs/ {
    ## block one workstation
    deny    192.168.1.1;
    ## allow anyone in 192.168.1.0/24
    allow   192.168.1.0/24;
    ## drop rest of the world
    deny    all;
}
```

## 8.5 在防火墙级限制每个IP的连接数

	网络服务器必须监视连接和每秒连接限制。PF和Iptales都能够在进入你的nginx服务器之前阻止最终用户的访问。 Linux Iptables:限制每次Nginx连接数 下面的例子会阻止来自一个IP的60秒钟内超过15个连接端口80的连接数。

```
/sbin/iptables -A INPUT -p tcp –dport 80 -i eth0 -m state –state NEW -m recent –set
/sbin/iptables -A INPUT -p tcp –dport 80 -i eth0 -m state –state NEW -m recent –update –seconds 60  –hitcount 15 -j DROP
service iptables save
```



# 9 入门介绍

## 9.1  Hello World

​	

```
sudo cp index.html helloworld.html

<!DOCTYPE html>
<html>
<head>
<title>Hello World!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Hello World<h1>
</body>
</html>
```

## 9.2  访问静态资源文件

	将上一步中的helloworld.html放置到/usr/share/nginx/html目录中，修改名字为index.html,添加location配置

```
location /hello {                
    alias /usr/share/nginx/html; 
    index index.html index.htm;  
}                                
```

访问http://IP/hello,即可看到与上一步一样内容的页面；

再次验证。在该目录下放入其他稳进，比如json文件，按照目录了位置访问，即可验证。



### 9.2.1 root与alias的区别

​	

```
location /hello {              
    root /usr/share/nginx/html;
    index index.html index.htm;
}                              
```

这样配置的结果就是当客户端请求 /hello/user.json 的时候， 

Nginx把请求映射为/usr/share/nginx/html/hello/user.json

```
location /hello {              
    alias /usr/share/nginx/html;
    index index.html index.htm;
}  
```

这样配置的结果就是当客户端请求 /hello/user.json 的时候， 

Nginx把请求映射为/usr/share/nginx/html/user.json

> http://nginx.org/en/docs/http/ngx_http_core_module.html#root
>
> http://nginx.org/en/docs/http/ngx_http_core_module.html#alias

### 9.2.2  反向代理IIS

1、首先，设置IIS站点，选中默认的站点，点击右侧`操作`栏的浏览，

![IIS_site_set](/imgs/nginx/IIS_site_set.jpg)

打开inetpub的wwwroot目录，如图

![IIS_site_wwwroot](/imgs/nginx/IIS_site_wwwroot.jpg)

访问本地网站，这里设置了hosts文件，所以直接域名访问

```
127.0.0.1 www.alex.com
```

![IIS_default_index](/imgs/nginx/IIS_default_iisstart.jpg)



2、在该目录中添加网页index.html

```
<!DOCTYPE html>
<html>
<head>
<title>IIS Content!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
<meta charset="UTF-8">
</head>
<body>
<h1>这里的内容来自IIS<h1>
</body>
</html>
```

刷新http://www.alex.com/，显示如下即为正常

![www_alex_index](/imgs/nginx/www_alex_index.jpg)

3、设置nginx反向代理处理

```nginx
location /iis {                      
    index index.html index.htm;      
    proxy_pass http://192.168.1.177/;
}                                    
```

重新加载nginx配置

```shell
sudo systemctl reload nginx
```

4、验证反向代理，注意对比浏览器URL

![master_alex_index](/imgs/nginx/master_alex_index.jpg)

# 10 njs介绍

官网介绍地址：

```
http://nginx.org/en/docs/njs/
```

## 10.1 安装

有两种方式安装：

> 1.通过包管理器，比如yum install nginx-module-njs
>
> 2.源码编译安装

推荐`源码编译安装` ，包管理器安装的无法与升级后的nginx版本相匹配

### 10.1.1 源码安装

njs的源码地址在

```
http://hg.nginx.org/njs
```

安装需要先下载源码，

```

```

或者直接下载压缩包

![njs_source_address](/imgs/nginx/njs_source_address.jpg)

可以通过静态模块或者动态模块的方式编译安装

```
./configure --add-module=path-to-njs/nginx

./configure --add-dynamic-module=path-to-njs/nginx
```



==推荐使用静态方式==，因为版本对应关系，每次升级都得级联升级，动态模块意义不大。

## 10.2  Hello World

新建/etc/nginx/njs/hello_world.js

```
function hello(r) {
    r.return(200, "Hello world!");
}
```

如果是动态模块，需要在nginx.conf中开启ngx_http_js_module.so (注意开启位置)

```

```

重新加载配置文件，验证

```

```



10.3 其他示例

```

```

