# 1  介绍



# 2 安装

## 2.1 Docker安装elasticsearch



### 2.1.1 拉取镜像

```
docker pull docker.elastic.co/elasticsearch/elasticsearch:6.5.4
```

2.1.2 运行实例

```
docker run -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.5.4

```

生产环境配置：

- Linux

  ```
  sysctl -w vm.max_map_count=262144
  ```

  The `vm.max_map_count` setting should be set permanently in /etc/sysctl.conf:

  ```sh
  $ grep vm.max_map_count /etc/sysctl.conf
  vm.max_map_count=262144
  ```



## 2.2 Docker安装Logstash

## 2.1下载镜像

```
docker pull docker.elastic.co/logstash/logstash:6.5.4
```













参考：

1、Docker安装elasticSearch https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

2、Docker安装Logstash [https://www.elastic.co/guide/en/logstash/current/docker.html]