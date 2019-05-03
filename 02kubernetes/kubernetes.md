typora-root-url: ./

# 1、Kubernetes入门

## 1.1   什么是Kubernetes

![kubernetes](/images/kubernetes.jpg)

​	Kubernetes是容器集群管理系统，是一个开源的平台，可以实现容器集群的自动化部署、自动扩缩容、维护等功能。
​	Kubernetes是Google 2014年创建管理的，是Google 10多年大规模容器管理技术Borg的开源版本。

**Kubernetes 这个单词的含义？k8s？**

Kubernetes 这个单词来自于希腊语，含义是 舵手 或 领航员 。其词根是 governor 和 cybernetic。 K8s 是它的缩写，用 8 字替代了“ubernete”。



通过Kubernetes你可以：

- 快速部署应用
- 快速扩展应用
- 无缝对接新的应用功能
- 节省资源，优化硬件资源的使用

我们的目标是促进完善组件和工具的生态系统，以减轻应用程序在公有云或私有云中运行的负担。

Kubernetes 特点

- 可移植: 支持公有云，私有云，混合云，多重云（multi-cloud）

- 可扩展: 模块化, 插件化, 可挂载, 可组合
- 自动化: 自动部署，自动重启，自动复制，自动伸缩/扩展

## 1.2  为什么选择容器?

想要知道你为什么要选择使用容器?

![1556365668(1)](/images/1556365668(1).jpg)



​	程序部署的传统方法是指通过操作系统包管理器在主机上安装程序。这样做的缺点是，容易混淆程序之间以及程序和主机系统之间的可执行文件、配置文件、库、生命周期。为了达到精准展现和精准回撤，你可以搭建一台不可变的虚拟机镜像。但是虚拟机体量往往过于庞大而且不可转移。

​	容器部署的新的方式是基于操作系统级别的虚拟化，而非硬件虚拟化。容器彼此是隔离的，与宿主机也是隔离的：它们有自己的文件系统，彼此之间不能看到对方的进程，分配到的计算资源都是有限制的。它们比虚拟机更容易搭建。并且由于和基础架构、宿主机文件系统是解耦的，它们可以在不同类型的云上或操作系统上转移。

​	正因为容器又小又快，每一个容器镜像都可以打包装载一个程序。这种一对一的“程序 – 镜像”联系带给了容器诸多便捷。有了容器，静态容器镜像可以在编译/发布时期创建，而非部署时期。因此，每个应用不必再等待和整个应用栈其它部分进行整合，也不必和产品基础架构环境之间进行妥协。在编译/发布时期生成容器镜像建立了一个持续地把开发转化为产品的环境。相似地，容器远比虚拟机更加透明，尤其在设备监控和管理上。这一点，在容器的进程生命周期被基础架构管理而非被容器内的进程监督器隐藏掉时，尤为显著。最终，随着每个容器内都装载了单一的程序，管理容器就等于管理或部署整个应用。

​	**容器优势总结：**

- 敏捷的应用创建与部署：相比虚拟机镜像，容器镜像的创建更简便、更高效。
- 持续的开发、集成，以及部署：在快速回滚下提供可靠、高频的容器镜像编译和部署（基于镜像的不可变性）。
- 开发与运营的关注点分离：由于容器镜像是在编译/发布期创建的，因此整个过程与基础架构解耦。
- 跨开发、测试、产品阶段的环境稳定性：在笔记本电脑上的运行结果和在云上完全一致。
- 在云平台与 OS 上分发的可转移性：可以在 Ubuntu、RHEL、CoreOS、预置系统、Google 容器引擎，乃至其它各类平台上运行。
- 以应用为核心的管理：从在虚拟硬件上运行系统，到在利用逻辑资源的系统上运行程序，从而提升了系统的抽象层级。
- 松散耦联、分布式、弹性、无拘束的微服务：整个应用被分散为更小、更独立的模块，并且这些模块可以被动态地部署和管理，而不再是存储在大型的单用途机器上的臃肿的单一应用栈。
- 资源隔离：增加程序表现的可预见性。
- 资源利用率：高效且密集。



## 1.3  为什么是Kubernetes 

​	k8s目前是容器编排的标准，对于标准，是值得持续投入的。k8s也是istio的基础，istio在service mesh领域目前没有竞争，istio是knative的基础，knative在serverless领域目前没有竞争，也许5年之后knative才会普及流行，现在已经可以预见持续投入k8s的技术演进和技术红利
​	Kubernetes是一个十分强大的容器编排系统。它在全球范围内已广受使用，支持了一些很大型的部署，但同时它也伴随着一些代价。

​	Kubernetes 能在实体机或虚拟机集群上调度和运行程序容器。而且，Kubernetes 也能让开发者斩断联系着实体机或虚拟机的“锁链”，从以主机为中心的架构跃至以容器为中心的架构。该架构最终提供给开发者诸多内在的优势和便利。Kubernetes 提供给基础架构以真正的以容器为中心的开发环境。

​	Kubernetes 满足了一系列产品内运行程序的普通需求，诸如：

- 协调辅助进程，协助应用程序整合，维护一对一“程序 – 镜像”模型。
- 挂载存储系统
- 分布式机密信息
- 检查程序状态
- 复制应用实例
- 使用横向自动缩放
- 服务注册与发现
- 负载均衡
- 滚动更新
- 资源监控
- 访问并读取日志
- 程序调试
- 提供验证与授权

​    以上兼具平台即服务（PaaS）的简化和基础架构即服务（IaaS）的灵活，并促进了在平台服务提供商之间的迁移。

**Kubernetes 是一个什么样的平台?**

虽然 Kubernetes 提供了非常多的功能，总会有更多受益于新特性的新场景出现。针对特定应用的工作流程，能被流水线化以加速开发速度。特别的编排起初是可接受的，这往往需要拥有健壮的大规模自动化机制。这也是为什么 Kubernetes 也被设计为一个构建组件和工具的生态系统的平台，使其更容易地部署、缩放、管理应用程序。

标签（label）可以让用户按照自己的喜好组织资源。 注释（annotation）让用户在资源里添加客户信息，以优化工作流程，为管理工具提供一个标示调试状态的简单方法。

此外，Kubernetes 控制面板是由开发者和用户均可使用的同样的 API 构建的。用户可以编写自己的控制器，比如 调度器（scheduler），使用可以被通用的命令行工具识别的他们自己的 API。

这种设计让大量的其它系统也能构建于 Kubernetes 之上。

**Kubernetes 不是什么？**

Kubernetes 不是传统的、全包容的平台即服务（Paas）系统。它尊重用户的选择，这很重要。

Kubernetes：

- 并不限制支持的程序类型。它并不检测程序的框架 (例如，Wildfly)，也不限制运行时支持的语言集合 (比如， Java、Python、Ruby)，也不仅仅迎合 12 因子应用程序(参考：<https://www.12factor.net/zh_cn/>)，也不区分 应用 与 服务 。Kubernetes 旨在支持尽可能多种类的工作负载，包括无状态的、有状态的和处理数据的工作负载。如果某程序在容器内运行良好，它在 Kubernetes 上只可能运行地更好。
- 不提供中间件（例如消息总线）、数据处理框架（例如 Spark）、数据库（例如 mysql），也不把集群存储系统（例如 Ceph）作为内置服务。但是以上程序都可以在 Kubernetes 上运行。
- 没有“点击即部署”这类的服务市场存在。
- 不部署源代码，也不编译程序。持续集成 (CI) 工作流程是不同的用户和项目拥有其各自不同的需求和表现的地方。所以，Kubernetes 支持分层 CI 工作流程，却并不监听每层的工作状态。
- 允许用户自行选择日志、监控、预警系统。（ Kubernetes 提供一些集成工具以保证这一概念得到执行）
- 不提供也不管理一套完整的应用程序配置语言/系统（例如 jsonnet）。
- 不提供也不配合任何完整的机器配置、维护、管理、自我修复系统。

​        Kubernetes 运营在应用程序层面而不是在硬件层面，它提供了一些 PaaS 所通常提供的常见的适用功能，比如部署、伸缩、负载平衡、日志和监控。然而，Kubernetes 并非铁板一块，这些默认的解决方案是可供选择，可自行增加或删除的。

​	而且， Kubernetes 不只是一个编排系统 。事实上，它满足了编排的需求。 编排 的技术定义是，一个定义好的工作流程的执行：先做 A，再做 B，最后做 C。相反地， Kubernetes 囊括了一系列独立、可组合的控制流程，它们持续驱动当前状态向需求的状态发展。从 A 到 C 的具体过程并不唯一。集中化控制也并不是必须的；这种方式更像是编舞。这将使系统更易用、更高效、更健壮、复用性、扩展性更强。

​	特别是对于规模较小的团队而言，会因为维护它并且因它的学习曲线陡峭导致大量耗时。

## 1.4  典型案例

# 2  Kubernetes基本概念和术语



## 2.1  Master

要使用 Kubernetes，你需要用 *Kubernetes API 对象* 来描述集群的*预期状态（desired state）* ：包括你需要运行的应用或者负载，它们使用的镜像、副本数，以及所需网络和磁盘资源等等。你可以使用命令行工具 `kubectl` 来调用 Kubernetes API 创建对象，通过所创建的这些对象来配置预期状态。你也可以直接调用 Kubernetes API 和集群进行交互，设置或者修改预期状态。

一旦你设置了你所需的目标状态，*Kubernetes 控制面（control plane）* 会促成集群的当前状态符合其预期状态。为此，Kubernetes 会自动执行各类任务，比如运行或者重启容器、调整给定应用的副本数等等。Kubernetes 控制面由一组运行在集群上的进程组成：

- **Kubernetes 主控组件（Master）** 包含三个进程，都运行在集群中的某个节上，通常这个节点被称为 master 节点。



k8s的控制节点扮演者整个调度和管理的角色，所以是非常关键的一部分。k8s的master节点主要包含三个部分： 

1. **kube-apiserver** 提供了统一的资源操作入口; 
2. **kube-scheduler** 是一个资源调度器，它根据特定的调度算法把pod生成到指定的计算节点中; 
3. **kube-controller-manager** 也是运行在控制节点上一个很关键的管理控制组件;

kube-scheduler、kube-controller-manager 和 kube-apiserver 三者的功能紧密相关； 
同时只能有一个 kube-scheduler、kube-controller-manager 进程处于工作状态，如果运行多个，则需要通过选举产生一个 leader；



## Kubernetes 控制面

关于 Kubernetes 控制平面的各个部分，（如 Kubernetes 主控组件和 kubelet 进程，管理着 Kubernetes 如何与你的集群进行通信。控制平面维护着系统中所有的 Kubernetes 对象的状态记录，并且通过连续的控制循环来管理这些对象的状态。在任一的给定时间点，控制面的控制环都能响应集群中的变化，并且让系统中所有对象的实际状态与你提供的预期状态相匹配。

比如， 当你通过 Kubernetes API 创建一个 Deployment 对象，你就为系统增加了一个新的目标状态。Kubernetes 控制平面记录着对象的创建，并启动必要的应用然后将它们调度至集群某个节点上来执行你的指令，以此来保持集群的实际状态和目标状态的匹配。

Kubernetes集群提供了类似REST API的集，通过Kubernetes API server对外进行暴露，支持持久化资源的增删改查操作。这些API作为控制面板的枢纽。

遵循Kubernetes API约定(路径约定、标准元数据等)的REST API能够自动从共享API服务(认证、授权、审计日志)中收益，通用客户端代码能够与它们进行交互。

作为系统的最底层，需要支持必要的扩展机制，以支持高层添加功能。另外，需要支持单租户和多租户的应用场景。核心层也需要提供足够的弹性，以支持高层能扩展新的范围，而不需要在安全模式方面进行妥协。



## 2.2  Node

​	Node是Kubernetes中的工作节点，最开始被称为minion。一个Node可以是VM或物理机。每个Node（节点）具有运行[pod](http://docs.kubernetes.org.cn/312.html)的一些必要服务，并由Master组件进行管理，Node节点上的服务包括Docker、kubelet和kube-proxy。有关更多详细信息，请参考架构设计文档中的[“Kubernetes Node”](https://git.k8s.io/community/contributors/design-proposals/architecture.md#the-kubernetes-node)部分。

 **Node Status**

```
kubectl explain nodes.status
```

节点的状态信息包含：

- Addresses
- ~~Phase~~ (已弃用)
- Condition
- Capacity
- Info

下面详细描述每个部分。

### Addresses

这些字段的使用取决于云提供商或裸机配置。

- HostName：可以通过kubelet 中 --hostname-override参数覆盖。
- ExternalIP：可以被集群外部路由到的IP。
- InternalIP：只能在集群内进行路由的节点的IP地址。

```
 addresses:
    - address: 10.30.5.33
      type: InternalIP
    - address: dev-node02
      type: Hostname
```



### Phase

不推荐使用，已弃用。

```
kubectl gexplain nodes.status.phase
KIND:     Node
VERSION:  v1

FIELD:    phase <string>

DESCRIPTION:
     NodePhase is the recently observed lifecycle phase of the node. More info:
     https://kubernetes.io/docs/concepts/nodes/node/#phase The field is never
     populated, and now is deprecated.
```



### Condition

```
kubectl gexplain nodes.status.conditions
KIND:     Node
VERSION:  v1

RESOURCE: conditions <[]Object>

DESCRIPTION:
     Conditions is an array of current observed node conditions. More info:
     https://kubernetes.io/docs/concepts/nodes/node/#condition

     NodeCondition contains condition information for a node.

FIELDS:
   lastHeartbeatTime    <string>
     Last time we got an update on a given condition.

   lastTransitionTime   <string>
     Last time the condition transit from one status to another.

   message      <string>
     Human readable message indicating details about last transition.

   reason       <string>
     (brief) reason for the condition's last transition.

   status       <string> -required-
     Status of the condition, one of True, False, Unknown.

   type <string> -required-
     Type of node condition.
```

conditions字段描述所有Running节点的状态。

| Node Condition | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| OutOfDisk      | True：如果节点上没有足够的可用空间来添加新的pod；否则为：False |
| Ready          | True：如果节点是健康的并准备好接收pod；False：如果节点不健康并且不接受pod；Unknown：如果节点控制器在过去40秒内没有收到node的状态报告。 |
| MemoryPressure | True：如果节点存储器上内存过低; 否则为：False。              |
| DiskPressure   | True：如果磁盘容量存在压力 - 也就是说磁盘容量低；否则为：False。 |

node condition被表示为一个JSON对象。例如，下面的响应描述了一个健康的节点。

```
"conditions": [
  {
    "kind": "Ready",
    "status": "True"
  }
]
```

如果Ready condition的Status是“Unknown” 或 “False”，比“pod-eviction-timeout”的时间长，则传递给“ kube-controller-manager”的参数，该节点上的所有Pod都将被节点控制器删除。默认的eviction timeout时间为5分钟。在某些情况下，当节点无法访问时，apiserver将无法与kubelet通信，删除Pod的需求不会传递到kubelet，直到重新与apiserver建立通信，这种情况下，计划删除的Pod会继续在划分的节点上运行。

在Kubernetes 1.5之前的版本中，节点控制器将强制从apiserver中删除这些不可达（上述情况）的pod。但是，在1.5及更高版本中，节点控制器在确认它们已经停止在集群中运行之前，不会强制删除Pod。可以看到这些可能在不可达节点上运行的pod处于"Terminating"或 “Unknown”。如果节点永久退出集群，Kubernetes是无法从底层基础架构辨别出来，则集群管理员需要手动删除节点对象，从Kubernetes删除节点对象会导致运行在上面的所有Pod对象从apiserver中删除，最终将会释放names。

### Capacity

描述节点上可用的资源：CPU、内存和可以调度到节点上的最大pod数。

```
capacity:
      cpu: "4"
      ephemeral-storage: 515729368Ki
      hugepages-2Mi: "0"
      memory: 16267760Ki
      pods: "110"
```



### nodeInfo

关于节点的一些基础信息，如内核版本、Kubernetes版本（kubelet和kube-proxy版本）、Docker版本（如果有使用）、OS名称等。信息由Kubelet从节点收集。

```
kubectl explain nodes.status.nodeInfo
KIND:     Node
VERSION:  v1

RESOURCE: nodeInfo <Object>

DESCRIPTION:
     Set of ids/uuids to uniquely identify the node. More info:
     https://kubernetes.io/docs/concepts/nodes/node/#info

     NodeSystemInfo is a set of ids/uuids to uniquely identify the node.

FIELDS:
   architecture <string> -required-
     The Architecture reported by the node

   bootID       <string> -required-
     Boot ID reported by the node.

   containerRuntimeVersion      <string> -required-
     ContainerRuntime Version reported by the node through runtime remote API
     (e.g. docker://1.5.0).

   kernelVersion        <string> -required-
     Kernel Version reported by the node from 'uname -r' (e.g.
     3.16.0-0.bpo.4-amd64).

   kubeProxyVersion     <string> -required-
     KubeProxy Version reported by the node.

   kubeletVersion       <string> -required-
     Kubelet Version reported by the node.

   machineID    <string> -required-
     MachineID reported by the node. For unique machine identification in the
     cluster this field is preferred. Learn more from man(5) machine-id:
     http://man7.org/linux/man-pages/man5/machine-id.5.html

   operatingSystem      <string> -required-
     The Operating System reported by the node

   osImage      <string> -required-
     OS Image reported by the node from /etc/os-release (e.g. Debian GNU/Linux 7
     (wheezy)).

   systemUUID   <string> -required-
     SystemUUID reported by the node. For unique machine identification
     MachineID is preferred. This field is specific to Red Hat hosts
     https://access.redhat.com/documentation/en-US/Red_Hat_Subscription_Management/1/html/RHSM/getting-system-uuid.html
```



## Management

与 [pods](http://docs.kubernetes.org.cn/312.html) 和 services 不同，节点不是由Kubernetes 系统创建，它是由Google Compute Engine等云提供商在外部创建的，或使用物理和虚拟机。这意味着当Kubernetes创建一个节点时，它只是创建一个代表节点的对象，创建后，Kubernetes将检查节点是否有效。例如，如果使用以下内容创建一个节点：

```
{
  "kind": "Node",
  "apiVersion": "v1",
  "metadata": {
    "name": "10.240.79.157",
    "labels": {
      "name": "my-first-k8s-node"
    }
  }
}
```

Kubernetes将在内部创建一个节点对象，并通过基于metadata.name字段的健康检查来验证节点，如果节点有效，即所有必需的服务会同步运行，则才能在上面运行pod。请注意，Kubernetes将保留无效节点的对象（除非客户端有明确删除它）并且它将继续检查它是否变为有效。

目前，有三个组件与Kubernetes节点接口进行交互：节点控制器（node controller）、kubelet和kubectl。

### Node Controller

节点控制器（Node Controller）是管理节点的Kubernetes master组件。

节点控制器在节点的生命周期中具有多个角色。

第一个是在注册时将CIDR块分配给节点。

第二个是使节点控制器的内部列表与云提供商的可用机器列表保持最新。当在云环境中运行时，每当节点不健康时，节点控制器将询问云提供程序是否该节点的VM仍然可用，如果不可用，节点控制器会从其节点列表中删除该节点。

第三是监测节点的健康状况。当节点变为不可访问时，节点控制器负责将NodeStatus的NodeReady条件更新为ConditionUnknown，随后从节点中卸载所有pod ，如果节点继续无法访问，（默认超时时间为40 --node-monitor-period秒，开始报告ConditionUnknown，之后为5m开始卸载）。节点控制器按每秒来检查每个节点的状态。

在Kubernetes 1.4中，我们更新了节点控制器的逻辑，以更好地处理大量节点到达主节点的一些问题（例如，主节点某些网络问题）。从1.4开始，节点控制器将在决定关于pod卸载的过程中会查看集群中所有节点的状态。

从触发模块的角度，`pod eviction` 可以分为两类：

- Kube-controller-manager: 周期性检查所有节点状态，当节点处于 NotReady 状态超过一段时间后，驱逐该节点上所有 pod。
- Kubelet: 周期性检查本节点资源，当资源不足时，按照优先级驱逐部分 pod。



Kuberntes有个特色功能叫 pod eviction，它在某些场景下如节点 NotReady，资源不足时，把 pod 驱逐至其它节点。

**Kube-controller-manger 发起的驱逐**

Kube-controller-manager 周期性检查节点状态，每当节点状态为 NotReady，并且超出 podEvictionTimeout 时间后，就把该节点上的 pod 全部驱逐到其它节点，其中具体驱逐速度还受驱逐速度参数，集群大小等的影响。最常用的 2 个参数如下：

- –pod-eviction-timeout：NotReady 状态节点超过该时间后，执行驱逐，默认 5 min。
- –node-eviction-rate：驱逐速度，默认为 0.1 pod/

当某个 zone 故障节点的数目超过一定阈值时，采用二级驱逐速度进行驱逐。

- –large-cluster-size-threshold：判断集群是否为大集群，默认为 50，即 50 个节点以上的集群为大集群。
- –unhealthy-zone-threshold：故障节点数比例，默认为 55%
- –secondary-node-eviction-rate：当大集群的故障节点超过 55% 时，采用二级驱逐速率，默认为 0.01 pod／秒。当小集群故障节点超过 55% 时，驱逐速率为 0 pod／秒。

**Kubelet 发起的驱逐**
Kubelet 周期性检查本节点的内存和磁盘资源，当可用资源低于阈值时，则按照优先级驱逐 pod，具体检查的资源如下：

memory.available
nodefs.available
nodefs.inodesFree
imagefs.available
imagefs.inodesFree
以内存资源为例，当内存资源低于阈值时，驱逐的优先级大体为 BestEffort > Burstable > Guaranteed，具体的顺序可能因实际使用量有所调整。当发生驱逐时，kubelet 支持 soft 和 hard 两种模式，soft 模式表示缓期一段时间后驱逐，hard 模式表示立刻驱逐。

**落地经验**
对于 kubelet 发起的驱逐，往往是资源不足导致，它优先驱逐 BestEffort 类型的容器，这些容器多为离线批处理类业务，对可靠性要求低。驱逐后释放资源，减缓节点压力，弃卒保帅，保护了该节点的其它容器。无论是从其设计出发，还是实际使用情况，该特性非常 nice。

对于由 kube-controller-manager 发起的驱逐，效果需要商榷。正常情况下，计算节点周期上报心跳给 master，如果心跳超时，则认为计算节点 NotReady，当 NotReady 状态达到一定时间后，kube-controller-manager 发起驱逐。然而造成心跳超时的场景非常多，例如：

原生 bug：kubelet 进程彻底阻塞
误操作：误把 kubelet 停止
基础设施异常：如交换机故障演练，NTP 异常，DNS 异常
节点故障：硬件损坏，掉电等
从实际情况看，真正因计算节点故障造成心跳超时概率很低，反而由原生 bug，基础设施异常造成心跳超时的概率更大，造成不必要的驱逐。

理想的情况下，驱逐对无状态且设计良好的业务方影响很小。但是并非所有的业务方都是无状态的，也并非所有的业务方都针对 Kubernetes 优化其业务逻辑。例如，对于有状态的业务，如果没有共享存储，异地重建后的 pod 完全丢失原有数据；即使数据不丢失，对于 Mysql 类的应用，如果出现双写，重则破坏数据。对于关心 IP 层的业务，异地重建后的 pod IP 往往会变化，虽然部分业务方可以利用 service 和 dns 来解决问题，但是引入了额外的模块和复杂性。

除非满足如下需求，不然请尽量关闭 kube-controller-manager 的驱逐功能，即把驱逐的超时时间设置非常长，同时把一级／二级驱逐速度设置为 0。否则，非常容易就搞出大大小小的故障，血泪的教训。

业务方要用正确的姿势使用容器，如数据与逻辑分离，无状态化，增强对异常处理等
分布式存储
可靠的 Service／DNS 服务或者保持异地重建后的 IP 不变
通常情况下，从架构设计的角度来说，管理模块的不可用并不会影响已有的实例。例如：OpenStack 计算节点的服务异常，管理节点不会去变动该节点上已经运行虚拟机。但是 kubernetes 的 pod eviction 则打破了这种设计，出发点很新颖，但是落地时，需要充分的考虑业务方的特点，以及业务方的设计是否充分考虑了 kubernetes 的特色。

参考：http://www.orchome.com/1252

  

### Self-Registration of Nodes

当kubelet flag --register-node为true（默认值）时，kubelet将向API服务器注册自身。这是大多数发行版使用的首选模式。

对于self-registration，kubelet从以下选项开始：

- `--api-servers` - Location of the apiservers.
- `--kubeconfig` - Path to credentials to authenticate itself to the apiserver.
- `--cloud-provider` - How to talk to a cloud provider to read metadata about itself.
- `--register-node` - Automatically register with the API server.
- `--register-with-taints` - Register the node with the given list of taints (comma separated `<key>=<value>:<effect>`). No-op if `register-node` is false.
- `--node-ip` IP address of the node.
- `--node-labels` - Labels to add when registering the node in the cluster.
- `--node-status-update-frequency` - Specifies how often kubelet posts node status to master.

 

#### 手动管理节点

集群管理员可以创建和修改节点对象。

如果管理员希望手动创建节点对象，请设置kubelet flag  --register-node=false。

管理员可以修改节点资源（不管--register-node设置如何），修改包括在节点上设置的labels 标签，并将其标记为不可调度的。

节点上的标签可以与pod上的节点选择器一起使用，以控制调度，例如将一个pod限制为只能在节点的子集上运行。

将节点标记为不可调度将防止新的pod被调度到该节点，但不会影响节点上的任何现有的pod，这在节点重新启动之前是有用的。例如，要标记节点不可调度，请运行以下命令：

```
kubectl cordon $NODENAME
```

**注意**，由daemonSet控制器创建的pod可以绕过Kubernetes调度程序，并且不遵循节点上无法调度的属性。

### Node容量

节点的容量(cpu数量和内存数量)是节点对象的一部分。通常，节点在创建节点对象时注册并通知其容量。如果是[手动管理节点](http://docs.kubernetes.org.cn/304.html#i)，则需要在添加节点时设置节点容量。

Kubernetes调度程序可确保节点上的所有pod都有足够的资源。它会检查节点上容器的请求的总和不大于节点容量。

如果要明确保留非pod过程的资源，可以创建一个占位符pod。使用以下模板：

```
apiVersion: v1
kind: Pod
metadata:
  name: resource-reserver
spec:
  containers:
  - name: sleep-forever
    image: gcr.io/google_containers/pause:0.8.0
    resources:
      requests:
        cpu: 100m
        memory: 100Mi
```

将cpu和内存值设置为你想要保留的资源量，将文件放置在manifest目录中(`--config=DIR` flag of kubelet)。在要预留资源的每个kubelet上执行此操作。

## 2.3  Pod

Pod是Kubernetes创建或部署的最小/最简单的基本单位

一个Pod封装一个应用容器（也可以有多个容器），存储资源、一个独立的网络IP以及管理控制容器运行方式的策略选项。Pod代表部署的一个单位：Kubernetes中单个应用的实例，它可能由单个容器或多个容器共享组成的资源。

> Docker是Kubernetes Pod中最常见的runtime ，Pods也支持其他容器runtimes。

Kubernetes中的Pod使用可分两种主要方式：

- Pod中运行一个容器。“one-container-per-Pod”模式是Kubernetes最常见的用法; 在这种情况下，你可以将Pod视为单个封装的容器，但是Kubernetes是直接管理Pod而不是容器。
- Pods中运行多个需要一起工作的容器。Pod可以封装紧密耦合的应用，它们需要由多个容器组成，它们之间能够共享资源，这些容器可以形成一个单一的内部service单位 - 一个容器共享文件，另一个“sidecar”容器来更新这些文件。Pod将这些容器的存储资源作为一个实体来管理。

关于Pod用法其他信息请参考：

- [The Distributed System Toolkit: Patterns for Composite Containers](http://blog.kubernetes.io/2015/06/the-distributed-system-toolkit-patterns.html)
- [Container Design Patterns](http://blog.kubernetes.io/2016/06/container-design-patterns.html)

每个Pod都是运行应用的单个实例，如果需要水平扩展应用（例如，运行多个实例），则应该使用多个Pods，每个实例一个Pod。在Kubernetes中，这样通常称为Replication。Replication的Pod通常由Controller创建和管理。更多信息，请参考[Pods和控制器](http://docs.kubernetes.org.cn/312.html#PodController)。

### Pods如何管理多个容器

Pods的设计可用于支持多进程的协同工作（作为容器），形成一个cohesive的Service单位。Pod中的容器在集群中Node上被自动分配，容器之间可以共享资源、网络和相互依赖关系，并同时被调度使用。

请注意，在单个Pod中共同管理多个容器是一个相对高级的用法，应该只有在容器紧密耦合的特殊实例中使用此模式。例如，有一个容器被用作WEB服务器，用于共享volume，以及一个单独“sidecar”容器需要从远程获取资源来更新这些文件，如下图所示：

![pod diagram](https://d33wubrfki0l68.cloudfront.net/aecab1f649bc640ebef1f05581bfcc91a48038c4/728d6/images/docs/pod.svg)

Pods提供两种共享资源：网络和存储。

#### 网络

每个Pod被分配一个独立的IP地址，Pod中的每个容器共享网络命名空间，包括IP地址和网络端口。Pod内的容器可以使用localhost相互通信。当Pod中的容器与Pod 外部通信时，他们必须协调如何使用共享网络资源（如端口）。

#### 存储

Pod可以指定一组共享存储*volumes*。Pod中的所有容器都可以访问共享*volumes*，允许这些容器共享数据。*volumes* 还用于Pod中的数据持久化，以防其中一个容器需要重新启动而丢失数据。有关Kubernetes如何在Pod中实现共享存储的更多信息，请参考Volumes。

## 使用Pod

你很少会直接在kubernetes中创建单个Pod。因为Pod的生命周期是短暂的，用后即焚的实体。当Pod被创建后（不论是由你直接创建还是被其他Controller），都会被Kuberentes调度到集群的Node上。直到Pod的进程终止、被删掉、因为缺少资源而被驱逐、或者Node故障之前这个Pod都会一直保持在那个Node上。

> 注意：重启Pod中的容器跟重启Pod不是一回事。Pod只提供容器的运行环境并保持容器的运行状态，重启容器不会造成Pod重启。

Pod不会自愈。如果Pod运行的Node故障，或者是调度器本身故障，这个Pod就会被删除。同样的，如果Pod所在Node缺少资源或者Pod处于维护状态，Pod也会被驱逐。Kubernetes使用更高级的称为Controller的抽象层，来管理Pod实例。虽然可以直接使用Pod，但是在Kubernetes中通常是使用Controller来管理Pod的。

### Pod和Controller

Controller可以创建和管理多个Pod，提供副本管理、滚动升级和集群级别的自愈能力。例如，如果一个Node故障，Controller就能自动将该节点上的Pod调度到其他健康的Node上。

包含一个或者多个Pod的Controller示例：

- [Deployment](http://docs.kubernetes.org.cn/317.html)
- [StatefulSet](http://docs.kubernetes.org.cn/443.html)
- DaemonSet

通常，Controller会用你提供的Pod Template来创建相应的Pod。

## Pod模板

Pod模板是包含了其他对象（如[Replication Controllers](http://docs.kubernetes.org.cn/437.html)，[Jobs](https://kubernetes.io/docs/concepts/jobs/run-to-completion-finite-workloads/)和 [DaemonSets）](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/)中的pod定义 。Controllers控制器使用Pod模板来创建实际需要的pod。

pod模板类似cookie cutters。“一旦饼干被切掉，饼干和刀将没有关系”。随后对模板的后续更改甚至切换到新模板对已创建的pod并没有任何的影响。

## 2.4  标签(Label)与标签选择器(Label Selector)

Labels其实就一对 key/value ，被关联到对象上，标签的使用我们倾向于能够标示对象的特殊特点，并且对用户而言是有意义的（比如一眼就看出了这个Pod是数据库），但是标签对内核系统是没有直接意义的。标签可以用来划分特定组的对象（比如，所有女的），标签可以在创建一个对象的时候直接给与，也可以在后期随时修改，每一个对象可以拥有多个标签，但是，key值必须是唯一的

```
"labels": {
  "key1" : "value1",
  "key2" : "value2"
}
```

我们最终会索引并且反向索引（reverse-index）labels，以获得更高效的查询和监视，把他们用到UI或者CLI中用来排序或者分组等等。我们不想用那些不具有指认效果的label来污染label，特别是那些体积较大和结构型的的数据。不具有指认效果的信息应该使用annotation来记录。

## Motivation

Labels可以让用户将他们自己的有组织目的的结构以一种松耦合的方式应用到系统的对象上，且不需要客户端存放这些对应关系（mappings）。

服务部署和批处理管道通常是多维的实体（例如多个分区或者部署，多个发布轨道，多层，每层多微服务）。管理通常需要跨越式的切割操作，这会打破有严格层级展示关系的封装，特别对那些是由基础设施而非用户决定的很死板的层级关系。

示例标签：

- "release" : "stable"， "release" : "canary"
- "environment" : "dev"，"environment" : "qa"，"environment" : "production"
- "tier" : "frontend"，"tier" : "backend"，"tier" : "cache"
- "partition" : "customerA"， "partition" : "customerB"
- "track" : "daily"， "track" : "weekly"

这些只是常用Labels的例子，你可以按自己习惯来定义，需要注意，每个对象的标签key具有唯一性。

## 语法和字符集

Label其实是一对 key/value。有效的标签键有两个段：可选的前缀和名称，用斜杠（/）分隔，名称段是必需的，最多63个字符，以[a-z0-9A-Z]带有虚线（-）、下划线（_）、点（.）和开头和结尾必须是字母或数字（都是字符串形式）的形式组成。前缀是可选的。如果指定了前缀，那么必须是DNS子域：一系列的DNSlabel通过”.”来划分，不超过253个字符，以斜杠（/）结尾。如果前缀被省略了，这个Label的key被假定为对用户私有的。自动化系统组件有（例如kube-scheduler，kube-controller-manager，kube-apiserver，kubectl，或其他第三方自动化），这些添加标签终端用户对象都必须指定一个前缀。Kuberentes.io 前缀是为Kubernetes 内核部分保留的。

有效的标签值最长为63个字符。要么为空，要么使用[a-z0-9A-Z]带有虚线（-）、下划线（_）、点（.）和开头和结尾必须是字母或数字（都是字符串形式）的形式组成。

## Labels选择器

与[Name和UID](http://docs.kubernetes.org.cn/235.html) 不同，标签不需要有唯一性。一般来说，我们期望许多对象具有相同的标签。

通过标签选择器（Labels Selectors），客户端/用户 能方便辨识出一组对象。标签选择器是kubernetes中核心的组成部分。

API目前支持两种选择器：equality-based（基于相等）和set-based（基于集合）的。标签选择器可以由逗号分隔的多个requirements 组成。在多重需求的情况下，必须满足所有要求，因此逗号分隔符作为AND逻辑运算符。

一个为空的标签选择器（即有0个必须条件的选择器）会选择集合中的每一个对象。

一个null型标签选择器（仅对于可选的选择器字段才可能）不会返回任何对象。

注意：两个控制器的标签选择器不能在命名空间中重叠。

### Equality-based requirement 基于相等的要求

基于相等的或者不相等的条件允许用标签的keys和values进行过滤。匹配的对象必须满足所有指定的标签约束，尽管他们可能也有额外的标签。有三种运算符是允许的，“=”，“==”和“!=”。前两种代表相等性（他们是同义运算符），后一种代表非相等性。例如：

```
environment = production
tier != frontend
```

第一个选择所有key等于 environment 值为 production 的资源。后一种选择所有key为 tier 值不等于 frontend 的资源，和那些没有key为 tier 的label的资源。要过滤所有处于 production 但不是 frontend 的资源，可以使用逗号操作符，

```
frontend：environment=production,tier!=frontend
```

### Set-based requirement

Set-based 的标签条件允许用一组value来过滤key。支持三种操作符: in ， notin 和 exists(仅针对于key符号) 。例如：

```
environment in (production, qa)
tier notin (frontend, backend)
partition
!partition
```

第一个例子，选择所有key等于 environment ，且value等于 production 或者 qa 的资源。 第二个例子，选择所有key等于 tier 且值是除了 frontend 和 backend 之外的资源，和那些没有标签的key是 tier 的资源。 第三个例子，选择所有有一个标签的key为partition的资源；value是什么不会被检查。 第四个例子，选择所有的没有lable的key名为 partition 的资源；value是什么不会被检查。

类似的，逗号操作符相当于一个AND操作符。因而要使用一个 partition 键（不管value是什么），并且 environment 不是 qa 过滤资源可以用 partition,environment notin (qa) 。

Set-based 的选择器是一个相等性的宽泛的形式，因为 environment=production 相当于environment in (production) ，与 != and notin 类似。

Set-based的条件可以与Equality-based的条件结合。例如， partition in (customerA,customerB),environment!=qa 。

## API

### LIST和WATCH过滤

LIST和WATCH操作可以指定标签选择器来过滤使用查询参数返回的对象集。这两个要求都是允许的（在这里给出，它们会出现在URL查询字符串中）：

LIST和WATCH操作，可以使用query参数来指定label选择器来过滤返回对象的集合。两种条件都可以使用：

- Set-based的要求：?labelSelector=environment%3Dproduction,tier%3Dfrontend
- Equality-based的要求：?labelSelector=environment+in+%28production%2Cqa%29%2Ctier+in+%28frontend%29

两个标签选择器样式都可用于通过REST客户端列出或观看资源。例如，apiserver使用kubectl和使用基于平等的人可以写：

两种标签选择器样式，都可以通过REST客户端来list或watch资源。比如使用 kubectl 来针对 apiserver ，并且使用Equality-based的条件，可以用：

```
$ kubectl get pods -l environment=production,tier=frontend
```

或使用Set-based 要求：

```
$ kubectl get pods -l 'environment in (production),tier in (frontend)'
```

如已经提到的Set-based要求更具表现力。例如，它们可以对value执行OR运算：

```
$ kubectl get pods -l 'environment in (production, qa)'
```

或者通过exists操作符进行否定限制匹配：

```
$ kubectl get pods -l 'environment,environment notin (frontend)'
```

### API对象中引用

一些Kubernetes对象，例如[services](https://kubernetes.io/docs/user-guide/services)和[replicationcontrollers](https://kubernetes.io/docs/user-guide/replication-controller)，也使用标签选择器来指定其他资源的集合，如[pod](https://kubernetes.io/docs/user-guide/pods)。

#### Service和ReplicationController

一个service针对的pods的集合是用标签选择器来定义的。类似的，一个replicationcontroller管理的pods的群体也是用标签选择器来定义的。

对于这两种对象的Label选择器是用map定义在json或者yaml文件中的，并且只支持Equality-based的条件：

```
"selector": {
    "component" : "redis",
}
```

要么

```
selector:
    component: redis
```

此选择器（分别为json或yaml格式）等同于component=redis或component in (redis)。

#### 支持set-based要求的资源

Job，[Deployment](http://docs.kubernetes.org.cn/317.html)，[Replica Set](http://docs.kubernetes.org.cn/314.html)，和Daemon Set，支持set-based要求。

```
selector:
  matchLabels:
    component: redis
  matchExpressions:
    - {key: tier, operator: In, values: [cache]}
    - {key: environment, operator: NotIn, values: [dev]}
```

matchLabels 是一个{key,value}的映射。一个单独的 {key,value} 相当于 matchExpressions 的一个元素，它的key字段是”key”,操作符是 In ，并且value数组value包含”value”。 matchExpressions 是一个pod的选择器条件的list 。有效运算符包含In, NotIn, Exists, 和DoesNotExist。在In和NotIn的情况下，value的组必须不能为空。所有的条件，包含 matchLabels andmatchExpressions 中的，会用AND符号连接，他们必须都被满足以完成匹配。

## 2.5  Replication Controller(RC)

注意：建议使用[Deployment](http://docs.kubernetes.org.cn/317.html) 配置 [ReplicaSet](http://docs.kubernetes.org.cn/314.html) （简称RS）方法来控制副本数。

ReplicationController（简称RC）是确保用户定义的Pod副本数保持不变。

**ReplicationController 工作原理**

在用户定义范围内，如果pod增多，则ReplicationController会终止额外的pod，如果减少，RC会创建新的pod，始终保持在定义范围。例如，RC会在Pod维护（例如内核升级）后在节点上重新创建新Pod。

注：

- ReplicationController会替换由于某些原因而被删除或终止的pod，例如在节点故障或中断节点维护（例如内核升级）的情况下。因此，即使应用只需要一个pod，我们也建议使用ReplicationController。
- RC跨多个Node节点监视多个pod。

### 示例：

[replication.yaml](https://raw.githubusercontent.com/kubernetes/kubernetes.github.io/master/docs/concepts/workloads/controllers/replication.yaml)

```
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx
spec:
  replicas: 3
  selector:
    app: nginx
  template:
    metadata:
      name: nginx
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
```

下载示例文件然后运行：

```
$ kubectl create -f ./replication.yaml
replicationcontroller "nginx" created
```

检查ReplicationController状态：

```
$ kubectl describe replicationcontrollers/nginx
Name:        nginx
Namespace:   default
Image(s):    nginx
Selector:    app=nginx
Labels:      app=nginx
Replicas:    3 current / 3 desired
Pods Status: 0 Running / 3 Waiting / 0 Succeeded / 0 Failed
Events:
  FirstSeen       LastSeen     Count    From                        SubobjectPath    Type      Reason              Message
  ---------       --------     -----    ----                        -------------    ----      ------              -------
  20s             20s          1        {replication-controller }                    Normal    SuccessfulCreate    Created pod: nginx-qrm3m
  20s             20s          1        {replication-controller }                    Normal    SuccessfulCreate    Created pod: nginx-3ntk0
  20s             20s          1        {replication-controller }                    Normal    SuccessfulCreate    Created pod: nginx-4ok8v
```

创建了三个pod：

```
Pods Status:    3 Running / 0 Waiting / 0 Succeeded / 0 Failed
```

列出属于ReplicationController的所有pod：

```
$ pods=$(kubectl get pods --selector=app=nginx --output=jsonpath={.items..metadata.name})
echo $pods
nginx-3ntk0 nginx-4ok8v nginx-qrm3m
```

### 删除ReplicationController及其Pods

使用[kubectl delete](https://www.kubernetes.org.cn/doc-60)命令删除ReplicationController及其所有pod。

当使用REST API或客户端库时，需要明确地执行这些步骤（将副本缩放为0，等待pod删除，然后删除ReplicationController）。

### 只删除 ReplicationController

在删除ReplicationController时，可以不影响任何pod。

使用kubectl，为kubectl delete指定- cascade = false选项。

使用REST API或go客户端库时，只需删除ReplicationController对象即可。

原始文件被删除后，你可以创建一个新的ReplicationController来替换它。只要旧的和新.spec.selector 相匹配，那么新的将会采用旧的Pod。

### ReplicationController隔离pod

可以通过更改标签来从ReplicationController的目标集中删除Pod。

## RC常用方式

- Rescheduling（重新规划）
- 扩展
- 滚动更新
- 多版本跟踪
- 使用ReplicationControllers与关联的Services

## API对象

Replication controller是Kubernetes REST API中的顶级资源。有关API对象更多详细信息，请参见：[ReplicationController API对象](https://kubernetes.io/docs/api-reference/v1.7/#replicationcontroller-v1-core)。

## RC 替代方法

### ReplicaSet

[ReplicaSet](http://docs.kubernetes.org.cn/314.html)是支持新的set-based选择器要求的下一代ReplicationController 。它主要用作[Deployment](http://docs.kubernetes.org.cn/317.html)协调pod创建、删除和更新。请注意，除非需要自定义更新编排或根本不需要更新，否则建议使用Deployment而不是直接使用ReplicaSets。

### Deployment（推荐）

[Deployment](http://docs.kubernetes.org.cn/317.html)是一个高级的API对象，以类似的方式更新其底层的副本集和它们的Pods kubectl rolling-update。如果您希望使用这种滚动更新功能，建议您进行部署，因为kubectl rolling-update它们是声明式的，服务器端的，并具有其他功能。

### Bare Pods

与用户直接创建pod的情况不同，ReplicationController会替换由于某些原因而被删除或终止的pod，例如在节点故障或中断节点维护（例如内核升级）的情况下。因此，即使应用只需要一个pod，我们也建议使用ReplicationController。

## 2.6  Deployment

Deployment为[Pod](http://docs.kubernetes.org.cn/312.html)和[Replica Set](http://docs.kubernetes.org.cn/314.html)（升级版的 [Replication Controller](http://docs.kubernetes.org.cn/437.html)）提供声明式更新。

你只需要在 Deployment 中描述您想要的目标状态是什么，Deployment controller 就会帮您将 Pod 和ReplicaSet 的实际状态改变到您的目标状态。您可以定义一个全新的 Deployment 来创建 ReplicaSet 或者删除已有的 Deployment 并创建一个新的来替换。

注意：您不该手动管理由 Deployment 创建的 [Replica Set](http://docs.kubernetes.org.cn/314.html)，否则您就篡越了 Deployment controller 的职责！下文罗列了 Deployment 对象中已经覆盖了所有的用例。如果未有覆盖您所有需要的用例，请直接在 Kubernetes 的代码库中提 issue。

典型的用例如下：

- 使用Deployment来创建ReplicaSet。ReplicaSet在后台创建pod。检查启动状态，看它是成功还是失败。
- 然后，通过更新Deployment的PodTemplateSpec字段来声明Pod的新状态。这会创建一个新的ReplicaSet，Deployment会按照控制的速率将pod从旧的ReplicaSet移动到新的ReplicaSet中。
- 如果当前状态不稳定，回滚到之前的Deployment revision。每次回滚都会更新Deployment的revision。
- 扩容Deployment以满足更高的负载。
- 暂停Deployment来应用PodTemplateSpec的多个修复，然后恢复上线。
- 根据Deployment 的状态判断上线是否hang住了。
- 清除旧的不必要的 ReplicaSet。

## 创建 Deployment

下面是一个 Deployment 示例，它创建了一个 ReplicaSet 来启动3个 nginx pod。

下载示例文件并执行命令：

```
$ kubectl create -f https://kubernetes.io/docs/user-guide/nginx-deployment.yaml --record
deployment "nginx-deployment" created
```

将kubectl的 --record 的 flag 设置为 true可以在 annotation 中记录当前命令创建或者升级了该资源。这在未来会很有用，例如，查看在每个 Deployment revision 中执行了哪些命令。

然后立即执行 get 将获得如下结果：

```
$ kubectl get deployments
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3         0         0            0           1s
```

输出结果表明我们希望的repalica数是3（根据deployment中的.spec.replicas配置）当前replica数（ .status.replicas）是0, 最新的replica数（.status.updatedReplicas）是0，可用的replica数（.status.availableReplicas）是0。

过几秒后再执行get命令，将获得如下输出：

```
$ kubectl get deployments
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3         3         3            3           18s
```

我们可以看到Deployment已经创建了3个 replica，所有的 replica 都已经是最新的了（包含最新的pod template），可用的（根据Deployment中的.spec.minReadySeconds声明，处于已就绪状态的pod的最少个数）。执行kubectl get rs和kubectl get pods会显示Replica Set（RS）和Pod已创建。

```
$ kubectl get rs
NAME                          DESIRED   CURRENT   READY   AGE
nginx-deployment-2035384211   3         3         0       18s
```

您可能会注意到 ReplicaSet 的名字总是<Deployment的名字>-<pod template的hash值>。

```
$ kubectl get pods --show-labels
NAME                                READY     STATUS    RESTARTS   AGE       LABELS
nginx-deployment-2035384211-7ci7o   1/1       Running   0          18s       app=nginx,pod-template-hash=2035384211
nginx-deployment-2035384211-kzszj   1/1       Running   0          18s       app=nginx,pod-template-hash=2035384211
nginx-deployment-2035384211-qqcnn   1/1       Running   0          18s       app=nginx,pod-template-hash=2035384211
```

刚创建的Replica Set将保证总是有3个 nginx 的 pod 存在。

注意： 您必须在 Deployment 中的 selector 指定正确的 pod template label（在该示例中是 app = nginx），不要跟其他的 controller 的 selector 中指定的 pod template label 搞混了（包括 Deployment、Replica Set、Replication Controller 等）。Kubernetes 本身并不会阻止您任意指定 pod template label ，但是如果您真的这么做了，这些 controller 之间会相互打架，并可能导致不正确的行为。

### Pod-template-hash label

注意：这个[ label](http://docs.kubernetes.org.cn/247.html) 不是用户指定的！

注意上面示例输出中的 pod label 里的 pod-template-hash label。当 Deployment 创建或者接管 ReplicaSet 时，Deployment controller 会自动为 Pod 添加 pod-template-hash label。这样做的目的是防止 Deployment 的子ReplicaSet 的 pod 名字重复。通过将 ReplicaSet 的 PodTemplate 进行哈希散列，使用生成的哈希值作为 label 的值，并添加到 ReplicaSet selector 里、 pod template label 和 ReplicaSet 管理中的 Pod 上。

## 更新Deployment

注意： Deployment 的 rollout 当且仅当 Deployment 的 pod template（例如.spec.template）中的label更新或者镜像更改时被触发。其他更新，例如扩容Deployment不会触发 rollout。

假如我们现在想要让 nginx pod 使用nginx:1.9.1的镜像来代替原来的nginx:1.7.9的镜像。

```
$ kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1
deployment "nginx-deployment" image updated
```

我们可以使用edit命令来编辑 Deployment，修改 .spec.template.spec.containers[0].image ，将nginx:1.7.9 改写成 nginx:1.9.1。

```
$ kubectl edit deployment/nginx-deployment
deployment "nginx-deployment" edited
```

查看 rollout 的状态，只要执行：

```
$ kubectl rollout status deployment/nginx-deployment
Waiting for rollout to finish: 2 out of 3 new replicas have been updated...
deployment "nginx-deployment" successfully rolled out
```

Rollout 成功后，get Deployment：

```
$ kubectl get deployments
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3         3         3            3           36s
```

UP-TO-DATE 的 replica 的数目已经达到了配置中要求的数目。

CURRENT 的 replica 数表示 Deployment 管理的 replica 数量，AVAILABLE 的 replica 数是当前可用的replica数量。

我们通过执行kubectl get rs可以看到 Deployment 更新了Pod，通过创建一个新的 ReplicaSet 并扩容了3个 replica，同时将原来的 ReplicaSet 缩容到了0个 replica。

```
$ kubectl get rs
NAME                          DESIRED   CURRENT   READY   AGE
nginx-deployment-1564180365   3         3         0       6s
nginx-deployment-2035384211   0         0         0       36s
```

执行 get pods只会看到当前的新的 pod:

```
$ kubectl get pods
NAME                                READY     STATUS    RESTARTS   AGE
nginx-deployment-1564180365-khku8   1/1       Running   0          14s
nginx-deployment-1564180365-nacti   1/1       Running   0          14s
nginx-deployment-1564180365-z9gth   1/1       Running   0          14s
```

下次更新这些 pod 的时候，只需要更新 Deployment 中的 pod 的 template 即可。

Deployment 可以保证在升级时只有一定数量的 Pod 是 down 的。默认的，它会确保至少有比期望的Pod数量少一个是up状态（最多一个不可用）。

Deployment 同时也可以确保只创建出超过期望数量的一定数量的 Pod。默认的，它会确保最多比期望的Pod数量多一个的 Pod 是 up 的（最多1个 surge ）。

在未来的 Kuberentes 版本中，将从1-1变成25%-25%。

例如，如果您自己看下上面的 Deployment，您会发现，开始创建一个新的 Pod，然后删除一些旧的 Pod 再创建一个新的。当新的Pod创建出来之前不会杀掉旧的Pod。这样能够确保可用的 Pod 数量至少有2个，Pod的总数最多4个。

```
$ kubectl describe deployments
Name:           nginx-deployment
Namespace:      default
CreationTimestamp:  Tue, 15 Mar 2016 12:01:06 -0700
Labels:         app=nginx
Selector:       app=nginx
Replicas:       3 updated | 3 total | 3 available | 0 unavailable
StrategyType:       RollingUpdate
MinReadySeconds:    0
RollingUpdateStrategy:  1 max unavailable, 1 max surge
OldReplicaSets:     <none>
NewReplicaSet:      nginx-deployment-1564180365 (3/3 replicas created)
Events:
  FirstSeen LastSeen    Count   From                     SubobjectPath   Type        Reason              Message
  --------- --------    -----   ----                     -------------   --------    ------              -------
  36s       36s         1       {deployment-controller }                 Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-2035384211 to 3
  23s       23s         1       {deployment-controller }                 Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 1
  23s       23s         1       {deployment-controller }                 Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-2035384211 to 2
  23s       23s         1       {deployment-controller }                 Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 2
  21s       21s         1       {deployment-controller }                 Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-2035384211 to 0
  21s       21s         1       {deployment-controller }                 Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 3
```

我们可以看到当我们刚开始创建这个 Deployment 的时候，创建了一个 ReplicaSet（nginx-deployment-2035384211），并直接扩容到了3个 replica。

当我们更新这个 Deployment 的时候，它会创建一个新的 ReplicaSet（nginx-deployment-1564180365），将它扩容到1个replica，然后缩容原先的 ReplicaSet 到2个 replica，此时满足至少2个 Pod 是可用状态，同一时刻最多有4个 Pod 处于创建的状态。

接着继续使用相同的 rolling update 策略扩容新的 ReplicaSet 和缩容旧的 ReplicaSet。最终，将会在新的 ReplicaSet 中有3个可用的 replica，旧的 ReplicaSet 的 replica 数目变成0。

### Rollover（多个rollout并行）

每当 Deployment controller 观测到有新的 deployment 被创建时，如果没有已存在的 ReplicaSet 来创建期望个数的 Pod 的话，就会创建出一个新的 ReplicaSet 来做这件事。已存在的 ReplicaSet 控制 label 与.spec.selector匹配但是 template 跟.spec.template不匹配的 Pod 缩容。最终，新的 ReplicaSet 将会扩容出.spec.replicas指定数目的 Pod，旧的 ReplicaSet 会缩容到0。

如果您更新了一个的已存在并正在进行中的 Deployment，每次更新 Deployment都会创建一个新的 ReplicaSet并扩容它，同时回滚之前扩容的 ReplicaSet ——将它添加到旧的 ReplicaSet 列表中，开始缩容。

例如，假如您创建了一个有5个niginx:1.7.9 replica的 Deployment，但是当还只有3个nginx:1.7.9的 replica 创建出来的时候您就开始更新含有5个nginx:1.9.1 replica 的 Deployment。在这种情况下，Deployment 会立即杀掉已创建的3个nginx:1.7.9的 Pod，并开始创建nginx:1.9.1的 Pod。它不会等到所有的5个nginx:1.7.9的 Pod 都创建完成后才开始改变航道。

### Label selector 更新

我们通常不鼓励更新 [label selector](http://docs.kubernetes.org.cn/247.html)，我们建议实现规划好您的 selector。

任何情况下，只要您想要执行 label selector 的更新，请一定要谨慎并确认您已经预料到所有可能因此导致的后果。

- 增添 selector 需要同时在 Deployment 的 spec 中更新新的 label，否则将返回校验错误。此更改是不可覆盖的，这意味着新的 selector 不会选择使用旧 selector 创建的 ReplicaSet 和 Pod，从而导致所有旧版本的 ReplicaSet 都被丢弃，并创建新的 ReplicaSet。
- 更新 selector，即更改 selector key 的当前值，将导致跟增添 selector 同样的后果。
- 删除 selector，即删除 Deployment selector 中的已有的 key，不需要对 Pod template label 做任何更改，现有的 ReplicaSet 也不会成为孤儿，但是请注意，删除的 label 仍然存在于现有的 Pod 和 ReplicaSet 中。

## 回退Deployment

有时候您可能想回退一个 Deployment，例如，当 Deployment 不稳定时，比如一直 crash looping。

默认情况下，kubernetes 会在系统中保存前两次的 Deployment 的 rollout 历史记录，以便您可以随时回退（您可以修改revision history limit来更改保存的revision数）。

注意： 只要 Deployment 的 rollout 被触发就会创建一个 revision。也就是说当且仅当 Deployment 的 Pod template（如.spec.template）被更改，例如更新template 中的 label 和容器镜像时，就会创建出一个新的 revision。

其他的更新，比如扩容 Deployment 不会创建 revision——因此我们可以很方便的手动或者自动扩容。这意味着当您回退到历史 revision 是，直有 Deployment 中的 Pod template 部分才会回退。

假设我们在更新 Deployment 的时候犯了一个拼写错误，将镜像的名字写成了nginx:1.91，而正确的名字应该是nginx:1.9.1：

```
$ kubectl set image deployment/nginx-deployment nginx=nginx:1.91
deployment "nginx-deployment" image updated
```

Rollout 将会卡住。

```
$ kubectl rollout status deployments nginx-deployment
Waiting for rollout to finish: 2 out of 3 new replicas have been updated...
```

按住 Ctrl-C 停止上面的 rollout 状态监控。

您会看到旧的 replica（nginx-deployment-1564180365 和 nginx-deployment-2035384211）和新的 replica （nginx-deployment-3066724191）数目都是2个。

```
$ kubectl get rs
NAME                          DESIRED   CURRENT   READY   AGE
nginx-deployment-1564180365   2         2         0       25s
nginx-deployment-2035384211   0         0         0       36s
nginx-deployment-3066724191   2         2         2       6s
```

看下创建 Pod，您会看到有两个新的 ReplicaSet 创建的 Pod 处于 ImagePullBackOff 状态，循环拉取镜像。

```
$ kubectl get pods
NAME                                READY     STATUS             RESTARTS   AGE
nginx-deployment-1564180365-70iae   1/1       Running            0          25s
nginx-deployment-1564180365-jbqqo   1/1       Running            0          25s
nginx-deployment-3066724191-08mng   0/1       ImagePullBackOff   0          6s
nginx-deployment-3066724191-eocby   0/1       ImagePullBackOff   0          6s
```

注意，Deployment controller会自动停止坏的 rollout，并停止扩容新的 ReplicaSet。

```
$ kubectl describe deployment
Name:           nginx-deployment
Namespace:      default
CreationTimestamp:  Tue, 15 Mar 2016 14:48:04 -0700
Labels:         app=nginx
Selector:       app=nginx
Replicas:       2 updated | 3 total | 2 available | 2 unavailable
StrategyType:       RollingUpdate
MinReadySeconds:    0
RollingUpdateStrategy:  1 max unavailable, 1 max surge
OldReplicaSets:     nginx-deployment-1564180365 (2/2 replicas created)
NewReplicaSet:      nginx-deployment-3066724191 (2/2 replicas created)
Events:
  FirstSeen LastSeen    Count   From                    SubobjectPath   Type        Reason              Message
  --------- --------    -----   ----                    -------------   --------    ------              -------
  1m        1m          1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-2035384211 to 3
  22s       22s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 1
  22s       22s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-2035384211 to 2
  22s       22s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 2
  21s       21s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-2035384211 to 0
  21s       21s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 3
  13s       13s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-3066724191 to 1
  13s       13s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-1564180365 to 2
  13s       13s         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-3066724191 to 2
```

为了修复这个问题，我们需要回退到稳定的 Deployment revision。

### 检查 Deployment 升级的历史记录

首先，检查下 Deployment 的 revision：

```
$ kubectl rollout history deployment/nginx-deployment
deployments "nginx-deployment":
REVISION    CHANGE-CAUSE
1           kubectl create -f https://kubernetes.io/docs/user-guide/nginx-deployment.yaml--record
2           kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1
3           kubectl set image deployment/nginx-deployment nginx=nginx:1.91
```

因为我们创建 Deployment 的时候使用了--recored参数可以记录命令，我们可以很方便的查看每次 revision 的变化。

查看单个revision 的详细信息：

```
$ kubectl rollout history deployment/nginx-deployment --revision=2
deployments "nginx-deployment" revision 2
  Labels:       app=nginx
          pod-template-hash=1159050644
  Annotations:  kubernetes.io/change-cause=kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1
  Containers:
   nginx:
    Image:      nginx:1.9.1
    Port:       80/TCP
     QoS Tier:
        cpu:      BestEffort
        memory:   BestEffort
    Environment Variables:      <none>
  No volumes.
```

### 回退到历史版本

现在，我们可以决定回退当前的 rollout 到之前的版本：

```
$ kubectl rollout undo deployment/nginx-deployment
deployment "nginx-deployment" rolled back
```

也可以使用 --revision参数指定某个历史版本：

```
$ kubectl rollout undo deployment/nginx-deployment --to-revision=2
deployment "nginx-deployment" rolled back
```

与 rollout 相关的命令详细文档见[kubectl rollout](https://kubernetes.io/docs/user-guide/kubectl/v1.6/#rollout)。

该 Deployment 现在已经回退到了先前的稳定版本。如您所见，Deployment controller产生了一个回退到revison 2的DeploymentRollback的 event。

```
$ kubectl get deployment
NAME               DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment   3         3         3            3           30m

$ kubectl describe deployment
Name:           nginx-deployment
Namespace:      default
CreationTimestamp:  Tue, 15 Mar 2016 14:48:04 -0700
Labels:         app=nginx
Selector:       app=nginx
Replicas:       3 updated | 3 total | 3 available | 0 unavailable
StrategyType:       RollingUpdate
MinReadySeconds:    0
RollingUpdateStrategy:  1 max unavailable, 1 max surge
OldReplicaSets:     <none>
NewReplicaSet:      nginx-deployment-1564180365 (3/3 replicas created)
Events:
  FirstSeen LastSeen    Count   From                    SubobjectPath   Type        Reason              Message
  --------- --------    -----   ----                    -------------   --------    ------              -------
  30m       30m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-2035384211 to 3
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 1
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-2035384211 to 2
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 2
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-2035384211 to 0
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-3066724191 to 2
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-3066724191 to 1
  29m       29m         1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-1564180365 to 2
  2m        2m          1       {deployment-controller }                Normal      ScalingReplicaSet   Scaled down replica set nginx-deployment-3066724191 to 0
  2m        2m          1       {deployment-controller }                Normal      DeploymentRollback  Rolled back deployment "nginx-deployment" to revision 2
  29m       2m          2       {deployment-controller }                Normal      ScalingReplicaSet   Scaled up replica set nginx-deployment-1564180365 to 3
```

### 清理 Policy

您可以通过设置.spec.revisonHistoryLimit项来指定 deployment 最多保留多少 revision 历史记录。默认的会保留所有的 revision；如果将该项设置为0，Deployment就不允许回退了。

## Deployment 扩容

您可以使用以下命令扩容 Deployment：

```
$ kubectl scale deployment nginx-deployment --replicas 10
deployment "nginx-deployment" scaled
```

假设您的集群中启用了[horizontal pod autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough)，您可以给 Deployment 设置一个 autoscaler，基于当前 Pod的 CPU 利用率选择最少和最多的 Pod 数。

```
$ kubectl autoscale deployment nginx-deployment --min=10 --max=15 --cpu-percent=80
deployment "nginx-deployment" autoscaled
```

### 比例扩容

RollingUpdate Deployment 支持同时运行一个应用的多个版本。或者 autoscaler 扩 容 RollingUpdate Deployment 的时候，正在中途的 rollout（进行中或者已经暂停的），为了降低风险，Deployment controller 将会平衡已存在的活动中的 ReplicaSet（有 Pod 的 ReplicaSet）和新加入的 replica。这被称为比例扩容。

例如，您正在运行中含有10个 replica 的 Deployment。maxSurge=3，maxUnavailable=2。

```
$ kubectl get deploy
NAME                 DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment     10        10        10           10          50s
```

您更新了一个镜像，而在集群内部无法解析。

```
$ kubectl set image deploy/nginx-deployment nginx=nginx:sometag
deployment "nginx-deployment" image updated
```

镜像更新启动了一个包含ReplicaSet nginx-deployment-1989198191的新的rollout，但是它被阻塞了，因为我们上面提到的maxUnavailable。

```
$ kubectl get rs
NAME                          DESIRED   CURRENT   READY     AGE
nginx-deployment-1989198191   5         5         0         9s
nginx-deployment-618515232    8         8         8         1m
```

然后发起了一个新的Deployment扩容请求。autoscaler将Deployment的repllica数目增加到了15个。Deployment controller需要判断在哪里增加这5个新的replica。如果我们没有谁用比例扩容，所有的5个replica都会加到一个新的ReplicaSet中。如果使用比例扩容，新添加的replica将传播到所有的ReplicaSet中。大的部分加入replica数最多的ReplicaSet中，小的部分加入到replica数少的ReplciaSet中。0个replica的ReplicaSet不会被扩容。

在我们上面的例子中，3个replica将添加到旧的ReplicaSet中，2个replica将添加到新的ReplicaSet中。rollout进程最终会将所有的replica移动到新的ReplicaSet中，假设新的replica成为健康状态。

```
$ kubectl get deploy
NAME                 DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx-deployment     15        18        7            8           7m
$ kubectl get rs
NAME                          DESIRED   CURRENT   READY     AGE
nginx-deployment-1989198191   7         7         0         7m
nginx-deployment-618515232    11        11        11        7m
```

## 暂停和恢复Deployment

您可以在发出一次或多次更新前暂停一个 Deployment，然后再恢复它。这样您就能多次暂停和恢复 Deployment，在此期间进行一些修复工作，而不会发出不必要的 rollout。

例如使用刚刚创建 Deployment：

```
$ kubectl get deploy
NAME      DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx     3         3         3            3           1m
[mkargaki@dhcp129-211 kubernetes]$ kubectl get rs
NAME               DESIRED   CURRENT   READY     AGE
nginx-2142116321   3         3         3         1m
```

使用以下命令暂停 Deployment：

```
$ kubectl rollout pause deployment/nginx-deployment
deployment "nginx-deployment" paused
```

然后更新 Deplyment中的镜像：

```
$ kubectl set image deploy/nginx nginx=nginx:1.9.1
deployment "nginx-deployment" image updated
```

注意新的 rollout 启动了：

```
$ kubectl rollout history deploy/nginx
deployments "nginx"
REVISION  CHANGE-CAUSE
1   <none>

$ kubectl get rs
NAME               DESIRED   CURRENT   READY     AGE
nginx-2142116321   3         3         3         2m
```

您可以进行任意多次更新，例如更新使用的资源：

```
$ kubectl set resources deployment nginx -c=nginx --limits=cpu=200m,memory=512Mi
deployment "nginx" resource requirements updated
```

Deployment 暂停前的初始状态将继续它的功能，而不会对 Deployment 的更新产生任何影响，只要 Deployment是暂停的。

最后，恢复这个 Deployment，观察完成更新的 ReplicaSet 已经创建出来了：

```
$ kubectl rollout resume deploy nginx
deployment "nginx" resumed
$ KUBECTL get rs -w
NAME               DESIRED   CURRENT   READY     AGE
nginx-2142116321   2         2         2         2m
nginx-3926361531   2         2         0         6s
nginx-3926361531   2         2         1         18s
nginx-2142116321   1         2         2         2m
nginx-2142116321   1         2         2         2m
nginx-3926361531   3         2         1         18s
nginx-3926361531   3         2         1         18s
nginx-2142116321   1         1         1         2m
nginx-3926361531   3         3         1         18s
nginx-3926361531   3         3         2         19s
nginx-2142116321   0         1         1         2m
nginx-2142116321   0         1         1         2m
nginx-2142116321   0         0         0         2m
nginx-3926361531   3         3         3         20s
^C
$ KUBECTL get rs
NAME               DESIRED   CURRENT   READY     AGE
nginx-2142116321   0         0         0         2m
nginx-3926361531   3         3         3         28s
```

注意： 在恢复 Deployment 之前您无法回退一个已经暂停的 Deployment。

## Deployment 状态

Deployment 在生命周期中有多种状态。在创建一个新的 ReplicaSet 的时候它可以是 [progressing](https://kubernetes.io/docs/concepts/workloads/controllers/deployment.md#progressing-deployment) 状态， [complete](https://kubernetes.io/docs/concepts/workloads/controllers/deployment.md#complete-deployment) 状态，或者 [fail to progress ](https://kubernetes.io/docs/concepts/workloads/controllers/deployment.md#failed-deployment)状态。

### 进行中的 Deployment

Kubernetes 将执行过下列任务之一的 Deployment 标记为 progressing 状态：

- Deployment 正在创建新的ReplicaSet过程中。
- Deployment 正在扩容一个已有的 ReplicaSet。
- Deployment 正在缩容一个已有的 ReplicaSet。
- 有新的可用的 pod 出现。

您可以使用kubectl rollout status命令监控 Deployment 的进度。

### 完成的 Deployment

Kubernetes 将包括以下特性的 Deployment 标记为 complete 状态：

- Deployment 最小可用。最小可用意味着 Deployment 的可用 replica 个数等于或者超过 Deployment 策略中的期望个数。
- 所有与该 Deployment 相关的replica都被更新到了您指定版本，也就说更新完成。
- 该 Deployment 中没有旧的 Pod 存在。

您可以用kubectl rollout status命令查看 Deployment 是否完成。如果 rollout 成功完成，kubectl rollout status将返回一个0值的 Exit Code。

```
$ kubectl rollout status deploy/nginx
Waiting for rollout to finish: 2 of 3 updated replicas are available...
deployment "nginx" successfully rolled out
$ echo $?
0
```

### 失败的 Deployment

您的 Deployment 在尝试部署新的 ReplicaSet 的时候可能卡住，用于也不会完成。这可能是因为以下几个因素引起的：

- 无效的引用
- 不可读的 probe failure
- 镜像拉取错误
- 权限不够
- 范围限制
- 程序运行时配置错误

探测这种情况的一种方式是，在您的 Deployment spec 中指定[spec.progressDeadlineSeconds](https://kubernetes.io/docs/concepts/workloads/controllers/deployment.md#progress-deadline-seconds)。spec.progressDeadlineSeconds 表示 Deployment controller 等待多少秒才能确定（通过 Deployment status）Deployment进程是卡住的。

下面的kubectl命令设置progressDeadlineSeconds 使 controller 在 Deployment 在进度卡住10分钟后报告：

```
$ kubectl patch deployment/nginx-deployment -p '{"spec":{"progressDeadlineSeconds":600}}'
"nginx-deployment" patched
```

当超过截止时间后，Deployment controller 会在 Deployment 的 status.conditions中增加一条DeploymentCondition，它包括如下属性：

- Type=Progressing
- Status=False
- Reason=ProgressDeadlineExceeded

浏览 [Kubernetes API conventions](https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md#typical-status-properties) 查看关于status conditions的更多信息。

注意： kubernetes除了报告Reason=ProgressDeadlineExceeded状态信息外不会对卡住的 Deployment 做任何操作。更高层次的协调器可以利用它并采取相应行动，例如，回滚 Deployment 到之前的版本。

注意： 如果您暂停了一个 Deployment，在暂停的这段时间内kubernetnes不会检查您指定的 deadline。您可以在 Deployment 的 rollout 途中安全的暂停它，然后再恢复它，这不会触发超过deadline的状态。

您可能在使用 Deployment 的时候遇到一些短暂的错误，这些可能是由于您设置了太短的 timeout，也有可能是因为各种其他错误导致的短暂错误。例如，假设您使用了无效的引用。当您 Describe Deployment 的时候可能会注意到如下信息：

```
$ kubectl describe deployment nginx-deployment
<...>
Conditions:
  Type            Status  Reason
  ----            ------  ------
  Available       True    MinimumReplicasAvailable
  Progressing     True    ReplicaSetUpdated
  ReplicaFailure  True    FailedCreate
<...>
```

执行 kubectl get deployment nginx-deployment -o yaml，Deployement 的状态可能看起来像这个样子：

```
status:
  availableReplicas: 2
  conditions:
  - lastTransitionTime: 2016-10-04T12:25:39Z
    lastUpdateTime: 2016-10-04T12:25:39Z
    message: Replica set "nginx-deployment-4262182780" is progressing.
    reason: ReplicaSetUpdated
    status: "True"
    type: Progressing
  - lastTransitionTime: 2016-10-04T12:25:42Z
    lastUpdateTime: 2016-10-04T12:25:42Z
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: 2016-10-04T12:25:39Z
    lastUpdateTime: 2016-10-04T12:25:39Z
    message: 'Error creating: pods "nginx-deployment-4262182780-" is forbidden: exceeded quota:
      object-counts, requested: pods=1, used: pods=3, limited: pods=2'
    reason: FailedCreate
    status: "True"
    type: ReplicaFailure
  observedGeneration: 3
  replicas: 2
  unavailableReplicas: 2
```

最终，一旦超过 Deployment 进程的 deadline，kuberentes 会更新状态和导致 Progressing 状态的原因：

```
Conditions:
  Type            Status  Reason
  ----            ------  ------
  Available       True    MinimumReplicasAvailable
  Progressing     False   ProgressDeadlineExceeded
  ReplicaFailure  True    FailedCreate
```

您可以通过缩容 Deployment的方式解决配额不足的问题，或者增加您的 namespace 的配额。如果您满足了配额条件后，Deployment controller 就会完成您的 Deployment rollout，您将看到 Deployment 的状态更新为成功状态（Status=True并且Reason=NewReplicaSetAvailable）。

```
Conditions:
  Type          Status  Reason
  ----          ------  ------
  Available     True    MinimumReplicasAvailable
  Progressing   True    NewReplicaSetAvailable
```

Type=Available、 Status=True 以为这您的Deployment有最小可用性。 最小可用性是在Deployment策略中指定的参数。Type=Progressing 、 Status=True意味着您的Deployment 或者在部署过程中，或者已经成功部署，达到了期望的最少的可用replica数量（查看特定状态的Reason——在我们的例子中Reason=NewReplicaSetAvailable 意味着Deployment已经完成）。

您可以使用kubectl rollout status命令查看Deployment进程是否失败。当Deployment过程超过了deadline，kubectl rollout status将返回非0的exit code。

```
$ kubectl rollout status deploy/nginx
Waiting for rollout to finish: 2 out of 3 new replicas have been updated...
error: deployment "nginx" exceeded its progress deadline
$ echo $?
1
```

### 操作失败的 Deployment

所有对完成的 Deployment 的操作都适用于失败的 Deployment。您可以对它扩/缩容，回退到历史版本，您甚至可以多次暂停它来应用 Deployment pod template。

## 清理Policy

您可以设置 Deployment 中的 .spec.revisionHistoryLimit 项来指定保留多少旧的 ReplicaSet。 余下的将在后台被当作垃圾收集。默认的，所有的 revision 历史就都会被保留。在未来的版本中，将会更改为2。

注意： 将该值设置为0，将导致所有的 Deployment 历史记录都会被清除，该 Deployment 就无法再回退了。

## 用例

### 金丝雀 Deployment

如果您想要使用 Deployment 对部分用户或服务器发布 release，您可以创建多个 Deployment，每个 Deployment 对应一个 release，参照 [managing resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/#canary-deployments) 中对金丝雀模式的描述。

## 编写 Deployment Spec

在所有的 Kubernetes 配置中，Deployment 也需要apiVersion，kind和metadata这些配置项。配置文件的通用使用说明查看 [部署应用](https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/)，配置容器，和 [使用 kubectl 管理资源 ](https://kubernetes.io/docs/tutorials/object-management-kubectl/object-management/)文档。

Deployment也需要 [.spec section](https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md#spec-and-status).

### Pod Template

.spec.template 是 .spec中唯一要求的字段。

.spec.template 是 [pod template](https://kubernetes.io/docs/user-guide/replication-controller/#pod-template). 它跟 [Pod](http://docs.kubernetes.org.cn/312.html)有一模一样的schema，除了它是嵌套的并且不需要apiVersion 和 kind字段。

另外为了划分Pod的范围，Deployment中的pod template必须指定适当的label（不要跟其他controller重复了，参考[selector](https://kubernetes.io/docs/concepts/workloads/controllers/deployment.md#selector)）和适当的重启策略。

[.spec.template.spec.restartPolicy](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle) 可以设置为 Always , 如果不指定的话这就是默认配置。

### Replicas

.spec.replicas 是可以选字段，指定期望的pod数量，默认是1。

### Selector

.spec.selector是可选字段，用来指定 [label selector](http://docs.kubernetes.org.cn/247.html) ，圈定Deployment管理的pod范围。

如果被指定， .spec.selector 必须匹配 .spec.template.metadata.labels，否则它将被API拒绝。如果 .spec.selector 没有被指定， .spec.selector.matchLabels 默认是 .spec.template.metadata.labels。

在Pod的template跟.spec.template不同或者数量超过了.spec.replicas规定的数量的情况下，Deployment会杀掉label跟selector不同的Pod。

注意： 您不应该再创建其他label跟这个selector匹配的pod，或者通过其他Deployment，或者通过其他Controller，例如ReplicaSet和ReplicationController。否则该Deployment会被把它们当成都是自己创建的。Kubernetes不会阻止您这么做。

如果您有多个controller使用了重复的selector，controller们就会互相打架并导致不正确的行为。

### 策略

.spec.strategy 指定新的Pod替换旧的Pod的策略。 .spec.strategy.type 可以是"Recreate"或者是 "RollingUpdate"。"RollingUpdate"是默认值。

#### Recreate Deployment

.spec.strategy.type==Recreate时，在创建出新的Pod之前会先杀掉所有已存在的Pod。

#### Rolling Update Deployment

.spec.strategy.type==RollingUpdate时，Deployment使用[rolling update](https://kubernetes.io/docs/tasks/run-application/rolling-update-replication-controller) 的方式更新Pod 。您可以指定maxUnavailable 和 maxSurge 来控制 rolling update 进程。

##### MAX UNAVAILABLE

.spec.strategy.rollingUpdate.maxUnavailable 是可选配置项，用来指定在升级过程中不可用Pod的最大数量。该值可以是一个绝对值（例如5），也可以是期望Pod数量的百分比（例如10%）。通过计算百分比的绝对值向下取整。如果.spec.strategy.rollingUpdate.maxSurge 为0时，这个值不可以为0。默认值是1。

例如，该值设置成30%，启动rolling update后旧的ReplicatSet将会立即缩容到期望的Pod数量的70%。新的Pod ready后，随着新的ReplicaSet的扩容，旧的ReplicaSet会进一步缩容，确保在升级的所有时刻可以用的Pod数量至少是期望Pod数量的70%。

##### MAX SURGE

.spec.strategy.rollingUpdate.maxSurge 是可选配置项，用来指定可以超过期望的Pod数量的最大个数。该值可以是一个绝对值（例如5）或者是期望的Pod数量的百分比（例如10%）。当MaxUnavailable为0时该值不可以为0。通过百分比计算的绝对值向上取整。默认值是1。

例如，该值设置成30%，启动rolling update后新的ReplicatSet将会立即扩容，新老Pod的总数不能超过期望的Pod数量的130%。旧的Pod被杀掉后，新的ReplicaSet将继续扩容，旧的ReplicaSet会进一步缩容，确保在升级的所有时刻所有的Pod数量和不会超过期望Pod数量的130%。

### Progress Deadline Seconds

.spec.progressDeadlineSeconds 是可选配置项，用来指定在系统报告Deployment的[failed progressing](https://kubernetes.io/docs/concepts/workloads/controllers/deployment.md#failed-deployment)——表现为resource的状态中type=Progressing、Status=False、 Reason=ProgressDeadlineExceeded前可以等待的Deployment进行的秒数。Deployment controller会继续重试该Deployment。未来，在实现了自动回滚后， deployment controller在观察到这种状态时就会自动回滚。

如果设置该参数，该值必须大于 .spec.minReadySeconds。

### Min Ready Seconds

.spec.minReadySeconds是一个可选配置项，用来指定没有任何容器crash的Pod并被认为是可用状态的最小秒数。默认是0（Pod在ready后就会被认为是可用状态）。进一步了解什么什么后Pod会被认为是ready状态，参阅 [Container Probes](https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#container-probes)。

### Rollback To

.spec.rollbackTo 是一个可以选配置项，用来配置Deployment回退的配置。设置该参数将触发回退操作，每次回退完成后，该值就会被清除。

#### Revision

.spec.rollbackTo.revision是一个可选配置项，用来指定回退到的revision。默认是0，意味着回退到历史中最老的revision。

### Revision History Limit

Deployment revision history存储在它控制的ReplicaSets中。

.spec.revisionHistoryLimit 是一个可选配置项，用来指定可以保留的旧的ReplicaSet数量。该理想值取决于心Deployment的频率和稳定性。如果该值没有设置的话，默认所有旧的Replicaset或会被保留，将资源存储在etcd中，是用kubectl get rs查看输出。每个Deployment的该配置都保存在ReplicaSet中，然而，一旦您删除的旧的RepelicaSet，您的Deployment就无法再回退到那个revison了。

如果您将该值设置为0，所有具有0个replica的ReplicaSet都会被删除。在这种情况下，新的Deployment rollout无法撤销，因为revision history都被清理掉了。

### Paused

.spec.paused是可以可选配置项，boolean值。用来指定暂停和恢复Deployment。Paused和没有paused的Deployment之间的唯一区别就是，所有对paused deployment中的PodTemplateSpec的修改都不会触发新的rollout。Deployment被创建之后默认是非paused。

## Deployment 的替代选择

### kubectl rolling update

[Kubectl rolling update](https://kubernetes.io/docs/user-guide/kubectl/v1.6/#rolling-update) 虽然使用类似的方式更新Pod和ReplicationController。但是我们推荐使用Deployment，因为它是声明式的，客户端侧，具有附加特性，例如即使滚动升级结束后也可以回滚到任何历史版本。

## 2.7  HPA(Horizontal Pod Autoscaling )

参考：<https://blog.csdn.net/qq_17016649/article/details/79297796>

云计算具有水平弹性的特性，这个是云计算区别于传统IT技术架构的主要特性。对于Kubernetes中的POD集群来说，HPA就是实现这种水平伸缩的控制器, 它能在当POD中业务负载上升的时候，创建新的POD来保证业务系统稳定运行，当POD中业务负载下降的时候，可以销毁POD来提高资源利用率。

HPA介绍
Horizontal Pod Autoscaling，简称HPA，是Kubernetes中实现POD水平自动伸缩的功能。为什么要水平而不叫垂直, 那是因为自动扩展主要分为两种:

水平扩展(scale out)，针对于实例数目的增减
垂直扩展(scal up)，即单个实例可以使用的资源的增减, 比如增加cpu和增大内存 
而HPA属于前者。它可以根据CPU使用率或应用自定义metrics自动扩展Pod数量(支持 replication controller、deployment 和 replica set)
架构介绍
--------------------- 
​	![hpa](images/hpa.png)





获取metrics的两种方式:

Heapster: heapster提供metrics服务, 但是在v1(autoscaling/v1)版本中仅支持以CPU作为扩展度量指标, 而其他比如:内存, 网络流量, qps等目前处于beta阶段(autoscaling/v2beta1)
Cousom: 同样处于beta阶段(autoscaling/v2beta1), 但是涉及到自定义的REST API的开发, 复杂度会大一些, 并且当需要从自定义的监控中获取数据时，只能设置绝对值，无法设置使用率
工作流程:

1.创建HPA资源，设定目标CPU使用率限额，以及最大、最小实例数, 一定要设置Pod的资源限制参数: request, 负责HPA不会工作。
2.控制管理器每隔30s(可以通过–horizontal-pod-autoscaler-sync-period修改)查询metrics的资源使用情况
3.然后与创建时设定的值和指标做对比(平均值之和/限额)，求出目标调整的实例个数
4.目标调整的实例数不能超过1中设定的最大、最小实例数，如果没有超过，则扩容；超过，则扩容至最大的实例个数
重复2-4步
自动伸缩算法: 
HPA Controller会通过调整副本数量使得CPU使用率尽量向期望值靠近，而且不是完全相等．另外，官方考虑到自动扩展的决策可能需要一段时间才会生效：例如当pod所需要的CPU负荷过大，从而在创建一个新pod的过程中，系统的CPU使用量可能会同样在有一个攀升的过程。所以，在每一次作出决策后的一段时间内，将不再进行扩展决策。对于扩容而言，这个时间段为3分钟，缩容为5分钟(可以通过--horizontal-pod-autoscaler-downscale-delay, --horizontal-pod-autoscaler-upscale-delay进行调整)。

HPA Controller中有一个tolerance（容忍力）的概念，它允许一定范围内的使用量的不稳定，现在默认为0.1，这也是出于维护系统稳定性的考虑。例如，设定HPA调度策略为cpu使用率高于50%触发扩容，那么只有当使用率大于55%或者小于45%才会触发伸缩活动，HPA会尽力把Pod的使用率控制在这个范围之间。
具体的每次扩容或者缩容的多少Pod的算法为: Ceil(前采集到的使用率 / 用户自定义的使用率) * Pod数量)

每次最大扩容pod数量不会超过当前副本数量的2倍



控制管理器每隔 30s（可以通过 --horizontal-pod-autoscaler-sync-period修改） 查询 metrics 的资源使用情况，支持三种 metrics 类型

1. 预定义 metrics（比如 Pod 的 CPU） 以利用率的方式计算
2. 自定义的 Pod metrics，以原始值（raw value） 的方式计算
3. 自定义的 object metrics

支持两种 metrics 查询方式：Heapster 和自定义的 REST API
支持多 metrics
注意：
本章是关于 Pod 的自动扩展，而 Node 的自动扩展请参考 Cluster AutoScaler。
在使用 HPA 之前需要 确保已部署好 metrics-server。 





HPA 最佳实践
为容器配置 CPU Requests
HPA 目标设置恰当，如设置 70% 给容器和应用预留 30% 的余量
保持 Pods 和 Nodes 健康（避免 Pod 频繁重建）
保证用户请求的负载均衡
使用 kubectl top node 和 kubectl top pod 查看资源使用情况 

## 2.8  服务(Service)

Kubernetes [Pod](http://docs.kubernetes.org.cn/312.html) 是有生命周期的，它们可以被创建，也可以被销毁，然而一旦被销毁生命就永远结束。 通过 [ReplicationController](http://docs.kubernetes.org.cn/437.html) 能够动态地创建和销毁 Pod（例如，需要进行扩缩容，或者执行 [滚动升级](https://k8smeetup.github.io/docs/user-guide/kubectl/v1.7/#rolling-update)）。 每个 Pod 都会获取它自己的 IP 地址，即使这些 IP 地址不总是稳定可依赖的。 这会导致一个问题：在 Kubernetes 集群中，如果一组 Pod（称为 backend）为其它 Pod （称为 frontend）提供服务，那么那些 frontend 该如何发现，并连接到这组 Pod 中的哪些 backend 呢？

关于 Service

Kubernetes Service 定义了这样一种抽象：一个 Pod 的逻辑分组，一种可以访问它们的策略 —— 通常称为微服务。 这一组 Pod 能够被 Service 访问到，通常是通过 [Label Selector](http://docs.kubernetes.org.cn/247.html)（查看下面了解，为什么可能需要没有 selector 的 Service）实现的。

举个例子，考虑一个图片处理 backend，它运行了3个副本。这些副本是可互换的 —— frontend 不需要关心它们调用了哪个 backend 副本。 然而组成这一组 backend 程序的 Pod 实际上可能会发生变化，frontend 客户端不应该也没必要知道，而且也不需要跟踪这一组 backend 的状态。 Service 定义的抽象能够解耦这种关联。

对 Kubernetes 集群中的应用，Kubernetes 提供了简单的 Endpoints API，只要 Service 中的一组 Pod 发生变更，应用程序就会被更新。 对非 Kubernetes 集群中的应用，Kubernetes 提供了基于 VIP 的网桥的方式访问 Service，再由 Service 重定向到 backend Pod。

## 定义 Service

一个 Service 在 Kubernetes 中是一个 REST 对象，和 Pod 类似。 像所有的 REST 对象一样， Service 定义可以基于 POST 方式，请求 apiserver 创建新的实例。 例如，假定有一组 Pod，它们对外暴露了 9376 端口，同时还被打上 "app=MyApp" 标签。

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```

上述配置将创建一个名称为 “my-service” 的 Service 对象，它会将请求代理到使用 TCP 端口 9376，并且具有标签 "app=MyApp" 的 Pod 上。 这个 Service 将被指派一个 IP 地址（通常称为 “Cluster IP”），它会被服务的代理使用（见下面）。 该 Service 的 selector 将会持续评估，处理结果将被 POST 到一个名称为 “my-service” 的 Endpoints 对象上。

需要注意的是， Service 能够将一个接收端口映射到任意的 targetPort。 默认情况下，targetPort 将被设置为与 port 字段相同的值。 可能更有趣的是，targetPort 可以是一个字符串，引用了 backend Pod 的一个端口的名称。 但是，实际指派给该端口名称的端口号，在每个 backend Pod 中可能并不相同。 对于部署和设计 Service ，这种方式会提供更大的灵活性。 例如，可以在 backend 软件下一个版本中，修改 Pod 暴露的端口，并不会中断客户端的调用。

Kubernetes Service 能够支持 TCP 和 UDP 协议，默认 TCP 协议。

### 没有 selector 的 Service

Servcie 抽象了该如何访问 Kubernetes Pod，但也能够抽象其它类型的 backend，例如：

- 希望在生产环境中使用外部的数据库集群，但测试环境使用自己的数据库。
- 希望服务指向另一个 [Namespace](http://docs.kubernetes.org.cn/242.html) 中或其它集群中的服务。
- 正在将工作负载转移到 Kubernetes 集群，和运行在 Kubernetes 集群之外的 backend。

在任何这些场景中，都能够定义没有 selector 的 Service ：

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
```

由于这个 Service 没有 selector，就不会创建相关的 Endpoints 对象。可以手动将 Service 映射到指定的 Endpoints：

```
kind: Endpoints
apiVersion: v1
metadata:
  name: my-service
subsets:
  - addresses:
      - ip: 1.2.3.4
    ports:
      - port: 9376
```

注意：Endpoint IP 地址不能是 loopback（127.0.0.0/8）、 link-local（169.254.0.0/16）、或者 link-local 多播（224.0.0.0/24）。

访问没有 selector 的 Service，与有 selector 的 Service 的原理相同。请求将被路由到用户定义的 Endpoint（该示例中为 1.2.3.4:9376）。

ExternalName Service 是 Service 的特例，它没有 selector，也没有定义任何的端口和 Endpoint。 相反地，对于运行在集群外部的服务，它通过返回该外部服务的别名这种方式来提供服务。

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
  namespace: prod
spec:
  type: ExternalName
  externalName: my.database.example.com
```

当查询主机 my-service.prod.svc.CLUSTER时，集群的 DNS 服务将返回一个值为 my.database.example.com 的 CNAME 记录。 访问这个服务的工作方式与其它的相同，唯一不同的是重定向发生在 DNS 层，而且不会进行代理或转发。 如果后续决定要将数据库迁移到 Kubernetes 集群中，可以启动对应的 Pod，增加合适的 Selector 或 Endpoint，修改 Service 的 type。

## VIP 和 Service 代理

在 Kubernetes 集群中，每个 Node 运行一个 kube-proxy 进程。kube-proxy 负责为 Service 实现了一种 VIP（虚拟 IP）的形式，而不是 ExternalName 的形式。 在 Kubernetes v1.0 版本，代理完全在 userspace。在 Kubernetes v1.1 版本，新增了 iptables 代理，但并不是默认的运行模式。 从 Kubernetes v1.2 起，默认就是 iptables 代理。

在 Kubernetes v1.0 版本，Service 是 “4层”（TCP/UDP over IP）概念。 在 Kubernetes v1.1 版本，新增了 Ingress API（beta 版），用来表示 “7层”（HTTP）服务。

### userspace 代理模式

这种模式，kube-proxy 会监视 Kubernetes master 对 Service 对象和 Endpoints 对象的添加和移除。 对每个 Service，它会在本地 Node 上打开一个端口（随机选择）。 任何连接到“代理端口”的请求，都会被代理到 Service 的backend Pods 中的某个上面（如 Endpoints 所报告的一样）。 使用哪个 backend Pod，是基于 Service 的 SessionAffinity 来确定的。 最后，它安装 iptables 规则，捕获到达该 Service 的 clusterIP（是虚拟 IP）和 Port 的请求，并重定向到代理端口，代理端口再代理请求到 backend Pod。

网络返回的结果是，任何到达 Service 的 IP:Port 的请求，都会被代理到一个合适的 backend，不需要客户端知道关于 Kubernetes、Service、或 Pod 的任何信息。

默认的策略是，通过 round-robin 算法来选择 backend Pod。 实现基于客户端 IP 的会话亲和性，可以通过设置 service.spec.sessionAffinity 的值为 "ClientIP" （默认值为 "None"）。

![service-1](/images/service_userspace.png)

### iptables 代理模式

这种模式，kube-proxy 会监视 Kubernetes master 对 Service 对象和 Endpoints 对象的添加和移除。 对每个 Service，它会安装 iptables 规则，从而捕获到达该 Service 的 clusterIP（虚拟 IP）和端口的请求，进而将请求重定向到 Service 的一组 backend 中的某个上面。 对于每个 Endpoints 对象，它也会安装 iptables 规则，这个规则会选择一个 backend Pod。

默认的策略是，随机选择一个 backend。 实现基于客户端 IP 的会话亲和性，可以将 service.spec.sessionAffinity 的值设置为 "ClientIP" （默认值为 "None"）。

和 userspace 代理类似，网络返回的结果是，任何到达 Service 的 IP:Port 的请求，都会被代理到一个合适的 backend，不需要客户端知道关于 Kubernetes、Service、或 Pod 的任何信息。 这应该比 userspace 代理更快、更可靠。然而，不像 userspace 代理，如果初始选择的 Pod 没有响应，iptables 代理能够自动地重试另一个 Pod，所以它需要依赖 [readiness probes](https://k8smeetup.github.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/#defining-readiness-probes)。

![service_iptables](images/service_iptables.png)

**IPVS 模式**

这种模式，kube-proxy会监视Kubernetes service对象和Endpoints，调用netlink接口以相应地创建ipvs规则并定期与Kubernetes service对象和Endpoints对象同步ipvs规则，以确保ipvs状态与期望一致。访问服务时，流量将被重定向到其中一个后端Pod。

与iptables类似，ipvs基于netfilter的hook功能，但使用哈希表作为底层数据结构并在内核空间中工作。这意味着ipvs可以更快地重定向流量，并且在同步代理规则时具有更好的性能。此外，ipvs为负载均衡算法提供了更多的选项，例如：

- rr：轮询调度
- lc：最小连接数
- dh：目标哈希
- sh：源哈希
- sed：最短期望延迟
- nq： 不排队调度

**注意：** ipvs模式假定在运行kube-proxy之前在节点上都已经安装了IPVS内核模块。当kube-proxy以ipvs代理模式启动时，kube-proxy将验证节点上是否安装了IPVS模块，如果未安装，则kube-proxy将回退到iptables代理模式。

![service_ipvs](images/service_ipvs.png)

参考：<https://www.cnblogs.com/baishuchao/p/9429757.html>

## 多端口 Service

很多 Service 需要暴露多个端口。对于这种情况，Kubernetes 支持在 Service 对象中定义多个端口。 当使用多个端口时，必须给出所有的端口的名称，这样 Endpoint 就不会产生歧义，例如：

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
    selector:
      app: MyApp
    ports:
      - name: http
        protocol: TCP
        port: 80
        targetPort: 9376
      - name: https
        protocol: TCP
        port: 443
        targetPort: 9377
```

## 选择自己的 IP 地址

在 Service 创建的请求中，可以通过设置 spec.clusterIP 字段来指定自己的集群 IP 地址。 比如，希望替换一个已经已存在的 DNS 条目，或者遗留系统已经配置了一个固定的 IP 且很难重新配置。 用户选择的 IP 地址必须合法，并且这个 IP 地址在 service-cluster-ip-range CIDR 范围内，这对 API Server 来说是通过一个标识来指定的。 如果 IP 地址不合法，API Server 会返回 HTTP 状态码 422，表示值不合法。

### 为何不使用 round-robin DNS？

一个不时出现的问题是，为什么我们都使用 VIP 的方式，而不使用标准的 round-robin DNS，有如下几个原因：

- 长久以来，DNS 库都没能认真对待 DNS TTL、缓存域名查询结果
- 很多应用只查询一次 DNS 并缓存了结果
  - 就算应用和库能够正确查询解析，每个客户端反复重解析造成的负载也是非常难以管理的

我们尽力阻止用户做那些对他们没有好处的事情，如果很多人都来问这个问题，我们可能会选择实现它。

## 服务发现

<https://www.jianshu.com/p/3749bf6aaabb>

Kubernetes 支持2种基本的服务发现模式 —— 环境变量和 DNS。

### 环境变量

当 Pod 运行在 Node 上，kubelet 会为每个活跃的 Service 添加一组环境变量。 它同时支持 [Docker links兼容](https://docs.docker.com/userguide/dockerlinks/) 变量（查看 [makeLinkVariables](http://releases.k8s.io/master/pkg/kubelet/envvars/envvars.go#L49)）、简单的 {SVCNAME}_SERVICE_HOST 和 {SVCNAME}_SERVICE_PORT 变量，这里 Service 的名称需大写，横线被转换成下划线。

举个例子，一个名称为 "redis-master" 的 Service 暴露了 TCP 端口 6379，同时给它分配了 Cluster IP 地址 10.0.0.11，这个 Service 生成了如下环境变量：

```
REDIS_MASTER_SERVICE_HOST=10.0.0.11
REDIS_MASTER_SERVICE_PORT=6379
REDIS_MASTER_PORT=tcp://10.0.0.11:6379
REDIS_MASTER_PORT_6379_TCP=tcp://10.0.0.11:6379
REDIS_MASTER_PORT_6379_TCP_PROTO=tcp
REDIS_MASTER_PORT_6379_TCP_PORT=6379
REDIS_MASTER_PORT_6379_TCP_ADDR=10.0.0.11
```

这意味着需要有顺序的要求 —— Pod 想要访问的任何 Service 必须在 Pod 自己之前被创建，否则这些环境变量就不会被赋值。DNS 并没有这个限制。

### DNS

一个可选（尽管强烈推荐）[集群插件](http://releases.k8s.io/master/cluster/addons/README.md) 是 DNS 服务器。 DNS 服务器监视着创建新 Service 的 Kubernetes API，从而为每一个 Service 创建一组 DNS 记录。 如果整个集群的 DNS 一直被启用，那么所有的 Pod 应该能够自动对 Service 进行名称解析。

例如，有一个名称为 "my-service" 的 Service，它在 Kubernetes 集群中名为 "my-ns" 的 Namespace 中，为 "my-service.my-ns" 创建了一条 DNS 记录。 在名称为 "my-ns" 的 Namespace 中的 Pod 应该能够简单地通过名称查询找到 "my-service"。 在另一个 Namespace 中的 Pod 必须限定名称为 "my-service.my-ns"。 这些名称查询的结果是 Cluster IP。

Kubernetes 也支持对端口名称的 DNS SRV（Service）记录。 如果名称为 "my-service.my-ns" 的 Service 有一个名为 "http" 的 TCP 端口，可以对 "_http._tcp.my-service.my-ns" 执行 DNS SRV 查询，得到 "http" 的端口号。

Kubernetes DNS 服务器是唯一的一种能够访问 ExternalName 类型的 Service 的方式。 更多信息可以查看[DNS Pod 和 Service](https://k8smeetup.github.io/docs/concepts/services-networking/dns-pod-service/)。

## Headless Service

有时不需要或不想要负载均衡，以及单独的 Service IP。 遇到这种情况，可以通过指定 Cluster IP（spec.clusterIP）的值为 "None" 来创建 Headless Service。

这个选项允许开发人员自由寻找他们自己的方式，从而降低与 Kubernetes 系统的耦合性。 应用仍然可以使用一种自注册的模式和适配器，对其它需要发现机制的系统能够很容易地基于这个 API 来构建。

对这类 Service 并不会分配 Cluster IP，kube-proxy 不会处理它们，而且平台也不会为它们进行负载均衡和路由。 DNS 如何实现自动配置，依赖于 Service 是否定义了 selector。

### 配置 Selector

对定义了 selector 的 Headless Service，Endpoint 控制器在 API 中创建了 Endpoints 记录，并且修改 DNS 配置返回 A 记录（地址），通过这个地址直接到达 Service 的后端 Pod上。

### 不配置 Selector

对没有定义 selector 的 Headless Service，Endpoint 控制器不会创建 Endpoints 记录。 然而 DNS 系统会查找和配置，无论是：

- ExternalName 类型 Service 的 CNAME 记录
  - 记录：与 Service 共享一个名称的任何 Endpoints，以及所有其它类型

## 发布服务 —— 服务类型

对一些应用（如 Frontend）的某些部分，可能希望通过外部（Kubernetes 集群外部）IP 地址暴露 Service。

Kubernetes ServiceTypes 允许指定一个需要的类型的 Service，默认是 ClusterIP 类型。

Type 的取值以及行为如下：

- ClusterIP：通过集群的内部 IP 暴露服务，选择该值，服务只能够在集群内部可以访问，这也是默认的 ServiceType。
- NodePort：通过每个 Node 上的 IP 和静态端口（NodePort）暴露服务。NodePort 服务会路由到 ClusterIP 服务，这个 ClusterIP 服务会自动创建。通过请求 <NodeIP>:<NodePort>，可以从集群的外部访问一个 NodePort 服务。
- LoadBalancer：使用云提供商的负载局衡器，可以向外部暴露服务。外部的负载均衡器可以路由到 NodePort 服务和 ClusterIP 服务。
- ExternalName：通过返回 CNAME 和它的值，可以将服务映射到 externalName 字段的内容（例如， foo.bar.example.com）。 没有任何类型代理被创建，这只有 Kubernetes 1.7 或更高版本的 kube-dns 才支持。

### NodePort 类型

如果设置 type 的值为 "NodePort"，Kubernetes master 将从给定的配置范围内（默认：30000-32767）分配端口，每个 Node 将从该端口（每个 Node 上的同一端口）代理到 Service。该端口将通过 Service 的 spec.ports[*].nodePort 字段被指定。

如果需要指定的端口号，可以配置 nodePort 的值，系统将分配这个端口，否则调用 API 将会失败（比如，需要关心端口冲突的可能性）。

这可以让开发人员自由地安装他们自己的负载均衡器，并配置 Kubernetes 不能完全支持的环境参数，或者直接暴露一个或多个 Node 的 IP 地址。

需要注意的是，Service 将能够通过 <NodeIP>:spec.ports[*].nodePort 和 spec.clusterIp:spec.ports[*].port 而对外可见。

### LoadBalancer 类型

使用支持外部负载均衡器的云提供商的服务，设置 type 的值为 "LoadBalancer"，将为 Service 提供负载均衡器。 负载均衡器是异步创建的，关于被提供的负载均衡器的信息将会通过 Service 的 status.loadBalancer 字段被发布出去。

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
    - protocol: TCP
      port: 80
      targetPort: 9376
      nodePort: 30061
  clusterIP: 10.0.171.239
  loadBalancerIP: 78.11.24.19
  type: LoadBalancer
status:
  loadBalancer:
    ingress:
      - ip: 146.148.47.155
```

来自外部负载均衡器的流量将直接打到 backend Pod 上，不过实际它们是如何工作的，这要依赖于云提供商。 在这些情况下，将根据用户设置的 loadBalancerIP 来创建负载均衡器。 某些云提供商允许设置 loadBalancerIP。如果没有设置 loadBalancerIP，将会给负载均衡器指派一个临时 IP。 如果设置了 loadBalancerIP，但云提供商并不支持这种特性，那么设置的 loadBalancerIP 值将会被忽略掉。

### AWS 内部负载均衡器

在混合云环境中，有时从虚拟私有云（VPC）环境中的服务路由流量是非常有必要的。 可以通过在 Service 中增加 annotation 来实现，如下所示：

```
[...]
metadata: 
    name: my-service
    annotations: 
        service.beta.kubernetes.io/aws-load-balancer-internal: 0.0.0.0/0
[...]
```

在水平分割的 DNS 环境中，需要两个 Service 来将外部和内部的流量路由到 Endpoint 上。

### AWS SSL 支持

对运行在 AWS 上部分支持 SSL 的集群，从 1.3 版本开始，可以为 LoadBalancer 类型的 Service 增加两个 annotation：

```
    metadata:
      name: my-service
      annotations:
        service.beta.kubernetes.io/aws-load-balancer-ssl-cert: arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012
```

第一个 annotation 指定了使用的证书。它可以是第三方发行商发行的证书，这个证书或者被上传到 IAM，或者由 AWS 的证书管理器创建。

```
    metadata:
      name: my-service
      annotations:
         service.beta.kubernetes.io/aws-load-balancer-backend-protocol: (https|http|ssl|tcp)
```

第二个 annotation 指定了 Pod 使用的协议。 对于 HTTPS 和 SSL，ELB 将期望该 Pod 基于加密的连接来认证自身。

HTTP 和 HTTPS 将选择7层代理：ELB 将中断与用户的连接，当转发请求时，会解析 Header 信息并添加上用户的 IP 地址（Pod 将只能在连接的另一端看到该 IP 地址）。

TCP 和 SSL 将选择4层代理：ELB 将转发流量，并不修改 Header 信息。

### 外部 IP

如果外部的 IP 路由到集群中一个或多个 Node 上，Kubernetes Service 会被暴露给这些 externalIPs。 通过外部 IP（作为目的 IP 地址）进入到集群，打到 Service 的端口上的流量，将会被路由到 Service 的 Endpoint 上。 externalIPs 不会被 Kubernetes 管理，它属于集群管理员的职责范畴。

根据 Service 的规定，externalIPs 可以同任意的 ServiceType 来一起指定。 在上面的例子中，my-service 可以在 80.11.12.10:80（外部 IP:端口）上被客户端访问。

```
kind: Service
apiVersion: v1
metadata:
  name: my-service
spec:
  selector:
    app: MyApp
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 9376
  externalIPs: 
    - 80.11.12.10
```

## 不足之处

为 VIP 使用 userspace 代理，将只适合小型到中型规模的集群，不能够扩展到上千 Service 的大型集群。 查看 [最初设计方案](http://issue.k8s.io/1107) 获取更多细节。

使用 userspace 代理，隐藏了访问 Service 的数据包的源 IP 地址。 这使得一些类型的防火墙无法起作用。 iptables 代理不会隐藏 Kubernetes 集群内部的 IP 地址，但却要求客户端请求必须通过一个负载均衡器或 Node 端口。

Type 字段支持嵌套功能 —— 每一层需要添加到上一层里面。 不会严格要求所有云提供商（例如，GCE 就没必要为了使一个 LoadBalancer 能工作而分配一个 NodePort，但是 AWS 需要 ），但当前 API 是强制要求的。

## 未来工作

未来我们能预见到，代理策略可能会变得比简单的 round-robin 均衡策略有更多细微的差别，比如 master 选举或分片。 我们也能想到，某些 Service 将具有 “真正” 的负载均衡器，这种情况下 VIP 将简化数据包的传输。

我们打算为 L7（HTTP）Service 改进我们对它的支持。

我们打算为 Service 实现更加灵活的请求进入模式，这些 Service 包含当前 ClusterIP、NodePort 和 LoadBalancer 模式，或者更多。

## VIP 的那些骇人听闻的细节

对很多想使用 Service 的人来说，前面的信息应该足够了。 然而，有很多内部原理性的内容，还是值去理解的。

### 避免冲突

Kubernetes 最主要的哲学之一，是用户不应该暴露那些能够导致他们操作失败、但又不是他们的过错的场景。 这种场景下，让我们来看一下网络端口 —— 用户不应该必须选择一个端口号，而且该端口还有可能与其他用户的冲突。 这就是说，在彼此隔离状态下仍然会出现失败。

为了使用户能够为他们的 Service 选择一个端口号，我们必须确保不能有2个 Service 发生冲突。 我们可以通过为每个 Service 分配它们自己的 IP 地址来实现。

为了保证每个 Service 被分配到一个唯一的 IP，需要一个内部的分配器能够原子地更新 etcd 中的一个全局分配映射表，这个更新操作要先于创建每一个 Service。 为了使 Service能够获取到 IP，这个映射表对象必须在注册中心存在，否则创建 Service 将会失败，指示一个 IP 不能被分配。 一个后台 Controller 的职责是创建映射表（从 Kubernetes 的旧版本迁移过来，旧版本中是通过在内存中加锁的方式实现），并检查由于管理员干预和清除任意 IP 造成的不合理分配，这些 IP 被分配了但当前没有 Service 使用它们。

### IP 和 VIP

不像 Pod 的 IP 地址，它实际路由到一个固定的目的地，Service 的 IP 实际上不能通过单个主机来进行应答。 相反，我们使用 iptables（Linux 中的数据包处理逻辑）来定义一个虚拟IP地址（VIP），它可以根据需要透明地进行重定向。 当客户端连接到 VIP 时，它们的流量会自动地传输到一个合适的 Endpoint。 环境变量和 DNS，实际上会根据 Service 的 VIP 和端口来进行填充。

#### Userspace

作为一个例子，考虑前面提到的图片处理应用程序。 当创建 backend Service 时，Kubernetes master 会给它指派一个虚拟 IP 地址，比如 10.0.0.1。 假设 Service 的端口是 1234，该 Service 会被集群中所有的 kube-proxy 实例观察到。 当代理看到一个新的 Service， 它会打开一个新的端口，建立一个从该 VIP 重定向到新端口的 iptables，并开始接收请求连接。

当一个客户端连接到一个 VIP，iptables 规则开始起作用，它会重定向该数据包到 Service代理 的端口。 Service代理 选择一个 backend，并将客户端的流量代理到 backend 上。

这意味着 Service 的所有者能够选择任何他们想使用的端口，而不存在冲突的风险。 客户端可以简单地连接到一个 IP 和端口，而不需要知道实际访问了哪些 Pod。

#### Iptables

再次考虑前面提到的图片处理应用程序。 当创建 backend Service 时，Kubernetes master 会给它指派一个虚拟 IP 地址，比如 10.0.0.1。 假设 Service 的端口是 1234，该 Service会被集群中所有的 kube-proxy 实例观察到。 当代理看到一个新的 Service， 它会安装一系列的 iptables 规则，从 VIP 重定向到 per-Service 规则。 该 per-Service 规则连接到 per-Endpoint 规则，该 per-Endpoint 规则会重定向（目标 NAT）到 backend。

当一个客户端连接到一个 VIP，iptables 规则开始起作用。一个 backend 会被选择（或者根据会话亲和性，或者随机），数据包被重定向到这个 backend。 不像 userspace 代理，数据包从来不拷贝到用户空间，kube-proxy 不是必须为该 VIP 工作而运行，并且客户端 IP 是不可更改的。 当流量打到 Node 的端口上，或通过负载均衡器，会执行相同的基本流程，但是在那些案例中客户端 IP 是可以更改的。



## 2.9  存储卷(Volume)

参考：<https://www.cnblogs.com/linuxk/p/9760363.html>

​	默认情况下容器中的磁盘文件是非持久化的，对于运行在容器中的应用来说面临两个问题，第一：当容器挂掉kubelet将重启启动它时，文件将会丢失；第二：当[Pod](http://docs.kubernetes.org.cn/312.html)中同时运行多个容器，容器之间需要共享文件时。Kubernetes的Volume解决了这两个问题。

## 背景

在Docker中也有一个[docker Volume](https://docs.docker.com/userguide/dockervolumes/)的概念 ，Docker的Volume只是磁盘中的一个目录，生命周期不受管理。当然Docker现在也提供Volume将数据持久化存储，但支持功能比较少（例如，对于Docker 1.7，每个容器只允许挂载一个Volume，并且不能将参数传递给Volume）。

另一方面，Kubernetes Volume具有明确的生命周期 - 与pod相同。因此，Volume的生命周期比Pod中运行的任何容器要持久，在容器重新启动时能可以保留数据，当然，当Pod被删除不存在时，Volume也将消失。注意，Kubernetes支持许多类型的Volume，Pod可以同时使用任意类型/数量的Volume。

内部实现中，一个Volume只是一个目录，目录中可能有一些数据，pod的容器可以访问这些数据。至于这个目录是如何产生的、支持它的介质、其中的数据内容是什么，这些都由使用的特定Volume类型来决定。

要使用Volume，pod需要指定Volume的类型和内容（`spec.volumes`字段），和映射到容器的位置（`spec.containers.volumeMounts`字段）。

## Volume 类型

Kubernetes支持Volume类型有：

- emptyDir
- hostPath
- gcePersistentDisk
- awsElasticBlockStore
- nfs
- iscsi
- fc (fibre channel)
- flocker
- glusterfs
- rbd
- cephfs
- gitRepo
- secret
- persistentVolumeClaim
- downwardAPI
- projected
- azureFileVolume
- azureDisk
- vsphereVolume
- Quobyte
- PortworxVolume
- ScaleIO
- StorageOS
- local

### emptyDir

使用emptyDir，当Pod分配到[Node](http://docs.kubernetes.org.cn/304.html)上时，将会创建emptyDir，并且只要Node上的Pod一直运行，Volume就会一直存。当Pod（不管任何原因）从Node上被删除时，emptyDir也同时会删除，存储的数据也将永久删除。注：删除容器不影响emptyDir。

示例：

```
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
  - name: cache-volume
    emptyDir: {}
```

### hostPath

hostPath允许挂载Node上的文件系统到Pod里面去。如果Pod需要使用Node上的文件，可以使用hostPath。

示例

```
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
  volumes:
  - name: test-volume
    hostPath:
      # directory location on host
      path: /data
```

### gcePersistentDisk

gcePersistentDisk可以挂载GCE上的永久磁盘到容器，需要Kubernetes运行在GCE的VM中。与emptyDir不同，Pod删除时，gcePersistentDisk被删除，但[Persistent Disk](http://cloud.google.com/compute/docs/disks) 的内容任然存在。这就意味着gcePersistentDisk能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间“切换”。

**提示：使用gcePersistentDisk，必须用gcloud或使用GCE API或UI 创建PD**

创建PD

使用GCE PD与pod之前，需要创建它

```
gcloud compute disks create --size=500GB --zone=us-central1-a my-data-disk
```

示例

```
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
  volumes:
  - name: test-volume
    # This GCE PD must already exist.
    gcePersistentDisk:
      pdName: my-data-disk
      fsType: ext4
```

### awsElasticBlockStore

awsElasticBlockStore可以挂载AWS上的EBS盘到容器，需要Kubernetes运行在AWS的EC2上。与emptyDir Pod被删除情况不同，Volume仅被卸载，内容将被保留。这就意味着awsElasticBlockStore能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间“切换”。

提示：必须使用aws ec2 create-volumeAWS API 创建EBS Volume，然后才能使用。

**创建EBS Volume**

在使用EBS Volume与pod之前，需要创建它。

```
aws ec2 create-volume --availability-zone eu-west-1a --size 10 --volume-type gp2
```

AWS EBS配置示例

```
apiVersion: v1
kind: Pod
metadata:
  name: test-ebs
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-ebs
      name: test-volume
  volumes:
  - name: test-volume
    # This AWS EBS volume must already exist.
    awsElasticBlockStore:
      volumeID: <volume-id>
      fsType: ext4
```

### NFS

NFS 是Network File System的缩写，即网络文件系统。Kubernetes中通过简单地配置就可以挂载NFS到Pod中，而NFS中的数据是可以永久保存的，同时NFS支持同时写操作。Pod被删除时，Volume被卸载，内容被保留。这就意味着NFS能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间相互传递。

详细信息，请参阅[NFS示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/nfs)。

### iSCSI

iscsi允许将现有的iscsi磁盘挂载到我们的pod中，和emptyDir不同的是，删除Pod时会被删除，但Volume只是被卸载，内容被保留，这就意味着iscsi能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间“切换”。

详细信息，请参阅[iSCSI示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/iscsi)。

### 

### flocker

[Flocker](https://clusterhq.com/flocker)是一个开源的容器集群数据卷管理器。它提供各种存储后端支持的数据卷的管理和编排。

详细信息，请参阅[Flocker示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/flocker)。

### glusterfs

glusterfs，允许将[Glusterfs](http://www.gluster.org/)（一个开源网络文件系统）Volume安装到pod中。不同于emptyDir，Pod被删除时，Volume只是被卸载，内容被保留。味着glusterfs能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间“切换”。

详细信息，请参阅[GlusterFS示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/glusterfs)。

### RBD

RBD允许Rados Block Device格式的磁盘挂载到Pod中，同样的，当pod被删除的时候，rbd也仅仅是被卸载，内容保留，rbd能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间“切换”。

详细信息，请参阅[RBD示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/rbd)。

### cephfs

cephfs Volume可以将已经存在的CephFS Volume挂载到pod中，与emptyDir特点不同，pod被删除的时，cephfs仅被被卸载，内容保留。cephfs能够允许我们提前对数据进行处理，而且这些数据可以在Pod之间“切换”。

提示：可以使用自己的Ceph服务器运行导出，然后在使用cephfs。

详细信息，请参阅[CephFS示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/cephfs/)。

### gitRepo

gitRepo volume将git代码下拉到指定的容器路径中。

示例：

```
apiVersion: v1
kind: Pod
metadata:
  name: server
spec:
  containers:
  - image: nginx
    name: nginx
    volumeMounts:
    - mountPath: /mypath
      name: git-volume
  volumes:
  - name: git-volume
    gitRepo:
      repository: "git@somewhere:me/my-git-repository.git"
      revision: "22f1d8406d464b0c0874075539c1f2e96c253775"
```

### secret

secret volume用于将敏感信息（如密码）传递给pod。可以将secrets存储在Kubernetes API中，使用的时候以文件的形式挂载到pod中，而不用连接api。 secret volume由tmpfs（RAM支持的文件系统）支持。

详细了解[secret](https://kubernetes.io/docs/user-guide/secrets)

### persistentVolumeClaim

persistentVolumeClaim用来挂载持久化磁盘的。PersistentVolumes是用户在不知道特定云环境的细节的情况下，实现持久化存储（如GCE PersistentDisk或iSCSI卷）的一种方式。

更多详细信息，请参阅[PersistentVolumes示例](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)。

### downwardAPI

通过环境变量的方式告诉容器Pod的信息

更多详细信息，请参见[downwardAPI卷示例](https://kubernetes.io/docs/tasks/configure-pod-container/downward-api-volume-expose-pod-information/)。

### projected

Projected volume将多个Volume源映射到同一个目录

目前，可以支持以下类型的卷源：

- secret
- downwardAPI
- configMap

所有卷源都要求与pod在同一命名空间中。更详细信息，请参阅[all-in-one volume design document](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/all-in-one-volume.md)。

示例

```
apiVersion: v1
kind: Pod
metadata:
  name: volume-test
spec:
  containers:
  - name: container-test
    image: busybox
    volumeMounts:
    - name: all-in-one
      mountPath: "/projected-volume"
      readOnly: true
  volumes:
  - name: all-in-one
    projected:
      sources:
      - secret:
          name: mysecret
          items:
            - key: username
              path: my-group/my-username
      - downwardAPI:
          items:
            - path: "labels"
              fieldRef:
                fieldPath: metadata.labels
            - path: "cpu_limit"
              resourceFieldRef:
                containerName: container-test
                resource: limits.cpu
      - configMap:
          name: myconfigmap
          items:
            - key: config
              path: my-group/my-config
apiVersion: v1
kind: Pod
metadata:
  name: volume-test
spec:
  containers:
  - name: container-test
    image: busybox
    volumeMounts:
    - name: all-in-one
      mountPath: "/projected-volume"
      readOnly: true
  volumes:
  - name: all-in-one
    projected:
      sources:
      - secret:
          name: mysecret
          items:
            - key: username
              path: my-group/my-username
      - secret:
          name: mysecret2
          items:
            - key: password
              path: my-group/my-password
              mode: 511
```

### FlexVolume

alpha功能

更多细节在[这里](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/flexvolume/README.md)

### AzureFileVolume

AzureFileVolume用于将Microsoft Azure文件卷（SMB 2.1和3.0）挂载到Pod中。

更多细节在[这里](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/azure_file/README.md)

### AzureDiskVolume

Azure是微软提供的公有云服务，如果使用Azure上面的虚拟机来作为Kubernetes集群使用时，那么可以通过AzureDisk这种类型的卷插件来挂载Azure提供的数据磁盘。

更多细节在[这里](https://www.kubernetes.org.cn/198.html)

### vsphereVolume

需要条件：配置了vSphere Cloud Provider的Kubernetes。有关cloudprovider配置，请参阅[vSphere入门指南](https://kubernetes.io/docs/getting-started-guides/vsphere/)。

vsphereVolume用于将vSphere VMDK Volume挂载到Pod中。卸载卷后，内容将被保留。它同时支持VMFS和VSAN数据存储。

重要提示：使用POD之前，必须使用以下方法创建VMDK。

#### 创建一个VMDK卷

- 使用vmkfstools创建。先将ssh接入ESX，然后使用以下命令创建vmdk

```
vmkfstools -c 2G /vmfs/volumes/DatastoreName/volumes/myDisk.vmdk
```

- 使用vmware-vdiskmanager创建

```
shell vmware-vdiskmanager -c -t 0 -s 40GB -a lsilogic myDisk.vmdk
```

示例

```
apiVersion: v1
kind: Pod
metadata:
  name: test-vmdk
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-vmdk
      name: test-volume
  volumes:
  - name: test-volume
    # This VMDK volume must already exist.
    vsphereVolume:
      volumePath: "[DatastoreName] volumes/myDisk"
      fsType: ext4
```

更多例子在[这里](https://git.k8s.io/kubernetes/examples/volumes/vsphere)。

### Quobyte

在kubernetes中使用Quobyte存储，需要提前部署Quobyte软件，要求必须是1.3以及更高版本，并且在kubernetes管理的节点上面部署Quobyte客户端。

详细信息，请参阅[这里](https://www.kubernetes.org.cn/198.html)。

### PortworxVolume

Portworx能把你的服务器容量进行蓄积（pool），将你的服务器或者云实例变成一个聚合的高可用的计算和存储节点。

PortworxVolume可以通过Kubernetes动态创建，也可以在Kubernetes pod中预先配置和引用。示例：

```
apiVersion: v1
kind: Pod
metadata:
  name: test-portworx-volume-pod
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /mnt
      name: pxvol
  volumes:
  - name: pxvol
    # This Portworx volume must already exist.
    portworxVolume:
      volumeID: "pxvol"
      fsType: "<fs-type>"
```

更多细节和例子可以在[这里](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/portworx/README.md)找到

### ScaleIO

ScaleIO是一种基于软件的存储平台（虚拟SAN），可以使用现有硬件来创建可扩展共享块网络存储的集群。ScaleIO卷插件允许部署的pod访问现有的ScaleIO卷（或者可以为持久卷声明动态配置新卷，请参阅 [Scaleio Persistent Volumes](https://kubernetes.io/docs/user-guide/persistent-volumes/#scaleio)）。

示例：

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-0
spec:
  containers:
  - image: gcr.io/google_containers/test-webserver
    name: pod-0
    volumeMounts:
    - mountPath: /test-pd
      name: vol-0
  volumes:
  - name: vol-0
    scaleIO:
      gateway: https://localhost:443/api
      system: scaleio
      volumeName: vol-0
      secretRef:
        name: sio-secret
      fsType: xfs
```

详细信息，请参阅[ScaleIO示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/scaleio)。

### StorageOS

StorageOS是一家英国的初创公司，给无状态容器提供简单的自动块存储、状态来运行数据库和其他需要企业级存储功能，但避免随之而来的复杂性、刚性以及成本。

核心：是StorageOS向容器提供块存储，可通过文件系统访问。

StorageOS容器需要64位Linux，没有额外的依赖关系，提供免费开发许可证。

安装说明，请参阅[StorageOS文档](https://docs.storageos.com/)

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    name: redis
    role: master
  name: test-storageos-redis
spec:
  containers:
    - name: master
      image: kubernetes/redis:v1
      env:
        - name: MASTER
          value: "true"
      ports:
        - containerPort: 6379
      volumeMounts:
        - mountPath: /redis-master-data
          name: redis-data
  volumes:
    - name: redis-data
      storageos:
        # The `redis-vol01` volume must already exist within StorageOS in the `default` namespace.
        volumeName: redis-vol01
        fsType: ext4
```

有关动态配置和持久卷声明的更多信息，请参阅[StorageOS示例](https://github.com/kubernetes/kubernetes/tree/master/examples/volumes/storageos)。

### Local

目前处于 Kubernetes 1.7中的 alpha 级别。

Local 是Kubernetes集群中每个节点的本地存储（如磁盘，分区或目录），在Kubernetes1.7中kubelet可以支持对kube-reserved和system-reserved指定本地存储资源。

通过上面的这个新特性可以看出来，Local Storage同HostPath的区别在于对Pod的调度上，使用Local Storage可以由Kubernetes自动的对Pod进行调度，而是用HostPath只能人工手动调度Pod，因为Kubernetes已经知道了每个节点上kube-reserved和system-reserved设置的本地存储限制。

示例：

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: example-pv
  annotations:
        "volume.alpha.kubernetes.io/node-affinity": '{
            "requiredDuringSchedulingIgnoredDuringExecution": {
                "nodeSelectorTerms": [
                    { "matchExpressions": [
                        { "key": "kubernetes.io/hostname",
                          "operator": "In",
                          "values": ["example-node"]
                        }
                    ]}
                 ]}
              }'
spec:
    capacity:
      storage: 100Gi
    accessModes:
    - ReadWriteOnce
    persistentVolumeReclaimPolicy: Delete
    storageClassName: local-storage
    local:
      path: /mnt/disks/ssd1
```

请注意，本地PersistentVolume需要手动清理和删除。

有关local卷类型的详细信息，请参阅 [Local Persistent Storage user guide](https://github.com/kubernetes-incubator/external-storage/tree/master/local-volume)

## Using subPath

有时，可以在一个pod中，将同一个卷共享，使其有多个用处。volumeMounts.subPath特性可以用来指定卷中的一个子目录，而不是直接使用卷的根目录。

以下是使用单个共享卷的LAMP堆栈（Linux Apache Mysql PHP）的pod的示例。HTML内容映射到其html文件夹，数据库将存储在mysql文件夹中：

```
apiVersion: v1
kind: Pod
metadata:
  name: my-lamp-site
spec:
    containers:
    - name: mysql
      image: mysql
      volumeMounts:
      - mountPath: /var/lib/mysql
        name: site-data
        subPath: mysql
    - name: php
      image: php
      volumeMounts:
      - mountPath: /var/www/html
        name: site-data
        subPath: html
    volumes:
    - name: site-data
      persistentVolumeClaim:
        claimName: my-lamp-site-data
```

## Resources

emptyDir Volume的存储介质（Disk，SSD等）取决于kubelet根目录（如/var/lib/kubelet）所处文件系统的存储介质。不限制emptyDir或hostPath Volume使用的空间大小，不对容器或Pod的资源隔离。



## 2.10  命名空间(NameSpace)

你可以认为namespaces是你kubernetes集群中的虚拟化集群。在一个Kubernetes集群中可以拥有多个命名空间，它们在逻辑上彼此隔离。 他们可以为您和您的团队提供组织，安全甚至性能方面的帮助！

“default” Namespace
大多数的Kubernetes中的集群默认会有一个叫default的namespace。实际上，应该是3个：

default：你的service和app默认被创建于此。
kube-system：kubernetes系统组件使用。
kube-public：公共资源使用。但实际上现在并不常用。

这个默认（default）的namespace并没什么特别，但你不能删除它。这很适合刚刚开始使用kubernetes和一些小的产品系统。但不建议应用于大型生产系统。因为，这种复杂系统中，团队会非常容易意外地或者无意识地重写或者中断其他服务service。相反，请创建多个命名空间来把你的服务service分割成更容易管理的块。



Kubernetes可以使用Namespaces（命名空间）创建多个虚拟集群。

## 何时使用多个Namespaces

当团队或项目中具有许多用户时，可以考虑使用Namespace来区分，a如果是少量用户集群，可以不需要考虑使用Namespace，如果需要它们提供特殊性质时，可以开始使用Namespace。

Namespace为名称提供了一个范围。资源的Names在Namespace中具有唯一性。

Namespace是一种将集群资源划分为多个用途(通过 [resource quota](https://kubernetes.io/docs/concepts/policy/resource-quotas/))的方法。

在未来的Kubernetes版本中，默认情况下，相同Namespace中的对象将具有相同的访问控制策略。

对于稍微不同的资源没必要使用多个Namespace来划分，例如同意软件的不同版本，可以使用[labels(标签)](http://docs.kubernetes.org.cn/247.html)来区分同一Namespace中的资源。

## 使用 Namespaces

Namespace的创建、删除和查看。

### 创建

```
(1) 命令行直接创建
$ kubectl create namespace new-namespace

(2) 通过文件创建
$ cat my-namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: new-namespace

$ kubectl create -f ./my-namespace.yaml
```

注意：命名空间名称满足正则表达式[a-z0-9]([-a-z0-9]*[a-z0-9])?,最大长度为63位

### 删除

```
$ kubectl delete namespaces new-namespace
```

注意：

1. 删除一个namespace会自动删除所有属于该namespace的资源。
2. default和kube-system命名空间不可删除。
3. PersistentVolumes是不属于任何namespace的，但PersistentVolumeClaim是属于某个特定namespace的。
4. Events是否属于namespace取决于产生events的对象。

### 查看 Namespaces

使用以下命令列出群集中的当前的Namespace：

```
$ kubectl get namespaces
NAME          STATUS    AGE
default       Active    1d
kube-system   Active    1d
```

Kubernetes从两个初始的Namespace开始：

- default
- kube-system 由Kubernetes系统创建的对象的Namespace

### Setting the namespace for a request

要临时设置Request的Namespace，请使用--namespace 标志。

例如：

```
$ kubectl --namespace=<insert-namespace-name-here> run nginx --image=nginx
$ kubectl --namespace=<insert-namespace-name-here> get pods
```

### Setting the namespace preference

可以使用kubectl命令创建的Namespace可以永久保存在context中。

```
$ kubectl config set-context $(kubectl config current-context) --namespace=<insert-namespace-name-here>
# Validate it
$ kubectl config view | grep namespace:
```

## 所有对象都在Namespace中?

大多数Kubernetes资源（例如pod、services、replication controllers或其他）都在某些Namespace中，但Namespace资源本身并不在Namespace中。而低级别资源（如[Node](http://docs.kubernetes.org.cn/304.html)和persistentVolumes）不在任何Namespace中。[Events](https://www.kubernetes.org.cn/1031.html)是一个例外：它们可能有也可能没有Namespace，具体取决于[Events](https://www.kubernetes.org.cn/1031.html)的对象。

## 2.11  注解(Anotation)

# Kubernetes Annotations

可以使用Kubernetes Annotations将任何非标识metadata附加到对象。客户端（如工具和库）可以检索此metadata。

## 将metadata附加到对象

可以使用[Labels](http://docs.kubernetes.org.cn/247.html)或Annotations将元数据附加到Kubernetes对象。标签可用于选择对象并查找满足某些条件的对象集合。相比之下，Annotations不用于标识和选择对象。Annotations中的元数据可以是small 或large，structured 或unstructured，并且可以包括标签不允许使用的字符。

Annotations就如标签一样，也是由key/value组成：

```
"annotations": {
  "key1" : "value1",
  "key2" : "value2"
}
```

以下是在Annotations中记录信息的一些例子：

- 构建、发布的镜像信息，如时间戳，发行ID，git分支，PR编号，镜像hashes和注Registry地址。
- 一些日志记录、监视、分析或audit repositories。
- 一些工具信息：例如，名称、版本和构建信息。
- 用户或工具/系统来源信息，例如来自其他生态系统组件对象的URL。
- 负责人电话/座机，或一些信息目录。

**注意**：Annotations不会被Kubernetes直接使用，其主要目的是方便用户阅读查找。

## 2.12  小结

Kubernetes对象是Kubernetes系统中的持久实体。Kubernetes使用这些实体来表示集群的状态。具体来说，他们可以描述：

- 容器化应用正在运行(以及在哪些节点上)
- 这些应用可用的资源
- 关于这些应用如何运行的策略，如重新策略，升级和容错

Kubernetes对象是“record of intent”，一旦创建了对象，Kubernetes系统会确保对象存在。通过创建对象，可以有效地告诉Kubernetes系统你希望集群的工作负载是什么样的。

要使用Kubernetes对象（无论是创建，修改还是删除），都需要使用[Kubernetes API](http://docs.kubernetes.org.cn/31.html)。例如，当使用[kubectl命令管理工具](http://docs.kubernetes.org.cn/61.html)时，CLI会为提供Kubernetes API调用。你也可以直接在自己的程序中使用Kubernetes API，Kubernetes提供一个golang[客户端库](http://docs.kubernetes.org.cn/29.html) （其他语言库正在开发中-如Python）。

### 对象（Object）规范和状态

每个Kubernetes对象都包含两个嵌套对象字段，用于管理Object的配置：Object Spec和Object Status。Spec描述了对象所需的状态 - 希望Object具有的特性，Status描述了对象的实际状态，并由Kubernetes系统提供和更新。

例如，通过Kubernetes Deployment 来表示在集群上运行的应用的对象。创建Deployment时，可以设置Deployment Spec，来指定要运行应用的三个副本。Kubernetes系统将读取Deployment Spec，并启动你想要的三个应用实例 - 来更新状态以符合之前设置的Spec。如果这些实例中有任何一个失败（状态更改），Kuberentes系统将响应Spec和当前状态之间差异来调整，这种情况下，将会开始替代实例。

有关object spec、status和metadata更多信息，请参考“[Kubernetes API Conventions](https://git.k8s.io/community/contributors/devel/api-conventions.md)[”](https://git.k8s.io/community/contributors/devel/api-conventions.md)。

### 描述Kubernetes对象

在Kubernetes中创建对象时，必须提供描述其所需Status的对象Spec，以及关于对象（如name）的一些基本信息。当使用Kubernetes API创建对象（直接或通过kubectl）时，该API请求必须将该信息作为JSON包含在请求body中。通常，可以将信息提供给kubectl .yaml文件，在进行API请求时，kubectl将信息转换为JSON。

以下示例是一个.yaml文件，显示Kubernetes Deployment所需的字段和对象Spec：

| [nginx-deployment.yaml ](https://raw.githubusercontent.com/kubernetes/kubernetes.github.io/master/docs/concepts/overview/working-with-objects/nginx-deployment.yaml)![将nginx-deployment.yaml复制到剪贴板](https://d33wubrfki0l68.cloudfront.net/951ae1fcc65e28202164b32c13fa7ae04fab4a0b/b77dc/images/copycode.svg) |
| ------------------------------------------------------------ |
| `apiVersion: apps/v1beta1 kind: Deployment metadata:   name: nginx-deployment spec:   replicas: 3   template:     metadata:       labels:         app: nginx     spec:       containers:       - name: nginx         image: nginx:1.7.9         ports:         - containerPort: 80` |

使用上述.yaml文件创建Deployment，是通过在kubectl中使用[kubectl create](https://kubernetes.io/docs/user-guide/kubectl/v1.7/#create)命令来实现。将该.yaml文件作为参数传递。如下例子：

```
$ kubectl create -f docs/user-guide/nginx-deployment.yaml --record
```

其输出与此类似:

```
deployment "nginx-deployment" created
```

### 必填字段

对于要创建的Kubernetes对象的yaml文件，需要为以下字段设置值：

- apiVersion - 创建对象的Kubernetes API 版本
- kind - 要创建什么样的对象？
- metadata- 具有唯一标示对象的数据，包括 name（字符串）、UID和Namespace（可选项）

还需要提供对象Spec字段，对象Spec的精确格式（对于每个Kubernetes 对象都是不同的），以及容器内嵌套的特定于该对象的字段。[Kubernetes API reference](https://kubernetes.io/docs/api/)可以查找所有可创建Kubernetes对象的Spec格式。

# 3  Kubernetes集群环境搭建

## 3.1  系统整体架构

![architecture](/images/architecture.png)

架构图参考链接：https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.2/docs/design/architecture.png

## 3.2  环境规划

## 3.3  各Node 安装Docker

## 3.4  kubeadm初始化Kubernetes集群

## 3.5  部署Master组件

## 3.6  部署Node组件

## 3.7  创建Node节点kubeconfig配置文件

## 3.8  Flannel网络工作原理

# overlay网络简介

覆盖网络就是应用层网络，它是面向应用层的，不考虑或很少考虑网络层，物理层的问题。

详细说来，覆盖网络是指建立在另一个网络上的网络。该网络中的结点可以看作通过虚拟或逻辑链路而连接起来的。虽然在底层有很多条物理链路，但是这些虚拟或逻辑链路都与路径一一对应。例如：许多P2P网络就是覆盖网络，因为它运行在互连网的上层。覆盖网络允许对没有IP地址标识的目的主机路由信息，例如：Freenet 和DHT（分布式哈希表）可以路由信息到一个存储特定文件的结点，而这个结点的IP地址事先并不知道。

覆盖网络被认为是一条用来改善互连网路由的途径，让二层网络在三层网络中传递，既解决了二层的缺点，又解决了三层的不灵活！

# Flannel的工作原理

flannel是CoreOS提供用于解决Dokcer集群跨主机通讯的覆盖网络工具。它的主要思路是：预先留出一个网段，每个主机使用其中一部分，然后每个容器被分配不同的ip；让所有的容器认为大家在同一个直连的网络，底层通过`UDP/VxLAN`等进行报文的封装和转发。它基于Linux TUN/TAP，使用UDP封装IP包来创建overlay网络，并借助etcd维护网络的分配情况

flannel项目地址：<https://github.com/coreos/flannel>

### flannel架构介绍

flannel默认使用8285端口作为`UDP`封装报文的端口，VxLan使用8472端口。

![flannel-01](/images/flannel-01.png)

那么一条网络报文是怎么从一个容器发送到另外一个容器的呢？

1. 容器直接使用目标容器的ip访问，默认通过容器内部的eth0发送出去。
2. 报文通过`veth pair`被发送到`vethXXX`。
3. `vethXXX`是直接连接到虚拟交换机`docker0`的，报文通过虚拟`bridge docker0`发送出去。
4. 查找路由表，外部容器ip的报文都会转发到`flannel0`虚拟网卡，这是一个`P2P`的虚拟网卡，然后报文就被转发到监听在另一端的`flanneld`。
5. `flanneld`通过`etcd`维护了各个节点之间的路由表，把原来的报文`UDP`封装一层，通过配置的`iface`发送出去。
6. 报文通过主机之间的网络找到目标主机。
7. 报文继续往上，到传输层，交给监听在8285端口的`flanneld`程序处理。
8. 数据被解包，然后发送给`flannel0`虚拟网卡。
9. 查找路由表，发现对应容器的报文要交给`docker0`。
10. `docker0`找到连到自己的容器，把报文发送过去。

## VXLAN

将源数据包封装到UDP中，并使用基础网络的IP/MAC作为外层报文头进行封装，然后在以太网上传输，到达目的地后由隧道端点解封装并将数据发送给目标地址。



## 3.9  Flannel容器集群网络部署

参考：<https://blog.csdn.net/bbwangj/article/details/81092728>

<https://www.jianshu.com/p/165a256fb1da>

# 4  kubernetes实践

## 4.1  运行一个测试示例.NET CORE

## 4.2  代码剖析

## 4.3  中间件-配置

## 4.4  编译打docker镜像

## 4.5  运行k8s命令部署服务

## 4.6  演示网站

# 5  kubectl 命令行管理工具

## 5.1  kubectl用法概述

​	kubectl用于运行Kubernetes集群命令的管理工具。

​	可以在  https://github.com/kubernetes/kubernetes   找到更多的信息。

**安装和设置kubectl**

使用Kubernetes命令行工具kubectl在Kubernetes上部署和管理应用程序。使用kubectl，可以检查集群资源; 创建，删除和更新组件。

以下是安装kubectl的几种方法。

通过curl安装kubectl二进制文件

**Linux**

下载最新版本的命令：

```
 curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
```

要下载特定版本，请使用特定版本替换$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)命令的一部分。

例如，要在Linux上下载v1.14.0版本，请键入：

```
 curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl
```

使kubectl二进制可执行。

```
 chmod +x ./kubectl
```

将二进制文件移动到PATH中。

```
 sudo mv ./kubectl /usr/local/bin/kubectl
```

**Windows**

 

从此[链接](https://storage.googleapis.com/kubernetes-release/release/v1.7.0/bin/windows/amd64/kubectl.exe)下载最新版本v1.14.0 。

如果curl已安装，请使用以下命令：

```
 curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/windows/amd64/kubectl.exe
```

要了解最新的稳定版本，请查看 <https://storage.googleapis.com/kubernetes-release/release/stable.txt>

 

将二进制文件添加到PATH中。

**配置kubectl**

为了使kubectl找到并访问Kubernetes集群，需要一个[kubeconfig文件](https://kubernetes.io/docs/concepts/cluster-administration/authenticate-across-clusters-kubeconfig/)，当你使用kube-up.sh创建集群或成功部署Minikube集群时，该[文件](https://kubernetes.io/docs/concepts/cluster-administration/authenticate-across-clusters-kubeconfig/)将自动创建。有关创建集群的更多信息，请参阅[入门指南](https://kubernetes.io/docs/getting-started-guides/)。如果你需要访问未创建的[群集](https://kubernetes.io/docs/tasks/administer-cluster/share-configuration/)，请参阅[共享群集访问文档](https://kubernetes.io/docs/tasks/administer-cluster/share-configuration/)。默认情况下，kubectl配置位于~/.kube/config。

**检查kubectl配置**

通过获取集群状态来检查kubectl是否正确配置：

```
$ kubectl cluster-info
```

如果看到一个URL响应，kubectl被正确配置为访问您的集群。

如果看到类似于以下内容的消息，则kubectl未正确配置：

```
The connection to the server <server-name:port> was refused - did you specify the right host or port?
```

**启用shell自动完成**

kubectl包括支持自动完成，可以节省大量打字！

完成脚本本身是由kubectl生成的，所以你通常只需要从你的配置文件中调用它。

这里提供常见的例子。有关详细信息，请咨询kubectl completion -h。

**在Linux上，使用bash**

要将kubectl自动完成添加到当前shell，请运行source <(kubectl completion bash)。

要将kubectl自动完成添加到你的配置文件中，因此将在以后的shell中自动加载运行：

```
echo "source <(kubectl completion bash)" >> ~/.bashrc
```



**Kubernetes kubectl 命令表**

> kubectl命令列表

- [kubectl run（创建容器镜像）](http://docs.kubernetes.org.cn/468.html)
- [kubectl expose（将资源暴露为新的 Service）](http://docs.kubernetes.org.cn/475.html)
- [kubectl annotate（更新资源的Annotations信息）](http://docs.kubernetes.org.cn/477.html)
- [kubectl autoscale（Pod水平自动伸缩）](http://docs.kubernetes.org.cn/486.html)
- [kubectl convert（转换配置文件为不同的API版本）](http://docs.kubernetes.org.cn/488.html)

- [kubectl create（创建一个集群资源对象](http://docs.kubernetes.org.cn/490.html)
- [kubectl create clusterrole（创建ClusterRole）](http://docs.kubernetes.org.cn/492.html)
- [kubectl create clusterrolebinding（为特定的ClusterRole创建ClusterRoleBinding）](http://docs.kubernetes.org.cn/494.html)
- [kubectl create configmap（创建configmap）](http://docs.kubernetes.org.cn/533.html)
- [kubectl create deployment（创建deployment）](http://docs.kubernetes.org.cn/535.html)
- [kubectl create namespace（创建namespace）](http://docs.kubernetes.org.cn/537.html)
- [kubectl create poddisruptionbudget（创建poddisruptionbudget）](http://docs.kubernetes.org.cn/539.html)
- [kubectl create quota（创建resourcequota）](http://docs.kubernetes.org.cn/541.html)
- [kubectl create role（创建role）](http://docs.kubernetes.org.cn/543.html)
- [kubectl create rolebinding（为特定Role或ClusterRole创建RoleBinding）](http://docs.kubernetes.org.cn/545.html)

- [kubectl create service（使用指定的子命令创建 Service服务）](http://docs.kubernetes.org.cn/564.html)
- [kubectl create service clusterip](http://docs.kubernetes.org.cn/566.html)
- [kubectl create service externalname](http://docs.kubernetes.org.cn/568.html)
- [kubectl create service loadbalancer](http://docs.kubernetes.org.cn/570.html)
- [kubectl create service nodeport](http://docs.kubernetes.org.cn/572.html)
- [kubectl create serviceaccount](http://docs.kubernetes.org.cn/574.html)

- [kubectl create secret（使用指定的子命令创建 secret）](http://docs.kubernetes.org.cn/548.html)
- [kubectl create secret tls](http://docs.kubernetes.org.cn/558.html)
- [kubectl create secret generic](http://docs.kubernetes.org.cn/556.html)
- [kubectl create secret docker-registry](http://docs.kubernetes.org.cn/554.html)

- [kubectl delete（删除资源对象）](http://docs.kubernetes.org.cn/618.html)
- [kubectl edit（编辑服务器上定义的资源对象）](http://docs.kubernetes.org.cn/623.html)
- [kubectl get（获取资源信息）](http://docs.kubernetes.org.cn/626.html)
- [kubectl label（更新资源对象的label）](http://docs.kubernetes.org.cn/628.html)
- [kubectl patch（使用patch更新资源对象字段）](http://docs.kubernetes.org.cn/632.html)
- [kubectl replace（替换资源对象）](http://docs.kubernetes.org.cn/635.html)
- [kubectl rolling-update（使用RC进行滚动更新）](http://docs.kubernetes.org.cn/638.html)
- [kubectl scale（扩缩Pod数量）](http://docs.kubernetes.org.cn/664.html)

- [kubectl rollout（对资源对象进行管理）](http://docs.kubernetes.org.cn/643.html)
- [kubectl rollout history（查看历史版本）](http://docs.kubernetes.org.cn/645.html)
- [kubectl rollout pause（标记资源对象为暂停状态）](http://docs.kubernetes.org.cn/647.html)
- [kubectl rollout resume（恢复已暂停资源）](http://docs.kubernetes.org.cn/650.html)
- [kubectl rollout status（查看资源状态）](http://docs.kubernetes.org.cn/652.html)
- [kubectl rollout undo（回滚版本）](http://docs.kubernetes.org.cn/654.html)

- [kubectl set（配置应用资源）](http://docs.kubernetes.org.cn/669.html)
- [kubectl set resources（指定Pod的计算资源需求）](http://docs.kubernetes.org.cn/671.html)
- [kubectl set selector（设置资源对象selector）](http://docs.kubernetes.org.cn/672.html)
- [kubectl set image（更新已有资源对象中的容器镜像）](http://docs.kubernetes.org.cn/670.html)
- [kubectl set subject（更新RoleBinding / ClusterRoleBinding中User、Group 或 ServiceAccount）](http://docs.kubernetes.org.cn/681.html)





参考：<https://www.kubernetes.org.cn/doc-45>



## 5.2  kubectl命令详解

## 语法

在管理工具界面使用kubectl语法运行如下命令：

```
kubectl [command] [TYPE] [NAME] [flags]
```

其中command，TYPE，NAME，和flags都是：* command：指定要在一个或多个资源执行的操作，例如操作create，get，describe，delete。* TYPE：指定[资源类型Resource types](http://docs.kubernetes.org.cn/61.html#resource-types)。Resource types会区分大小写，也可以指定单数，复数或缩写的形式。例如，以下命令将输出相同的结果：

shell $ kubectl get pod pod1 $ kubectl get pods pod1 $ kubectl get po pod1 * NAME：指定Resource的Name。Name区分大小写，如果省略Name，则显示所有资源的详细信息，例如：$ kubectl get pods。

当在多个资源上执行操作时，可以通过type和name 指定每个资源，或者指定一个或多个file:通过type和name指定的资源:如果它们都是相同的type，就可以对资源进行分组TYPE1 name1 name2 name<#>

- 例：$ kubectl get pod example-pod1 example-pod2 *单独指定多种资源type：TYPE1/name1 TYPE1/name2 TYPE2/name3 TYPE<#>/name<#>
- 例：$ kubectl get pod/example-pod1 replicationcontroller/example-rc1 *使用一个或多个file来指定资源：-f file1 -f file2 -f file<#> [使用YAML而不是JSON，](http://docs.kubernetes.org.cn/61.html#general-config-tips)因为YAML往往更容易掌握也对用户更友好，特别是对于配置文件。
- 例：$ kubectl get pod -f ./pod.yaml * flags：指定可选flags。例如，你可以使用-s或--server flag来指定Kubernetes API Server的地址和端口。

*提示：命令行指定的flags将覆盖默认值和任何相应的环境变量。*

> 如果需要更多相关帮助，只需从终端命令窗口运行 kubectl help

## Operations

下表包括了所有kubectl操作简短描述和通用语法：

| Operation                                        | Syntax                                                       | Description                                                  |
| ------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| [annotate](https://www.kubernetes.org.cn/doc-46) | kubectl annotate (-f FILENAME \| TYPE NAME \| TYPE/NAME) KEY_1=VAL_1 ... KEY_N=VAL_N [--overwrite] [--all] [--resource-version=version] [flags] | 为一个或多个资源添加注释                                     |
| api-versions                                     | kubectl api-versions [flags]                                 | 列出支持的API版本。                                          |
| apply                                            | kubectl apply -f FILENAME [flags]                            | 对文件或stdin的资源进行配置更改。                            |
| attach                                           | kubectl attach POD -c CONTAINER [-i] [-t] [flags]            | 连接到一个运行的容器，既可以查看output stream，也可以与容器(stdin)进行交互。 |
| autoscale                                        | kubectl autoscale (-f FILENAME \| TYPE NAME \| TYPE/NAME) [--min=MINPODS] --max=MAXPODS [--cpu-percent=CPU] [flags] | 自动扩容/缩容由replication controller管理的一组pod。         |
| cluster-info                                     | kubectl cluster-info [flags]                                 | 显示有关集群中master和services的终端信息。                   |
| config                                           | kubectl config SUBCOMMAND [flags]                            | 修改kubeconfig文件。有关详细信息，请参阅各个子命令。         |
| create                                           | kubectl create -f FILENAME [flags]                           | 从file或stdin创建一个或多个资源。                            |
| delete                                           | kubectl delete (-f FILENAME \| TYPE [NAME \| /NAME \| -l label \| --all]) [flags] | 从file，stdin或指定label 选择器，names，resource选择器或resources中删除resources。 |
| describe                                         | kubectl describe (-f FILENAME \| TYPE [NAME_PREFIX \| /NAME \| -l label]) [flags] | 显示一个或多个resources的详细状态。                          |
| [edit](https://www.kubernetes.org.cn/doc-62)     | kubectl edit (-f FILENAME \| TYPE NAME \| TYPE/NAME) [flags] | 使用默认编辑器编辑和更新服务器上一个或多个定义的资源。       |
| exec                                             | kubectl exec POD [-c CONTAINER] [-i] [-t] [flags] [-- COMMAND [args...]] | 对pod中的容器执行命令。                                      |
| explain                                          | kubectl explain [--include-extended-apis=true] [--recursive=false] [flags] | 获取各种资源的文档。例如pod，node，services等                |
| expose                                           | kubectl expose (-f FILENAME \| TYPE NAME \| TYPE/NAME) [--port=port] [--protocol=TCP\|UDP] [--target-port=number-or-name] [--name=name] [----external-ip=external-ip-of-service] [--type=type] [flags] | 将 replication controller，service或pod作为一个新的Kubernetes service显示。 |
| get                                              | kubectl get (-f FILENAME \| TYPE [NAME \| /NAME \| -l label]) [--watch] [--sort-by=FIELD] [[-o \| --output]=OUTPUT_FORMAT] [flags] | 列出一个或多个资源。                                         |
| label                                            | kubectl label (-f FILENAME \| TYPE NAME \| TYPE/NAME) KEY_1=VAL_1 ... KEY_N=VAL_N [--overwrite] [--all] [--resource-version=version] [flags] | 添加或更新一个或多个资源的flags。                            |
| logs                                             | kubectl logs POD [-c CONTAINER] [--follow] [flags]           | 在pod中打印容器的日志。                                      |
| patch                                            | kubectl patch (-f FILENAME \| TYPE NAME \| TYPE/NAME) --patch PATCH [flags] | 使用strategic merge 补丁程序更新资源的一个或多个字段。       |
| port-forward                                     | kubectl port-forward POD [LOCAL_PORT:]REMOTE_PORT [...[LOCAL_PORT_N:]REMOTE_PORT_N] [flags] | 将一个或多个本地端口转发到pod。                              |
| proxy                                            | kubectl proxy [--port=PORT] [--www=static-dir] [--www-prefix=prefix] [--api-prefix=prefix] [flags] | 在Kubernetes API服务器运行代理。                             |
| replace                                          | kubectl replace -f FILENAME                                  | 从file或stdin替换资源。                                      |
| rolling-update                                   | kubectl rolling-update OLD_CONTROLLER_NAME ([NEW_CONTROLLER_NAME] --image=NEW_CONTAINER_IMAGE \| -f NEW_CONTROLLER_SPEC) [flags] | 通过逐步替换指定的replication controller及其pod来执行滚动更新。 |
| run                                              | kubectl run NAME --image=image [--env="key=value"] [--port=port] [--replicas=replicas] [--dry-run=bool] [--overrides=inline-json] [flags] | 在集群上运行指定的镜像。                                     |
| scale                                            | kubectl scale (-f FILENAME \| TYPE NAME \| TYPE/NAME) --replicas=COUNT [--resource-version=version] [--current-replicas=count] [flags] | 更新指定replication controller的大小。                       |
| stop                                             | kubectl stop                                                 | 已弃用：请参阅[kubectl delete](https://www.kubernetes.org.cn/doc-60)。 |
| version                                          | kubectl version [--client] [flags]                           | 显示客户端和服务器上运行的Kubernetes版本。                   |

提示：有关更多命令信息，请参阅[kubectl](https://kubernetes.io/docs/user-guide/kubectl)参考文档。

## Resource types

下表列出了所有支持的资源类型及其缩写：

| Resource type              | Abbreviated alias |
| -------------------------- | ----------------- |
| apiservices                |                   |
| certificatesigningrequests | csr               |
| clusters                   |                   |
| clusterrolebindings        |                   |
| clusterroles               |                   |
| componentstatuses          | cs                |
| configmaps                 | cm                |
| controllerrevisions        |                   |
| cronjobs                   |                   |
| customresourcedefinition   | crd               |
| daemonsets                 | ds                |
| deployments                | deploy            |
| endpoints                  | ep                |
| events                     | ev                |
| horizontalpodautoscalers   | hpa               |
| ingresses                  | ing               |
| jobs                       |                   |
| limitranges                | limits            |
| namespaces                 | ns                |
| networkpolicies            | netpol            |
| nodes                      | no                |
| persistentvolumeclaims     | pvc               |
| persistentvolumes          | pv                |
| poddisruptionbudget        | pdb               |
| podpreset                  |                   |
| pods                       | po                |
| podsecuritypolicies        | psp               |
| podtemplates               |                   |
| replicasets                | rs                |
| replicationcontrollers     | rc                |
| resourcequotas             | quota             |
| rolebindings               |                   |
| roles                      |                   |
| secrets                    |                   |
| serviceaccounts            | sa                |
| services                   | svc               |
| statefulsets               |                   |
| storageclasses             |                   |

## 输出选项 Output options

使用以下部分来了解如何格式化或对某些命令的输出进行排序。关于哪些命令支持什么输出选项，请查阅[kubectl](https://www.kubernetes.org.cn/doc-45)参考文档。

### 格式化输出 Formatting output

所有kubectl命令输出的默认格式是可读的纯文本格式。要以特定的格式向终端窗口输出详细信息，可以将-o或-output flags 添加到支持的kubectl命令中。

语法：

```
kubectl [command] [TYPE] [NAME] -o=<output_format>
```

根据kubectl操作，支持以下输出格式：

| 输出格式                          | 描述                                                         |
| --------------------------------- | ------------------------------------------------------------ |
| -o=custom-columns=<spec>          | 使用逗号分隔的[custom columns](https://kubernetes.io/docs/user-guide/kubectl-overview/#custom-columns)列表打印一个表。 |
| -o=custom-columns-file=<filename> | 使用文件中的[custom columns](https://kubernetes.io/docs/user-guide/kubectl-overview/#custom-columns)模板打印表<filename>。 |
| -o=json                           | 输出JSON格式的API对象。                                      |
| -o=jsonpath=<template>            | 打印在[jsonpath](https://kubernetes.io/docs/user-guide/jsonpath)表达式中定义的字段。 |
| -o=jsonpath-file=<filename>       | 打印由 file中的[jsonpath](https://kubernetes.io/docs/user-guide/jsonpath)表达式定义的字段<filename>。 |
| -o=name                           | 仅打印资源名称，而不打印其他内容。                           |
| -o=wide                           | 以纯文本格式输出任何附加信息。对于pod，包括node名称。        |
| -o=yaml                           | 输出YAML格式的API对象。                                      |

例如:

在此示例中，以下命令将单个pod的详细信息作为YAML格式化对象输出：

```
$ kubectl get pod web-pod-13je7 -o=yaml
```

注意：有关每个命令支持哪种输出格式的详细信息，请参阅[kubectl](https://kubernetes.io/docs/user-guide/kubectl)参考文档。

#### Custom columns

要定义custom columns并仅将所需的详细信息输出，可以使用该custom-columns选项，选择Inline定义custom columns或使用模板文件定义：-o=custom-columns=<spec>或-o=custom-columns-file=<filename>。

例如

Inline方式：

```
$ kubectl get pods <pod-name> -o=custom-columns=NAME:.metadata.name,RSRC:.metadata.resourceVersion
```

模板文件方式：

```
$ kubectl get pods <pod-name> -o=custom-columns-file=template.txt
```

其中，template.txt文件包含：

```
NAME                    RSRC

      metadata.name           metadata.resourceVersion
```

任何一个命令运行的结果将是：

```
NAME           RSRC

submit-queue   610995
```

### Sorting list objects

要将对象输出到终端窗口中的排序列表，可以将--sort-by标志添加到kubectl支持的命令中，通过使用--sort-by标志指定任何数字或字符串字段来对对象进行排序，要指定字段，请使用[jsonpath](http://docs.kubernetes.org.cn/67.html)表达式。

命令：

```
kubectl [command] [TYPE] [NAME] --sort-by=<jsonpath_exp>
```

例如

要打印按名称排序的pod列表，请运行：

```
$ kubectl get pods --sort-by=.metadata.name
```

## 

## 5.3  kubectl操作示例

## 示例：常用操作

使用以下一组示例来帮助你熟悉运行kubectl常用操作：

kubectl create - 从file或stdin中创建资源。

```
// Create a service using the definition in example-service.yaml.
$ kubectl create -f example-service.yaml

// Create a replication controller using the definition in example-controller.yaml.
$ kubectl create -f example-controller.yaml

// Create the objects that are defined in any .yaml, .yml, or .json file within the <directory> directory.
$ kubectl create -f <directory>
```

kubectl get 列出一个或多个资源。

```
// List all pods in plain-text output format.
$ kubectl get pods

// List all pods in plain-text output format and includes additional information (such as node name).
$ kubectl get pods -o wide

// List the replication controller with the specified name in plain-text output format. Tip: You can shorten and replace the 'replicationcontroller' resource type with the alias 'rc'.
$ kubectl get replicationcontroller <rc-name>

// List all replication controllers and services together in plain-text output format.
$ kubectl get rc,services
```

kubectl describe - 显示一个或多个资源的详细状态。

```
// Display the details of the node with name <node-name>.
$ kubectl describe nodes <node-name>

// Display the details of the pod with name <pod-name>.
$ kubectl describe pods/<pod-name>

// Display the details of all the pods that are managed by the replication controller named <rc-name>.
// Remember: Any pods that are created by the replication controller get prefixed with the name of the replication controller.
$ kubectl describe pods <rc-name>
```

kubectl delete - 从file、stdin或指定label选择器，names，resource选择器或resources中删除resources资源。

```
// Delete a pod using the type and name specified in the pod.yaml file.
$ kubectl delete -f pod.yaml

// Delete all the pods and services that have the label name=<label-name>.
$ kubectl delete pods,services -l name=<label-name>

// Delete all pods.
$ kubectl delete pods --all
```

kubectl exec - 对pod中的容器执行命令。

```
// Get output from running 'date' from pod <pod-name>. By default, output is from the first container.
$ kubectl exec <pod-name> date

// Get output from running 'date' in container <container-name> of pod <pod-name>.
$ kubectl exec <pod-name> -c <container-name> date

// Get an interactive TTY and run /bin/bash from pod <pod-name>. By default, output is from the first container.
$ kubectl exec -ti <pod-name> /bin/bash
```

kubectl logs - 打印pod中的容器的日志。

```
// Return a snapshot of the logs from pod <pod-name>.
$ kubectl logs <pod-name>

// Start streaming the logs from pod <pod-name>. This is similar to the 'tail -f' Linux command.
$ kubectl logs -f <pod-name>
```

## 5.4  kubectl管理工具远程连接集群 

​	kubectl不一定部署在master上。用户通过kubectl连接到master上然后将命令通过master分发到集群的node节点上。

> 默认情况下是默认连接本地的apiserver

**使用https连接集群**

默认情况下，kubectl使用非安全http协议连接本地apiserver的8080非安全端口： 
![kubectl-https](/images/kubectl-https.png)



如果想使用apiserver安全的https端口（6443）连接集群，可以这样

将Master服务器上的.kube/config文件复制到本地电脑上当前用户所在目录下的.kube目录下，后面就是通过这个文件访问集群，其内容如下：

```
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: REDACTED
    server: https://10.30.13.112:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: kubernetes-admin
  name: kubernetes-admin@kubernetes
current-context: kubernetes-admin@kubernetes
kind: Config
preferences: {}
users:
- name: kubernetes-admin
  user:
    client-certificate-data: REDACTED
    client-key-data:REDACTED

```



## 5.5  ~~kubectl管理命令概要~~

## 5.6  ~~kubectl工具管理应用生命周期~~

# 6  POD 对象深入学习

## 6.1  详解Pod定义

​	在Kubernetes中，最小的管理元素不是一个个独立的容器，而是Pod,Pod是最小的，管理，创建，计划的最小单元.

​	![pod_definition](/images/pod_definition.jpg)

## **什么是Pod**

一个[**Pod**](https://www.kubernetes.org.cn/tags/pod)（就像一群鲸鱼，或者一个豌豆夹）相当于一个共享context的配置组，在同一个context下，应用可能还会有独立的cgroup隔离机制，一个Pod是一个容器环境下的“逻辑主机”，它可能包含一个或者多个紧密相连的应用，这些应用可能是在同一个物理主机或虚拟机上。

Pod 的context可以理解成多个linux命名空间的联合

- PID 命名空间（同一个Pod中应用可以看到其它进程）
- 网络 命名空间（同一个Pod的中的应用对相同的IP地址和端口有权限）
- IPC 命名空间（同一个Pod中的应用可以通过VPC或者POSIX进行通信）
- UTS 命名空间（同一个Pod中的应用共享一个主机名称）

同一个Pod中的应用可以共享磁盘，磁盘是Pod级的，应用可以通过文件系统调用，额外的，一个Pod可能会定义顶级的cgroup隔离，这样的话绑定到任何一个应用（好吧，这句是在没怎么看懂，就是说Pod，应用，隔离）

由于docker的架构，一个Pod是由多个相关的并且共享磁盘的容器组成，Pid的命名空间共享还没有应用到Docker中

和相互独立的容器一样，Pod是一种相对短暂的存在，而不是持久存在的，正如我们在Pod的生命周期中提到的，Pod被安排到结点上，并且保持在这个节点上直到被终止（根据重启的设定）或者被删除，当一个节点死掉之后，上面的所有Pod均会被删除。特殊的Pod永远不会被转移到的其他的节点，作为替代，他们必须被replace.

## **Pod的发展**

### **资源的共享及通信**

Pod使Pod内的数据共享及通信变得容易

Pod的中的应用均使用相同的网络命名空间及端口，并且可以通过localhost发现并沟通其他应用，每个Pod都有一个扁平化的网络命名空间下IP地址，它是Pod可以和其他的物理机及其他的容器进行无障碍通信，（The hostname is set to the pod’s Name for the application containers within the pod）主机名被设置为Pod的名称（这个没翻译出来…）

除了定义了在Pod中运行的应用之外，Pod还定义了一系列的共享的磁盘，磁盘让这些数据在容器重启的时候不回丢失并且可以将这些数据在Pod中的应用进行共享

### **管理**

Pod通过提供一个高层次抽象而不是底层的接口简化了应用的部署及管理，Pod 作为最小的部署及管理单位，位置管理，拷贝复制，资源共享，依赖关系都是自动处理的。（fate sharing估计就说什么时候该死了，什么时候该新增一个了…）

## **Pod的使用**

Pod可以作为垂直应用整合的载体，但是它的主要特点是支持同地协作，同地管理程序，例如：

- 内容管理系统，文件和数据加载，本地缓存等等
- 日志和检查点备份，压缩，循环，快照等等
- 数据交换监控，日志追踪，日志记录和监控适配器，以及事件发布等等
- 代理，网桥，适配器
- 控制，管理，配置，更新

总体来说，独立的Pod不会去加载多个相同的应用实例

## 考虑过的其他方案

**为什么不直接在一个容器上运行所有的应用？**

1. 透明，[**Pod**](https://www.kubernetes.org.cn/tags/pod)中的容器对基础设施可见使的基础设施可以给容器提供服务，例如线程管理和资源监控，这为用户提供很多便利
2. 解耦软件依赖关系,独立的容器可以独立的进行重建和重新发布，Kubernetes 甚至会在将来支持独立容器的实时更新
3. 易用，用户不需要运行自己的线程管理器，也不需要关心程序的信号以及异常结束码等
4. 高效，因为基础设施承载了更多的责任，所以容器可以更加高效

**为什么不支持容器的协同调度**

容器的协同调度可以提供，但是它不具备Pod的大多数优点，比如资源共享，IPC，选择机制，简单管理等

## **Pod的持久性**

Pod并不是被设计成一个持久化的资源，它不会在调度失败，节点崩溃，或者其他回收中（比如因为资源的缺乏，或者其他的维护中）幸存下来

总体来说，用户因该直接去创建Pod，并且一直使用controller(replication controller),即使是一个节点的情况，这是因为controller提供了集群范围内的自我修复，以及复制还有展示管理

集群API的使用是用户的主要使用方式，这是相对普遍的在如下云管理平台中（ Borg, Marathon, Aurora, and Tupperware.）

**Pod的直接暴露是如下操作变得更容器**

1. 调度和管理的易用性
2. 在没有代理的情况下通过API可以对Pod进行操作
3. Pod的生命周期与管理器的生命周期的分离
4. 解偶控制器和服务，后段管理器仅仅监控Pod
5. 划分清楚了Kubelet级别的功能与云平台级别的功能，kubelet 实际上是一个Pod管理器
6. 高可用，当发生一些删除或者维护的过程时，Pod会自动的在他们被终止之前创建新的替代

目前对于宠物的最佳实践是，创建一个副本等于1和有对应service的一个replication控制器。如果你觉得这太麻烦，请在这里留下你的意见。

## 容器的终止

因为pod代表着一个集群中节点上运行的进程，让这些进程不再被需要，优雅的退出是很重要的（与粗暴的用一个KILL信号去结束，让应用没有机会进行清理操作）。用户应该能请求删除，并且在室进程终止的情况下能知道，而且也能保证删除最终完成。当一个用户请求删除pod，系统记录想要的优雅退出时间段，在这之前Pod不允许被强制的杀死，TERM信号会发送给容器主要的进程。一旦优雅退出的期限过了，KILL信号会送到这些进程，pod会从API服务器其中被删除。如果在等待进程结束的时候，Kubelet或者容器管理器重启了，结束的过程会带着完整的优雅退出时间段进行重试。

一个示例流程：

1. 用户发送一个命令来删除Pod，默认的优雅退出时间是30秒

2. API服务器中的Pod更新时间，超过该时间Pod被认为死亡

3. 在客户端命令的的里面，Pod显示为”Terminating（退出中）”的状态

4. （与第3同时）当Kubelet看到Pod标记为退出中的时候，因为第2步中时间已经设置了，它开始pod关闭的流程

i. 如果该Pod定义了一个停止前的钩子，其会在pod内部被调用。如果钩子在优雅退出时间段超时仍然在运行，第二步会意一个很小的优雅时间断被调用

ii. 进程被发送TERM的信号

5. （与第三步同时进行）Pod从service的列表中被删除，不在被认为是运行着的pod的一部分。缓慢关闭的pod可以继续对外服务，当负载均衡器将他们轮流移除。

6. 当优雅退出时间超时了，任何pod中正在运行的进程会被发送SIGKILL信号被杀死。

7. Kubelet会完成pod的删除，将优雅退出的时间设置为0（表示立即删除）。pod从API中删除，不在对客户端可见。

默认情况下，所有的删除操作的优雅退出时间都在30秒以内。kubectl delete命令支持–graceperiod=的选项，以运行用户来修改默认值。0表示删除立即执行，并且立即从API中删除pod这样一个新的pod会在同时被创建。在节点上，被设置了立即结束的的pod，仍然会给一个很短的优雅退出时间段，才会开始被强制杀死。





## 6.2  Pod的基本用法

## 使用Volume

Volume可以为容器提供持久化存储，比如

```
apiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis
    volumeMounts:
    - name: redis-storage
      mountPath: /data/redis
  volumes:
  - name: redis-storage
    emptyDir: {}
```

更多挂载存储卷的方法参考[Volume](https://feisky.gitbooks.io/kubernetes/concepts/volume.html)。

## 私有镜像

在使用私有镜像时，需要创建一个docker registry secret，并在容器中引用。

创建docker registry secret：

```
kubectl create secret docker-registry regsecret --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>
```

容器中引用该secret：

```
apiVersion: v1
kind: Pod
metadata:
  name: private-reg
spec:
  containers:
    - name: private-reg-container
      image: <your-private-image>
  imagePullSecrets:
    - name: regsecret
```

## RestartPoliy

支持三种RestartPolicy

- Always：只要退出就重启
- OnFailure：失败退出（exit code不等于0）时重启
- Never：只要退出就不再重启

注意，这里的重启是指在Pod所在Node上面本地重启，并不会调度到其他Node上去。

## 环境变量

环境变量为容器提供了一些重要的资源，包括容器和Pod的基本信息以及集群中服务的信息等：

(1) hostname

`HOSTNAME`环境变量保存了该Pod的hostname。

（2）容器和Pod的基本信息

Pod的名字、命名空间、IP以及容器的计算资源限制等可以以Downward API的方式获取并存储到环境变量中。

```
apiVersion: v1
kind: Pod
metadata:
  name: test
spec:
  containers:
    - name: test-container
      image: gcr.io/google_containers/busybox
      command: [ "sh", "-c"]
      args:
      - env
      resources:
        requests:
          memory: "32Mi"
          cpu: "125m"
        limits:
          memory: "64Mi"
          cpu: "250m"
      env:
        - name: MY_NODE_NAME
          valueFrom:
            fieldRef:
              fieldPath: spec.nodeName
        - name: MY_POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: MY_POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: MY_POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP
        - name: MY_POD_SERVICE_ACCOUNT
          valueFrom:
            fieldRef:
              fieldPath: spec.serviceAccountName
        - name: MY_CPU_REQUEST
          valueFrom:
            resourceFieldRef:
              containerName: test-container
              resource: requests.cpu
        - name: MY_CPU_LIMIT
          valueFrom:
            resourceFieldRef:
              containerName: test-container
              resource: limits.cpu
        - name: MY_MEM_REQUEST
          valueFrom:
            resourceFieldRef:
              containerName: test-container
              resource: requests.memory
        - name: MY_MEM_LIMIT
          valueFrom:
            resourceFieldRef:
              containerName: test-container
              resource: limits.memory
  restartPolicy: Never
```

(3) 集群中服务的信息

容器的环境变量中还包括了容器运行前创建的所有服务的信息，比如默认的kubernetes服务对应了环境变量

```
KUBERNETES_PORT_443_TCP_ADDR=10.0.0.1
KUBERNETES_SERVICE_HOST=10.0.0.1
KUBERNETES_SERVICE_PORT=443
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT=tcp://10.0.0.1:443
KUBERNETES_PORT_443_TCP=tcp://10.0.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_PORT=443
```

由于环境变量存在创建顺序的局限性（环境变量中不包含后来创建的服务），推荐使用DNS来解析服务。

## ImagePullPolicy

支持三种ImagePullPolicy

- Always：不管镜像是否存在都会进行一次拉取。
- Never：不管镜像是否存在都不会进行拉取
- IfNotPresent：只有镜像不存在时，才会进行镜像拉取。

注意：

- 默认为`IfNotPresent`，但`:latest`标签的镜像默认为`Always`。
- 拉取镜像时docker会进行校验，如果镜像中的MD5码没有变，则不会拉取镜像数据。
- 生产环境中应该尽量避免使用`:latest`标签，而开发环境中可以借助`:latest`标签自动拉取最新的镜像。

## 资源限制

Kubernetes通过cgroups限制容器的CPU和内存等计算资源，包括requests（请求，调度器保证调度到资源充足的Node上）和limits（上限）等：

- `spec.containers[].resources.limits.cpu`：CPU上限，可以短暂超过，容器也不会被停止
- `spec.containers[].resources.limits.memory`：内存上限，不可以超过；如果超过，容器可能会被停止或调度到其他资源充足的机器上
- `spec.containers[].resources.requests.cpu`：CPU请求，可以超过
- `spec.containers[].resources.requests.memory`：内存请求，可以超过；但如果超过，容器可能会在Node内存不足时清理

比如nginx容器请求30%的CPU和56MB的内存，但限制最多只用50%的CPU和128MB的内存：

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: nginx
  name: nginx
spec:
  containers:
    - image: nginx
      name: nginx
      resources:
        requests:
          cpu: "300m"
          memory: "56Mi"
        limits:
          cpu: "500m"
          memory: "128Mi"
```

注意，CPU的单位是milicpu，500mcpu=0.5cpu；而内存的单位则包括E, P, T, G, M, K, Ei, Pi, Ti, Gi, Mi, Ki等。

## 健康检查

为了确保容器在部署后确实处在正常运行状态，Kubernetes提供了两种探针（Probe，支持exec、tcp和httpGet方式）来探测容器的状态：

- LivenessProbe：探测应用是否处于健康状态，如果不健康则删除重建改容器
- ReadinessProbe：探测应用是否启动完成并且处于正常服务状态，如果不正常则更新容器的状态

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    app: nginx
  name: nginx
spec:
    containers:
    - image: nginx
      imagePullPolicy: Always
      name: http
      livenessProbe:
        httpGet:
        path: /
        port: 80
        initialDelaySeconds: 15
        timeoutSeconds: 1
      readinessProbe:
        httpGet:
        path: /ping
        port: 80
        initialDelaySeconds: 5
        timeoutSeconds: 1
```

## Init Container

Init Container在所有容器运行之前执行（run-to-completion），常用来初始化配置。

```
apiVersion: v1
kind: Pod
metadata:
  name: init-demo
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
    volumeMounts:
    - name: workdir
      mountPath: /usr/share/nginx/html
  # These containers are run during pod initialization
  initContainers:
  - name: install
    image: busybox
    command:
    - wget
    - "-O"
    - "/work-dir/index.html"
    - http://kubernetes.io
    volumeMounts:
    - name: workdir
      mountPath: "/work-dir"
  dnsPolicy: Default
  volumes:
  - name: workdir
    emptyDir: {}
```

## 容器生命周期钩子

容器生命周期钩子（Container Lifecycle Hooks）监听容器生命周期的特定事件，并在事件发生时执行已注册的回调函数。支持两种钩子：

- postStart： 容器启动后执行，注意由于是异步执行，它无法保证一定在ENTRYPOINT之后运行。如果失败，容器会被杀死，并根据RestartPolicy决定是否重启
- preStop：容器停止前执行，常用于资源清理。如果失败，容器同样也会被杀死

而钩子的回调函数支持两种方式：

- exec：在容器内执行命令
- httpGet：向指定URL发起GET请求

postStart和preStop钩子示例：

```
apiVersion: v1
kind: Pod
metadata:
  name: lifecycle-demo
spec:
  containers:
  - name: lifecycle-demo-container
    image: nginx
    lifecycle:
      postStart:
        exec:
          command: ["/bin/sh", "-c", "echo Hello from the postStart handler > /usr/share/message"]
      preStop:
        exec:
          command: ["/usr/sbin/nginx","-s","quit"]
```

## 指定Node

通过nodeSelector，一个Pod可以指定它所想要运行的Node节点。

首先给Node加上标签：

```
kubectl label nodes <your-node-name> disktype=ssd
```

接着，指定该Pod只想运行在带有`disktype=ssd`标签的Node上：

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
    imagePullPolicy: IfNotPresent
  nodeSelector:
    disktype: ssd
```

## 使用Capabilities

默认情况下，容器都是以非特权容器的方式运行。比如，不能在容器中创建虚拟网卡、配置虚拟网络。

Kubernetes提供了修改[Capabilities](http://man7.org/linux/man-pages/man7/capabilities.7.html)的机制，可以按需要给给容器增加或删除。比如下面的配置给容器增加了`CAP_NET_ADMIN`并删除了`CAP_KILL`。

```
apiVersion: v1
kind: Pod
metadata:
  name: hello-world
spec:
  containers:
  - name: friendly-container
    image: "alpine:3.4"
    command: ["/bin/echo", "hello", "world"]
    securityContext:
      capabilities:
        add:
        - NET_ADMIN
        drop:
        - KILL
```

## 限制网络带宽

可以通过给Pod增加`kubernetes.io/ingress-bandwidth`和`kubernetes.io/egress-bandwidth`这两个annotation来限制Pod的网络带宽

```
apiVersion: v1
kind: Pod
metadata:
  name: qos
  annotations:
    kubernetes.io/ingress-bandwidth: 3M
    kubernetes.io/egress-bandwidth: 4M
spec:
  containers:
  - name: iperf3
    image: networkstatic/iperf3
    command:
    - iperf3
    - -s
```

>  **仅kubenet支持限制带宽**
>
> 目前只有kubenet网络插件支持限制网络带宽，其他CNI网络插件暂不支持这个功能。

kubenet的网络带宽限制其实是通过tc来实现的

```
# setup qdisc (only once)
tc qdisc add dev cbr0 root handle 1: htb default 30
# download rate
tc class add dev cbr0 parent 1: classid 1:2 htb rate 3Mbit
tc filter add dev cbr0 protocol ip parent 1:0 prio 1 u32 match ip dst 10.1.0.3/32 flowid 1:2
# upload rate
tc class add dev cbr0 parent 1: classid 1:3 htb rate 4Mbit
tc filter add dev cbr0 protocol ip parent 1:0 prio 1 u32 match ip src 10.1.0.3/32 flowid 1:3
```

## 调度到指定的Node上

可以通过nodeSelector、nodeAffinity、podAffinity以及Taints和tolerations等来将Pod调度到需要的Node上。具体使用方法请参考[调度器章节](https://feisky.gitbooks.io/kubernetes/components/scheduler.html)。

## 6.3  静态Pod

静态Pod是由kubectl进行管理的仅存于特定Node上的Pod。他们不能通过API Server管理，无法与ReplicationController、Deployment或者DaemonSet进行关联，并且kubelet也无法对他们进行健康检查。静态Pod总是由kubectl进行创建，并且总是在kubelet所在的Node上运行。

创建Pod有两种方式：`配置文件`或`HTTP方式`，这里只说常用的配置文件方式

#### 配置文件方式

在目录`/etc/kubelet.d`中放入`static-web.yaml`文件，内容：

```
apiVersion: v1
kind: Pod
metadata:
  name: static-web
  labels:
    name: static-web
  spce:
    containers:
    - name: static-web
      image: nginx
      ports:
      - name: web
        containerPort: 80
```

等一会，查看本机中已经启动的容器：

```
docker ps
```

就可以看到一个Nginx容器已经被Kubelet成功创建了出来。

到Master节点查看Pod列表，可以看到这个`static pod`：

```
kubectl get pods
```

由于静态Pod无法通过API Server直接管理，所以在Master节点尝试删除这个Pod，将会使其标为Pending状态，且不会被删除。

```
kubectl delete pod static-web-node1
```

删除该Pod的操作只能是到其所在Node上，将其自定义文件static-web.yaml从/etc/kubelet.d目录下删除

```
rm /etc/kubelet.d/static-web.yaml
docker ps
```

容器已经删除了  

## 6.4  Pod容器共享Volume

在一个pod中的多个容器能够共享Pod级别的存储卷volume。

# 描述

在下面的例子中，Pod中包含两个容器，Nginx和busybox. 在pod中设置Volume: app-logs. Nginx容器向其中写入日志， busybox读取日志。

![pod_share_volume](/images/pod_share_volume.png)

实现

```
apiVersion: v1
kind: Pod
metadata:
  name: volume-pod
  labels:
    app: volume-pod
spec:
  containers:

- name: nginx
image: nginx
ports:
  - containerPort: 8080
volumeMounts:
  - name: app-logs
mountPath: /var/log/nginx
- name: busybox
image: busybox
command: ["sh", "-c", "tail -f /var/log/nginx/*.log"]
volumeMounts:
  - name: app-logs
mountPath: /var/log/nginx

  volumes:

- name: app-logs
emptyDir: {}

```



## 6.5  Pod 生命周期(~~调度约束~~)与重启策略

可参考：<https://www.cnblogs.com/linuxk/p/9569618.html>

参考：<https://blog.51cto.com/2032872/2332944?source=dra>

> 我们在调度、管理 Pod 时，需要熟悉 Pod 在整个生命周期的各个状态，而设置 Pod 的重启策略也是基于对 Pod 的各种状态的了解。

### Pod 生命周期：

![pod_phase_recycle](/images/pod_phase_recycle.png)

- 说明：

  > - 初始化容器阶段初始化pod中每一个容器,他们是串行执行的，执行完成后就退出了
  > - 启动主容器main container
  > - 在main container刚刚启动之后可以执行post start命令
  > - 在整个main container执行的过程中可以做两类探测：liveness probe(存活探测)和readiness probe(就绪探测)
  > - 在main container结束前可以执行pre stop命令

- 配置启动后钩子(post start)和终止前钩子(pre stop)

  > - post start：容器创建之后立即执行，如果失败了就会按照重启策略重启容器
  > - pre stop：容器终止前立即执行，执行完成之后容器将成功终止

- 可以使用以下命令查看post start和pre stop的设置格式：

  > - [root@master manifests]# kubectl explain pod.spec.containers.lifecycle.preStop
  > - [root@master manifests]# kubectl explain pod.spec.containers.lifecycle.postStart

### Pod 的状态（phase）：

> Pod 的所有状态总共有 5 种，分别如下：
>
> - 挂起（Pending）：Pod 已被 Kubernetes 系统接受，但有一个或者多个容器镜像尚未创建。等待时间包括调度 Pod 的时间和通过网络下载镜像的时间，这可能需要花点时间。
> - 运行中（Running）：该 Pod 已经绑定到了一个节点上，Pod 中所有的容器都已被创建。至少有一个容器正在运行，或者正处于启动或重启状态。
> - 成功（Succeeded）：Pod 中的所有容器都被成功终止，并且不会再重启。
> - 失败（Failed）：Pod 中的所有容器都已终止了，并且至少有一个容器是因为失败终止。也就是说，容器以非0状态退出或者被系统终止。
> - 未知（Unknown）：因为某些原因无法取得 Pod 的状态，通常是因为与 Pod 所在主机通信失败。

### 使用命令查看：

```
[root@master app]# kubectl describe pods test1 -n kube-system
```

#### pod状态（phase）：

![pod_status](/images/pod_status.png)

#### 容器状态：

![pod_container_status](images/pod_container_status.png)

#### 条件状态：

![pod_condition_status](images/pod_condition_status.png)

### 容器探针：

> 探针 是由 kubelet 对容器执行的定期诊断。要执行诊断，kubelet 调用由容器实现的 Handler。有三种类型的处理程序：
>
> - ExecAction：在容器内执行指定命令。如果命令退出时返回码为 0 则认为诊断成功。
> - TCPSocketAction：对指定端口上的容器的 IP 地址进行 TCP 检查。如果端口打开，则诊断被认为是成功的。
> - HTTPGetAction：对指定的端口和路径上的容器的 IP 地址执行 HTTP Get 请求。如果响应的状态码大于等于200 且小于 400，则诊断被认为是成功的。

\-

> 每次探测都将获得以下三种结果之一：
>
> - 成功：容器通过了诊断。
> - 失败：容器未通过诊断。
> - 未知：诊断失败，因此不会采取任何行动。

\-

> Kubelet 可以选择是否执行在容器上运行的两种探针执行和做出反应：
>
> - livenessProbe：指示容器是否正在运行。如果存活探测失败，则 kubelet 会杀死容器，并且容器将受到其 重启策略 的影响。如果容器不提供存活探针，则默认状态为 Success。
> - readinessProbe：就绪探测是用于容器是否准备好服务请求。如果就绪探测失败，端点控制器将从与 Pod 匹配的所有 Service 的端点中删除该 Pod 的 IP 地址。初始延迟之前的就绪状态默认为 Failure。如果容器不提供就绪探针，则默认状态为 Success。

### Pod的重启策略：

> Pod 的重启策略有 3 种，默认值为 Always。
>
> - Always ： 容器失效时，kubelet 自动重启该容器；
> - OnFailure ： 容器终止运行且退出码不为0时重启；
> - Never ： 不论状态为何， kubelet 都不重启该容器。
>
> 失败的容器由 kubelet 以五分钟为上限的指数退避延迟（10秒，20秒，40秒…）重新启动，并在成功执行十分钟后重置。

### Pod 的生命：

> 一般来说，Pod 不会消失，直到人为销毁他们。这可能是一个人或控制器。这个规则的唯一例外是成功或失败的 phase 超过一段时间（由 master 确定）的Pod将过期并被自动销毁。
>
> 有三种可用的控制器：
>
> - 使用 Job 运行预期会终止的 Pod，例如批量计算。Job 仅适用于重启策略为 OnFailure 或 Never 的 Pod。
> - 对预期不会终止的 Pod 使用 ReplicationController、ReplicaSet 和 Deployment ，例如 Web 服务器。ReplicationController 仅适用于具有 restartPolicy 为 Always 的 Pod。
> - 提供特定于机器的系统服务，使用 DaemonSet 为每台机器运行一个 Pod 。

\-

> 所有这三种类型的控制器都包含一个 PodTemplate。建议创建适当的控制器，让它们来创建 Pod，而不是直接自己创建 Pod。这是因为单独的 Pod 在机器故障的情况下没有办法自动复原，而控制器却可以。

\-

> 如果节点死亡或与集群的其余部分断开连接，则 Kubernetes 将应用一个策略将丢失节点上的所有 Pod 的 phase 设置为 Failed。

### LivenessProbe (存活检查)：

#### livenessProbe参数解析：

```
[root@k8s-master ~]# kubectl explain pod.spec.containers.livenessProbe

KIND:     Pod
VERSION:  v1

RESOURCE: livenessProbe <Object>

exec  command的方式探测,例如 ps 一个进程

failureThreshold 探测几次失败 才算失败 默认是连续三次

periodSeconds 每次的多长时间探测一次  默认10s

timeoutSeconds 探测超市的秒数 默认1s

initialDelaySeconds  初始化延迟探测，第一次探测的时候，因为主程序未必启动完成

tcpSocket 检测端口的探测

httpGet http请求探测
```

#### ExecAction探测方式：

> 举个例子：定义一个liveness的pod资源类型，基础镜像为busybox，在busybox这个容器启动后会执行创建/tmp/test的文件啊，并删除，然后等待3600秒。随后定义了存活性探测，方式是以exec的方式执行命令判断/tmp/test是否存在，存在即表示存活，不存在则表示容器已经挂了。

```
apiVersion: v1
kind: Pod
metadata:
  name: liveness-exec-pod
  namespace: default
  labels:
    name: myapp
spec:
  containers:
  - name: livess-exec
    image: busybox:latest
    imagePullPolicy: IfNotPresent
    command: ["/bin/sh","-c","touch /tmp/test; sleep 30; rm -f /tmp/test; sleep 3600"]
    livenessProbe:
      exec:
        command: ["test","-e","/tmp/test"]
      initialDelaySeconds: 1
      periodSeconds: 3
```

#### HTTPGetAction探测方式：

```
apiVersion: v1
kind: Pod
metadata:
  name: nginx-test1
  namespace: kube-system
  labels:
    app: myapp
spec:
  containers:
  - name: nginxtest
    image: nginx:1.7.9
    imagePullPolicy: IfNotPresent
    ports:
     - name: http
       containerPort: 80
     - name: https
       containerPort: 443
    livenessProbe:
      httpGet:
        path: /index.html
        port: 80
      initialDelaySeconds: 1
      periodSeconds: 3
```

### Pod状态（phase）示例：

- Pod 中只有一个容器并且正在运行。容器成功退出。

  > - 记录完成事件。
  > - 如果 restartPolicy 为：
  > - Always：重启容器；Pod phase 仍为 Running。
  > - OnFailure：Pod phase 变成 Succeeded。
  > - Never：Pod phase 变成 Succeeded。

- Pod 中只有一个容器并且正在运行。容器退出失败。

  > - 记录失败事件。
  > - 如果 restartPolicy 为：
  > - Always：重启容器；Pod phase 仍为 Running。
  > - OnFailure：重启容器；Pod phase 仍为 Running。
  > - Never：Pod phase 变成 Failed。

- Pod 中有两个容器并且正在运行。有一个容器退出失败。

  > - 记录失败事件。
  >
  > - 如果 restartPolicy 为：
  >
  > - Always：重启容器；Pod phase 仍为 Running。
  >
  > - OnFailure：重启容器；Pod phase 仍为 Running。
  >
  > - Never：不重启容器；Pod phase 仍为 Running。
  >
  >   > - 如果有一个容器没有处于运行状态，并且两个容器退出：
  >   > - 记录失败事件。
  >   > - 如果 restartPolicy 为：
  >   > - Always：重启容器；Pod phase 仍为 Running。
  >   > - OnFailure：重启容器；Pod phase 仍为 Running。
  >   > - Never：Pod phase 变成 Failed。

- Pod 中只有一个容器并处于运行状态。容器运行时内存超出限制：

  > - 容器以失败状态终止。
  > - 记录 OOM 事件。
  > - 如果 restartPolicy 为：
  > - Always：重启容器；Pod phase 仍为 Running。
  > - OnFailure：重启容器；Pod phase 仍为 Running。
  > - Never: 记录失败事件；Pod phase 仍为 Failed。

- Pod 正在运行，磁盘故障：

  > - 杀掉所有容器。
  > - 记录适当事件。
  > - Pod phase 变成 Failed。
  > - 如果使用控制器来运行，Pod 将在别处重建。

- Pod 正在运行，其节点被分段。

  > - 节点控制器等待直到超时。
  > - 节点控制器将 Pod phase 设置为 Failed。
  > - 如果是用控制器来运行，Pod 将在别处重建。

### ReadinessProbe (就绪检查)：

> 就绪探测是用于容器是否准备好服务请求。如果就绪探测失败，端点控制器将从与 Pod 匹配的所有 Service 的端点中删除该 Pod 的 IP 地址。初始延迟之前的就绪状态默认为 Failure。如果容器不提供就绪探针，则默认状态为 Success。（注：默认为read状态）

![pod_ready_status](images/pod_ready_status.png)

> 有时，应用程序暂时无法对外部流量提供服务。 例如，应用程序可能需要在启动期间加载大量数据或配置文件。 在这种情况下，你不想杀死应用程序，但你也不想发送请求。 Kubernetes提供了readiness probe来检测和减轻这些情况。 Pod中的容器可以报告自己还没有准备，不能处理Kubernetes服务发送过来的流量。（如果在Pod没有ready的情况下是不会被加入到service中，如果已经加入到service中但设置了readiness probe检测发现Pod服务未处于ready状态也会被service移除）

\-

> Readiness probe的配置跟liveness probe很像。唯一的不同是使用 readinessProbe而不是livenessProbe。

```
readinessProbe:
  exec:
    command:
    - cat
    - /tmp/healthy
  initialDelaySeconds: 5
  periodSeconds: 5
```

> Readiness probe的HTTP和TCP的探测器配置跟liveness probe一样。

\-

> Readiness和livenss probe可以并行用于同一容器。 使用两者可以确保流量无法到达未准备好的容器，并且容器在失败时重新启动。

**资源限制**
集群可能部署多个应用，为了防止某些应用占用资源过高导致集群资源异常，我们一般会针对某些应用的pod资源进行资源限制，这个资源限制是通过resources 的requests和limits来实现。
比如：

```
    spec:
      containers:
      - image: xxxx
        imagePullPolicy: Always
        name: auth
        ports:
        - containerPort: 8080
          protocol: TCP
        resources:
          limits:
            cpu: "4"
            memory: 2Gi
          requests:
            cpu: 250m
            memory: 250Mi
```

resources 对象进行资源限制，具体：requests 要分分配的资源，limits为最高请求的资源值。可以简单理解为初始值和最大值。

**调度约束**
我们可以根据需要将pod分配到指定角色的node上，或具体node节点上，即通过spec.nodeName 或spec.nodeSelector来指定。

```
spec:
  #nodeName: 10.1.14.25
  nodeSelector:
    role: dev
```

具体node可以通过kubectl label添加标签。

## 6.6  Pod健康检查与问题定位

健康检查
提供probe机制，比如如下两种：
livenessProbe:如果检查失败，杀死容器，根据restartPolicy操作。
readnessProbe：如果检查失败，k8s会将pod从service endpoints中剔除。

probe支持如下三种检查：
(1) httpget 发送http请求，返回200或者301 302等状态码即成功

```
apiVersion: v1
kind: Pod
metadata:
  name: testpod
  labels:
    web: nginx
spec:
  #nodeName: 10.1.14.25
  nodeSelector:
    role: dev
  containers:
  - name: testpod
    image: nginx:1.12
    ports:
    - containerPort: 80
    livenessProbe:
      httpGet:
        path: /index.html
        port: 80
      initialDelaySeconds: 30
      periodSeconds: 10
```

通过nginx -s stop 以后，describe查看该pod存在重启记录。 另外 -f也可以查看实时日志输出，可以看到

(2)exec 执行指定shell 根据返回状态码进行判定。 一般针对特定需求来脚本实现。

(3)tcp socket。 发起tcp socker 检查，三次握手建立成功则为成功。
用法：

```
[root@master01 test]# cat test_pod.yaml 
apiVersion: v1
kind: Pod
metadata:
  name: testpod
  labels:
    web: nginx
spec:
  #nodeName: 10.1.14.25
  nodeSelector:
    role: dev
  containers:
  - name: testpod
    image: nginx:1.12
    ports:
    - containerPort: 80
    livenessProbe:
      tcpSocket:
        port: 80
      initialDelaySeconds: 30
      timeoutSeconds: 1
```

通过执行nginx -s stop 发现这个pod被重新拉起：

```
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Tue, 04 Dec 2017 01:21:24 -0500
      Finished:     Tue, 04 Dec 2017 01:32:35 -0500
    Ready:          True
    Restart Count:  1
    Limits:
      cpu:     4
      memory:  2G
    Requests:
      cpu:        250m
      memory:     250Mi
    Liveness:     tcp-socket :80 delay=30s timeout=1s period=10s #success=1 #failure=3
```

 

**日志排查**

无非就是常用的describe logs 以及exec进行排查，这个实际生产环境中最为常用。借助于events，日志输出或者是进去查看对应应用日志报错进行针对性排查pod。

## 6.7  Pod的扩容与缩容

​	Kubernetes通过HPA控制器，用于实现基本CPU使用率进行自动Pod扩容和缩容的功能。HAP控制器基于Master的Kube-controller-manager服务启动参数--horizontal-pod-autoscaler-sync-period定义的时长（默认值为30s）,周期性地检测目标Pod的CPU使用率，并在满足条件时对ReplicationController或Deployment中的Pod副本数量进行调整，以符合用户定义的平均Pod CPU使用率。

Pod CPU使用率来源于Heapster组件，所有需要预先安装好Heapster.



**HPA的创建**

  创建HPA时可以使用kubectl autoscale命令进行快速创建或者使用Yaml配置文件进行创建，在创建HPA之前，需要已经存在一个Deployment/RC对象，并且该Deployment/RC中的Pod必须定义resources.requests.cpu的资源请求值，如果不设置该值，则Heapster将无法采集到Pod的CPU使用情况，会导致HPA无法正常工作。

举例：

1.kubectl autoscale deployment php-apache --min=1 --max=10 --cpu-percent=50

2.通过yaml文件创建  

```
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: php-apache
spec:
  scaleTargetRef:
    apiVersion: apps/v1beta1
    kind: Deployment
    name: php-apache
  minReplicas: 1
  maxReplicas: 10
  targetCPUUtilizationPercentage: 50
```



## 6.8  滚动升级与回滚

**一：Deployment的升级**

```
apiVersion: apps/v1beta1
kind: Deployment
metadata:
  name: nginx-deployment
spec: 
  replicas: 3
  template: 
    metadata:
      labels:
        app: nginx
    spec:
      containers: 
      - name: nginx
        images: nginx:1.7.9
        ports:
        - containerPort: 80
```

  1.通过kubectl set image命令为Deployment设置新的镜像名称
kubectl set image deployment/nginx-deployment nginx=nginx:1.9.1

2.使用kubectl edit命令修改Deployment的配置 将spec.template.spec.containers[0].images 从nginx:1.7.9 更改为1.9.1; 保存退出后，kubernetes会自动升级镜像。

3.通过kubectl rollout status 可以查看deployment的更新过程

在Deployment的定义中，可以通过spec.strategy指定Pod更新的策略：

1.Recreate(重建)： 设置spec.strategy.type=Recreate,表示Deployment在更新Pod时，会先杀掉所有正在运行的Pod,然后创建新的Pod.

2.RollingUpdate(滚动更新)：以滚动更新的方式来逐个更新Pod,可以通过设置spec.strategy.rollingUpdate下的两个参数（maxUnavailable和maxSurge）来控制滚动更新的过程。

通常来说，不鼓励更新Deployment的标签选择器，因为这样会导致Deployment选择的Pod列表发生变化，也可能与其它控制器产生冲突。  

**二：Deployment的回滚**

  所有Deployment的发布历史记录都保留在系统中，如果要进行回滚：

1.用kubectl rollout history命令检查这个Deployment部署的历史记录

2.用kubectl rollout undo deployment/nginx-deployment 撤销本次发布回滚到上一个部署版本

3.用kubectl rollout undo deployment/nginx-deployment --to-revision=2 回滚到指定版本  

 三：**暂停和恢复Deployment的部署操作，以完成复杂的修改**

对应一次复杂的Deployment配置修改，为了避免频繁触发Deployment的更新操作，可以暂停Deployment的更新操作，然后进行配置修改，再回复Deployment.一次性触发完整的更新操作。

使用命令：kubectl rollout pause deployment/nginx-deployment

**四：使用kubectl rolling-update命令完成RC的滚动升级**

对应RC的滚动升级，Kubernetes还提供了一个kubectl rolling-update 命令进行实现。该命令创建一个新的RC，然后自动控制旧的RC中的副本数量逐渐减少到0，同时新的RC中的Pod副本的数量从0逐步增加到目标值，来完成Pod的升级。 需要注意的是新旧RC要再同一个命名空间内。

**五：其它管理对象的更新策略**
1.DaemonSet的更新策略
a.OnDelete:  默认配置。只有旧的Pod被用户手动删除后，才触发新建操作。
b.RollingUpdate: 就版本的Pod将被自动杀掉，然后自动创建新版本的DaemonSet Pod.

2.StatefulSet的更新策略
StatefulSet的更新策略正逐渐向Deployment和DaemonSet的更新策略看齐。  



# 7  Service深入掌握

​	Kubernetes Pod是平凡的，它门会被创建，也会死掉（生老病死），并且他们是不可复活的。 ReplicationControllers动态的创建和销毁Pods(比如规模扩大或者缩小，或者执行动态更新)。每个pod都由自己的ip，这些IP也随着时间的变化也不能持续依赖。这样就引发了一个问题：如果一些Pods（让我们叫它作后台，后端）提供了一些功能供其它的Pod使用（让我们叫作前台），在kubernete集群中是如何实现让这些前台能够持续的追踪到这些后台的？

**答案是：Service**



## 7.1  详解Service定义

​	Kubernete Service 是一个定义了一组[**Pod**](https://www.kubernetes.org.cn/tags/pod)的策略的抽象，我们也有时候叫做宏观服务。这些被服务标记的Pod都是（一般）通过label Selector决定的（下面我们会讲到我们为什么需要一个没有label selector的服务）

举个例子，我们假设后台是一个图形处理的后台，并且由3个副本。这些副本是可以相互替代的，并且前台并需要关心使用的哪一个后台Pod，当这个承载前台请求的pod发生变化时，前台并不需要直到这些变化，或者追踪后台的这些副本，服务是这些去耦

对于Kubernete原生的应用，Kubernete提供了一个简单的Endpoints API，这个Endpoints api的作用就是当一个服务中的pod发生变化时，Endpoints API随之变化，对于哪些不是原生的程序，Kubernetes提供了一个基于虚拟IP的网桥的服务，这个服务会将请求转发到对应的后台pod

## **Defining a service(定义一个服务)**

一个Kubernete服务是一个最小的对象，类似pod,和其它的终端对象一样，我们可以朝paiserver发送请求来创建一个新的实例，比如，假设你拥有一些Pod,每个pod都开放了9376端口，并且均带有一个标签app=MyApp

> {
>
> “kind”: “Service”,
>
> “apiVersion”: “v1”,
>
> “metadata”: {
>
> “name”: “my-service”
>
> },
>
> “spec”: {
>
> “selector”: {
>
> “app”: “MyApp”
>
> },
>
> “ports”: [
>
> {
>
> “protocol”: “TCP”,
>
> “port”: 80,
>
> “targetPort”: 9376
>
> }
>
> ]
>
> }
>
> }

这段代码会创建一个新的服务对象，名称为：my-service，并且会连接目标端口9376，并且带有label app=MyApp的pod,这个服务会被分配一个ip地址，这个ip是给服务代理使用的（下面我们会看到），服务的选择器会持续的评估，并且结果会被发送到一个Endpoints 对象，这个Endpoints的对象的名字也叫“my-service”.

服务可以将一个“入端口”转发到任何“目标端口”，默认情况下targetPort的值会和port的值相同，更有趣的是，targetPort可以是字符串，可以指定到一个name,这个name是pod的一个端口。并且实际指派给这个name的端口可以是不同在不同的后台pod中，这样让我们能更加灵活的部署我们的服务，比如；我们可以在下一个更新版本中修改后台pod暴露的端口而不会影响客户的使用（更新过程不会打断）

- 服务支持tcp和UDP，但是默认的是TCP
- Services without selectors（没有选择器的服务）

服务总体上抽象了对Pod的访问，但是服务也抽象了其它的内容，比如：

1：比如你希望有一个额外的数据库云在生产环境中，但是在测试的时候，我们希望使用自己的数据库

2：我们希望将服务指向其它的服务或者其它命名空间或者其它的云平台上的服务

3：我们正在向kubernete迁移，并且我们后台并没有在Kubernete中

如上的情况下，我们可以定义一个服务没有选择器

> {
>
> “kind”: “Service”,
>
> “apiVersion”: “v1″,
>
> “metadata”: {
>
> “name”: “my-service”
>
> },
>
> “spec”: {
>
> “ports”: [
>
> {
>
> “protocol”: “TCP”,
>
> “port”: 80,
>
> “targetPort”: 9376
>
> }
>
> ]
>
> }
>
> }

因为没有选择器，所以相应的Endpoints对象就不会被创建，但是我们手动把我们的服务和Endpoints对应起来

> {
>
> “kind”: “Endpoints”,
>
> “apiVersion”: “v1″,
>
> “metadata”: {
>
> “name”: “my-service”
>
> },
>
> “subsets”: [
>
> {
>
> “addresses”: [
>
> { “IP”: “1.2.3.4” }
>
> ],
>
> “ports”: [
>
> { “port”: 80 }
>
> ]
>
> }
>
> ]
>
> }

这样的话，这个服务虽然没有selector，但是却可以正常工作，所有的请求都会被转发到1.2.3.4：80

## Virtual IPs and service proxies（虚拟IP和服务代理）

每一个节点上都运行了一个kube-proxy，这个应用监控着Kubermaster增加和删除服务，对于每一个服务，kube-proxy会随机开启一个本机端口，任何发向这个端口的请求都会被转发到一个后台的Pod当中，而如何选择是哪一个后台的pod的是基于SessionAffinity进行的分配。kube-proxy会增加iptables rules来实现捕捉这个服务的Ip和端口来并重定向到前面提到的端口。

最终的结果就是所有的对于这个服务的请求都会被转发到后台的Pod中，这一过程用户根本察觉不到

![20161014161523](https://img.kubernetes.org.cn/2016/10/20161014161523.jpg)

默认的，后台的选择是随机的，基于用户session机制的策略可以通过修改service.spec.sessionAffinity 的值从NONE到ClientIP

### Multi-Port Services（多端口服务）

可能很多服务需要开发不止一个端口,为了满足这样的情况，Kubernetes允许在定义时候指定多个端口，当我们使用多个端口的时候，我们需要指定所有端口的名称，这样endpoints才能清楚，例如

> {
>
> “kind”: “Service”,
>
> “apiVersion”: “v1”,
>
> “metadata”: {
>
> “name”: “my-service”
>
> },
>
> “spec”: {
>
> “selector”: {
>
> “app”: “MyApp”
>
> },
>
> “ports”: [
>
> {
>
> “name”: “http”,
>
> “protocol”: “TCP”,
>
> “port”: 80,
>
> “targetPort”: 9376
>
> },
>
> {
>
> “name”: “https”,
>
> “protocol”: “TCP”,
>
> “port”: 443,
>
> “targetPort”: 9377
>
> }
>
> ]
>
> }
>
> }

## 选择自己的IP地址

我们可以在创建服务的时候指定IP地址，将spec.clusterIP的值设定为我们想要的IP地址即可。例如，我们已经有一个DNS域我们希望用来替换，或者遗留系统只能对指定IP提供服务，并且这些都非常难修改，用户选择的IP地址必须是一个有效的IP地址，并且要在API server分配的IP范围内，如果这个IP地址是不可用的，apiserver会返回422http错误代码来告知是IP地址不可用

### 为什么不使用循环的DNS

一个问题持续的被提出来，这个问题就是我们为什么不使用标准的循环DNS而使用虚拟IP，我们主要有如下几个原因

1：DNS不遵循TTL查询和缓存name查询的问题由来已久（这个还真不知道，就是DNS更新的问题估计）

2：许多的应用的DNS查询查询一次后就缓存起来

3：即使如上亮点被解决了，但是不停的进行DNS进行查询，大量的请求也是很难被管理的

我们希望阻止用户使用这些可能会“伤害”他们的事情，但是如果足够多的人要求这么作，那么我们将对此提供支持，来作为一个可选项.

## **Discovering services（服务的发现）**

Kubernetes 支持两种方式的来发现服务 ，环境变量和 DNS

### 环境变量

当一个Pod在一个node上运行时，kubelet 会针对运行的服务增加一系列的环境变量，它支持Docker links compatible 和普通环境变量

举例子来说：

redis-master服务暴露了 TCP 6379端口，并且被分配了10.0.0.11 IP地址

那么我们就会有如下的环境变量

> REDIS_MASTER_SERVICE_HOST=10.0.0.11
>
> REDIS_MASTER_SERVICE_PORT=6379
>
> REDIS_MASTER_PORT=tcp://10.0.0.11:6379
>
> REDIS_MASTER_PORT_6379_TCP=tcp://10.0.0.11:6379
>
> REDIS_MASTER_PORT_6379_TCP_PROTO=tcp
>
> REDIS_MASTER_PORT_6379_TCP_PORT=6379
>
> REDIS_MASTER_PORT_6379_TCP_ADDR=10.0.0.11

这样的话，对系统有一个要求：所有的想要被POD访问的服务，必须在POD创建之前创建，否则这个环境变量不会被填充，使用DNS则没有这个问题

### DNS

一个可选择的云平台插件就是DNS，DNS 服务器监控着API SERVER ，当有服务被创建的时候，DNS 服务器会为之创建相应的记录，如果DNS这个服务被添加了，那么Pod应该是可以自动解析服务的。

举个例子来说：如果我们在my-ns命名空间下有一个服务叫做“my-service”，这个时候DNS就会创建一个my-service.my-ns的记录，所有my-ns命名空间下的Pod,都可以通过域名my-service查询找到对应的ip地址，不同命名空间下的Pod在查找是必须使用my-sesrvice.my-ns才可以。

Kubernete 同样支持端口的解析，如果my-service有一个提供http的TCP主持的端口，那么我们可以通过查询“_http._tcp.my-service.my-ns”来查询这个端口

## Headless services

有时候我们可能不需要一个固定的IP和分发，这个时候我们只需要将spec.clusterIP的值设置为none就可以了

对于这样的服务来说，集群IP没有分配，这个时候当你查询服务的名称的时候，DNS会返回多个A记录，这些记录都是指向后端Pod的。Kube 代理不会处理这个服务，在服务的前端也没有负载均衡器。但是endpoints controller还是会创建Endpoints

（好吧，这个好处貌似我还理解好）

This option allows developers to reduce coupling to the Kubernetes system, if they desire, but leaves them freedom to do discovery in their own way. Applications can still use a self-registration pattern and adapters for other discovery systems could easily be built upon this API.

## External services（外部服务）

对于我们的应用程序来说，我们可能有一部分是放在Kubernete外部的（比如我们有单独的物理机来承担数据库的角色），Kubernetes支持两种方式：NodePorts，LoadBalancers

每一个服务都会有一个字段定义了该服务如何被调用（发现），这个字段的值可以为：

- ClusterIP:使用一个集群固定IP，这个是默认选项
- NodePort：使用一个集群固定IP，但是额外在每个POD上均暴露这个服务，端口
- LoadBalancer：使用集群固定IP，和NODEPord,额外还会申请申请一个负载均衡器来转发到服务（load balancer ）

注意：NodePort 支持TCP和UDN，但是LoadBalancers在1.0版本只支持TCP

### Type NodePort

如果你选择了“NodePort”，那么 Kubernetes master 会分配一个区域范围内，（默认是30000-32767），并且，每一个node，都会代理（proxy）这个端口到你的服务中，我们可以在spec.ports[*].nodePort 找到具体的值

如果我们向指定一个端口，我们可以直接写在nodePort上，系统就会给你指派指定端口，但是这个值必须是指定范围内的。

这样的话就能够让开发者搭配自己的负载均衡器，去撘建一个kubernete不是完全支持的系统，又或者是直接暴露一个node的ip地址

### Type LoadBalancer

在支持额外的负载均衡器的的平台上，将值设置为LoadBalancer会提供一个负载均衡器给你的服务，负载均衡器的创建其实是异步的。下面的例子

> {
>
> “kind”: “Service”,
>
> “apiVersion”: “v1″,
>
> “metadata”: {
>
> “name”: “my-service”
>
> },
>
> “spec”: {
>
> “selector”: {
>
> “app”: “MyApp”
>
> },
>
> “ports”: [
>
> {
>
> “protocol”: “TCP”,
>
> “port”: 80,
>
> “targetPort”: 9376,
>
> “nodePort”: 30061
>
> }
>
> ],
>
> “clusterIP”: “10.0.171.239”,
>
> “type”: “LoadBalancer”
>
> },
>
> “status”: {
>
> “loadBalancer”: {
>
> “ingress”: [
>
> {
>
> “ip”: “146.148.47.155”
>
> }
>
> ]
>
> }
>
> }
>
> }

所有服务的请求均会直接到到Pod,具体是如何工作的是由平台决定的

**缺点**

我们希望使用IPTABLES和用户命名空间来代理虚拟IP能在中小型规模的平台上正常运行，但是可能出现问题在比较大的平台上当应对成千上万的服务的时候。

这个时候，使用kube-proxy来封装服务的请求，这使得这些变成可能

LoadBalancers 只支持TCP，不支持UDP

Type 的值是设定好的，不同的值代表不同的功能，并不是所有的平台都需要的，但是是所有API需要的

## Future work

在将来，我们预想proxy的策略能够更加细致，不再是单纯的转发，比如master-elected or sharded，我们预想将来服务会拥有真正的负载均衡器，到时候虚拟IP直接转发到负载均衡器

将来有倾向与将所的工作均通过iptables来进行，从而小从用户命名空间代理，这样的话会有更好的性能和消除一些原地值IP的问题，尽管这样的会减少一些灵活性.

## 7.2  Service基本用法

## Service 基本用法

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app: webapp
  ports:
  - port: 80
    targetPort: 80
    protocol: TCP
    name: web
  - port: 8080
    targetPort: 8080
    name: management
    protocol: UDP
kubectl expose rc webapp
kubectl create -f someService.yaml
```

### 2.1 外部服务Service

通过创建一个不带标签选择器的 Service, 即无法选择后端的Pod, 系统不会自动创建 endpoint,
 因此需要手动创建一个和该Service同名的endpoint, 用于指向实际的后端访问地址.

```
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
---
apiVersion: v1
kind: Endpoints
metadata:
  name: my-service
subsets:
- addresses:
  - IP: 1.2.3.4
  ports:
  - port: 80
```

### 2.2 headless Service

有时,我们希望自己控制负载均衡的策略, kubernetes提供了 headless service,即不为 service 设置 clusterIP,仅通过 label selector 将后端的pod列表返回给调用的客户端.

```
apiVersion: v1
kind: Service
...
spec:
  clusterIP: None
...
```





## 7.3  集群外部访问Service

参考：<http://www.voidcn.com/article/p-mtzdtitz-brq.html>

由于Pod和Service是kubernetes集群范围内的虚拟概念，所以集群外的客户端系统无法通过Pod的IP地址或者Service的虚拟IP地址和虚拟端口号访问到它们。为了让外部客户端能够访问到这些服务，可以将Pod或Service的端口号映射到宿主机。

​    1.将容器应用的端口号映射到物理机

​      1）设置容器级别的hostPort，将容器应用的端口号映射到物理机

​      2）设置Pod级别的hostNetwork=true，该Pod中所有容器的端口号都将被直接映射到物理机上

​    2.将Service的端口号映射到物理机

​      1）设置nodePort映射到物理机，同时设置Service的类型为NodePort

​      2）设置LoadBalancer映射到云服务商提供的LoadBalancer地址

​    如果设置了Service的nodePort，那么集群会在每一个节点都监听设置的nodePort，外部客户端可以通过任意nodeIP:Port的方式对集群服务进行访问。但是当集群中服务较多，那么需要管理的端口也会比较多，各个端口之间不能冲突，比较麻烦；另外，因为方式访问形式为nodeIP:Port的方式，那么对于一些HTTP服务，这种方式是无法做到根据URL路径进行转发的。ingress是kubernetes V1.1版本之后新增的资源对象，用于实现HTTP层业务路由机制。

​    实现ingress路由机制主要包括3个组件：

​      1）ingress是kubernetes的一个资源对象，用于编写定义规则

​      2）反向代理负载均衡器，通常以Service的Port方式运行，接收并按照ingress定义的规则进行转发，通常为nginx，haproxy，traefik等，本文使用nginx

​      3）ingress-controller，监听apiserver，获取服务新增，删除等变化，并结合ingress规则动态更新到反向代理负载均衡器上，并重载配置使其生效

#### (1) 创建 Ingress Controller 和 默认的backend服务

在定义 Ingress策略之前,需要先创建 Ingress Controller, 为所有后端Service提供一个统一的入口.

Ingress Controller需要实现基于不同HTTP URL向后转发的负载分发规则, 并可以灵活设置7层的负载分发策略.

如果公有云服务商能够提供该类型的HTTP路由loadbalancer, 也可以将其设置为  Ingress Controller.

在kubernetes中, Ingress Controller 以 Pod 方式运行, 监控 apiserver 的 /ingress 接口后端的 backend services, 如果 service 发生变化, 则  Ingress Controller 应自动更新其转发规则.

下面的例子使用 nginx 来实现一个  Ingress Controller:

- 监听 apiserver, 获取全部 ingress 的定义
- 基于 ingress 的定义,生成 nginx 所需的配置文件 /etc/nginx/nginx.conf
- 执行 nginx -s reload 命令,重新加载 nginx.conf 配置文件内容.

## 7.4  代理模式与负载均衡

​	在Kubernetes集群中，每个Node运行一个kube-proxy进程。kube-proxy负责为Service实现一种VIP(虚拟IP)的形式，而不是ExternalName的形式。在Kubernetes v1.0版本中，代理完全在userspace。在Kubernetes v1.1版本中，新增了iptables代理，但并不是默认的运行模式。从Kubernetes v1.2起，默认就是iptables代理。在Kubernetes v1.8.0-beta.0中，添加了ipvs代理。在Kubernetes v1.0版本中，Service是“4层”(TCP/UDP over IP)概念。在Kubernetes v1.1版本中，新增了Ingress API(beta版)，用来表示“7层”(HTTP)服务。

​	kube-proxy这个组件始终监视着apiserver中有关service的变动信息，获取任何一个与service资源相关的变动状态，通过watch监视，一旦有servcie资源相关的变动和创建，kube-proxy都要转换为当前节点上的能够实现调度的规则(例如：iptables、ipvs)。

![service_proxy_mode](images/service_proxy_mode.png)



## userspace代理模式

这种模式下，当Client Pod请求内核空间的service ip后，把请求转到用户空间kube-porxy监听的端口，由kube-proxy处理后，再由kube-proxy将请求转给内核空间的service ip，再由service ip根据请求转给各节点中的service pod。

由此可见这个模式将流量反复的从用户空间进出内核空间，这样带来的性能损耗是非常大的。

![service_userspace](images/service_userspace.png)

## iptables代理模式

​	这种模式下，Client Pod直接请求本地内核service ip，根据iptables规则直接将请求转发到各pod上，因为使用iptable NAT来完成转发，也存在不可忽视的性能损耗。另外，如果集群中存在上万的Service/Endpoint，那么Node上的iptables rules将会非常庞大，性能还会再打折扣。

![service_iptables](images/service_iptables.png)

## ipvs代理模式

这种模式下，Client Pod请求到达内核空间时，根据ipvs规则直接分发到各Pod上。kube-proxy会监视Kubernetes Service对象和Endpoints，调用netlink接口以相应的创建ipvs规则并定期与Kubernetes Service对象和Endpoints对象同步ipvs规则，以确保ipvs状态与期望一致。访问服务时，流量将被重定向到其中一个后端Pod。
与iptables类似，ipvs基于netfilter的hook功能，但使用哈希表作为底层数据结构并在内核空间中工作。这意味着ipvs可以更快的重定向流量，并且在同步代理规则时具有更好的性能。此外，ipvs为负载均衡算法提供了更多选项，例如：

rr：轮询调度
lc：最小连接数
dh：目标哈希
sh：源哈希
sed：最短期望延迟
nq：不排队调度

注意： ipvs代理模式假定在运行kube-proxy之前在节点上都已经安装了IPVS内核模块。当kube-proxy以ipvs代理模式启动时，kube-proxy将验证节点上是否安装了IPVS模块，如果未安装，则kube-proxy将回退到iptables代理模式

![service_ipvs](images/service_ipvs.png)





**Headless Service**
有时不需要或不想要负载均衡，以及单独的Service IP。遇到这种情况，可以通过指定Cluster IP(spec.clusterIP)的值为“None”来创建Headless Service。
这个选项允许开发人员自由的寻找他们自己的方式，从而降低与Kubernetes系统的耦合性。应用仍然可以使用一种自注册的模式和适配器，对其他需要发现机制的系统能够很容易的基于这个API来构建。

对这类Service并不会分配Cluster IP，kube-proxy不会处理它们，而且平台也不会为它们进行负载均衡和路由。DNS如何实现自动配置，依赖于Service时候定义了selector。

```
（1）编写headless service配置清单
[root@k8s-master mainfests]# cp myapp-svc.yaml myapp-svc-headless.yaml 
[root@k8s-master mainfests]# vim myapp-svc-headless.yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-headless
  namespace: default
spec:
  selector:
    app: myapp
    release: canary
  clusterIP: "None"　　#headless的clusterIP值为None
  ports: 
  - port: 80
    targetPort: 80

（2）创建headless service 
[root@k8s-master mainfests]# kubectl apply -f myapp-svc-headless.yaml 
service/myapp-headless created
[root@k8s-master mainfests]# kubectl get svc
NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes       ClusterIP   10.96.0.1        <none>        443/TCP        36d
myapp            NodePort    10.101.245.119   <none>        80:30080/TCP   1h
myapp-headless   ClusterIP   None             <none>        80/TCP         5s
redis            ClusterIP   10.107.238.182   <none>        6379/TCP       2h

（3）使用coredns进行解析验证
[root@k8s-master mainfests]# dig -t A myapp-headless.default.svc.cluster.local. @10.96.0.10

; <<>> DiG 9.9.4-RedHat-9.9.4-61.el7 <<>> -t A myapp-headless.default.svc.cluster.local. @10.96.0.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 62028
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;myapp-headless.default.svc.cluster.local. IN A

;; ANSWER SECTION:
myapp-headless.default.svc.cluster.local. 5 IN A 10.244.1.18
myapp-headless.default.svc.cluster.local. 5 IN A 10.244.1.19
myapp-headless.default.svc.cluster.local. 5 IN A 10.244.2.15
myapp-headless.default.svc.cluster.local. 5 IN A 10.244.2.16
myapp-headless.default.svc.cluster.local. 5 IN A 10.244.2.17

;; Query time: 4 msec
;; SERVER: 10.96.0.10#53(10.96.0.10)
;; WHEN: Thu Sep 27 04:27:15 EDT 2018
;; MSG SIZE  rcvd: 349

[root@k8s-master mainfests]# kubectl get svc -n kube-system
NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)         AGE
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP   36d

[root@k8s-master mainfests]# kubectl get pods -o wide -l app=myapp
NAME                            READY     STATUS    RESTARTS   AGE       IP            NODE
myapp-deploy-69b47bc96d-4hxxw   1/1       Running   0          1h        10.244.1.18   k8s-node01
myapp-deploy-69b47bc96d-95bc4   1/1       Running   0          1h        10.244.2.16   k8s-node02
myapp-deploy-69b47bc96d-hwbzt   1/1       Running   0          1h        10.244.1.19   k8s-node01
myapp-deploy-69b47bc96d-pjv74   1/1       Running   0          1h        10.244.2.15   k8s-node02
myapp-deploy-69b47bc96d-rf7bs   1/1       Running   0          1h        10.244.2.17   k8s-node02

（4）对比含有ClusterIP的service解析
[root@k8s-master mainfests]# dig -t A myapp.default.svc.cluster.local. @10.96.0.10

; <<>> DiG 9.9.4-RedHat-9.9.4-61.el7 <<>> -t A myapp.default.svc.cluster.local. @10.96.0.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 50445
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;myapp.default.svc.cluster.local. IN    A

;; ANSWER SECTION:
myapp.default.svc.cluster.local. 5 IN    A    10.101.245.119

;; Query time: 1 msec
;; SERVER: 10.96.0.10#53(10.96.0.10)
;; WHEN: Thu Sep 27 04:31:16 EDT 2018
;; MSG SIZE  rcvd: 107

[root@k8s-master mainfests]# kubectl get svc
NAME             TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
kubernetes       ClusterIP   10.96.0.1        <none>        443/TCP        36d
myapp            NodePort    10.101.245.119   <none>        80:30080/TCP   1h
myapp-headless   ClusterIP   None             <none>        80/TCP         11m
redis            ClusterIP   10.107.238.182   <none>        6379/TCP       2h

```

从以上的演示可以看到对比普通的service和headless service，headless service做dns解析是直接解析到pod的，而servcie是解析到ClusterIP的，那么headless有什么用呢？这将在statefulset中应用到，这里暂时仅仅做了解什么是headless service和创建方法。





 	service类型：

​    a)、ExternalName：表示把集群外部的服务引入到集群内部中来，即实现了集群内部pod和集群外部的服务进行通信；

​    b）、ClusterIP：只能在集群内部通讯；

​    c）、NodePort：可以和集群外部通讯；

​    d）、LoadBalancer：这个表示我们把k8s部署在虚拟机上，自动在外部创建负载均衡器。比如在阿里云上，底层是LBAAS。

# ClusterIP

​    以前我们使用kubectl expose创建service，下面我们使用清单来创建service。

```
[root@master manifests]``# cat redis-svc.yaml
apiVersion: v1
kind: Service
metadata:
  ``name: redis
  ``namespace: default
spec:
  ``selector:
    ``app: redis
    ``role: logstor
  ``clusterIP: ``10.97``.``97.97` `#这个ip可以不指定，让它自动分配
  ``type``: ClusterIP
  ``ports:
  ``-` `port: ``6379` `#service ip中的端口
    ``targetPort: ``6379` `#容器ip中的端口
```

```
[root@master manifests]``# kubectl apply -f redis-svc.yaml
service``/``redis created
```

```
[root@master manifests]# kubectl get svc
NAME         TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
kubernetes   ClusterIP   10.96.0.1     <none>        443/TCP    16d
redis        ClusterIP   10.97.97.97   <none>        6379/TCP   1m

```

```
[root@master manifests]# kubectl describe svc redis
Name:              redis
Namespace:         default
Labels:            <none>
Annotations:       kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"redis","namespace":"default"},"spec":{"clusterIP":"10.97.97.97","ports":[{"por...
Selector:          app=redis,role=logstor
Type:              ClusterIP
IP:                10.97.97.97
Port:              <unset>  6379/TCP
TargetPort:        6379/TCP
Endpoints:         10.244.2.65:6379  ##这是pod的ip
Session Affinity:  None
Events:            <none>
```

资源记录：SVC_NAME.NAMESPACE_NAME.DOMAIN.LTD 

 集群默认后缀是svc.cluster.local 

比如我们创建的redis默认名称就是redis.defalut.svc.cluster.local

# NodePort 

访问路径：client---->NodeIP:NodePoint----->ClusterIP:ServerPort---->PodIP:containerPort

```
[root@master manifests]``# cat myapp-svc.yaml
apiVersion: v1
kind: Service
metadata:
  ``name: myapp
  ``namespace: default
spec:
  ``selector:
    ``app: myapp
    ``release: canary
  ``clusterIP: ``10.99``.``99.99` `#这个ip可以不指定，让他自动分配
  ``type``: NodePort
  ``ports:
  ``-` `port: ``80` `#service ip的端口
    ``targetPort: ``80` `#容器ip的端口
    ``nodePort: ``30080` `#node节点上端口,这个端口也可以不指定，会自动分配端口
```

```
[root@master manifests]``# kubectl apply -f myapp-svc.yaml
service``/``myapp created
```

```
[root@master manifests]# kubectl get svc
NAME         TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1     <none>        443/TCP        16d
myapp        NodePort    10.99.99.99   <none>        80:30080/TCP   44s
redis        ClusterIP   10.97.97.97   <none>        6379/TCP       15m
```

```
[root@master manifests]# curl http://172.16.1.101:30080/hostname.html
myapp-deploy-69b47bc96d-79fqh
[root@master manifests]# curl http://172.16.1.101:30080/hostname.html
myapp-deploy-69b47bc96d-tc54k
```

注意：172.16.1.101是Node节点的Ip，并且可以看到访问是做了负载均衡的

下面我们再把来自同一个客户端会话请求用sessionAffinity粘滞到一个固定的pod上，这样就不会出现负载均衡现象了，相当于nginx的 ip_hash功能，如下：

```
[root@master manifests]# kubectl patch svc myapp -p '{"spec":{"sessionAffinity":"ClientIP"}}'
service/myapp patched
```

上面打的补丁也可以直接用edit方法编辑。

```
[root@master manifests]# kubectl describe svc myapp
Session Affinity:         ClientIP
```

```
再改回负载均衡模式：
[root@master manifests]# kubectl patch svc myapp -p '{"spec":{"sessionAffinity":"None"}}'
service/myapp patched
```

# 无头service 

​    我们前面介绍的service是service name解析为cluster ip，然后cluster ip对应到后面的pod ip。 

​    而无头service是指service name 直接解析为后面的pod ip。 

​    无头就是没有cluster ip了。 

```
[root@master manifests]# cat myapp-svc-headless.yaml
apiVersion: v1
kind: Service
metadata:
  name: myapp-svc
  namespace: default
spec:
  selector:
    app: myapp #挑选的pod还是myapp。一个pod可以有多个service
    release: canary
  clusterIP: None #None表示是无头service
  ports:
  - port: 80 #service ip中的端口
    targetPort: 80 #容器ip中的端口
```

```
[root@master manifests]# kubectl apply -f myapp-svc-headless.yaml
service/myapp-svc created
```

```
[root@master manifests]# kubectl get svc
NAME         TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1     <none>        443/TCP        16d
myapp        NodePort    10.99.99.99   <none>        80:30080/TCP   1h
myapp-svc    ClusterIP   None          <none>        80/TCP         28s
redis        ClusterIP   10.97.97.97   <none>        6379/TCP       1h
```

看到上面myapp-svc的cluster-ip是空，这就是无头service。

```
[root@master manifests]# kubectl get svc -n kube-system
NAME       TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)         AGE
kube-dns   ClusterIP   10.96.0.10   <none>        53/UDP,53/TCP   16d
```

可以看到coreDNS的地址是10.96.0.10

```
[root@master manifests]# dig -t A myapp-svc.default.svc.cluster.local. @10.96.0.10
; <<>> DiG 9.9.4-RedHat-9.9.4-61.el7_5.1 <<>> -t A myapp-svc.default.svc.cluster.local. @10.96.0.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 10702
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1
;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;myapp-svc.default.svc.cluster.local. INA
;; ANSWER SECTION:
myapp-svc.default.svc.cluster.local. 5 IN A10.244.1.63
myapp-svc.default.svc.cluster.local. 5 IN A10.244.2.51
;; Query time: 0 msec
;; SERVER: 10.96.0.10#53(10.96.0.10)
;; WHEN: Mon Sep 24 00:22:07 EDT 2018
;; MSG SIZE  rcvd: 166
```

```
[root@master manifests]``# kubectl get pods -o wide -l app=myapp
NAME                            READY     STATUS    RESTARTS   AGE       IP            NODE
myapp``-``deploy``-``69b47bc96d``-``79fqh`   `1``/``1`       `Running   ``0`          `1d`        `10.244``.``1.63`   `node1
myapp``-``deploy``-``69b47bc96d``-``tc54k   ``1``/``1`       `Running   ``0`          `1d`        `10.244``.``2.51`   `node2
```

上面看到无头service name直接被解析到另个pod上的ip了。

# ExternalName

​    我们可以用ExternalName对Service名称和集群外部服务地址做一个映射，使之访问Service名称就是访问外部服务。例如下面的例子是将 svc1 和 xxx.xxx.xxx.xxx 做了对等关系。

```
kind: Service
apiVersion: v1
metadata:
  name: svc1
  namespace: default
spec:
  type: ExternalName
  externalName: somedomain.org
```

不过，ExternalName 类型的服务适用于外部服务使用域名的方式，缺点是不能指定端口。

​    另外，要实现集群内访问集群外服务的这个需求，也是非常简单的。因为集群内的Pod会继承Node上的DNS解析规则。因此只要Node可以访问的服务，Pod中也可以访问到

参考：<https://www.cnblogs.com/dribs/p/10281018.html>

## 7.5  服务发现

如果某一个服务后端pod发生变化，标签选择器适应的pod又多一个，适应的信息会立即反映到apiserver上，而kube-proxy一定可以watch到etcd中的信息变化，而将它立即转为ipvs或iptables规则中，这一切都是动态和实时的，删除一个pod也是同样的原理。如图：

![service_discory](images/service_discory.png)

参考：<https://blog.csdn.net/clouduncle/article/details/82937342>

## 7.6  内部DNS服务

DNS服务监视Kubernetes API，为每一个Service创建DNS记录用于域名解析。

DNS，全名为 Domain Name System。DNS 会有一张表格，记录每个 domain name 相对应的 IP 位址。如此，我们不再需要去记录该服务的 IP address，而是可以透过该服务的域名来连接到该服务。以 www.google.com.tw 为例，当我们在浏览器输入 www.google.com.tw 时，DNS会帮我们找到该域名相对应的 IP，并连接到该服务.

 从Kubernetes 1.10开始，在安装时将默认的DNS服务切换为CoreDNS



# 8.kubernetes ingress与Ingress Controller

## 8.1  Ingress介绍

## 什么是Ingress？

通常情况下，service和pod的IP仅可在集群内部访问。集群外部的请求需要通过负载均衡转发到service在Node上暴露的NodePort上，然后再由kube-proxy将其转发给相关的Pod。

而Ingress就是为进入集群的请求提供路由规则的集合，如下图所示

```
    internet
        |
   [ Ingress ]
   --|-----|--
   [ Services ]
```

Ingress可以给service提供集群外部访问的URL、负载均衡、SSL终止、HTTP路由等。为了配置这些Ingress规则，集群管理员需要部署一个[Ingress controller](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-controllers)，它监听Ingress和service的变化，并根据规则配置负载均衡并提供访问入口。

## Ingress格式

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: test-ingress
spec:
  rules:
  - http:
      paths:
      - path: /testpath
        backend:
          serviceName: test
          servicePort: 80
```

每个Ingress都需要配置rules，目前Kubernetes仅支持http规则。上面的示例表示请求/testpath时转发到服务test的80端口。

根据Ingress Spec配置的不同，Ingress可以分为以下几种类型：

### 单服务Ingress

单服务Ingress即该Ingress仅指定一个没有任何规则的后端服务。

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: test-ingress
spec:
  backend:
    serviceName: testsvc
    servicePort: 80
```

> 注：单个服务还可以通过设置Service.Type=NodePort或者Service.Type=LoadBalancer来对外暴露。

### 路由到多服务的Ingress

路由到多服务的Ingress即根据请求路径的不同转发到不同的后端服务上，比如

```
foo.bar.com -> 178.91.123.132 -> / foo    s1:80
                                 / bar    s2:80
```

可以通过下面的Ingress来定义：

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: test
spec:
  rules:
  - host: foo.bar.com
    http:
      paths:
      - path: /foo
        backend:
          serviceName: s1
          servicePort: 80
      - path: /bar
        backend:
          serviceName: s2
          servicePort: 80
```

使用kubectl create -f创建完ingress后：

```
$ kubectl get ing
NAME      RULE          BACKEND   ADDRESS
test      -
          foo.bar.com
          /foo          s1:80
          /bar          s2:80
```

### 虚拟主机Ingress

虚拟主机Ingress即根据名字的不同转发到不同的后端服务上，而他们共用同一个的IP地址，如下所示

```
foo.bar.com --|                 |-> foo.bar.com s1:80
              | 178.91.123.132  |
bar.foo.com --|                 |-> bar.foo.com s2:80
```

下面是一个基于[Host header](https://tools.ietf.org/html/rfc7230#section-5.4)路由请求的Ingress：

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: test
spec:
  rules:
  - host: foo.bar.com
    http:
      paths:
      - backend:
          serviceName: s1
          servicePort: 80
  - host: bar.foo.com
    http:
      paths:
      - backend:
          serviceName: s2
          servicePort: 80
```

> 注：没有定义规则的后端服务称为默认后端服务，可以用来方便的处理404页面。

### TLS Ingress

TLS Ingress通过Secret获取TLS私钥和证书(名为tls.crt和tls.key)，来执行TLS终止。如果Ingress中的TLS配置部分指定了不同的主机，则它们将根据通过SNI TLS扩展指定的主机名（假如Ingress controller支持SNI）在多个相同端口上进行复用。

定义一个包含tls.crt和tls.key的secret：

```
apiVersion: v1
data:
  tls.crt: base64 encoded cert
  tls.key: base64 encoded key
kind: Secret
metadata:
  name: testsecret
  namespace: default
type: Opaque
```

Ingress中引用secret：

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: no-rules-map
spec:
  tls:
    - secretName: testsecret
  backend:
    serviceName: s1
    servicePort: 80
```

注意，不同Ingress controller支持的TLS功能不尽相同。 请参阅有关[nginx](https://github.com/kubernetes/ingress/blob/master/controllers/nginx/README.md#https)，[GCE](https://github.com/kubernetes/ingress/blob/master/controllers/gce/README.md#tls)或任何其他Ingress controller的文档，以了解TLS的支持情况。

## 更新Ingress

可以通过kubectl edit ing name的方法来更新ingress：

```
$ kubectl get ing
NAME      RULE          BACKEND   ADDRESS
test      -                       178.91.123.132
          foo.bar.com
          /foo          s1:80
$ kubectl edit ing test
```

这会弹出一个包含已有IngressSpec yaml文件的编辑器，修改并保存就会将其更新到kubernetes API server，进而触发Ingress Controller重新配置负载均衡：

```
spec:
  rules:
  - host: foo.bar.com
    http:
      paths:
      - backend:
          serviceName: s1
          servicePort: 80
        path: /foo
  - host: bar.baz.com
    http:
      paths:
      - backend:
          serviceName: s2
          servicePort: 80
        path: /foo
..
```

更新后：

```
$ kubectl get ing
NAME      RULE          BACKEND   ADDRESS
test      -                       178.91.123.132
          foo.bar.com
          /foo          s1:80
          bar.baz.com
          /foo          s2:80
```

当然，也可以通过kubectl replace -f new-ingress.yaml命令来更新，其中new-ingress.yaml是修改过的Ingress yaml。

## 8.2  Ingress Nginx部署 

**使用 NGINX 的 Ingress Controller 进行 Kubernetes 的负载均衡**

运行和管理跨机器集群的大规模的容器微服务应用是一个极具挑战的任务。Kubernetes 提供了一个强大的容器编排解决方案，从而帮助我们迎接这个挑战。它包含了一些重要特性，比如容错，自动伸缩，滚动升级，存储，服务发现，以及负载均衡。

本文讲解了如何使用开源 NGINX 软件或者 NGINX Plus，以及 Ingress 这个 Kubernetes 自带的负载均衡框架，对 HTTP 流量进行负载均衡。Ingress 能让我们配置规则，从而控制外部流向 Kubernetes 集群内的服务的流量。你可以选择任何能提供 *Ingress controller* 的负载均衡器，Ingress controller 指的是部署在集群内的软件，它使得 Kubernetes 和负载均衡器融为一体。这里我们将展示如何利用 Ingress 以及我们之前介绍过的 NGINX Plus Ingress controller 和 NGINX Ingress controller，对一个微服务应用进行负载均衡。

本文只介绍使用 Ingress 对 Kubernetes 进行 HTTP 的负载均衡，要学习更多有关其它负载均衡的选项，请看另一片博文：《使用 NGINX Plus 对 Kubernetes 服务进行负载均衡》（http://dockone.io/article/957）。

**注意**：文中讨论的程序的完整指令，可在我们的 GitHub 仓库上找到。本文不会遍历所有必要步骤，而是只提供那些步骤的链接。

NGINX 和 NGINX Plus 的 Ingress Controllers

![img](http://mmbiz.qpic.cn/mmbiz_png/b2YlTLuGbKAqFgpSGeW7gPVFkXF48zOhLx8tfDUlzrcGxiabTPKHfe9FrslAWqnnueY9cVTuictVMxbjBxrj12vQ/640?)

在我们部署示例应用并为它配置负载均衡前，我们必须选择一个负载均衡器并部署相应的 Ingress controller。

一个 Ingress controller 是能将一个特定的负载均衡器和 Kubernetes 整合在一起的软件。我们已经为开源的 NGINX 和 NGINX Plus 开发了相应的 Ingress controller，它们可在我们的 GitHub 仓库（https://github.com/nginxinc/kubernetes-ingress）取到。其它实现也有，你可以去 Kubernetes GitHub 仓库上的 Ingress Controllers页面了解。

关于集群内部署 NGINX Plus Ingress controller 的完整命令，可以去我们的 GitHub 仓库查看。

微服务示例应用

![img](http://mmbiz.qpic.cn/mmbiz_png/b2YlTLuGbKAqFgpSGeW7gPVFkXF48zOhLx8tfDUlzrcGxiabTPKHfe9FrslAWqnnueY9cVTuictVMxbjBxrj12vQ/640?)

我们的示例应用是一个典型的微服务 web 应用，它由多个独立部署的服务组成。这个名叫 cafe 的应用，可通过 tea 服务订购茶叶，或者通过 coffee 服务订购咖啡。你可以通过 HTTP 请求的 URI 来表明你的饮料偏好：以 /tea 结尾的 URI 将提供茶叶，以 /coffee 结尾的 URI 将提供咖啡。这个应用必须通过 SSL/TLS 进行安全连接。

下图从概念上描述了整个应用，图中 NGINX Plus 这个负载均衡器扮演了一个重要角色，它路由客户端请求到合适的服务，并保证了安全的客户端连接。

![nginx_ingress](images/nginx_ingress.jpg)

我们的 cafe 应用要求负载均衡器提供两个功能：

- 基于请求的 URI 来路由（也叫基于路径的路由）
- SSL/TLS 终端

用 Ingress 来配置负载均衡，你得在 *Ingress 资源*里配置规则。这些规则指定如何路由外部流量到集群内的服务。

在资源内你可以定义多个虚拟服务器，每个服务器对应不同的域名。一个虚拟服务器通常对应集群内的一个单一微服务应用。对每个服务器，你可以：

- 指定多个基于路径的规则。流量基于请求URI 发送到应用内的不同服务。
- 通过引用一个SSL/TLS证书和密钥来建立SSL/TLS终端。

你可以在 Ingress 文档页面（https://kubernetes.io/docs/user-guide/ingress/）上查看更多详细解释的例子。

下面是 cafe 应用的 Ingress 资源文件（cafe-ingress.yaml）：

```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
 name: cafe-ingress
spec:
 tls:
 - hosts:
   - cafe.example.com
   secretName: cafe-secret
  rules:
  - host: cafe.example.com
    http:
      paths:
      - path: /tea
        backend:
          serviceName: tea-svc
          servicePort: 80
      - path: /coffee
        backend:
          serviceName: coffee-svc
          servicePort: 80
```

一行一行过，我们看到：

第 4 行我们命名该资源为 cafe-ingress。

第6-9行我们建立SSL/TLS终端：

- 第 9 行我们通过名字 cafe-secret 来引用一个 Secret 资源。这个资源包含SSL/TLS证书和密钥，并且必须在Ingress 资源前部署。
- 第8 行我们把这个证书和密钥用到我们的 cafe.example.com 这个虚拟服务器上。

第 11 行我们定义了一个虚拟服务器，域名为 cafe.example.com。

第 13-21 行我们定义了两个基于路径的规则：

- 第 14-17 行定义的规则要求负载均衡器分发带 /tea URI 的请求到 tea 服务的容器内，这个服务以 tea-svc 名字部署在集群内。
- 第 18-21 行定义的规则要求负载均衡器分发带 /coffee URI 的请求到 coffee 服务的容器内，这个服务以 coffee-svc 名字部署在集群内。
- 两条规则都要求负载均衡器分发请求到对应服务的80端口上。

集群内部署 Ingress 和 Secret 资源的完整命令，请参考GitHub仓库。







## 8.3  Ingress Controller使用

Ingress 为 Kubernetes 集群中的服务提供了外部入口以及路由，而 Ingress Controller
监测 Ingress 和 Service 资源的变更并根据规则配置负载均衡、路由规则和 DNS 等并提
供访问入 

如何开发 Ingress Controller 扩展
NGINX Ingress Controller 和 GLBC 提供了两个 Ingress Controller 的完整示例，可以在
此基础上方便的开发新的 Ingress Controller。
常见 Ingress Controller

- Nginx Ingress

```
helm install stable/nginx-ingress --name nginx-ingress --set rbac.create=true 
```

HaProxy Ingress Controller

Linkerd 

traefik

AWS Application Load Balancer Ingress Controller

kube-ingress-aws-controller

Voyager:Haproxy Ingress Controller

## 8.4  Ingress http与https网站测试 

示例

# 9.Kubernetes核心原理

就像Linux拥有内核（kernel）、核心系统类库、和可选的用户级工具，kubernetes也拥有功能和工具的层次。对于开发者来说，理解这些层次是非常重要的。kubernetes APIs、概念和功能都在下面的层级图中得到体现。

![K8s_layer_architecture](images/K8s_layer_architecture.png)

## **2.1** **核心层：API和执行（The Nucleus: API and Execution）**

**核心层包含最核心的API和执行机。**

这些API和功能由上游的kubernetes代码库实现，由最小特性集和概念集所组成，这些特征和概念是系统上层所必需的。

这些由上游KubNeNETs代码库实现的API和函数包括建立系统的高阶层所需的最小特征集和概念集。这些内容被明确的地指定和记录，并且每个容器化的应用都会使用它们。开发人员可以安全地假设它们是一直存在的，这些内容应该是稳定和乏味的。

### **2.1.1 API****和集群控制面板**

Kubernetes集群提供了类似REST API的集，通过Kubernetes API server对外进行暴露，支持持久化资源的增删改查操作。这些API作为控制面板的枢纽。

遵循Kubernetes API约定(路径约定、标准元数据等)的REST API能够自动从共享API服务(认证、授权、审计日志)中收益，通用客户端代码能够与它们进行交互。

作为系统的最底层，需要支持必要的扩展机制，以支持高层添加功能。另外，需要支持单租户和多租户的应用场景。核心层也需要提供足够的弹性，以支持高层能扩展新的范围，而不需要在安全模式方面进行妥协。

如果没有下面这些基础的API机和语义，Kubernetes将不能够正常工作：

- **认证（Authentication）****:** **认证机制是非常关键的一项工作，在Kubernetes中需要通过服务器和客户端双方的认证通过。API server 支持基本****认证模式 (用户命名/密码) (注意，在将来会被放弃)， X.509客户端证书模式，OpenID连接令牌模式，和不记名令牌模式****。通过kubeconfig支持，客户端能够使用上述各种认证模式。第三方认证系统可以实现TokenReview API，并通过配置认证webhook来调用，通过非标准的认证机制可以限制可用客户端的数量。**

- - The TokenReview API (与hook的机制一样) 能够启用外部认证检查，例如Kubelet
  - Pod身份标识通过”[service accounts](https://kubernetes.io/docs/user-guide/service-accounts/)“提供

- - - The ServiceAccount API，包括通过控制器创建的默认ServiceAccount保密字段，并通过接入许可控制器进行注入。

- **授权（Authorization）****：第三方授权系统可以实现SubjectAccessReview API，并通过配置授权webhook进行调用。**

- - SubjectAccessReview (与hook的机制一样), LocalSubjectAccessReview, 和SelfSubjectAccessReview APIs能启用外部的许可检查，诸如Kubelet和其它控制器。

- **REST** **语义、监控、持久化和一致性保证、API版本控制、违约、验证**

- - NIY：需要被解决的API缺陷：

- - - 混淆违约行为
    - 缺少保障
    - 编排支持
    - 支持事件驱动的自动化
    - 干净卸载

- NIY： 内置的准入控制语义、同步准入控制钩子、异步资源初始化 — 发行商系统集成商，和集群管理员实现额外的策略和自动化
- NIY：API注册和发行、包括API聚合、注册额外的API、发行支持的API、获得支持的操作、有效载荷和结果模式的详细信息。
- NIY：ThirdPartyResource和ThirdPartyResourceData APIs (或她们的继承者)，支持第三方存储和扩展API。
- NIY：The Componentstatuses API的可扩展和高可用的替代，以确定集群是否完全体现和操作是否正确：ExternalServiceProvider (组件注册)
- The Endpoints API，组件增持需要，API服务器端点的自我发布，高可用和应用层目标发行
- The Namespace API，用户资源的范围，命名空间生命周期(例如：大量删除)
- The Event API，用于对重大事件的发生进行报告，例如状态改变和错误，以及事件垃圾收集
- NIY：级联删除垃圾收集器、finalization, 和orphaning
- NIY： 需要内置的add-on的管理器 ，从而能够自动添加自宿主的组件和动态配置到集群，在运行的集群中提取出功能。

- - Add-ons应该是一个集群服务，作为集群的一部分进行管理
  - 它们可以运行在kube-system命名空间，这么就不会与用户的命名进行冲突

- **API server****作为集群的网关****。根据定义，API server必需能够被集群外的客户端访问，而Node和Pod是不被集群外的客户端访问的。客户端认证API server，并使用API server作为堡垒和代理/通道来通过/proxy和/portforward API访问Node和Pod等Clients authenticate the API server and also use it**
- TBD：The [CertificateSigningRequest](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/cluster-lifecycle/kubelet-tls-bootstrap.md) API，能够启用认证创建，特别是kubele证书。

理想情况下，核心层API server江仅仅支持最小的必需的API，额外的功能通过聚合、钩子、初始化器、和其它扩展机制来提供。注意，中心化异步控制器以名为Controller Manager的独立进程运行，例如垃圾收集。

API server依赖下面的外部组件：

- 持久化状态存储 (etcd，或相对应的其它系统；可能会存在多个实例)

API server可以依赖：

- 身份认证提供者
- The TokenReview API实现者 实现者
- The SubjectAccessReview API实现者

### **2.1.2** **执行**

在Kubernetes中最重要的控制器是kubelet，它是Pod和Node API的主要实现者，没有这些API的话，Kubernetes将仅仅只是由键值对存储（后续，API机最终可能会被作为一个独立的项目）支持的一个增删改查的REST应用框架。

Kubernetes默认执行独立的应用容器和本地模式。

Kubernetes提供管理多个容器和存储卷的Pod，Pod在Kubernetes中作为最基本的执行单元。

Kubelet API语义包括：

- The Pod API，Kubernetes执行单元，包括：

- - Pod可行性准入控制基于Pod API中的策略(资源请求、Node选择器、node/pod affinity and anti-affinity, taints and tolerations)。API准入控制可以拒绝Pod或添加额外的调度约束，但Kubelet才是决定Pod最终被运行在哪个Node上的决定者，而不是schedulers or DaemonSets。
  - 容器和存储卷语义和生命周期
  - Pod IP地址分配(每个Pod要求一个可路由的IP地址)
  - 将Pod连接至一个特定安全范围的机制(i.e., ServiceAccount)
  - 存储卷来源：

- - - emptyDir
    - hostPath
    - secret
    - configMap
    - downwardAPI
    - NIY：容器和镜像存储卷 (and deprecate gitRepo)
    - NIY：本地存储，对于开发和生产应用清单不需要复杂的模板或独立配置
    - flexVolume (应该替换内置的cloud-provider-specific存储卷)

- - 子资源：绑定、状态、执行、日志、attach、端口转发、代理

- NIY：可用性和引导API 资源检查点
- 容器镜像和日志生命周期
- The Secret API，启用第三方加密管理
- The ConfigMap API，用于组件配置和Pod引用
- The Node API，Pod的宿主

- - 在一些配置中，可以仅仅对集群管理员可见

- Node和pod网络，业绩它们的控制(路由控制器)
- Node库存、健康、和可达性(node控制器)

- - Cloud-provider-specific node库存功能应该被分成特定提供者的控制器

- pod终止垃圾收集
- 存储卷控制器

- - Cloud-provider-specific attach/detach逻辑应该被分成特定提供者的控制器，需要一种方式从API中提取特定提供者的存储卷来源。

- The PersistentVolume API

- - NIY：至少被本地存储所支持

- The PersistentVolumeClaim API

中心化异步功能，诸如由Controller Manager执行的pod终止垃圾收集。

当前，控制过滤器和kubelet调用“云提供商”接口来询问来自于基础设施层的信息，并管理基础设施资源。然而，kubernetes正在努力将这些触摸点（问题）提取到外部组件中，不可满足的应用程序/容器/OS级请求（例如，PODS，PersistentVolumeClaims）作为外部“动态供应”系统的信号，这将使基础设施能够满足这些请求，并使用基础设施资源（例如，Node、和PersistentVolumes）在Kubernetes进行表示，这样Kubernetes可以将请求和基础设施资源绑定在一起。

对于kubelet，它依赖下面的可扩展组件：

- 镜像注册
- 容器运行时接口实现
- 容器网络接口实现
- FlexVolume 实现（”CVI” in the diagram）

以及可能依赖：

- NIY：第三方加密管理系统(例如：Vault)
- NIY：凭证创建和转换控制器

## **2.2** **应用层：部署和路由**

应用管理和组合层，提供**自愈、扩容、应用生命周期管理、服务发现、负载均衡和路由**— 也即服务编排和service fabric。这些API和功能是所有Kubernetes分发所需要的，Kubernetes应该提供这些API的默认实现，当然可以使用替代的实现方案。没有应用层的API，大部分的容器化应用将不能运行。

Kubernetes’s API提供类似IaaS的以容器为中心的基础单元，以及生命周期控制器，以支持所有工作负载的编排(自愈、扩容、更新和终止)。这些应用管理、组合、发现、和路由API和功能包括：

- 默认调度，在Pod API中实现调度策略：资源请求、nodeSelector、node和pod affinity/anti-affinity、taints and tolerations. 调度能够作为一个独立的进度在集群内或外运行。
- NIY：重新调度器 ，反应和主动删除已调度的POD，以便它们可以被替换并重新安排到其他Node
- 持续运行应用：这些应用类型应该能够通过声明式更新、级联删除、和孤儿/领养支持发布(回滚)。除了DaemonSet，应该能支持水平扩容。

- - The Deployment API，编排更新无状态的应用，包括子资源(状态、扩容和回滚)
  - The DaemonSet API，集群服务，包括子资源(状态)
  - The StatefulSet API，有状态应用，包括子资源(状态、扩容)
  - The PodTemplate API，由DaemonSet和StatefulSet用来记录变更历史

- 终止批量应用：这些应该包括终止jobs的自动剔除(NIY)

- - The Job API ([GC discussion](https://github.com/kubernetes/kubernetes/issues/30243))
  - The CronJob API

- 发现、负载均衡和路由

- - The Service API，包括集群IP地址分配，修复服务分配映射，通过kube-proxy或者对等的功能实现服务的负载均衡，自动化创建端点，维护和删除。NIY：负载均衡服务是可选的，如果被支持的化，则需要通过一致性的测试。
  - The Ingress API，包括[internal L7](https://docs.google.com/document/d/1ILXnyU5D5TbVRwmoPnC__YMO9T5lmiA_UiU8HtgSLYk/edit?ts=585421fc) (NIY)
  - 服务DNS。DNS使用[official Kubernetes schema](https://git.k8s.io/dns/docs/specification.md)。

应用层可以依赖：

- 身份提供者 (集群的身份和/或应用身份)
- NIY：云提供者控制器实现
- Ingress controller(s)
- 调度器和重新调度器的替代解决方案
- DNS服务替代解决方案
- kube-proxy替代解决方案
- 工作负载控制器替代解决方案和/或辅助，特别是用于扩展发布策略

## **2.3** **治理层：自动化和策略执行**

策略执行和高层自动化。这些API和功能是运行应用的可选功能，应该挺其它的解决方案实现。

每个支持的API/功能应用作为企业操作、安全和治理场景的一部分。

需要为集群提供可能的配置和发现默认策略，至少支持如下的用例：

- - 单一租户/单一用户集群
  - 多租户集群
  - 生产和开发集群
  - Highly tenanted playground cluster
  - 用于将计算/应用服务转售给他人的分段集群

- 需要关注的内容：

- - 资源使用
  - Node内部分割
  - 最终用户
  - 管理员
  - 服务质量（DoS）

自动化APIs和功能：

- 度量APIs (水平/垂直自动扩容的调度任务表)
- 水平Pod自动扩容API
- NIY：垂直Pod自动扩容API(s)
- 集群自动化扩容和Node供应
- The PodDisruptionBudget API
- 动态存储卷供应，至少有一个出厂价来源类型

- - The StorageClass API，至少有一个默认存储卷类型的实现

- 动态负载均衡供应
- NIY：[PodPreset](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/service-catalog/pod-preset.md) API
- NIY：[service broker/catalog](https://github.com/kubernetes-incubator/service-catalog) APIs
- NIY：[Template](https://github.com/kubernetes/community/blob/master/contributors/design-proposals/apps/OBSOLETE_templates.md)和TemplateInstance APIs

策略APIs和功能：

- 授权：ABAC和RBAC授权策略方案

- - RBAC，实现下面的API：Role, RoleBinding, ClusterRole, ClusterRoleBinding

- The LimitRange API
- The ResourceQuota API
- The PodSecurityPolicy API
- The ImageReview API
- The NetworkPolicy API

管理层依赖：

- 网络策略执行机制
- 替换、水平和垂直Pod扩容
- 集群自动扩容和Node提供者
- 动态存储卷提供者
- 动态负载均衡提供者
- 度量监控pipeline，或者它的替换
- 服务代理

## **2.4** **接口层：类库和工具**

这些机制被建议用于应用程序版本的分发，用户也可以用其进行下载和安装。它们包括Kubernetes官方项目开发的通用的类库、工具、系统、界面，它们可以用来发布。

- **Kubectl — kubectl****作为很多客户端工具中的一种，Kubernetes的目标是使Kubectl更薄，通过将常用的非平凡功能移动到API中。这是必要的，以便于跨Kubernetes版本的正确操作，并促进API的扩展性，以保持以API为中心的Kubernetes生态系统模型，并简化其它客户端，尤其是非GO客户端。**
- **客户端类库(例如：client-go, client-python)**
- **集群联邦(API server, controllers, kubefed)**
- **Dashboard**
- **Helm**

这些组件依赖：

- Kubectl扩展
- Helm扩展

## **2.5** **生态**

在有许多领域，已经为Kubernetes定义了明确的界限。虽然，Kubernetes必须提供部署和管理容器化应用需要的通用功能。但作为一般规则，在对Kubernete通用编排功能进行补足的功能领域，Kubernetes保持了用户的选择。特别是那些有自己的竞争优势的区域，特别是能够满足不同需求和偏好的众多解决方案。Kubernetes可以为这些解决方案提供插件API，或者可以公开由多个后端实现的通用API，或者公开此类解决方案可以针对的API。有时，功能可以与Kubernetes干净地组合在而不需要显式接口。

此外，如果考虑成为Kubernetes的一部分，组件就需要遵循Kubernetes设计约定。例如，主要接口使用特定域语言的系统（例如，Puppet、Open Policy Agent）与Kubenetes API的方法不兼容，可以与Kubernetes一起使用，但不会被认为是Kubernetes的一部分。类似地，被设计用来支持多平台的解决方案可能不会遵循Kubernetes API协议，因此也不会被认为是Kubernetes的一部分。

- **内部的容器镜像：Kubernetes不提供容器镜像的内容。 如果某些内容被设计部署在容器镜像中，则其不应该直接被考虑作为Kubernetes的一部分。例如，基于特定语言的框架。**
- **在Kubernetes的顶部**

- - **持久化集成和部署(CI/CD)：Kubernetes不提供从源代码到镜像的能力。Kubernetes 不部署源代码和不构建应用。用户和项目可以根据自身的需要选择持久化集成和持久化部署工作流，Kubernetes的目标是方便CI/CD的使用，而不是命令它们如何工作。**
  - **应用中间件：Kubernetes不提供应用中间件作为内置的基础设施，例如：消息队列和SQL数据库。然而，可以提供通用目的的机制使其能够被容易的提供、发现和访问。理想的情况是这些组件仅仅运行在Kubernetes上。**
  - **日志和监控：Kubernetes本身不提供日志聚合和综合应用监控的能力，也没有遥测分析和警报系统，虽然日志和监控的机制是Kubernetes集群必不可少的部分。**
  - **数据处理平台：在数据处理平台方面，Spark和Hadoop是还有名的两个例子，但市场中还存在很多其它的系统。**
  - **特定应用运算符****：****Kubernetes****支持通用类别应用的工作负载管理。**
  - **平台即服务 Paas：Kubernetes为Paas提供基础。**
  - **功能即服务 FaaS：与PaaS类似，但Faa侵入容器和特定语言的应用框架。**
  - **工作量编排：** **“工作流”是一个非常广泛的和多样化的领域，通常针对特定的用例场景（例如：数据流图、数据驱动处理、部署流水线、事件驱动自动化、业务流程执行、iPAAS）和特定输入和事件来源的解决方案，并且通常需要通过编写代码来实现。**
  - **配置特定领域语言：****特定领域的语言不利于分层高级的API和工具，它们通常具有有限的可表达性、可测试性、熟悉性和文档性。它们复杂的配置生成，它们倾向于在互操作性和可组合性间进行****折衷****。它们使依赖管理复杂化，并经常颠覆性的抽象和封装。**
  - [Kompose](https://github.com/kubernetes-incubator/kompose)：Kompose是一个适配器工具，它有助于从Docker Compose迁移到Kubernetes ，并提供简单的用例。Kompose不遵循Kubernetes约定，而是基于手动维护的DSL。
  - [ChatOps](https://github.com/harbur/kubebot)：也是一个适配器工具，用于聊天服务。

- **支撑Kubernetes**

- - **容器运行时：Kubernetes本身不提供容器运行时环境，但是其提供了接口，可以来插入所选择的容器运行时。**
  - **镜像仓库：Kubernetes本身不提供容器的镜像，可通过Harbor、Nexus和docker registry等搭建镜像仓库，以为集群拉取需要的容器镜像。**
  - **集群状态存储：用于存储集群运行状态，例如默认使用Etcd，但也可以使用其它存储系统。**
  - **网络：与容器运行时一样，Kubernetes提供了接入各种网络插件的容器网络接口（CNI）。**
  - **文件存储：本地文件系统和网络存储**
  - **Node****管理：Kubernetes既不提供也不采用任何综合的机器配置、维护、管理或自愈系统。通常针对不同的公有/私有云，针对不同的操作系统，针对可变的和不可变的基础设施。**
  - **云提供者：IaaS供应和管理。**
  - **集群创建和管理：社区已经开发了很多的工具，利润minikube、kubeadm、bootkube、kube-aws、kops、kargo, kubernetes-anywhere等待。 从工具的多样性可以看出，集群部署和管理（例如，升级）没有一成不变的解决方案。也就是说，常见的构建块（例如，安全的Kubelet注册）和方法（特别是自托管）将减少此类工具中所需的自定义编排的数量。**

后续，希望通过建立Kubernetes的生态系统，并通过整合相关的解决方案来满足上述需求。

**矩阵管理**

选项、可配置的默认、扩展、插件、附加组件、特定于提供者的功能、版本管理、特征发现和依赖性管理。

Kubernetes不仅仅是一个开源的工具箱，而且是一个典型集群或者服务的运行环境。 Kubernetes希望大多数用户和用例能够使用上游版本，这意味着Kubernetes需要足够的可扩展性，而不需要通过重建来处理各种场景。

虽然在可扩展性方面的差距是代码分支的主要驱动力，而上游集群生命周期管理解决方案中的差距是当前Kubernetes分发的主要驱动因素，可选特征的存在（例如，alpha API、提供者特定的API）、可配置性、插件化和可扩展性使概念不可避免。

然而，为了使用户有可能在Kubernetes上部署和管理他们的应用程序，为了使开发人员能够在Kubernetes集群上构建构建Kubernetes扩展，他们必须能够对Kubernetes集群或分发提供一个假设。在基本假设失效的情况下，需要找到一种方法来发现可用的功能，并表达功能需求（依赖性）以供使用。

集群组件，包括add-ons，应该通过组件注册 API进行注册和通过/componentstatuses进行发现。

启用内置API、聚合API和注册的第三方资源，应该可以通过发现和OpenAPI（Savigj.JSON）端点来发现。如上所述，LoadBalancer类型服务的云服务提供商应该确定负载均衡器API是否存在。

类似于StorageClass，扩展和它们的选项应该通过FoeClass资源进行注册。但是，使用参数描述、类型（例如，整数与字符串）、用于验证的约束（例如，ranger或regexp）和默认值，从扩展API中引用fooClassName。这些API应该配置/暴露相关的特征的存在，例如动态存储卷供应（由非空的storageclass.provisioner字段指示），以及标识负责的控制器。需要至少为调度器类、ingress控制器类、Flex存储卷类和计算资源类（例如GPU、其他加速器）添加这样的API。

假设我们将现有的网络存储卷转换为flex存储卷，这种方法将会覆盖存储卷来源。在将来，API应该只提供通用目的的抽象，即使与LoadBalancer服务一样，抽象并不需要在所有的环境中都实现（即，API不需要迎合最低公共特性）。

NIY：需要为注册和发现开发下面的机制：

- 准入控制插件和hooks(包括内置的APIs)
- 身份认证插件
- 授权插件和hooks
- 初始化和终结器
- 调度器扩展
- Node标签和集群拓扑

NIY：单个API和细粒度特征的激活/失活可以通过以下机制解决：

- 所有组件的配置正在从命令行标志转换为版本化配置。
- 打算将大部分配置数据存储在配置映射(ConfigMaps)中，以便于动态重新配置、渐进发布和内省性。
- 所有/多个组件共同的配置应该被分解到它自己的配置对象中。这应该包括特征网关机制。
- 应该为语义意义上的设置添加API，例如，在无响应节点上删除Pod之前需要等待的默认时间长度。

NIY：版本管理操作的问题，取决于多个组件的升级（包括在HA集群中的相同组件的副本），应该通过以下方式来解决：

- 为所有新的特性创建flag网关
- 总是在它们出现的第一个小版本中，默认禁用这些特性，
- 提供启用特性的配置补丁；
- 在接下来的小版本中默认启用这些特性

NIY：我们还需要一个机制来警告过时的节点，和/或潜在防止Master升级（除了补丁发布），直到/除非Node已经升级。

NIY：字段级版本管理将有助于大量激活新的和/或alpha API字段的解决方案，防止不良写入过时的客户端对新字段的阻塞，以及非alpha API的演进，而不需要成熟的API定义的扩散。

Kubernetes API server忽略不支持的资源字段和查询参数，但不忽略未知的/未注册的API（注意禁用未实现的/不活动的API）。这有助于跨多个版本的集群重用配置，但往往会带来意外。Kubctl支持使用服务器的Wagger/OpenAPI规范进行可选验证。这样的可选验证，应该由服务器（NYY）提供。此外，为方便用户，共享资源清单应该指定Kubernetes版本最小的要求，这可能会被kubectl和其他客户端验证。

服务目录机制（NIY）应该能够断言应用级服务的存在，例如S3兼容的群集存储。

**、与安全相关的系统分层**

为了正确地保护Kubernetes集群并使其能够安全扩展，一些基本概念需要由系统的组件进行定义和约定。最好从安全的角度把Kubernetes看作是一系列的环，每个层都赋予连续的层功能去行动。

1. 用于存储核心API的一个或者多个数据存储系统(etcd)
2. 核心APIs
3. 高度可信赖资源的APIs(system policies)
4. 委托的信任API和控制器（用户授予访问API /控制器，以代表用户执行操作），无论是在集群范围内还是在更小的范围内
5. 在不同范围，运行不受信任/作用域API和控制器和用户工作负载

当较低层依赖于更高的层时，它会使安全模型崩溃，并使系统变得更加复杂。管理员可以选择这样做以获得操作简单性，但这必须是有意识的选择。一个简单的例子是etcd：可以将数据写入etcd的任何组件现在都在整个集群上，任何参与者（可以破坏高度信任的资源）都几乎可以进行逐步升级。为每一层的进程，将上面的层划分成不同的机器集（etcd-> apiservers +控制器->核心安全扩展->委托扩展- >用户工作负载），即使有些可能在实践中崩溃。

如果上面描述的层定义了同心圆，那么它也应该可能存在重叠或独立的圆-例如，管理员可以选择一个替代的秘密存储解决方案，集群工作负载可以访问，但是平台并不隐含地具有访问权限。这些圆圈的交点往往是运行工作负载的机器，并且节点必须没有比正常功能所需的特权更多的特权。

最后，在任何层通过扩展添加新的能力，应该遵循最佳实践来传达该行为的影响。

当一个能力通过扩展被添加到系统时，它有什么目的？

- 使系统更加安全
- 为集群中的每一个人，启用新的“生产质量”API
- 在集群的子集上自动完成一个公共任务
- 运行一个向用户提供API的托管工作负载（spark、数据库、etcd）
- 它们被分为三大类：

- - 集群所需的（因此必须在内核附近运行，并在存在故障时导致操作权衡）
  - 暴露于所有集群用户（必须正确地租用）
  - 暴露于集群用户的子集（像传统的“应用程序”工作负载运行）

如果管理员可以很容易地被诱骗，在扩展期间安装新的群集级安全规则，那么分层被破坏，并且系统是脆弱的。

参考：<https://www.kubernetes.org.cn/3958.html#4243-1524904380087>

<https://github.com/kubernetes/community/blob/master/contributors/devel/architectural-roadmap.md>









## 9.1  Kubernetes API Server概述

在概念层面上，Kubernetes由一系列不同角色的节点组成。Mater节点上的控制平面由API Server，Controller Manager和Scheduler组成。API Server是中心管理实体，是与分布式存储组件（etcd）进行直接通信的唯一组件。API Server提供以下核心功能：



- 服务于被集群内部工作节点和外部kubectl使用的Kubernetes API
- 为集群组件提供代理，如Kubernetes UI
- 允许对对象（例如pod和service等）的状态进行操作
- 保持分布式存储（etcd）中对象的状态



Kubernetes API是HTTP API，以JSON作为主要的结构化数据的序列化格式，但同时它也支持Google的Protocol Buffers格式进行描述（主要用于集群内部通信）。



考虑到可扩展性原因，Kubernetes支持多个API版本，分别处于不同的API路径上，例如/api/v1或/apis/extensions/v1beta1。不同的API版本意味着不同等级的稳定性和支持度：



- Alpha级别，例如v1alpha1，默认情况下被禁用，对此功能的支持可能随时会被舍弃，而且不会进行通知，因此只能在短期测试的集群中使用。
- Beta级别，例如v2beta3，默认情况下启用，意味着代码已经经过良好的测试，但对象的语义可能会在后续beta版或stable版中以不兼容的方式进行更改。
- Stable级别，例如v1，将出现在多个后续版本的released软件中。



现在来看看HTTP API空间是如何组成的。在顶层，按照以下几个组进行区分：核心组（均位于/api/v1路径下，由于历史原因位于此路径，而不在/apis/core/v1路径下），命名组（位于/apis/$NAME/$VERSION路径下），以及系统范围实体（如/metrics）。



接下来我们将聚焦一个具体的例子：批处理（batch）操作。在Kubernetes 1.5中，存在两个版本的批处理操作：/apis/batch/v1和/apis/batch/v2alpha1，分别暴露不同的可以进行查询和操作的实体集。



下面我们展示一个与API进行交互的示范性例子（使用Minishift工具和代理命令行oc proxy –port=8080，以直接对API进行访问）：



$ curl http://127.0.0.1:8080/apis/batch/v1 

{ 

“kind”: “APIResourceList”, 

“apiVersion”: “v1”, 

“groupVersion”: “batch/v1”, 

“resources”: [ 

{ 

“name”: “jobs”, 

“namespaced”: true, 

“kind”: “Job” 

}, 

{ 

“name”: “jobs/status”, 

“namespaced”: true, 

“kind”: “Job” 

} 

] 

}



接下来，使用新的Alpha版本：



$ curl http://127.0.0.1:8080/apis/batch/v2alpha1 

{ 

“kind”: “APIResourceList”, 

“apiVersion”: “v1”, 

“groupVersion”: “batch/v2alpha1”, 

“resources”: [ 

{ 

“name”: “cronjobs”, 

“namespaced”: true, 

“kind”: “CronJob” 

}, 

{ 

“name”: “cronjobs/status”, 

“namespaced”: true, 

“kind”: “CronJob” 

}, 

{ 

“name”: “jobs”, 

“namespaced”: true, 

“kind”: “Job” 

}, 

{ 

“name”: “jobs/status”, 

“namespaced”: true, 

“kind”: “Job” 

}, 

{ 

“name”: “scheduledjobs”, 

“namespaced”: true, 

“kind”: “ScheduledJob” 

}, 

{ 

“name”: “scheduledjobs/status”, 

“namespaced”: true, 

“kind”: “ScheduledJob” 

} 

] 

}



通常情况下，通过标准HTTP的POST、PUT、DELETE和GET动作，以JSON作为默认有效载荷，Kubernetes API支持在给定路径上进行创建（create）、更新（update）、删除（delete）、检索（retrieve）操作。



大多数API对象会区分对象的期望状态规格（specification）和对象的当前状态。对象规格（specification）是对期望状态的完整描述，并保存在持久化存储中。

## 9.2  Kubernetes API Server原理分析

k8s的API server核心功能是提供了k8s各类资源对象（Pod，RC，service）的增，删，改，查及HTTP REST接口。

server是通过一个名为kube-apiserver的进程提供服务。该进程运行在master节点上，默认情况下，在本机8080端口提供REST服务。

通常我们可以通过命令行工具kubectl来与API server交互。它们之间的接口是REST调用。为了测试和学习API server所提供的接口，也可以使用curl命令行工具进行快速验证。

比如我们登录master节点，运行下面的curl命令，得到以json方式返回的API的版本信息：

curl localhost:8080/api



可以运行下面命令，查看API server目前所支持的资源对象的种类：

curl localhost:8080/api/v1

根据以上命令的输出，可以运行下面的curl命令，分别返回集群中的pod列表，service列表，RC列表等：

curl localhost:8080/api/v1/pods

curl localhost:8080/api/v1/services

curl localhost:8080/api/v1/replicationcontrollers

如果我们只想对外暴露部分REST服务，则可以在master或其他任何节点上通过运行kubectl proxy进程启动一个内部代理来实现。

kubectl proxy --reject-paths="^/api/v1/replicationcontrollers" --port=8001 --v=2

然后运行下面命令验证：

curl localhost:8080/api/v1/replicationcontrollers

会显示如下：



也就是说可以通过proxy提供简单有效的安全机制。

最后一种方式是可以通过编程的方式调用API server。

 

集群功能模块之间的通信

如下图所示：

![api-server-yuanli](images/api-server-yuanli.png)

API server作为集群的核心，负责各个功能模块之间的通信。集群中各个模块通过API server将信息存入etcd，当需要获取和操作这些数据时，则通过API server提供的REST接口来实现，从而实现各模块之间的信息交互。

常见的一个交互场景是kubelet与API server交互。每个node节点上的kubelet每隔一个时间周期，会调用一次API server的REST接口报告自身状态。API server接受到这些信息，更新至etcd中，此外，kubelet也通过server的watch接口监听pod信息，若监听到新的pod副本被调度绑定到本节点，则执行pod对应的容器创建和启动。如果监听到pod对象被删除，则删除本节点上对应的pod容器。

另一个交互场景是kube-controller-manager进程与API server的交互。前者的Node controller模块通过API server提供的watch接口。实时监控Node的信息。

还有一个比较重要的交互场景就是kube-scheduler与api server交互，当前者通过server的watch接口监听到新建pod副本的信息后，它会检索所有符合该pod要求的Node列表，开始执行pod调度逻辑，调度成功后将pod绑定到目标节点上。

## 9.3  Scheduler原理分析

### 1. Scheduler简介

Scheduler负责Pod调度。在整个系统中起"承上启下"作用，承上：负责接收Controller Manager创建的新的Pod，为其选择一个合适的Node；启下：Node上的kubelet接管Pod的生命周期。

Scheduler：

1）**通过调度算法为待调度Pod列表的每个Pod从Node列表中选择一个最适合的Node，并将信息写入etcd中**

2）**kubelet通过API Server监听到kubernetes Scheduler产生的Pod绑定信息，然后获取对应的Pod清单，下载Image，并启动容器。**

![scheduler-1](images/scheduler-1.webp)

2. ### 调度流程

1、预选调度过程，即遍历所有目标Node,筛选出符合要求的候选节点，kubernetes内置了多种预选策略（xxx Predicates）供用户选择

2、确定最优节点，在第一步的基础上采用优选策略（xxx Priority）计算出每个候选节点的积分，取最高积分。

调度流程通过插件式加载的“调度算法提供者”（AlgorithmProvider）具体实现，一个调度算法提供者就是包括一组预选策略与一组优选策略的结构体。

### 3. 预选策略

说明：返回true表示该节点满足该Pod的调度条件；返回false表示该节点不满足该Pod的调度条件。

#### 3.1. NoDiskConflict

判断备选Pod的数据卷是否与该Node上已存在Pod挂载的数据卷冲突，如果是则返回false，否则返回true。

#### 3.2. PodFitsResources

判断备选节点的资源是否满足备选Pod的需求，即节点的剩余资源满不满足该Pod的资源使用。

1. 计算备选Pod和节点中已用资源（该节点所有Pod的使用资源）的总和。
2. 获取备选节点的状态信息，包括节点资源信息。
3. 如果（备选Pod+节点已用资源>该节点总资源）则返回false，即剩余资源不满足该Pod使用；否则返回true。

#### 3.3. PodSelectorMatches

判断节点是否包含备选Pod的标签选择器指定的标签，即通过标签来选择Node。

1. 如果Pod中没有指定spec.nodeSelector，则返回true。
2. 否则获得备选节点的标签信息，判断该节点的标签信息中是否包含该Pod的spec.nodeSelector中指定的标签，如果包含返回true，否则返回false。

#### 3.4. PodFitsHost

判断备选Pod的spec.nodeName所指定的节点名称与备选节点名称是否一致，如果一致返回true，否则返回false。

#### 3.5. CheckNodeLabelPresence

检查备选节点中是否有Scheduler配置的标签，如果有返回true，否则返回false。

#### 3.6. CheckServiceAffinity

判断备选节点是否包含Scheduler配置的标签，如果有返回true，否则返回false。

#### 3.7. PodFitsPorts

判断备选Pod所用的端口列表中的端口是否在备选节点中已被占用，如果被占用返回false，否则返回true。

### 4. 优选策略

#### 4.1. LeastRequestedPriority

优先从备选节点列表中选择资源消耗最小的节点（CPU+内存）。

#### 4.2. CalculateNodeLabelPriority

优先选择含有指定Label的节点。

#### 4.3. BalancedResourceAllocation

优先从备选节点列表中选择各项资源使用率最均衡的节点。



## 9.4  Controller Manager 原理分析

​	Controller Manager作为集群内部的管理控制中心，负责集群内的Node、Pod副本、服务端点（Endpoint）、命名空间（Namespace）、服务账号（ServiceAccount）、资源定额（ResourceQuota）的管理，当某个Node意外宕机时，Controller Manager会及时发现并执行自动化修复流程，确保集群始终处于预期的工作状态。

![controller-manager-1](images/controller-manager-1.png)

每个Controller通过API Server提供的接口实时监控整个集群的每个资源对象的当前状态，当发生各种故障导致系统状态发生变化时，会尝试将系统状态修复到“期望状态”。

2. Replication Controller
    为了区分，资源对象Replication Controller简称RC,而本文是指Controller Manager中的Replication Controller，称为副本控制器。副本控制器的作用即保证集群中一个RC所关联的Pod副本数始终保持预设值。

只有当Pod的重启策略是Always的时候（RestartPolicy=Always），副本控制器才会管理该Pod的操作（创建、销毁、重启等）。
RC中的Pod模板就像一个模具，模具制造出来的东西一旦离开模具，它们之间就再没关系了。一旦Pod被创建，无论模板如何变化，也不会影响到已经创建的Pod。
Pod可以通过修改label来脱离RC的管控，该方法可以用于将Pod从集群中迁移，数据修复等调试。
删除一个RC不会影响它所创建的Pod，如果要删除Pod需要将RC的副本数属性设置为0。
不要越过RC创建Pod，因为RC可以实现自动化控制Pod，提高容灾能力。
2.1. Replication Controller的职责
确保集群中有且仅有N个Pod实例，N是RC中定义的Pod副本数量。
通过调整RC中的spec.replicas属性值来实现系统扩容或缩容。
通过改变RC中的Pod模板来实现系统的滚动升级。
2.2. Replication Controller使用场景
使用场景
说明
使用命令
重新调度	当发生节点故障或Pod被意外终止运行时，可以重新调度保证集群中仍然运行指定的副本数。	 
弹性伸缩	通过手动或自动扩容代理修复副本控制器的spec.replicas属性，可以实现弹性伸缩。	kubectl scale
滚动更新	创建一个新的RC文件，通过kubectl 命令或API执行，则会新增一个新的副本同时删除旧的副本，当旧副本为0时，删除旧的RC。	kubectl rolling-update

滚动升级，具体可参考kubectl rolling-update --help,官方文档：https://kubernetes.io/docs/tasks/run-application/rolling-update-replication-controller/

```
[root@node5 ~]# kubectl rolling-update --help
Perform a rolling update of the given ReplicationController.
Replaces the specified replication controller with a new replication controller by updating one pod at a time to use the
new PodTemplate. The new-controller.json must specify the same namespace as the
existing replication controller and overwrite at least one (common) label in its replicaSelector.
Usage:
  kubectl rolling-update OLD_CONTROLLER_NAME ([NEW_CONTROLLER_NAME] --image=NEW_CONTAINER_IMAGE | -f NEW_CONTROLLER_SPEC) [flags]
Aliases:
  rolling-update, rollingupdate
 
Examples:
# Update pods of frontend-v1 using new replication controller data in frontend-v2.json.
$ kubectl rolling-update frontend-v1 -f frontend-v2.json
# Update pods of frontend-v1 using JSON data passed into stdin.
$ cat frontend-v2.json | kubectl rolling-update frontend-v1 -f -
# Update the pods of frontend-v1 to frontend-v2 by just changing the image, and switching the
# name of the replication controller.
$ kubectl rolling-update frontend-v1 frontend-v2 --image=image:v2
# Update the pods of frontend by just changing the image, and keeping the old name
$ kubectl rolling-update frontend --image=image:v2

```

3. Node Controller
    kubelet在启动时会通过API Server注册自身的节点信息，并定时向API Server汇报状态信息，API Server接收到信息后将信息更新到etcd中。

Node Controller通过API Server实时获取Node的相关信息，实现管理和监控集群中的各个Node节点的相关控制功能。流程如下

![controller-manager-2](images/controller-manager-2.png)

1、Controller Manager在启动时如果设置了--cluster-cidr参数，那么为每个没有设置Spec.PodCIDR的Node节点生成一个CIDR地址，并用该CIDR地址设置节点的Spec.PodCIDR属性，防止不同的节点的CIDR地址发生冲突。

2、具体流程见以上流程图。

3、逐个读取节点信息，如果节点状态变成非“就绪”状态，则将节点加入待删除队列，否则将节点从该队列删除。

4. ResourceQuota Controller
    资源配额管理确保指定的资源对象在任何时候都不会超量占用系统物理资源。

支持三个层次的资源配置管理：

1）容器级别：对CPU和Memory进行限制

2）Pod级别：对一个Pod内所有容器的可用资源进行限制

3）Namespace级别：包括

Pod数量
Replication Controller数量
Service数量
ResourceQuota数量
Secret数量
可持有的PV（Persistent Volume）数量
说明：

k8s配额管理是通过Admission Control（准入控制）来控制的；
Admission Control提供两种配额约束方式：LimitRanger和ResourceQuota；
LimitRanger作用于Pod和Container；
ResourceQuota作用于Namespace上，限定一个Namespace里的各类资源的使用总额。

ResourceQuota Controller流程图：

![controller-manager-3](images/controller-manager-3.png)

5. Namespace Controller
    用户通过API Server可以创建新的Namespace并保存在etcd中，Namespace Controller定时通过API Server读取这些Namespace信息。

如果Namespace被API标记为优雅删除（即设置删除期限，DeletionTimestamp）,则将该Namespace状态设置为“Terminating”,并保存到etcd中。同时Namespace Controller删除该Namespace下的ServiceAccount、RC、Pod等资源对象。

6. Endpoint Controller
    Service、Endpoint、Pod的关系：

![controller-manager-4](images/controller-manager-4.png)



Endpoints表示了一个Service对应的所有Pod副本的访问地址，而Endpoints Controller负责生成和维护所有Endpoints对象的控制器。它负责监听Service和对应的Pod副本的变化。

如果监测到Service被删除，则删除和该Service同名的Endpoints对象；
如果监测到新的Service被创建或修改，则根据该Service信息获得相关的Pod列表，然后创建或更新Service对应的Endpoints对象。
如果监测到Pod的事件，则更新它对应的Service的Endpoints对象。
kube-proxy进程获取每个Service的Endpoints，实现Service的负载均衡功能。

7. Service Controller
    Service Controller是属于kubernetes集群与外部的云平台之间的一个接口控制器。Service Controller监听Service变化，如果是一个LoadBalancer类型的Service，则确保外部的云平台上对该Service对应的LoadBalancer实例被相应地创建、删除及更新路由转发表。


参考：https://blog.csdn.net/huwh_/article/details/75675761 



## 9.5  kubelet运行机制分析

# kubelet运行机制分析

在Kubernetes集群中，每个Node节点（又称Minion）上都会启动一个Kubelet服务进行。该进程用于处理Master节点下发到本节点的任务，管理Pod及Pod中的容器。每个Kubelet进程会在API Server上注册节点自身信息，定期向Master节点汇报节点资源的使用情况，并通过cAdvise监控容器和节点资源。

## 1. 节点管理

节点通过设置Kubelet的启动参数“--register-node”，来决定是否想API Server注册自己。如果该参数值为true，那么Kubelet将试着通过API Server注册自己。作为自注册，Kubelet启动时还包含下列参数：

- --api-servers Master节点API Server的位置；
- --kubeconfig 告诉Kubelet在哪儿可以找到用于访问API Server的证书；
- --cloud-provider 告诉Kubelet如何从云服务商（IAAS）哪里读取到和自己相关的元数据

当前每个Kubelet被授予创建和修改任何节点的权限。但是在实践中，它仅仅创建和修改自己。
 Kubelet在启动时通过API Server注册节点信息，并定时向API Server发送节点新消息，API Server在接收到这些信息后，将这些信息写入etcd。通过Kubelet的启动参数“--node-status-update-frequency”设置Kubelet每隔多少时间向API Server报告节点状态，默认为10秒。

## 2. Pod管理

Kubelet通过以下几种方式获取自身Node上所要运行的Pod清单。

1. 文件：Kubelet启动参数“--config”指定的配置文件目录下的文件（默认目录为”/etc/kubernets/manifests/“）。通过--file-check-frequency设置检查该文件目录的时间间隔，默认为20秒。
2. HTTP端点（URL）：通过”--manifest-url“参数设置。通过--http-check-frequency设置检查该HTTP端点的数据时间间隔，默认为20秒。
3. API Server：Kubelet通过API Server监听etcd目录，同步Pod清单。

所有以非API Server方式创建的Pod都叫作Static Pod。Kubelet将Static Pod的状态汇报给API Server，API Server为该Static Pod创建一个Mirror Pod和其相匹配。Mirror Pod的状态将真实反映Static Pod的状态。当Static Pod被删除时，与之相对应的Mirror Pod也会被删除。
 Kubelet通过API Server Client使用Watch加List的方式监听”/registry/node/$当前节点名称“和”/registry/pods“目录，将获取的信息同步到本地缓存中。
 Kubelet监听etcd，所有针对Pod的操作将会被Kubelet监听到。如果发现有新的绑定到本节点的Pod，则按照Pod清单的要求创建该Pod。
 如果发现本地的Pod被修改，则Kubelet会做出相应的修改，比如删除Pod中的某个容器时，则通过Docker Client删除该容器。
 如果发现删除本节点的Pod，则删除相应的Pod，并通过Docker Client删除Pod中的容器。

Kubelet读取监听到的信息，如果是创建和修改Pod任务，则做如下处理：

1. 为该Pod创建一个数据目录。
2. 从API Server读取该Pod清单。
3. 为该Pod挂载外部卷（Extenal Volume）。
4. 下载Pod用到的Secret。
5. 检查已经运行在节点中的Pod，如果该Pod没有容器或Pause容器（”kubernetes/pause“镜像创建的容器）没有启动，则先停止Pod里所有容器的进程。如果在Pod中有需要删除的容器，则删除这些容器。
6. 用”kubernetes/pause“镜像为每个Pod创建一个容器。该Pause容器用于接管Pod中所有其他容器的网络。每创建一个新的Pod，Kubelet都会先创建一个Pause容器，然后创建其他容器。”kubernetes/pause“镜像大概为200KB，是一个非常小的容器镜像。
7. 为Pod中的每个容器做如下处理：

> 为容器计算一个hash值，然后用容器的名字去Docker查询对应容器的hash值。若查到容器，且两者hash值不同，则停止Docker中容器的进程，并停止与之关联的Pause容器进程；若两者相同，则不做任何处理；
>  如果容器被终止了，且容器没有指定的restartPolicy（重启策略），则不做任何处理；
>  调用Docker Client下载容器镜像，调用Docker Client运行容器。

## 3. 容器健康检查

Pod通过两类探针来检查容器的健康状态。

1. 一个是LivenessProbe探针，用于判断容器是否健康，告诉Kubelet一个容器什么时候处于不健康的状态。如果LivenessProbe探针探测到容器不健康，则Kubelet将删除该容器，并根据容器的重启策略做相应的处理。如果一个容器不包含LivenessProbe探针，那么Kubelet认为该容器的LivenessProbe探针返回的值永远是”Seccess“；
2. 另一类是ReadinessProbe探针，用于判断容器是否启动完成，且准备接受请求。如果ReadinessProbe探针检测到失败，则Pod的状态将被修改。Endpoint Controller将从Service的Endpoint中删除包含该容器所在Pod的IP地址的Endpoint条目。

Kubelet定期调用容器的LivenessProbe探针来诊断容器的健康状况。LivenessProbe包好一下三种实现方式：

1. ExecAction：在容器内部执行一个命令，如果该命令的退出状态吗为0，则表示容器健康。
2. TCPSocketAction：通过容器的IP地址和端口号执行TCP检查，如果端口能被访问，则表示容器健康。
3. HTTPGetAction：通过容器的IP地址和端口号及路径调用HTTP Get方法，如果响应的状态码大于等于200且小于等于400，则认为容器状态健康。

LivenessProbe探针包含在Pod定义的spec.containers.{某个容器}中。

### 4. cAdvisor资源监控

cAdvisor是一个开源的分析容器资源使用率和性能特性的代理工具。它是因为容器而产生的，因此自然支持Docker容器。在Kubernetes项目中，cAdvisor被集成到Kubernetes代码中。cAdvisor自动查找所有在其所在节点上的容器，自动采集CPU、内存、文件系统和网络使用的统计信息。cAdvisor通过它所在节点机的Root容器，采集并分析该节点机的全面的使用情况。

链接：https://www.jianshu.com/p/639903727a60

<https://www.cnblogs.com/suolu/p/6841848.html>

## 9.6  kube-proxy运行机制分析

  **一： Service,Endpoints与Pod****的关系**
![img](http://img.blog.itpub.net/blog/attachment/201805/31/28624388_1527763669mcsy.jpg?x-oss-process=style/bb)
**Kube-proxy进程获取每个Service的Endpoints,实现Service的负载均衡功能**

**二：Service的负载均衡转发规则**
![img](http://img.blog.itpub.net/blog/attachment/201805/31/28624388_15277638357ojj.jpg?x-oss-process=style/bb)
访问Service的请求，不论是Cluster IP+TargetPort的方式；还是用Node节点IP+NodePort的方式，都被Node节点的Iptables规则重定向到Kube-proxy监听Service服务代理端口。kube-proxy接收到Service的访问请求后，根据负载策略，转发到后端的Pod。

**三：kube-proxy工作原理**
![img](http://img.blog.itpub.net/blog/attachment/201805/31/28624388_1527764252Aeze.jpg?x-oss-process=style/bb)

**1.Service在很多情况下只是一个概念，而真正将Service的作用实现的是kube-proxy服务进程。**

**2.每个Node节点上都会运行一个kube-proxy服务进程。**

**3.对每一个TCP类型的Kubernetes Service,kube-proxy都会在本地Node节点上建立一个SocketServer来负责接收请求，然后均匀发送****到后端某个Pod的端口上。这个过程默认采用Round Robin负载均衡算法。**

**4.****kube-proxy在运行过程中动态创建与Service相关的Iptables规则，这些规则实现了ClusterIp及NodePort的请求流量重定向到kube-proxy进程上对应服务的代理端口功能。**

**5.kube-proxy通过查询和监听API Server 中Service与Endpoints的变化，为每个Service都建立一个“服务代理对象****”，并自动同步。服务代理对象是kube-proxy程序内部的一种数据结构，它包括一个用于监听此服务请求的SockerServer,SocketServer的端口是随机选择一个本地空闲端口。此外，kube-proxy内部创建了一个负载均衡器-LoadBalancer.**

**6.针对发生变化的Service列表，kube-proxy会逐个处理：**
a. 如果没有设置集群IP，则不做任何处理，否则，取该Service的所有端口定义列表。
b.为Service端口分配服务代理对象并为该Service创建相关的Iptables规则。
c.更新负载均衡器组件中对应Service的转发地址列表

**7.kube-proxy在启动时和监听到Service或Endpoint的变化后，会在本机Iptables的NAT表中添加4条规则链。**
a.KUBE-PORTALS-CONTAINER: 从容器中通过Cluster IP 和端口号访问service.
b.KUBE-PORTALS-HOST: 从主机中通过Cluster IP 和端口号访问service.
c.KUBE-NODEPORT-CONTAINER:从容器中通过NODE IP 和端口号访问service.
d. KUBE-NODEPORT-HOST:从主机中通过Node IP 和端口号访问service.  

参考：<http://blog.itpub.net/28624388/viewspace-2155433/>

<https://blog.csdn.net/hahachenchen789/article/details/80634088>

## 9.7  深入分析K8s集群安全机制

Kubernetes过一系列机制来实现集群的安全机制，包括API Server的认证授权、准入控制机制及保护敏感信息的Secret机制等。
集群的安全性必须考虑以下的几个目标：
（1）保证容器与其所在宿主机的隔离；
（2）限制容器给基础设施及其他容器带来消极影响的能力；
（3）最小权限原则，合理限制所有组件的权限，确保组件只执行它被授权的行为，通过限制单个组件的能力来限制他所能到达的权限范围；
（4）明确组件间边界的划分；
（5）划分普通用户和管理员角色；
（6）在必要的时候允许将管理员权限赋给普通用户；
（7）允许拥有Secret数据（Keys、Certs、Passwords）的应用在集群中运行；
下面分别从Authentication、Authorization、Admission Control、Secret和Service Account等方面来说明集群的安全机制。

1、API Server认证管理（Authentication）
我们知道，Kubernetes集群中所有资源的访问和变更都是通过Kubernetes API Server的REST API来实现的，所以集群安全的关键点在于如何识别并认证客户端身份（Authentication）以及随后访问权限的授权（Authorization）这两个关键问题。本节对认证管理进行说明。
Kubernetes集群提供了3种级别的客户端身份认证方式：
最严格的HTTPS证书认证：基于CA根证书签名的双向数字证书认证方式；
HTTP Token认证：通过一个Token来识别合法用户；
HTTP Base认证：通过用户名+密码的方式认证；

1.1 HTTPS证书认证的原理
首先，需要一个CA证书。CA通过证书证实他人的公钥信息，而证书上有CA的签名。很多情况下，CA与用户是相互独立的实体，CA作为服务提供方，有可能因为服务质量问题而给用户带来损失。在证书中绑定了公钥数据和相应私钥拥有者的信息，并带有CA的数字签名。证书中也包含了CA的名称，以便于依赖方找到CA的公钥，验证证书上的数字签名。

CA认证涉及诸多概念，比如根证书、自签名证书、密钥、私钥、加密算法及HTTPS等。
下面通过大致讲述SSL协议的流程，帮助理解CA认证和Kubernetes CA认证的配置过程。
（1）HTTPS通信双方的务器端向CA机构申请证书，CA机构是可信的第三方机构，它可以是一个公认的权威的企业，也可以是企业自身。企业内部系统一般都使用企业自身的认证系统。CA机构下发根证书、服务端证书及私钥给申请者；
（2）HTTPS通信双方的客户端向CA机构申请证书，CA机构下发根证书、客户端证书及私钥给申请者；
（3）客户端向服务器端发起请求，服务端下发服务端证书给客户端。客户端接收到证书后，通过私钥解密证书，并利用服务器端证书中的公钥认证证书信息比较证书里的消息，例如域名和公钥与服务器刚刚发送的相关消息是否一致，如果一致，则客户端认可这个服务器的合法身份；
（4）客户端发送客户端证书给服务器端，服务端接收到证书后，通过私钥解密证书，获得客户端的证书公钥，并用该公钥认证证书信息，确认客户端是否合法；
（5）客户端通过随机秘钥加密信息，并发送加密后的信息给服务器端。服务器端和客户端协商好加密方案后，客户端会产生一个随机的秘钥，客户端通过协商好的加密方案，加密该随机秘钥，并发送该随机秘钥到服务器端。服务器端接收这个秘钥后，双方通信的所有内容都通过该随机秘钥加密。

上述是双向SSL协议的具体通信过程，这种情况要求服务器和用户双方都有证书。单向认证SSL协议不需要客户拥有CA证书，对应上面的步骤，只需将服务器端验证客户端证书的过程去掉，以及在协商对称密码方案和对称通话秘钥时，服务器端发送给客户端的是没有加过密的（这并不影响SSL过程的安全性）密码方案。

1.2 HTTP Token的认证原理
HTTP Token的认证是用一个很长的特殊编码方式的并且难以被模仿的字符串——Token来表明客户身份的一种方式。

在通常情况下，Token是一个复杂的字符串，比如我们用私钥签名一个字符串的数据就可以作为一个Token。此外每个Token对应一个用户名，存储在API Server能访问的一个文件中。当客户端发起API调用请求时，需要在HTTP Header里放入Token，这样一来API Server就能够识别合法用户和非法用户了。

1.3 HTTP Base认证原理
这种认证方式是把“用户名+冒号+密码”用BASE64算法进行编码后的字符串放在HTTP REQUEST中的Header Authorization域里发送给服务端。服务端收到后进行解码，获取用户名及密码，然后进行用户身份的鉴权过程。

2、API Server授权管理（Authorization）
对合法用户进行授权（Authorization）并且随后在用户访问时进行鉴权，是权限与安全系统的重要一环。授权就是授予不同用户不同访问权限。
API Server目前支持以下集中授权策略（通过API Server的启动参数--authorization-mode设置）：
AlwaysDeny：拒绝所有请求，该配置一般用于测试；
AlwaysAllow：接收所有请求，如果集群不需要授权流程，可以采用该策略，此为Kubernetes默认的策略；
ABAC：（Attribute-Base Access Control）为基于属性的访问控制，表示使用用户配置的授权规则对用户的请求进行匹配和控制；
Webhook：通过调用外部REST服务对用户进行授权；
RBAC：Role-Based Access Control，基于角色的访问控制。
API Server在接收到请求后，会读取该请求中的数据，生成一个访问策略对象，如果该请求中不带某些属性，则会被自动填充默认值。然后将这个访问策略对象和授权策略文件中的所有访问策略对象逐条匹配。如果至少有一个策略对象被匹配，则该请求将被鉴权通过，否则终止API调用流程，并返回客户端的错误调用码。
2.1 ABAC授权模式详解
在API Server启用ABAC模式时，需要指定授权文件的路径和名字（--authorization_policy_file=SOME_FILENAME）,授权策略文件里的每一行都是一个Map类型的JOSN对象，这被称为访问策略对象，我们可以通过设置“访问策略对象”中的如下属性来确定具体的授权策略：
（1）apiVersion: 当前版本为abac.authorization.kubernetes.io/v1beta1
（2）kind: 设置为"Policy"。
（3）spec: 详细的策略设置，包括下列字段。
主体属性
user：用户名，字符串类型，该字符串类型的用户名来源于Token文件（--token-auth-file参数设置的文件）或基本认证文件中的用户名字段的值。
group：用户组，设置为"system:authenticated"时表示匹配所有已认证的请求，设置为"system:unauthenticated"时表示匹配所有未认证的请求。
资源属性
apiGroup（API组）：字符串类型，表明匹配哪些API Group，例如extensions或*（表示匹配所有API Group）。
namespace：字符串类型，表明该策略允许访问某个Namespace的资源，例如kube-system或*（表示匹配所有namespace）。
resource（资源）：字符串类型，API资源对象，例如pods或*（表示匹配所有资源对象）。
非资源属性
nonResourcePath（非资源对象类路径）：非资源对象类的URL路径，例如/version或/apis，*表示匹配所有非资源对象类的请求路径，也可以设置为子路径，/foo/*表示匹配所有/foo路径下的所有子路径。
readonly（只读标识）：布尔类型，当它的值为true时，表明仅允许GET请求通过。
1）ABAC授权算法
API Server进行ABAC授权的算法如下：在API Server收到请求之后，这些请求携带的策略对象的属性就被组装为一个数组，接下来使用策略文件对其进行逐条匹配。如果至少一行匹配成功，那么这个请求就通过了授权（不过还是可能会在后续其他授权校验中失败）。
常见的配置策略如下：
要允许所有用户做某件事，可以写一个策略，将group属性设置为system:authenticated；
要允许所有未认证用户做某件事，可以把策略的group属性设置为system:unauthenticated；
要允许一个用户做任何可，将策略的apiGroup、namespace、resource和nonResourcePath属性设置为"*"即可。
2）使用kubectl时的授权机制
kubectl 使用API Server的/api和/apis端点来获取版本信息。
要验证kubectl create/update命令发送给服务器的对象，kubectl需要向swagger资源进行查询，k8s v1版的API对应的是/swaggerapi/api/v1和swaggerapi/experimental/v1。
当使用ABAC授权模式时，下列特殊资源必须显式地用nonResourcePath属性来表达：
API版本协商过程中的/api、/api/*、/apis和/apis/*。
使用kubectl version命令从服务器获取版本时的/version。
create/update操作过程中的/swaggerapi/*。
在使用kubectl操作时，如果需要查看发送到API Server的HTTP请求，可以将日志级别设置为8，例如：
# kubectl --v=8 version

下面通过几个授权策略文件（JSON格式）示例说明ABAC的访问控制用法。
（1）允许用户alice对所有资源做任何操作
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"user": "alice", "namespace": "*", "resource": "*", "apiGroup": "*"}}

（2）kubelet可以读取任意Pod
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"user": "kubelet", "namespace": "*", "resource": "pods", "readonly": "true"}}

（3）kubelet可以读写Event对象
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"user": "kubelet", "namespace": "*", "resource": "events"}}

（4）用户bob只能读取projectCaribou中的Pod
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"user": "bob", "namespace": "projectCaribou", "resource": "pods", "readonly": true}}

（5）任何认证用户都可以对非资源类路径进行只读请求
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"group": "system:authenticated", "readonly": true, "nonResourcePath": "*"}}
任何非认证用户都可以对非资源类路径进行只读请求
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"group": "system:unauthenticated", "readonly": true, "nonResourcePath": "*"}}

如果添加了新的ABAC策略，则需要重启API Server以使其生效。

3）Service Account与授权
Service Account会自动生成一个用户（user），用户的名称按照以下规则产生：
system:serviceaccount:<namespace>:<serviceaccountname>
创建新的命名空间时，会产生一个如下形式的Service Account：
system:serviceaccount:<namespace>:default

如果希望kube-system命名空间中的Service Account——"default"具有全部权限，就要在策略文件中加入如下内容：
{"apiVersion": "abac.authorization.kubernetes.io/v1beta1", "kind": "Policy", "spec": {"user": "system:serviceaccount:kube-system:default", "namespace": "*", "resource": "*", "apiGroup": "*"}}

2.2 Webhook授权模式详解
Webhook定义了一个HTTP回调接口，实现Webhook的应用会在指定事件发生时，向一个URL地址POST通知信息。启用Webhook授权模式后，k8s会调用外部REST服务对用户进行授权。
Webhook模式用参数--authorization-webhook-config-file=SOME_FILENAME来设置远端授权服务的信息。

配置文件使用的是kubeconfig文件的格式。文件里user一节的内容指的是API Server。相对于远程授权服务来说，API Server是客户端，也就是用户。cluster一节的内容是远程授权服务器的配置。
下面的例子为设置一个使用HTTPS客户端认证的配置：
clusters:
  - name: name-of-remote-authz-service
    cluster:
      certificate-authority: /path/to/ca.pem   # 用于验证远端服务的CA
      server: https://authz.example.com/authorize  # 远端服务的URL，必须使用HTTPS
    users:
  - name: name-of-api-server
    user:
      client-certificate: /path/to/cert.pem # Webhook插件使用的证书
      client-key: /path/to/key.pem  # 证书的key
    current-contex: webhook    # kubeconfig文件需要设置context
    contexts:
  - context:
    cluster: name-of-remote-authz-service
    user: name-of-api-server
      name: webhook

在授权开始时，API Server会生成一个api.authorization.v1beta1.SubjectAccessReview对象，用于描述操作信息，在进行JSON序列化之后POST出来。这个对象中包含了用户尝试访问资源的请求动作的描述，以及被访问资源的属性。

Webhook API对象和其他API对象一样，遵循同样的版本兼容性规则，在实现时要注意apiVersion字段的版本，以实现正确的反序列化操作。
另外，API Server必须在启用时启用authorization.k8s.io/v1beta1 API扩展（--runtime-config=authorization.k8s.io/v1beta1=true）。
下面是一个希望获取Pod列表的请求报文示例：
{
"apiVersion": "authorization.k8s.io/v1beta1",
"kind": "SubjectAccessReview",
"spec": {
  "resourceAttributes": {
    "namespace": "kittensandponies",
    "verb": "get",
    "group": "unicorn.example.org",
    "resource": "pods"
  },
  "user": "jane",
  "group": [
    "group1",
    "group2"
    ]
  }
}

远端服务需要填充请求中的SubjectAccessReviewStatus字段，并返回允许或不允许访问的结果。应答报文中的spec字段是无效的，也可以省略。
一个返回“允许访问”的应答报文示例如下：
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "status": {
    "allowed": true
  }
}

一个返回”不允许访问“的应答报文示例如下：
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "status": {
    "allowed": false,
    "reason": "user does not have read access to the namespace"
  }
}

非资源的访问请求路径包括/api、/apis、/metrics、/resetMetrics、/logs、/debug、/healthz、/swagger-ui、/swaggerapi、/ui和/version。
通常可以对/api、/api/*、/apis、/apis/*和/version对于客户端发现服务器提供的资源和版本信息给予”允许“的授权。对于其他非资源的访问一般可以禁止，以限制客户端对API Server进行没必要的查询。
查询/debug的请求报文示例如下：
{
  "apiVersion": "authorization.k8s.io/v1beta1",
  "kind": "SubjectAccessReview",
  "spec": {
    "nonResourceAttributes": {
      "path": "/debug",
      "verb": "get"
    },
    "user": "jane",
    "group": [
      "group1",
      "group2"
    ]
  }
}

2.3 RBAC授权模式详解
RBAC，基于角色的访问控制，在k8s v1.5中引入，在v1.6版本时升级为Beta版本，并成为kubeadm安装方式下的默认选项。
RBAC具有如下优势：
对集群中的资源和非资源权限均有完整的覆盖。
整个RBAC完全由几个API对象完成，同其他API对象一样，可以用kubectl或API进行操作。
可以在运行时进行调整，无须重新启动API Server。
要使用RBAC授权模式，则需要在API Server的启动参数中加上--authorization-mode=RBAC .

下面对RBAC的原理和用法进行说明。
1）RBAC的API资源对象说明
RBAC引入了4个新的顶级资源对象：
Role
ClusterRole
RoleBinding
ClusterRoleBinding
同其他API资源对象一样，用户可以使用kubectl或API调用等方式操作这些资源对象。
（1）角色（Role）
一个角色就是一组权限的集合，这里的权限都是许可形式的，不存在拒绝的规则（效果类似于白名单）。在一个命名空间中，可以用角色来定义一个角色，如果是集群级别的，就需要使用ClusterRole了。
角色只能对命名空间内的资源进行授权。下面的例子中定义的角色具备读取Pod的权限：
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""]    # ""空字符串，表示核心API群
  resources: ["pods"]
  verbs: ["get", "watch", "list"]

rules中的参数说明如下：
apiGroups: 支持的API组列表,例如"apiVersion: batch/v1"、"apiVersion: extensions:v1beta1"、"apiVersion:apps/v1beta1"等。
resources：支持的资源对象列表，例如pods、deployments、jobs等。
verbs：对资源对象的操作方法列表，例如get、watch、list、delete、replace、patch等。

（2）集群角色（ClusterRole）
集群角色除了具有和角色一致的命名空间内资源的管理能力，因其集群级别的生效范围，还可以用于以下特殊元素的授权管理上：
集群范围的资源，如Node。
非资源型的路径，如"/healthz"。
包含全部命名空间的资源，例如pods（用于kubectl get pods --all-namespaces这样的操作授权）

下面的集群角色可以让用户有权访问任意一个或所有命名空间的secrets（视其绑定方式而定）：
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  # ClusterRole不受限于命名空间，所以省略了namespace name的定义
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]


（3）角色绑定（RoleBinding）和集群角色绑定（ClusterRoleBinding）
角色绑定或集群角色绑定用来把一个角色绑定到一个目标上，绑定目标可以是User（用户）、Group（组）或者Service Account。使用RoleBinding可以为某个命名空间授权，使用ClusterRoleBinding可以为集群范围内授权。
RoleBinding可以引用Role进行授权。
下例中的RoleBinding将在default命名空间中把pod-reader角色授予用户jane，这一操作让jane可以读取default命名空间中的Pod：
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
  roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io

RoleBinding也可以引用ClusterRole进行授权。
RoleBinding可以引用ClusterRole，对属于同一命名空间内ClusterRole定义的资源主体进行授权。一种很常用的做法就是，集群管理员为集群范围预定义好一组角色（ClusterRole），然后在多个命名空间中重复使用这些ClusterRole。这样可以大幅提高授权管理工作效率，也使得各个命名空间下的基础性授权规则与使用体验保持一致。
例如下面， 虽然secret-reader是一个集群角色，但是因为使用了RoleBinding，所以dave只能读取development命名空间中的secret。
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: read-secrets
  namespace: development   # 集群角色中，只有在development命名空间中的权限才能赋予dave
subjects:
- kind: User
  name: dave
  apiGroup: rbac.authorization.k8s.io
  roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io

ClusterRoleBinding，集群角色绑定中的角色只能是集群角色。用于进行集群级别或者对所有命名空间都生效的授权。
下面的例子中允许manager组的用户读取任意namespace中的secret：
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: read-secrets-global
subjects:
- kind: Group
  name: manager
  apiGroup: rbac.authorization.k8s.io
  roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io

下图展示了上述对Pod的get/watch/list操作进行授权的Role和RoleBinding逻辑关系。


2）对资源的引用方式
多数资源可以用其名称的字符串来表达，也就是Endpoint中的URL相对路径，例如pods。
然而，某些k8s API包含下级资源，例如Pod的日志（logs）。Pod日志的Endpoint是GET/api/v1/namespaces/{namespace}/pods/{name}/log 。
在这个例子中，Pod是一个命名空间内的资源，log就是一个下级资源。要在RBAC角色中体现，则需要用斜线“/”来分隔资源和下级资源。
若想授权让某个主体同时能够读取Pod和Pod log，则可以配置resources为一个数组：
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: default
  name: pod-and-pod-logs-reader
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log"]
  verbs: ["get", "list"]

资源还可以通过名字（ResourceName）进行引用（这里指的是资源实例的名子）。在指定ResourceName后，使用get、delete、update和patch动词的请求，就会被限制在这个资源实例的范围内。
例如下面的声明让一个主体只能对一个configmap进行get和update操作：
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: default
  name: configmap-updater
rules:
- apiGroups: [""]
  resources: ["configmap"]
  resourceNames: ["my-configmap"]
  verbs: ["update", "get"]
  可想而知，resourceName这种用法对list、watch、create或deletecollection操作是无效的。这是因为必须要通过URL进行鉴权，而资源名称在list、watch、create或deletecollection请求中只是请求Body数据的一部分。

3）常用的角色（Role）示例
下面的例子只展示了rules部分的内容。
（1）允许读取核心API组中的Pod资源
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
  （2）允许读写"extensions"和"apps"两个API组中的"deployments"资源
  rules:
- apiGroups: ["extensions", "apps"]
  resources: ["deployments"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  （3）允许读取"pods"及读写"jobs"
  rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["batch", "extensions"]
  resources: ["jobs"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
  （4）允许读取一个名为"my-config"的ConfigMap（必须绑定到一个RoleBinding来限制到一个namespace下的ConfigMap）
  rules:
- apiGroups: [""]
  resources: ["configmaps"]
  resourceNames: ["my-config"]
  verbs: ["get"]
  （5）读取核心组的"node"资源（Node属于集群级的资源，所以必须存在于ClusterRole中，并使用ClusterRoleBinding进行绑定）
  rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
  （6）允许对非资源端点/healthz及其所有子路径进行GET和POST操作（必须使用ClusterRole和ClusterRoleBinding）
  rules:
- nonResourceURLs: ["/healthz", "/healthz/*"]
  verbs: ["get", "post"]

4）常用的角色绑定（RoleBinding）示例
注意，下面的例子中只包含subjects部分的内容。
（1）用户名"alice@example.com"
subjects:
- kind: User
  name: "alice@example.com"
  apiGroup: rbac.authorization.k8s.io
  （2）组名"frontend-admins"
  subjects:
- kind: Group
  name: "frontend-admins"
  apiGroup: rbac.authorization.k8s.io
  （3）kube-system命名空间中的默认Service Account
  subjects:
- kind: ServiceAccount
  name: default
  namespace: kube-system
  （4）"qa"命名空间中的所有Service Account
  subjects:
- kind: Group
  name: system:serviceaccounts:qa
  apiGroup: rbac.authorization.k8s.io
  （5）所有Service Account
  subjects:
- kind: Group
  name: system:serviceaccounts
  apiGroup: rbac.authorization.k8s.io
  （6）所有认证用户（v1.5版本以上）
  subjects:
- kind: Group
  name: system:authenticated
  apiGroup: rbac.authorization.k8s.io
  （7）所有未认证用户（v1.5版本以上）
  subjects:
- kind: Group
  name: system:unauthenticated
   apiGroup: rbac.authorization.k8s.io
  （8）全部用户（v1.5版本以上）
  subjects:
- kind: Group
  name: system:authenticated
   apiGroup: rbac.authorization.k8s.io
- kind: Group
  name: system:unauthenticated
  apiGroup: rbac.authorization.k8s.io

5）默认的角色和角色绑定
API Server 创建了一系列的默认 ClusterRole 和 ClusterRoleBinding 对象， 其中许多对象以 "system:" 前缀开头，代表其中绑定的资源是作为基础设施适用和占有的。修改这些资源会导致整个集群不可用。一个例子是 system:node 。这个ClusterRole角色拥有一系列的kubelet 权限，如果这个集群角色被修改了，可能会让kubelet 出现异常。
所有默认的集群角色 （ClusterRole） 和其角色绑定（role binding）都带有如下标记
kubernetes.io/bootstrapping=rbac-defaults

下面对一些常见的默认ClusterRole和ClusterRoleBinding对象进行说明。
对系统角色的说明如下表所示：

默认的ClusterRole
默认的ClusterRoleBinding
描述
system:basic-user
system:authenticated和system:unauthenticated组
让用户能够读取自身的信息
system:discovery
system:authenticated和system:unauthenticated组
对API发现Endpoint的只读访问，用于API级别的发现和协商
对用户角色的说明如下表所示：
默认的ClusterRole
默认的ClusterRoleBinding
描述
cluster-admin
system:masters组
让超级用户可以对任何资源执行任何操作。如果在ClusterRoleBinding中使用，则影响的是整个集群的所有namespace中的任何资源；如果使用的是RoleBinding，则能控制这一绑定的namespace中的资源，还包括namespace本身。
cluster-status
None
可以对基础集群状态信息进行只读访问。
admin
None
允许admin访问，可以限制在一个namespace中使用RoleBinding。如果在RoleBinding中使用，则允许对namespace中大多数资源进行读写访问，其中包含创建角色和角色绑定的能力。这一角色不允许操作namespace本身，也不能写入资源限额。
edit
None
允许对命名空间内的大多数资源进行读写操作，不允许查看或修改角色，以及角色绑定。
view
None
允许对多数对象进行只读操作，但是对角色、角色绑定及secret是不可访问的。

注：有些默认角色不是以"system:"为前缀的，这部分角色是针对用户的。其中包含超级用户角色（cluster-admin），有的用于集群一级的角色（cluster-staus），还有针对namespace的角色（admin,edit,view）。


对核心Master组件角色的说明如下表所示：
默认的ClusterRole
默认的ClusterRoleBinding
描述
system:kube-scheduler
system:kube-scheduler用户
能够访问kube-scheduler组件所需的资源
system:kube-controller-manager
system:kube-controller-manager用户
能够访问kube-controller-manager组件所需的资源，不同的控制所需的不同权限参见下表。
system:node
system:nodes组
允许访问kubelet所需的资源，包括对secret的读取，以及对Pod的写入。未来会把上面的两个权限限制在分配到本Node的对象上。今后的鉴权过程，kubelet必须以system:node及一个system:node形式的用户名进行。参看https://pr.k8s.io/40476
system:node-proxier
system:kube-proxy用户
允许访问kube-proxy所需的资源
system:kube-scheduler
system:kube-scheduler用户
能够访问kube-scheduler组件所需的资源
对其他组件角色的说明如下表所示：
默认的ClusterRole
默认的ClusterRoleBinding
描述
system:auth-delegator
None
允许对授权和认证进行托管，通常用于附加的API服务器
system:heapster
None
Heapster组件的角色
system:kube-aggregator
None
kube-aggregator的角色
system:kube-dns
在kube-system namespace中kube-dns的Service Account
kube-dns角色
system:node-bootstrapper
None
允许访问kubelet TLS启动所需的资源
system:node-problem-detector
None
允许访问node-problem-detector组件所需的资源
system:persistent-volume-provisioner
None
允许访问多数动态卷供给所需的资源
对Controller角色的说明如下表所示：
Controller角色
system:controller:attachdetach-controller
system:controller:certificate-controller
system:controller:cronjob-controller
system:controller:daemon-set-controller
system:controller:deployment-controller
system:controller:disruption-controller
system:controller:endpoint-controller
system:controller:generic-garbage-collector
system:controller:horizontal-pod-autoscaler
system:controller:job-controller
system:controller:namespace-controller
system:controller:node-controller
system:controller:persistent-volume-binder
system:controller:pod-garbage-collector
system:controller:replicaset-controller
system:controller:replication-controller
system:controller:route-controller
system:controller:service-account-controller
system:controller:service-controller
system:controller:statefulset-controller
system:controller:ttl-controller
K8s Controller Manager负责的是核心控制流。如果启用--user-service-account-credentials，则每个控制过程都会使用不同的Service Account启动。因此就有了对应各个控制过程的角色，前缀是system:controller。如果未启用这一功能，则将使用各自的凭据运行各个控制流程，这就需要为该凭据授予所有相关角色。

6）授权注意事项：预防提权和授权初始化
RBAC API拒绝用户利用编辑角色或者角色绑定的方法进行提权。这一限制是在API层面做出的，因此即使RBAC没有启动也仍然有效。
用户只能在拥有一个角色的所有权限，且与该角色的生效范围一致的前提下，才能对角色进行创建和更新。
要让一个用户能够创建或更新角色，需要：
为其授予一个允许创建/更新Role或ClusterRole资源对象的角色；
为用户授予角色，要覆盖该用户所能控制的所有权限范围。用户如果尝试创建超出其自身权限的角色或集群角色，则该API调用会被禁止。

如果一个用户的权限包含了一个角色的所有权限，那么就可以为其创建和更新角色绑定。或者如果被授予了针对某个角色的绑定授权，则也有权完成此操作。
要使用户能够创建、更新这一角色绑定或者集群角色绑定的角色，需要有如下做法：
为其授予一个允许其创建和更新角色绑定或者集群角色绑定的角色；
为其授予绑定某一角色的权限。

需要注意的是，在进行第1个角色绑定时，必须让初始用户具备其尚未被授予的权限，要进行初始的角色和角色绑定设置，有以下两种办法：
使用属于system:masters组的身份，这一群组默认具有cluster:admin这一超级角色的绑定。
如果API Server以--insecure-port参数运行，则客户端通过这个非安全端口进行接口调用，这一端口没有认证鉴权的限制。
7）对Service Account的授权管理
默认的RBAC策略为控制平台组件、节点和控制器授予有限范围的权限，但是在"kube-system"之外的Service Account是没有任何权限的。除了所有认证用户都具有的discovery权限。
在使用中，要求用户为Service Account赋予所需的权限。细粒度的角色分配能够提高安全性，但也会提高管理成本。粗放的授权方式可能会给Service Account多余的权限，但会更易于管理。

下面的实践以安全性递减的方式排序。
（1）为一个应用专属的Service Account赋权（最佳实践）
这个应用需要在Pod的Spec中指定一个serviceAccountName，用API、Application Manifest、kubectl create serviceaccount命令等创建Service Account，例如为"my-namespace"中的"my-sa"Service Account授予只读权限：
$ kubectl create rolebinding my-sa-view --clusterrole=view --serviceaccount=my-namespace:my-sa --namespace=my-namespace

（2）为一个命名空间中的"default" Service Account授权
如果一个应用没有指定serviceAccountName，则会使用"default" Service Account。注意：赋给"default" Service Account的权限会让所有没指定serviceAccountName的Pod都具有这些权限。
例如在"my-namespace"命名空间里为"default" Service Account授予只读权限：
$ kubectl create rolebinding default-view --clusterrole=view --serviceaccount=my-namespace:default --namespace=my-namespace

目前不少Add-Ons在"kube-system"命名空间中用"default" Service Account运行。要让这些Add-Ons能够使用超级用户权限，则可以把cluster-admin权限赋予"kube-system"的"default" Service Account。
注意：这一操作意味着"kube-system"命名空间包含了通向API超级用户的一个捷径！
$ kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default

（3）为命名空间内的所有Service Account授予一个角色
例如，为"my-namespace"命名空间中的所有Service Account赋予只读权限：
$ kubectl create rolebinding serviceaccounts-view --clusterrole=view --group=system:serviceaccounts:my-namespace --namespace=my-namespace

（4）为集群范围内的所有Service Account授予一个低权限角色
例如，为所有命名空间中的所有Service Account授予只读权限：
$ kubectl create clusterrolebinding serviceaccounts-view --clusterrole=view --group=system:serviceaccounts

（5）为所有Service Account授予超级用户权限（非常危险）
$ kubectl create clusterrolebinding serviceaccouns-cluster-admin --clusterrole=cluster-admin --group=system:serviceaccounts

8）使用kubectl 命令工具创建资源对象
除了使用yaml配置文件来创建这些资源对象，也可以直接使用kubectl工具对它们进行创建。
下面通过几个例子进行说明。
（1）在命名空间acme内为用户bob授权admin ClusterRole
kubectl create rolebinding bob-admin-binding --clusterrole=admin --user=bob --namespace=acme
（2）在命名空间acme内为名为myapp的Service  Account授予view ClusterRole
kubectl create rolebinding myapp-view-binding --clusterrole=view --serviceaccount=acme:myapp --namespace=acme
（3）在全集群范围内为用户root授权cluster-admin ClusterRole
kubectl create clusterrolebinding root-cluster-admin-binding --clusterrole=cluster-admin --user=root
（4）在全集群范围内为用户kubelet授予system:node ClusterRole
kubectl create clusterrolebinding kubelet-node-binding --clusterrole=system:node --user=kubelet
（5）在全集群范围内为名为myapp的Service Account授予view ClusterRole
kubectl create clusterrolebinding myapp-view-binding --clusterrole=view --serviceaccount=acme:myapp

9）RBAC的Auto-reconciliation（自动恢复）功能
自动恢复从k8s v1.6版本开始引入，每次启动时，API Server都会更新默认的集群角色的缺失权限，也会刷新默认的角色绑定中缺失的主体，以防止一些破坏性的修改，保证在集群升级的情况下，相关内容也能够及时更新。
如果不希望使用这一功能，则可以将一个默认的集群角色（ClusterRole）或者角色绑定（RoleBinding）的Annotation注解"rbac.authorization.kubernetes.io/autoupdate"值设置为false。

10）从旧版本的授权策略升级到RBAC
在k8s v1.6之前，很多Deployment都使用了比较宽松的ABAC策略，包含为所有Service Account开放完全API访问。
而默认的RBAC策略是为控制台组件、节点和控制器授予了范围受限的权限，且不会为"kube-system"以外的Service Account授予任何权限。

这样一来，可能会对现有的一些工作负载造成影响，有两种办法来解决这一问题：
（1）并行认证。RBAC和ABAC同时进行，并包含传统的ABAC策略：
--authorization-mode=RBAC,ABAC --authorization-policy-file=mypolicy.jsonl
首先会由RBAC尝试对请求进行鉴权，如果未通过，那么就轮到ABAC生效。这样所有的应用只要满足RBAC或ABAC之一即可工作。
通过输出更详细的日志信息，查看以上鉴权过程和结果。直到某一天，再也不输出RBAC鉴权失败的日志了，就可以移除ABAC了。

（2）粗放管理
可以使用RBAC的角色绑定，复制一个粗话的策略。
下面的策略会让所有Service Account都具备了集群管理员权限，所有容器运行的应用都会自动接收到Service Account的认证，能够对任何API做任何事情，包括查看Secret和修改授权。
这一策略无疑是比较凶险的。
$ kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin --user=admin --user=kubelet --group=system:serviceaccounts

2.4 Admission Control准入控制
通过认证和鉴权之后，客户端并不能得到API Server的真正响应，这个请求还需通过Admission Control所控制的一个“准入控制链”的层层考验。
Admission Control配备有一个“准入控制器”的插件列表，发送给API Server的任何请求都需要通过列表中每一个准入控制器的检查，检查不通过API Server拒绝此调用请求。
此外，准入控制器还能够修改请求参数以完成一些自动化的任务，比如Service Account这个控制器。

当前可配置的Admission Control准入控制如下：
AlwaysAdmit：允许所有请求；
AlwaysPullmages：在启动容器之前总去下载镜像，相当于在每个容器的配置项imagePullPolicy=Always
AlwaysDeny：禁止所有请求，一般用于测试；
DenyExecOnPrivileged：它会拦截所有想在Privileged Container上执行命令的请求，如果你的集群支持Privileged Container，你又希望限制用户在这些Privileged Container上执行命令，强烈推荐你使用它，其功能已经合并到DenyEscalatingExec中。
ImagePolicyWebhook：这个插件将允许后端的一个Webhook程序来完成admission controller的功能。ImagePolicyWebhook需要使用一个配置文件（通过kube-apiserver的启动参数--admission-control-config-file设置）定义后端Webhook的参数。目前该插件还处在Alpha版本。
Service Account：这个plug-in将ServiceAccount实现了自动化，默认启用，如果你想使用ServiceAccount对象，那么强烈推荐使用它。
SecurityContextDeny：这个插件将使用SecurityContext的Pod中的定义全部失效。SecurityContext在Container中定义了操作系统级别的安全设定（uid，gid，capabilityes，SELinux等）。在未启用PodSecurityPolicy的集群中建议启用该插件，以禁用容器设置的非安全访问权限。
ResourceQuota：用于资源配额管理目的，作用于namespace上，它会观察所有请求，确保在namespace上的配额不会超标。推荐在Admission Control参数列表中将这个插件安排在最后一个，以免可能被其他插件拒绝的Pod被过早分配资源。
LimitRanger：用于资源限制管理，作用于namespace上，确保对Pod进行资源限制。启用该插件还会为未设置资源限制的Pod进行默认设置，例如为namespace "default"中所有的Pod设置0.1CPU的资源请求。
InitialResources：是一个实验特性，旨在为未设置资源请求与限制的Pod，根据其镜像的历史资源的使用情况进行初始化的资源请求、限制设置。
NamespaceLifecycle：如果尝试在一个不存在的namespace中创建资源对象，则该创建请求将被拒绝。当删除一个namespace时，系统将会删除该namespace中所有对象，保存Pod，Service等。
DefaultStorageClass：为了实现共享存储的动态供应，为未指定StorageClass或PV的PVC尝试匹配默认的StorageClass，尽可能减少用户在申请PVC时所需了解的后端存储细节。
DefaultTolerationSeconds：这个插件为那些没有设置forgiveness tolerations并具有notready:NoExecute和unreachable:NoExecute两种taints的Pod设置默认的“容忍”时间，为5min。
PodSecurityPolicy：这个插件用于在创建或修改Pod时决定是否根据Pod的security context和可用的PodSecurityPolicy对Pod的安全策略进行控制。

在API Server上设置--admission-control参数，即可定制我们需要的准入控制链。
如果启用多种准入控制选项，则建议的设置（含加载顺序）如下(对k8s v1.6及以上版本建议设置)：
--admission-control=NamespaceLifecycle，LimitRanger，ServiceAccount，Persistent VolumeLabel, DefaultStorageClass, ResourceQuota,  DefaultTolerationSeconds

2.5 Service Account
Servuce Account是一种账号，但他并不是给Kubernetes的集群的用户（系统管理员、运维人员、租户用户等），而是给运行在Pod里的进程用的，它为Pod里的进程提供必要的身份证明。
Pod中访问Kubernetes API Server服务的时候，是以Service方式访问服务名为kubernetes这个服务的，而kubernetes服务又只在HTTPS安全端口443上提供服务，那么如何进行身份认证呢？
通过查看源码获知这是在用一种类似HTTP Token的新的认证方式--ServiceAccount Auth，Pod中的客户端调用Kubernetes API的时候，在HTTP Header中传递了一个Token字符串，这类似于之前提到的HTTP Token认证方式，存在以下几个不同点：
此处的Token的内容来源于Pod里指定路径下的一个文件（/run/secrets/kubernetes.io/serviceaccount/token），这种token是动态生成的，确切的说，是由KubernetesController进程用API Server的私钥（--service-account-private-key-file指定的私钥）签名生成的一个JWT Secret。
官方提供的客户端REST框架代码里，通过HTTPS方式与API Server建立链接后，会用Pod里指定路径下的一个CA证书（/run/secrets/kubernetes.io/serviceaccount/ca.crt）验证API Server发来的证书，验证是否是被CA证书签名的合法证书。
API Server收到这个Token以后，采用自己的私钥（实际是使用参数service-account-key-file指定的私钥，如果此参数没有设置，则默认采用tls-private-key-file指定的参数，即自己的私钥），对token进行合法性验证。
明白原理之后。接下来分析认证过程中涉及的Pod中的三个文件：
/run/secrets/kubernetes.io/serviceaccount/token
/run/secrets/kubernetes.io/serviceaccount/ca.crt
/run/secrets/kubernetes.io/serviceaccount/namespace（客户端采用这里指定的namespace作为参数调用Kubernetes API）
这三个文件由于参与到Pod进程与API Server认证的过程中，起到了类似Secret（私密凭据）的作用，所以他们被称为Kubernetes Secret对象。Secret从属于ServiceAccount资源对象，属于Service Account的一部分，一个ServiceAccount对象里面可以包括多个不同的Secret对象，分别用于不同目的的认证活动。

下面通过命令来直观的加深对ServiceAccount的认识：
查看系统中ServiceAccount对象，可以看到一个名为default的Service Account对象，包含一个名为default-token-xxx的Secret，这个Secret同时是“Mountable secrets”，表明他是需要被Mount到Pod上的。
kubectl describe serviceaccounts
kubectl describe secrets default-token-xxx
default-token-xxx包括三个数据项：
token
ca.crt
namespace
联想到“Mountable secrets”的标记，以及之前看到的Pod中的三个文件的文件名：每个namespace下有一个名为default的默认的ServiceAccount对象，这个ServiceAccount里有一个名为Tokens的可以作作为Volume一样被Mount到Pod里的Secret，当Pod启动时这个Secret会被自动Mount到Pod的指定目录下，用来协助完成Pod中的进程访问API Server时的身份鉴权过程。

一个ServiceAccount可以包括多个Secrets对象：
名为Tokens的Secret用于访问API Server的Secret，也被称为ServiceAccountSecret；
名为Image Pull secrets的Secret用于下载容器镜像时的认证过程，通常镜像库运行在Insecure模式下，所以这个Secret为空；
用户自定义的其他Secret，用于用户的进程；
如果一个Pod在定义时没有指定spec.service.AccountName属性，则系统会自动为其赋值为“Default”，即使用同一namespace下默认的ServiceAccount，如果某个Pod需要使用非default的ServiceAccount，需要在定义时指定：
apiVersion：v1
kind：Pod
metadata：
    name：mypod
spec：
    containers：
    - name：mycontainer
      image：
    serviceAccountName：myserviceaccount

Kubernetes之所以要创建两套独立的账号系统，原因如下：
User账号是给人用的，ServiceAccount是给Pod里的进程使用的，面向对象不同；
User账号是全局性的，ServiceAccount则属于某个具体的Namespace；
通常来说，User账号是与后端的用户数据库同步的，创建一个新用户通常要走一套复杂的业务流程才能实现，ServiceAccount的创建则需要极轻量级实现方式，集群管理员可以很容易为某些特定任务组创建一个ServiceAccount。
对于这两种不同的账户，其审计要求通常不同；
对于一个复杂的系统来说，多个组件通常拥有各种账号的配置信息，ServiceAccount是Namespace隔离的，可以针对组件进行一对一的定义，同时具备很好的“便携性”。

下面深入分析Service Account与Secret相关的一些运行机制：
Controller manager创建了ServiceAccountController与Token Controllerl两个安全相关的控制器。
其中ServiceAccountController一直监听Service Account和Namespace的事件，如果一个Namespace中没有default Service Account，那么Service Account Controller就会为该Namespace创建一个默认的（default）的Service Account，这就是我们之前看到的每个namespace下都有一个名为default的ServiceAccount的原因。

如果Controller manager进程在启动时指定了API Server私钥（service-account-private-key-file）参数，那么Controller manager会创建Token Controller。
Token Controller也监听Service Account的事件，如果发现新建的Service Account里没有对应的Service Account Secret，则会用API Server私钥创建一个Token（JWT Token），并用该Token、CA证书Namespace名称等三个信息产生一个新的Secret对象，然后放入刚才的Service Account中；如果监听到的事件是删除Service Account事件，则自动删除与该Service Account相关的所有Secret。
此外，Token Controller对象同时监听Secret的创建、修改和删除事件，并根据事件的不同做不同的处理。

当我们在API Server的鉴权过程中启用了Service Account类型的准入控制器，即在kube-apiserver的启动参数中包括下面的内容时：
--admission_control=ServiceAccount
则针对Pod新增或修改的请求，Service Account准入控制器会验证Pod里Service Account是否合法。

    1） 如果spec.serviceAccount域没有被设置，则Kubernetes默认为其制定名字为default的Serviceaccount；
    2） 如果Pod的spec.serviceAccount域指定了default以外的ServiceAccount，而该ServiceAccount没有事先被创建，则该Pod操作失败；
    3） 如果在Pod中没有指定“ImagePullSecrets”，那么该spec.serviceAccount域指定的ServiceAccount的“ImagePullSecrets”会被加入该Pod；
    4） 给Pod添加一个新的Volume，在该Volume中包含ServiceAccountSecret中的Token，并将Volume挂载到Pod中所有容器的指定目录下（/var/run/secrets/kubernetes.io/serviceaccount）;

综上所述，ServiceAccount正常运行需要以下几个控制器：
Admission Controller
Service Account Controller
Token Controller
2.6 Secret私密凭据
Secret主要作用是保管私密数据，比如密码、OAuth Tokens、SSH Keys等信息。将这些私密信息放在Secret对象中比直接放在Pod或Docker Image中要更安全，也便于使用和分发。
下面的例子用于创建一个Secret：
secret.yaml
apiVersion：v1
kind：Secret
metadata：
    name：mysecret
type： Opaque
data：
    password：dmfsdWUtMg0k
    username：dmfsdWUtMg0k

kubectl create -f secret.yaml
在上面的data域中的各子域的值必须为BASE64编码值，其中password域和username域BASE64编码前的值分别为value-1和value-2。

一旦Secret被创建，可以通过以下三个方式使用它：
在创建Pod时，通过为Pod指定ServiceAccount来自动使用该Seret；
通过挂载该Secret到Pod来使用它；
Docker镜像下载时使用，通过指定Pod的spec.ImagePullSecrets来引用它；
第一种方式主要用在API Server鉴权方面；
下面的例子展示了第二种使用方式：将一个Secret通过挂载的方式添加到Pod的Volume中。
apiVersion：v1
kind：Pod
metadata：
    name：mypod
    namespace：myns
spec：
    containers：
    - name：mycontainer
      image：redis
      volumeMounts：
      - name：foo
        mountPath：“/etc/foo”
        readOnly：true
volumes：
- name：foo
  secret：
      secretName：mysecret

第三种使用方式的使用流程如下：
（1）执行login命令，登录私有Registry
#docker login localhost：5000（输入账户及密码，如果是第1次登录则会创建新用户，并把相关信息写入~/.dockercfg文件中）
（2）用BASE64编码dockercfg的内容
#cat ~/.dockercfg|base64
（3）将上一步命令的输出结果作为Secret的“data.dockercfg”域的内容，由此来创建一个Secret
image-pull-secret.yaml：
apiVersion：v1
kind：Secret
metadata：
    name：myregistrykey
data：
    .dockercfg:oiu09joiu09ujlih8hkjh98...
type:kubernetes.io/dockercfg

# kubectl create -f image-pull-secret.yaml
（4）在创建Pod的时候引用该Secret
pods.yaml
apiVersion：v1
kind：Pod
metadata：
  name：mypod2
spec：
  containers：
    - name：foo
    image：janedoe/awexomeapp:v1
  imagePullSecrets：
    - name：myregistrykey

# kubectl create -f pods.yaml

每个单独的Secret大小不能超过1M，Kubernetes不鼓励创建大尺寸的Secret，因为如果使用大尺寸的Secret，则将大量占用API Server和kubelet的内存。
当然创建许多小的Secret也能耗尽API Server和kubelet的内存。

在使用Mount方式挂载Secret时，Container中Secret的“data”域的各个域的key值作为目录中的文件，Value值被BASE64编码后存储在相应的文件中。前面的例子中创建的Secret，被挂载到一个叫做mycontainer的container中。
在该container中可以通过命令查看所生产的文件和文件中的内容：
# ls /etc/foo
username
password
# cat /etc/foo/username
value-1
# cat /etc/foo/password
value-2

关于Secret的一些知识点：
我们可以通过Secret保管其他系统的敏感信息（比如数据库用户名和密码），并以Mount的方式将Secret挂载到Container中，然后通过访问目录中的文件的方式获取该敏感信息。
当Pod被API Server创建时，API Server不会校验该Pod引用的Secret是否存在。
一旦这个Pod被调度，则Kubelet将试着获取Secret的值。如果Secret不存在或暂时无法连接到API Server，则kubelet将按一定的时间间隔定期重试获取该Secret，并发送一个Event来解释Pod没有启动的原因。一旦Secret被Pod获取，则Kubelet将创建并Mount包含Secret的Volume。
只有所有的Volume被Mount后，Pod中的Container才会被启动。
在kubelet启动Pod中container后，Container中和Secret相关的Volume将不会被改变，即使Secret本身被修改了。

为了使用更新后的Secret，必须删除旧的Pod，并重新创建一个新的Pod，因此更新Secret的流程和部署一个新的Image是一样的。



参考：https://blog.csdn.net/watermelonbig/article/details/80059588 

<https://www.cnblogs.com/cf532088799/p/7977083.html>	

## 9.8  网络原理分析

​	Kubernetes网络模型
​	Docker网络基础
​	Docker网络实现
​	Kubernetes网络实现
​	K8s网络实战



# 10.Kubernetes认证授权实战

## 10.1  kubernetes认证及serviceaccount

<https://kubernetes.io/zh/docs/admin/service-accounts-admin/>

## 用户账户与服务账户

Kubernetes 区分用户账户和服务账户的概念主要基于以下原因：

- 用户账户是针对人而言的。 服务账户是针对运行在pod中的进程而言的。
- 用户账户是全局性的。 其名称在集群各namespace中都是全局唯一的，未来的用户资源不会做namespace隔离， 服务账户是namespace隔离的。
- 通常情况下，集群的用户账户可能会从企业数据库进行同步，其创建需要特殊权限，并且涉及到复杂的业务流程。 服务账户创建的目的是为了更轻量，允许集群用户为了具体的任务创建服务账户 (即权限最小化原则)。
- 对人员和服务账户审计所考虑的因素可能不同。
- 针对复杂系统的配置可能包含系统组件相关的各种服务账户的定义。 因为服务账户可以定制化地创建，并且有namespace级别的名称，这种配置是很轻量的。

## 服务账户的自动化

三个独立组件协作完成服务账户相关的自动化:

- 服务账户准入控制器（Service account admission controller）
- Token控制器（Token controller）
- 服务账户控制器（Service account controller）

### 服务账户准入控制器

对pod的改动通过一个被称为[Admission Controller](https://kubernetes.io/docs/admin/admission-controllers)的插件来实现。它是apiserver的一部分。 当pod被创建或更新时，它会同步地修改pod。 当该插件处于激活状态(在大多数发行版中都是默认的)，当pod被创建或更新时它会进行以下动作：

1. 如果该pod没有 `ServiceAccount` 设置，将其 `ServiceAccount` 设为 `default`。
2. 保证pod所关联的 `ServiceAccount` 存在，否则拒绝该pod。
3. 如果pod不包含 `ImagePullSecrets`设置，那么 将 `ServiceAccount`中的`ImagePullSecrets` 信息添加到pod中。
4. 将一个包含用于API访问的token的 `volume` 添加到pod中。
5. 将挂载于 `/var/run/secrets/kubernetes.io/serviceaccount` 的 `volumeSource`添加到pod下的每个容器中。

### Token管理器

Token管理器是controller-manager的一部分。 以异步的形式工作：

- 检测服务账户的创建，并且创建相应的Secret以支持API访问。
- 检测服务账户的删除，并且删除所有相应的服务账户Token Secret。
- 检测Secret的增加，保证相应的服务账户存在，如有需要，为Secret增加token。
- 检测Secret的删除，如有需要，从相应的服务账户中移除引用。

你需要通过 `--service-account-private-key-file` 参数项传入一个服务账户私钥文件至Token管理器。 私钥用于为生成的服务账户token签名。 同样地，你需要通过 `--service-account-key-file` 参数将对应的公钥传入kube-apiserver。 公钥用于认证过程中的token校验。

#### 创建额外的 API tokens

控制器中有专门的循环来保证每个服务账户中都存在API token对应的Secret。 当需要为服务账户创建额外的API token时，创建一个类型为 `ServiceAccountToken` 的Secret，并在annotation中引用服务账户，控制器会生成token并更新:

secret.json:

```json
{
    "kind": "Secret",
    "apiVersion": "v1",
    "metadata": {
        "name": "mysecretname",
        "annotations": {
            "kubernetes.io/service-account.name": "myserviceaccount"
        }
    },
    "type": "kubernetes.io/service-account-token"
}
kubectl create -f ./secret.json
kubectl describe secret mysecretname
```

#### 删除/失效 服务账户token

```shell
kubectl delete secret mysecretname
```

### 服务账户管理器

服务账户管理器管理各命名空间下的服务账户，并且保证每个活跃的命名空间下存在一个名为 “default” 的服务账户

## 10.2 使用准入控制插件

## 什么是准入控制插件？

一个准入控制插件是一段代码，它会在请求通过认证和授权之后、对象被持久化之前拦截到达 API server 的请求。插件代码运行在 API server 进程中，必须将其编译为二进制文件，以便在此时使用。

在每个请求被集群接受之前，准入控制插件依次执行。如果插件序列中任何一个拒绝了该请求，则整个请求将立即被拒绝并且返回一个错误给终端用户。

准入控制插件可能会在某些情况下改变传入的对象，从而应用系统配置的默认值。另外，作为请求处理的一部分，准入控制插件可能会对相关的资源进行变更，以实现类似增加配额使用量这样的功能。

## 为什么需要准入控制插件？

Kubernetes 的许多高级功能都要求启用一个准入控制插件，以便正确地支持该特性。因此，一个没有正确配置准入控制插件的 Kubernetes API server 是不完整的，它不会支持您所期望的所有特性。

## 如何启用一个准入控制插件？

Kubernetes API server 支持一个标志参数 `admission-control` ，它指定了一个用于在集群修改对象之前调用的以逗号分隔的准入控制插件顺序列表。

## 每个插件的功能是什么？

### AlwaysAdmit

使用这个插件自行通过所有的请求。

### AlwaysPullImages

这个插件修改每一个新创建的 Pod 的镜像拉取策略为 Always 。这在多租户集群中是有用的，这样用户就可以放心，他们的私有镜像只能被那些有凭证的人使用。没有这个插件，一旦镜像被拉取到节点上，任何用户的 pod 都可以通过已了解到的镜像的名称（假设 pod 被调度到正确的节点上）来使用它，而不需要对镜像进行任何授权检查。当启用这个插件时，总是在启动容器之前拉取镜像，这意味着需要有效的凭证。

### AlwaysDeny

拒绝所有的请求。用于测试。

### DenyExecOnPrivileged （已废弃）

如果一个 pod 拥有一个特权容器，这个插件将拦截所有在该 pod 中执行 exec 命令的请求。

如果集群支持特权容器，并且希望限制最终用户在这些容器中执行 exec 命令的能力，我们强烈建议启用这个插件。

此功能已合并到 [DenyEscalatingExec](https://kubernetes.io/zh/docs/reference/access-authn-authz/admission-controllers/#denyescalatingexec)。

### DenyEscalatingExec

这个插件将拒绝在拥有衍生特权而具备访问宿主机能力的 pod 中执行 exec 和 attach 命令。这包括在特权模式运行的 pod ，可以访问主机 IPC 命名空间的 pod ，和访问主机 PID 命名空间的 pod 。

如果集群支持使用以衍生特权运行的容器，并且希望限制最终用户在这些容器中执行 exec 命令的能力，我们强烈建议启用这个插件。

### ImagePolicyWebhook

ImagePolicyWebhook 插件允许使用一个后端的 webhook 做出准入决策。您可以按照如下配置 admission-control 选项来启用这个插件:

```shell
--admission-control=ImagePolicyWebhook
```

#### 配置文件格式

ImagePolicyWebhook 插件使用了admission config 文件 `--admission-control-config-file` 来为后端行为设置配置选项。该文件可以是 json 或 yaml ，并具有以下格式:

```javascript
{
  "imagePolicy": {
     "kubeConfigFile": "path/to/kubeconfig/for/backend",
     "allowTTL": 50,           // time in s to cache approval
     "denyTTL": 50,            // time in s to cache denial
     "retryBackoff": 500,      // time in ms to wait between retries
     "defaultAllow": true      // determines behavior if the webhook backend fails
  }
}
```

这个配置文件必须引用一个 [kubeconfig](https://kubernetes.io/docs/concepts/cluster-administration/authenticate-across-clusters-kubeconfig/) 格式的文件，并在其中配置指向后端的连接。且需要在 TLS 上与后端进行通信。

kubeconfig 文件的 cluster 字段需要指向远端服务，user 字段需要包含已返回的授权者。

```yaml
# clusters refers to the remote service.
clusters:
- name: name-of-remote-imagepolicy-service
  cluster:
    certificate-authority: /path/to/ca.pem    # CA for verifying the remote service.
    server: https://images.example.com/policy # URL of remote service to query. Must use 'https'.

# users refers to the API server's webhook configuration.
users:
- name: name-of-api-server
  user:
    client-certificate: /path/to/cert.pem # cert for the webhook plugin to use
    client-key: /path/to/key.pem          # key matching the cert
```

对于更多的 HTTP 配置，请参阅 [kubeconfig](https://kubernetes.io/docs/concepts/cluster-administration/authenticate-across-clusters-kubeconfig/) 文档。

#### 请求载荷

当面对一个准入决策时，API server 发送一个描述操作的 JSON 序列化的 api.imagepolicy.v1alpha1.ImageReview 对象。该对象包含描述被审核容器的字段，以及所有匹配 `*.image-policy.k8s.io/*` 的 pod 注释。

注意，webhook API 对象与其他 Kubernetes API 对象一样受制于相同的版本控制兼容性规则。实现者应该知道对 alpha 对象的更宽松的兼容性，并检查请求的 “apiVersion” 字段，以确保正确的反序列化。此外，API server 必须启用 imagepolicy.k8s.io/v1alpha1 API 扩展组 (`--runtime-config=imagepolicy.k8s.io/v1alpha1=true`)。

请求载荷例子：

```
{  
  "apiVersion":"imagepolicy.k8s.io/v1alpha1",
  "kind":"ImageReview",
  "spec":{  
    "containers":[  
      {  
        "image":"myrepo/myimage:v1"
      },
      {  
        "image":"myrepo/myimage@sha256:beb6bd6a68f114c1dc2ea4b28db81bdf91de202a9014972bec5e4d9171d90ed"
      }
    ],
    "annotations":[  
      "mycluster.image-policy.k8s.io/ticket-1234": "break-glass"
    ],
    "namespace":"mynamespace"
  }
}
```

远程服务将填充请求的 ImageReviewStatus 字段，并返回允许或不允许访问。响应主体的 “spec” 字段会被忽略，并且可以省略。一个允许访问应答会返回：

```
{
  "apiVersion": "imagepolicy.k8s.io/v1alpha1",
  "kind": "ImageReview",
  "status": {
    "allowed": true
  }
}
```

不允许访问，服务将返回：

```
{
  "apiVersion": "imagepolicy.k8s.io/v1alpha1",
  "kind": "ImageReview",
  "status": {
    "allowed": false,
    "reason": "image currently blacklisted"
  }
}
```

更多的文档，请参阅 `imagepolicy.v1alpha1` API 对象 和 `plugin/pkg/admission/imagepolicy/admission.go`。

使用注解进行扩展

一个 pod 中匹配 `*.image-policy.k8s.io/*` 的注解都会被发送给 webhook。这允许了解镜像策略后端的用户向它发送额外的信息，并为不同的后端实现接收不同的信息。

您可以在这里输入的信息有：

- 在紧急情况下，请求 “break glass” 覆盖一个策略。 <!–
- a ticket number from a ticket system that documents the break-glass request –>
- 从一个记录了 break-glass 的请求的票证系统得到的一个票证编号 <!–
- provide a hint to the policy server as to the imageID of the image being provided, to save it a lookup –>
- 向策略服务器提供一个提示，用于提供镜像的 imageID，以方便它进行查找

在任何情况下，注解都是由用户提供的，并不会被 Kubernetes 以任何方式进行验证。在将来，如果一个注解确定将被广泛使用，它可能会被提升为 ImageReviewSpec 的一个命名字段。

### ServiceAccount

这个插件实现了 [serviceAccounts](https://kubernetes.io/docs/user-guide/service-accounts) 的自动化。 如果您打算使用 Kubernetes 的 ServiceAccount 对象，我们强烈建议您使用这个插件。

### SecurityContextDeny

该插件将拒绝任何试图设置特定扩展 [SecurityContext](https://kubernetes.io/docs/user-guide/security-context) 字段的 pod。如果集群没有使用 [pod 安全策略](https://kubernetes.io/docs/user-guide/pod-security-policy) 来限制安全上下文所能获取的值集，那么应该启用这个功能。

### ResourceQuota

此插件将观察传入的请求，并确保它不违反任何一个 `Namespace` 中的 `ResourceQuota` 对象中枚举出来的约束。如果您在 Kubernetes 部署中使用了 `ResourceQuota` ，您必须使用这个插件来强制执行配额限制。

请查看 [resourceQuota 设计文档](https://git.k8s.io/community/contributors/design-proposals/admission_control_resource_quota.md) 和 [Resource Quota 例子](https://kubernetes.io/docs/concepts/policy/resource-quotas/) 了解更多细节。

强烈建议将这个插件配置在准入控制插件序列的末尾。这样配额就不会过早地增加，只会在稍后的准入控制中被拒绝。

### LimitRanger

这个插件将观察传入的请求，并确保它不会违反 `Namespace` 中 `LimitRange` 对象枚举的任何约束。如果您在 Kubernetes 部署中使用了 `LimitRange` 对象，则必须使用此插件来执行这些约束。LimitRanger 插件还可以用于将默认资源请求应用到没有指定任何内容的 Pod ；当前，默认的 LimitRanger 对 `default` 命名空间中的所有 pod 应用了0.1 CPU 的需求。

请查看 [limitRange 设计文档](https://git.k8s.io/community/contributors/design-proposals/admission_control_limit_range.md) 和 [Limit Range 例子](https://kubernetes.io/docs/tasks/configure-pod-container/limit-range/) 了解更多细节。

### InitialResources （试验）

此插件观察 pod 创建请求。如果容器忽略了 requests 和 limits 计算资源，那么插件就会根据运行相同镜像的容器的历史使用记录来自动填充计算资源请求。如果没有足够的数据进行决策，则请求将保持不变。当插件设置了一个计算资源请求时，它会用它自动填充的计算资源对 pod 进行注解。

请查看 [InitialResouces 建议书](https://git.k8s.io/community/contributors/design-proposals/initial-resources.md) 了解更多细节。

### NamespaceLifecycle

这个插件强制不能在一个正在被终止的 `Namespace` 中创建新对象，和确保使用不存在 `Namespace` 的请求被拒绝。

删除 `Namespace` 触发了在该命名空间中删除所有对象（ pod 、 services 等）的一系列操作。为了确保这个过程的完整性，我们强烈建议启用这个插件。

### DefaultStorageClass

这个插件观察不指定 storage class 字段的 `PersistentVolumeClaim` 对象的创建，并自动向它们添加默认的 storage class 。这样，不指定 storage class 字段的用户根本无需关心它们，它们将得到默认的 storage class 。

当没有配置默认 storage class 时，这个插件不会执行任何操作。当一个以上的 storage class 被标记为默认时，它拒绝 `PersistentVolumeClaim` 创建并返回一个错误，管理员必须重新检查 `StorageClass` 对象，并且只标记一个作为默认值。这个插件忽略了任何 `PersistentVolumeClaim` 更新，它只对创建起作用。

查看 [persistent volume](https://kubernetes.io/docs/user-guide/persistent-volumes) 文档了解 persistent volume claims 和 storage classes 并了解如何将一个 storage classes 标志为默认。

### DefaultTolerationSeconds

这个插件设置了 pod 默认的宽恕容忍时间，对于那些没有设置宽恕容忍时间的 pod ，可以容忍 `notready:NoExecute` 和 `unreachable:NoExecute` 这些 taint 5分钟。

### PodNodeSelector

通过读取命名空间注释和全局配置,这个插件默认并限制了在一个命名空间中使用什么节点选择器。

#### 配置文件格式

PodNodeSelector 插件使用准入配置文件 `--admission-control-config-file` 来设置后端行为的配置选项。

请注意，配置文件格式将在未来版本中移至版本化文件。

这个文件可能是 json 或 yaml ，格式如下：

```yaml
podNodeSelectorPluginConfig:
 clusterDefaultNodeSelector: <node-selectors-labels>
 namespace1: <node-selectors-labels>
 namespace2: <node-selectors-labels>
```

#### 配置注解格式

PodNodeSelector 插件使用键为 `scheduler.alpha.kubernetes.io/node-selector` 的注解将节点选择器分配给 namespace 。

```yaml
apiVersion: v1
kind: Namespace
metadata:
  annotations:
    scheduler.alpha.kubernetes.io/node-selector: <node-selectors-labels>
  name: namespace3
```

### PodSecurityPolicy

此插件负责在创建和修改 pod 时根据请求的安全上下文和可用的 pod 安全策略确定是否应该通过 pod。

对于 Kubernetes < 1.6.0 的版本，API Server 必须启用 extensions/v1beta1/podsecuritypolicy API 扩展组 (`--runtime-config=extensions/v1beta1/podsecuritypolicy=true`)。

查看 [Pod 安全策略文档](https://kubernetes.io/docs/concepts/policy/pod-security-policy/) 了解更多细节。

### NodeRestriction

这个插件限制了 kubelet 可以修改的 `Node` 和 `Pod` 对象。 为了受到这个入场插件的限制，kubelet 必须在 `system：nodes` 组中使用凭证，并使用 `system：node：<nodeName>` 形式的用户名。这样的 kubelet 只允许修改自己的 `Node` API 对象，只能修改绑定到节点本身的 `Pod` 对象。 未来的版本可能会添加额外的限制，以确保 kubelet 具有正确操作所需的最小权限集。

## 是否有推荐的一组插件可供使用？

有。 对于 Kubernetes >= 1.6.0 版本，我们强烈建议运行以下一系列准入控制插件（顺序也很重要）

```shell
--admission-control=NamespaceLifecycle,LimitRanger,ServiceAccount,PersistentVolumeLabel,DefaultStorageClass,ResourceQuota,DefaultTolerationSeconds
```

对于 Kubernetes >= 1.4.0 版本，我们强烈建议运行以下一系列准入控制插件（顺序也很重要）

```shell
--admission-control=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota
```

对于 Kubernetes >= 1.2.0 版本，我们强烈建议运行以下一系列准入控制插件（顺序也很重要）

```shell
--admission-control=NamespaceLifecycle,LimitRanger,ServiceAccount,ResourceQuota
```

对于 Kubernetes >= 1.0.0 版本，我们强烈建议运行以下一系列准入控制插件（顺序也很重要）

```shell
--admission-control=NamespaceLifecycle,LimitRanger,SecurityContextDeny,ServiceAccount,PersistentVolumeLabel,ResourceQuota
```

## 10.3  kubernetes RBAC

## 概述

Kuberntes中API Server的访问控制过程图示如下：

[![access-control-overview](https://blog.frognew.com/images/2017/04/access-control-overview.png)](https://blog.frognew.com/images/2017/04/access-control-overview.png)

在Kubernetes中，授权(authorization)是在认证(authentication)之后的一个步骤。 授权就是决定一个用户(普通用户或ServiceAccount)是否有权请求Kubernetes API做某些事情。

之前，Kubernetes中的授权策略主要是ABAC(Attribute-Based Access Control)。 对于ABAC，Kubernetes在实现上是比较难用的，而且需要Master Node的SSH和根文件系统访问权限，授权策略发生变化后还需要重启API Server。

Kubernetes 1.6中，RBAC(Role-Based Access Control)基于角色的访问控制进入Beta阶段。RBAC访问控制策略可以使用kubectl或Kubernetes API进行配置。 使用RBAC可以直接授权给用户，让用户拥有授权管理的权限，这样就不再需要直接触碰Master Node。 在Kubernetes中RBAC被映射成API资源和操作。

## RBAC API的资源对象

在Kubernetes 1.6中通过启动参数`--authorization-mode=RBAC. API Overview`为API Server启用RBAC。

使用kubeadm初始化的1.6版本的Kubernetes集群，已经默认为API Server开启了RBAC，可以查看Master Node上API Server的静态Pod定义文件：

```
cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep RBAC
    - --authorization-mode=RBAC
```

RBAC API定义了四个资源对象用于描述RBAC中用户和资源之间的连接权限：

- Role
- ClusterRole
- RoleBinding
- ClusterRoleBinding

### Role和ClusterRole

Role是一系列权限的集合。Role是定义在某个Namespace下的资源，在这个具体的Namespace下使用。 ClusterRole与Role相似，只是ClusterRole是整个集群范围内使用的。

下面我们使用kubectl打印一下Kubernetes集群中的Role和ClusterRole：

```
kubectl get roles --all-namespaces
NAMESPACE     NAME                                        AGE
kube-public   system:bootstrap-signer-clusterinfo         6d
kube-public   system:controller:bootstrap-signer          6d
kube-system   extension-apiserver-authentication-reader   6d
kube-system   system:controller:bootstrap-signer          6d
kube-system   system:controller:token-cleaner             6d
```

```
kubectl get ClusterRoles
NAME                                           AGE
admin                                          6d
cluster-admin                                  6d
edit                                           6d
flannel                                        5d
system:auth-delegator                          6d
system:basic-user                              6d
system:controller:attachdetach-controller      6d
......
system:kube-aggregator                         6d
system:kube-controller-manager                 6d
system:kube-dns                                6d
system:kube-scheduler                          6d
system:node                                    6d
system:node-bootstrapper                       6d
system:node-problem-detector                   6d
system:node-proxier                            6d
system:persistent-volume-provisioner           6d
view                                           6d
```

可以看到之前创建的这个Kubernetes集群中已经内置或创建很多的Role和ClusterRole。

下面在default命名空间内创建一个名称为pod-reader的Role，role-pord-reader.yaml文件如下：

```
kind: Role
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```

```
kubectl create -f role-pord-reader.yaml
role "pod-reader" created

kubectl get roles
NAME         AGE
pod-reader   1m
```

注意RBAC在Kubernetes 1.6还处于Beta阶段，所以API归属在`rbac.authorization.k8s.io`，上面的`apiVersion`为`rbac.authorization.k8s.io/v1beta1`。

下面再给一个ClusterRole的定义文件：

```
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
```

### RoleBinding和ClusterRoleBinding

RoleBinding把Role绑定到账户主体Subject，让Subject继承Role所在namespace下的权限。 ClusterRoleBinding把ClusterRole绑定到Subject，让Subject集成ClusterRole在整个集群中的权限。

账户主体Subject在这里还是叫“用户”吧，包含组group，用户user和ServiceAccount。

```
kubectl get rolebinding --all-namespaces
NAMESPACE     NAME                                   AGE
kube-public   kubeadm:bootstrap-signer-clusterinfo   6d
kube-public   system:controller:bootstrap-signer     6d
kube-system   system:controller:bootstrap-signer     6d
kube-system   system:controller:token-cleaner        6d
```

实际上一个RoleBinding既可以引用相同namespace下的Role；又可以引用一个ClusterRole，RoleBinding引用ClusterRole时用户继承的权限会被限制在RoleBinding所在的namespace下。

```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: read-pods
  namespace: default
subjects:
- kind: User
  name: jane
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io
```

```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1beta1
metadata:
  name: read-secrets
  namespace: development # This only grants permissions within the "development" namespace.
subjects:
- kind: User
  name: dave
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```

## Kubernetes中默认的Role和RoleBinding

API Server已经创建一系列ClusterRole和ClusterRoleBinding。这些资源对象中名称以`system:`开头的，表示这个资源对象属于Kubernetes系统基础设施。 也就说RBAC默认的集群角色已经完成足够的覆盖，让集群可以完全在 RBAC的管理下运行。 修改这些资源对象可能会引起未知的后果，例如对于`system:node`这个ClusterRole定义了kubelet进程的权限，如果这个角色被修改，可能导致kubelet无法工作。

可以使用`kubernetes.io/bootstrapping=rbac-defaults`这个label查看默认的ClusterRole和ClusterRoleBinding：

```
kubectl get clusterrole -l kubernetes.io/bootstrapping=rbac-defaults
NAME                                           AGE
admin                                          6d
cluster-admin                                  6d
edit                                           6d
system:auth-delegator                          6d
system:basic-user                              6d
system:controller:attachdetach-controller      6d
system:controller:certificate-controller       6d
......
system:node-problem-detector                   6d
system:node-proxier                            6d
system:persistent-volume-provisioner           6d
view                                           6d
```

```
kubectl get clusterrolebinding -l kubernetes.io/bootstrapping=rbac-defaults
NAME                                           AGE
cluster-admin                                  6d
system:basic-user                              6d
system:controller:attachdetach-controller      6d
system:controller:certificate-controller       6d
system:controller:cronjob-controller           6d
system:controller:daemon-set-controller        6d
system:controller:deployment-controller        6d
......
system:discovery                               6d
system:kube-controller-manager                 6d
system:kube-dns                                6d
system:kube-scheduler                          6d
system:node                                    6d
system:node-proxier                            6d
```

关于这些角色详细的权限信息可以查看[Default Roles and Role Bindings](https://kubernetes.io/docs/admin/authorization/rbac/#default-roles-and-role-bindings)

参考：<https://blog.frognew.com/2017/04/kubernetes-1.6-rbac.html>



## 10.4  kubernetes dashboard认证及分级授权

参考：<https://www.cnblogs.com/panwenbin-logs/p/10052554.html>

### 第一章、部署dashboard

```
作为Kubernetes的Web用户界面，用户可以通过Dashboard在Kubernetes集群中部署容器化的应用，对应用进行问题处理和管理，并对集群本身进行管理。通过Dashboard，用户可以查看集群中应用的运行情况，同时也能够基于Dashboard创建或修改部署、任务、服务等Kubernetes的资源。通过部署向导，用户能够对部署进行扩缩容，进行滚动更新、重启Pod和部署新应用。
```

**项目地址：https://github.com/kubernetes/dashboard，根据项目中的介绍，我们自己在线安装即可，但是实际上我们国内用户无法自己安装，需要下载后修改文件才能使用**

**下载yaml文件**

```
[root@k8s-master01 manifests]# mkdir dashboard^C
[root@k8s-master01 manifests]# cd dashboard/
[root@k8s-master01 dashboard]# wget  https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

修改yaml文件中镜像的地址及service的类型

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202104559816-817595713.png)

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202104727393-1368655718.png)

**修改完成后，应用yaml文件**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@k8s-master01 dashboard]# kubectl apply -f kubernetes-dashboard.yaml 
serviceaccount "kubernetes-dashboard" unchanged
role.rbac.authorization.k8s.io "kubernetes-dashboard-minimal" unchanged
rolebinding.rbac.authorization.k8s.io "kubernetes-dashboard-minimal" unchanged
deployment.apps "kubernetes-dashboard" configured
service "kubernetes-dashboard" configured
[root@k8s-master01 dashboard]# kubectl get pod -n kube-system   #dashborad存在于kube-system名称空间中
NAME                                    READY     STATUS    RESTARTS   AGE
......
kubernetes-dashboard-7b689d867f-f67hm   1/1       Running   0          27s
[root@k8s-master01 dashboard]# kubectl get svc -n kube-system  #查看service和端口是否开启
NAME                   TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)         AGE
......
kubernetes-dashboard   NodePort    10.101.22.15   <none>        443:32333/TCP   13m
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**通过masterIP:port进行访问，正常应该会出现下面的界面**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202104957932-747211865.png)

**从界面中可以看到访问dashboard需要通过config或者token授权才能登陆，但是dashboard本身不提供授权，因为dashborad是一个pod，实际上我们是使用这个pod认证到k8s的集群中去的，我们需要为dashborad的pod提供config或者token认证，所以这里的认证主体应该是serviceaccount**

**如果出现以下界面**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202105243737-1611913.png)

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202105307894-1191410367.png)

**这是因为yaml文件中创建secret有问题，我们需要手动创建一个证书来进行认证，下面我们创建一个证书**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@k8s-master01 dashboard]# cd /etc/kubernetes/pki/
[root@k8s-master01 pki]# (umask 077; openssl genrsa -out dashboard.key 2048)  #创建一个证书
Generating RSA private key, 2048 bit long modulus
............................................................................................+++
.............+++
e is 65537 (0x10001)
[root@k8s-master01 pki]# openssl req -new -key dashboard.key -out dashboard.csr -subj "/O=qiangungun/CN=kubernetes-dashboard"    #建立证书的签署请求
[root@k8s-master01 pki]# openssl x509 -req -in dashboard.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out dashboard.crt -days 3650 #使用集群的ca来签署证书
Signature ok
subject=/O=qiangungun/CN=kubernetes-dashboard
Getting CA Private Key
[root@k8s-master01 pki]# kubectl create secret generic kubernetes-dashboard-certs --from-file=dashboard.crt=./dashboard.crt --from-file=dashboard.key=./dashboard.key  -n kube-system  #我们需要把我们创建的证书创建为secret给k8s使用
secret "kubernetes-dashboard-certs" created
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**注释dashborad yaml文件中secret的配置**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202110817099-567876207.png)

**重新应用yaml文件**

```
[root@k8s-master01 dashboard]# kubectl delete  -f kubernetes-dashboard.yaml 
[root@k8s-master01 dashboard]# kubectl apply  -f kubernetes-dashboard.yaml 
```

**再次访问应该就正常了**

### 第二章、创建以token方式登录dashborad的用户

#### 1.创建具有集群管理权限的用户登录dashborad

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@k8s-master01 dashboard]# kubectl create serviceaccount dashboard-admin -n kube-system #创建用于登录dashborad的serviceaccount账号
serviceaccount "dashboard-admin" created
[root@k8s-master01 dashboard]# kubectl create clusterrolebinding dashboard-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:dashboard-admin   #创建一个clusterrolebingding，将名称为cluster-admin的clusterrole绑定到我们刚刚从的serviceaccount上，名称空间和sa使用:作为间隔
clusterrolebinding.rbac.authorization.k8s.io "dashboard-cluster-admin" created   
[root@k8s-master01 dashboard]# kubectl get secret -n kube-system #创建完成后系统会自动创建一个secret，名称以serviceaccount名称开头
NAME                                             TYPE                                  DATA      AGE
......
dashboard-admin-token-pbsj9                      kubernetes.io/service-account-token   3         4m
.....
[root@k8s-master01 dashboard]# kubectl describe secret dashboard-admin-token-pbsj9 -n kube-system  #使用describe查看该secret的详细信息，主要是token一段
Name:         dashboard-admin-token-pbsj9
Namespace:    kube-system
Labels:       <none>
Annotations:  kubernetes.io/service-account.name=dashboard-admin
              kubernetes.io/service-account.uid=b24fb2eb-f5e1-11e8-8969-5254001b07db

Type:  kubernetes.io/service-account-token

Data
====
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJkYXNoYm9hcmQtYWRtaW4tdG9rZW4tcGJzajkiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGFzaGJvYXJkLWFkbWluIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiYjI0ZmIyZWItZjVlMS0xMWU4LTg5NjktNTI1NDAwMWIwN2RiIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omt1YmUtc3lzdGVtOmRhc2hib2FyZC1hZG1pbiJ9.jDtIZFrcAPkr71pSStWm1AD4_gJM9A4JeYics3Nxs0hm2NQSCgL_pAIlVlSiHELmn3TLasOcvy8SljQnZQJcLKSkP-ubSBe8IkzXJkBr3SOhEr6eHb1ZDHXtC9bx58QH6PEOnO3hwoUaEtcIMuzC8ULbMp5f4TCvZ5mSKL_WPwaVJgZZDteUBPOsZHfcfIyatjXOWZBhiWbD3UZIN47ghpZl6BdXVeqLT5ua8Z8G0qtRD-DoDiQOaQ5Z9nKo_yluyb5cLJgpAtAl9i4Df7exHgVRnPETk1fbnxCDTGYlEgmLKFU6tRCEKl5Q66O9TICpdJIeT4sUBJxDSFVScPNFrA
ca.crt:     1025 bytes
namespace:  11 bytes
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**复制secret中的token，来访问dashborad**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202113325953-1615524893.png)

**选择令牌，并粘贴刚刚复制的token，点击登录**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202113641908-1064249082.png)

**可以看到，可以管理集群中的所有资源**

#### 2、创建具有指定名称空间管理权限的用户登录dashborad

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@k8s-master01 dashboard]# kubectl create serviceaccount default-ns-admin -n default #再次创建一个serviceaccount，指定名称空间为default
serviceaccount "default-ns-admin" created
[root@k8s-master01 dashboard]# kubectl create rolebinding default-ns-admin --clusterrole=admin --serviceaccount=default:default-ns-admin #使用rolebinding绑定clusterrole用户admin到刚刚创建的serviceaccount上
rolebinding.rbac.authorization.k8s.io "default-ns-admin" created
[root@k8s-master01 dashboard]# kubectl get secret 
NAME                           TYPE                                  DATA      AGE
......
default-ns-admin-token-26xgs   kubernetes.io/service-account-token   3         2m
......
[root@k8s-master01 dashboard]# kubectl describe secret default-ns-admin-token-26xgs 
Name:         default-ns-admin-token-26xgs
Namespace:    default
Labels:       <none>
Annotations:  kubernetes.io/service-account.name=default-ns-admin
              kubernetes.io/service-account.uid=b13f19e9-f5ec-11e8-8969-5254001b07db

Type:  kubernetes.io/service-account-token

Data
====
ca.crt:     1025 bytes
namespace:  7 bytes
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtbnMtYWRtaW4tdG9rZW4tMjZ4Z3MiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdC1ucy1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImIxM2YxOWU5LWY1ZWMtMTFlOC04OTY5LTUyNTQwMDFiMDdkYiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmRlZmF1bHQtbnMtYWRtaW4ifQ.T1TsD-SyHDgpMMLWk75TFtYxOzc6SQcUHD4FsNEEjx6p48G9smBoh7fO6_y9NIvZKCjIGvzKt-ZUhRg7Oxk6vL2JIODe2apQQQBYyIzzW2y1ZFSICPpEHs0FYwt84RsUefGLLfEq0BrGa22mV58UfcttSMZN9LAUuWYe_1UX81F9neAuknKO78BNzif854SFOLvOaqOqNfMSiXs8Fi3vWPLi8_QFihObrC_FkDBhzc62zYtXzpH8T7gzadfAIexLpX7__RmcY8Cuaf7XvRh-zn3SAcmwo8v2ydtwOwTOtPA-6gEXGSM2UfR-rZ0WloPCIvGonej8fbNgH8G9sT2KTg
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**使用此token登录dashborad**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202124749441-1777854073.png)

**可以看到，出来default名称空间之外，无法看到其他名称空间了**

### 第三章、创建以config方式登录dashborad的用户

**为了方面我们直接使用刚刚创建的serviceaccount的token作为认证信息**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@k8s-master01 dashboard]# cd /etc/kubernetes/pki/
[root@k8s-master01 pki]# kubectl config set-cluster kubernetes --certificate-authority=./ca.crt --server="https://172.16.150.212:6443" --embed-certs=true --kubeconfig=/root/def-ns-admin.conf  #新建一个cluster，名称为kubernetes，使用当前集群的ca进行认证，并指定kubeconfig文件位置
Cluster "kubernetes" set.
[root@k8s-master01 pki]# kubectl config view --kubeconfig=/root/def-ns-admin.conf  #查看创建信息
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: REDACTED
    server: https://172.16.150.212:6443
  name: kubernetes
contexts: []
current-context: ""
kind: Config
preferences: {}
users: []
[root@k8s-master01 pki]# cd 
[root@k8s-master01 ~]# kubectl get secret 
[root@k8s-master01 ~]# DEF_NS_ADMIN_TOKEN=$(kubectl get secret default-ns-admin-token-26xgs -o jsonpath={.data.token}|base64 -d) #k8s生成的token为base64加密，所有需要使用base64进行解密
[root@k8s-master01 ~]# kubectl config set-credentials def-ns-admin --token=$DEF_NS_ADMIN_TOKEN --kubeconfig=/root/def-ns-admin.conf #创建一个serviceaccount的用户
User "def-ns-admin" set.
[root@k8s-master01 manifests]# kubectl config view --kubeconfig=/root/def-ns-admin.conf 
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: REDACTED
    server: https://172.16.150.212:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: def-ns-admin
  name: def-ns-admin@kubernetes
current-context: ""
kind: Config
preferences: {}
users:
- name: def-ns-admin
  user:
    token: eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtbnMtYWRtaW4tdG9rZW4tMjZ4Z3MiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdC1ucy1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImIxM2YxOWU5LWY1ZWMtMTFlOC04OTY5LTUyNTQwMDFiMDdkYiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmRlZmF1bHQtbnMtYWRtaW4ifQ.T1TsD-SyHDgpMMLWk75TFtYxOzc6SQcUHD4FsNEEjx6p48G9smBoh7fO6_y9NIvZKCjIGvzKt-ZUhRg7Oxk6vL2JIODe2apQQQBYyIzzW2y1ZFSICPpEHs0FYwt84RsUefGLLfEq0BrGa22mV58UfcttSMZN9LAUuWYe_1UX81F9neAuknKO78BNzif854SFOLvOaqOqNfMSiXs8Fi3vWPLi8_QFihObrC_FkDBhzc62zYtXzpH8T7gzadfAIexLpX7__RmcY8Cuaf7XvRh-zn3SAcmwo8v2ydtwOwTOtPA-6gEXGSM2UfR-rZ0WloPCIvGonej8fbNgH8G9sT2KTg
[root@k8s-master01 manifests]# kubectl config use-context def-ns-admin@kubernetes --kubeconfig=/root/def-ns-admin.conf #设置当前serviceaccount的上下文
Switched to context "def-ns-admin@kubernetes".
[root@k8s-master01 manifests]# kubectl config view --kubeconfig=/root/def-ns-admin.conf 
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: REDACTED
    server: https://172.16.150.212:6443
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: def-ns-admin
  name: def-ns-admin@kubernetes
current-context: def-ns-admin@kubernetes
kind: Config
preferences: {}
users:
- name: def-ns-admin
  user:
    token: eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtbnMtYWRtaW4tdG9rZW4tMjZ4Z3MiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdC1ucy1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImIxM2YxOWU5LWY1ZWMtMTFlOC04OTY5LTUyNTQwMDFiMDdkYiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmRlZmF1bHQtbnMtYWRtaW4ifQ.T1TsD-SyHDgpMMLWk75TFtYxOzc6SQcUHD4FsNEEjx6p48G9smBoh7fO6_y9NIvZKCjIGvzKt-ZUhRg7Oxk6vL2JIODe2apQQQBYyIzzW2y1ZFSICPpEHs0FYwt84RsUefGLLfEq0BrGa22mV58UfcttSMZN9LAUuWYe_1UX81F9neAuknKO78BNzif854SFOLvOaqOqNfMSiXs8Fi3vWPLi8_QFihObrC_FkDBhzc62zYtXzpH8T7gzadfAIexLpX7__RmcY8Cuaf7XvRh-zn3SAcmwo8v2ydtwOwTOtPA-6gEXGSM2UfR-rZ0WloPCIvGonej8fbNgH8G9sT2KTg
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**导出/root/def-ns-admin.conf到客户端上，并选择kubeconfig方式登录，点击选择文件即可**

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202131503951-1818092118.png)

![img](https://img2018.cnblogs.com/blog/911490/201812/911490-20181202131519204-1782551273.png)

**没有问题，登录成功**

### 第四章、Dashboard使用

**1 、Dashboard提供的功能**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
在默认情况下，Dashboard显示默认(default)命名空间下的对象，也可以通过命名空间选择器选择其他的命名空间。在Dashboard用户界面中能够显示集群大部分的对象类型。

1）集群管理
集群管理视图用于对节点、命名空间、持久化存储卷、角色和存储类进行管理。 节点视图显示CPU和内存的使用情况，以及此节点的创建时间和运行状态。 命名空间视图会显示集群中存在哪些命名空间，以及这些命名空间的运行状态。角色视图以列表形式展示集群中存在哪些角色，这些角色的类型和所在的命名空间。 持久化存储卷以列表的方式进行展示，可以看到每一个持久化存储卷的存储总量、访问模式、使用状态等信息；管理员也能够删除和编辑持久化存储卷的YAML文件。

2） 工作负载
工作负载视图显示部署、副本集、有状态副本集等所有的工作负载类型。在此视图中，各种工作负载会按照各自的类型进行组织。 工作负载的详细信息视图能够显示应用的详细信息和状态信息，以及对象之间的关系。

3） 服务发现和负载均衡
服务发现视图能够将集群内容的服务暴露给集群外的应用，集群内外的应用可以通过暴露的服务调用应用，外部的应用使用外部的端点，内部的应用使用内部端点。

4） 存储
存储视图显示被应用用来存储数据的持久化存储卷申明资源。

5） 配置
配置视图显示集群中应用运行时所使用配置信息，Kubernetes提供了配置字典（ConfigMaps）和秘密字典（Secrets），通过配置视图，能够编辑和管理配置对象，以及查看隐藏的敏感信息。

6） 日志视图
Pod列表和详细信息页面提供了查看日志视图的链接，通过日志视图不但能够查看Pod的日志信息，也能够查看Pod容器的日志信息。通过Dashboard能够根据向导创建和部署一个容器化的应用，当然也可以通过手工的方式输入指定应用信息，或者通过上传YAML和JSON文件来创建和不受应用。
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**2 、部署应用**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
1）手动创建应用
通过向导创建和部署容器化应用时，需要提供如下的一些信息：
应用名称（App name 必需）： 需要部署的应用的名称。带有此值的标签将会被添加至部署和服务中。在当前的Kubernetes命名空间中，应用名称必须是唯一的。同时，应用名称必须以小写字母开头，以小写字母和数字结尾，可以包含字母、数字和“-”。名称最长为24个字母。
容器组个数（Number of pods 必需）： 希望部署的容器组数量。值必须为整数。
描述（Description）： 对于应用的描述，将被添加至部署的注释中，并在应用详细信息中显示。
标签（Labels）： 应用的默认标签为应用的名称和版本。可以指定其它的标签，这些标签将会被应用至部署、服务、容器组等资源中。
命名空间（Namespace）：在同一个物理集群中，Kubernetes支持多个虚拟集群。这些虚拟集群被称为命名空间，通过命名空间可以将资源进行逻辑上的划分。通过下列菜单可以选择已有的命名空间，当然也可以创建新的命名空间。命名空间的名称最大的字符数为63，名词可以使用字母、数字“-”，不能包含大写字母，同时也不能全部使用数字。
镜像拉取保密字典（Image Pull Secret）： 如果Docker容器镜像是私有的，则有可能需要保密证书。Dashboard通过下拉菜单提供了所有的可用的保密凭证，也允许创建新的保密字典。保密字典名称必须遵循DNS域名语法，例如：new.image-pull.secret。保密字典的内容必须使用基于base64进行加密的，并在.dockercfg文件中进行指定。保密字典名称最长不能超过253个字符。
环境变量（Environment variables）： Kubernetes通过环境变量暴露服务， 可以创建环境变量或者使用环境变量的值将参数传递给命令。环境变量能够被应用用来发现服务，环境变量的值可以通过￥（VAR_NAME）语法被其它变量引用。

2）上传YAML或JSON文件创建应用
通过编译工具编写容器化应用的YAML和JSON文件，在Dashboard用户界面中通过上传文件创建和部署应用。
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

### 部署步骤简单总结：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
1、部署：
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
2、将Service改为NodePort
kubectl patch svc kubernetes-dashboard -p '{"spec":{"type":"NodePort"}}' -n kube-system
3、认证：
认证时的账号必须为ServiceAccount：被dashboard pod拿来由kubernetes进行认证；
    token:
        （1）创建ServiceAccount，根据其管理目标，使用rolebinding或clusterrolebinding绑定至合理role或clusterrole;
        （2）获取到此ServiceAccount的secret，查看secret的详细信息，其中就有token；
    kubeconfig: 把ServiceAccount的token封装为kubeconfig文件
        （1）创建ServiceAccount，根据其管理目标，使用rolebinding或clusterrolebinding绑定至合理role或clusterrole;         
        （2）kubectl get secret | awk '/^ServiceAccount/{print $1}'
             KUBE_TOKEN=$(kubectl get secret SERVCIEACCOUNT_SERRET_NAME -o jsonpath={.data.token} |base64 -d)
        （3）生成kubeconfig文件
            kubectl config set-cluster --kubeconfig=/PATH/TO/SOMEFILE
            kubectl config set-credentials NAME --token=$KUBE_TOKEN --kubeconfig=/PATH/TO/SOMEFILE kubectl config set-context
            kubectl config use-context
```

# 11 kubernetes调度



## 11.1  调度器、预选策略及优选函数

​	kubernets scheduler主要负责的工作是：接受API Server创建的新Pod，并为其安排一个主机，将信息写入etcd中。当然在这个过程中要处理的事情远远没有这么简单，需要综合考虑多种决策因素，比如把同一个replication controller的Pod分配到不同的主机上，防止因主机节点宕机对业务造成较大冲击；以及如何考虑资源均衡，从而提升整个集群的资源使用率等。

### **调度流程**

kubernetes调度器通过API Server查找还未分配主机的Pod，并尝试为这些Pod分配主机，这个过程如下图所示

![scheduler_progress](images/scheduler_progress.jpg)

- 客户端提交创建请求，可以通过API Server的Restful API，也可以使用kubectl命令行工具。支持的数据类型包括JSON和YAML。
- API Server处理用户请求，存储Pod数据到etcd。
- 调度器通过API Server查看未绑定的Pod。尝试为Pod分配主机。
- 过滤主机：调度器用一组规则过滤掉不符合要求的主机。比如Pod指定了所需要的资源量，那么可用资源比Pod需要的资源量少的主机会被过滤掉。
- 主机打分：对第一步筛选出的符合要求的主机进行打分，在主机打分阶段，调度器会考虑一些整体优化策略，比如把容一个Replication Controller的副本分布到不同的主机上，使用最低负载的主机等。
- 选择主机：选择打分最高的主机，进行binding操作，结果存储到etcd中。
- 所选主机对于的kubelet根据调度结果执行Pod创建操作。

### **调度算法**

kubernetes通过一组规则，为每一个未调度的Pod选择一个主机，如调度流程中介绍，kubernetes的调度算法主要包括两个方面，过滤主机和主机打分。

kubernetes调度器的源码位于kubernetes/plugin/中，大体的代码目录结构如下所示：

—-kubernetes

——–plugin

————cmd    //kub-scheduler启动函数在cmd包中

————pkg    //调度相关的具体实现

—————-scheduler

——————–algorithm

————————predicates    //主机筛选策略

————————priorities    //主机打分策略

——————–algorithmprovider

————————defaults       //定义默认的调度器

过滤主机的目的是过滤掉不符合Pod要求的主机，现在kubernetes中实现的过滤规则主要包括以下几种（在kubernetes/plugin/pkg/scheduler/algorithm/predicates中实现）：

- NoDiskConflict：检查在此主机上是否存在卷冲突。如果这个主机已经挂载了卷，其它同样使用这个卷的Pod不能调度到这个主机上。GCE,        Amazon EBS, and Ceph RBD使用的规则如下：
  - GCE允许同时挂载多个卷，只要这些卷都是只读的。
  - Amazon EBS不允许不同的Pod挂载同一个卷。
  - Ceph RBD不允许任何两个pods分享相同的monitor，match pool和 image。
- NoVolumeZoneConflict：检查给定的zone限制前提下，检查如果在此主机上部署Pod是否存在卷冲突。假定一些volumes可能有zone调度约束， VolumeZonePredicate根据volumes自身需求来评估pod是否满足条件。必要条件就是任何volumes的zone-labels必须与节点上的zone-labels完全匹配。节点上可以有多个zone-labels的约束（比如一个假设的复制卷可能会允许进行区域范围内的访问）。目前，这个只对PersistentVolumeClaims支持，而且只在PersistentVolume的范围内查找标签。处理在Pod的属性中定义的volumes（即不使用PersistentVolume）有可能会变得更加困难，因为要在调度的过程中确定volume的zone，这很有可能会需要调用云提供商。
- PodFitsResources：检查主机的资源是否满足Pod的需求。根据实际已经分配的资源量做调度，而不是使用已实际使用的资源量做调度。
- PodFitsHostPorts：检查Pod内每一个容器所需的HostPort是否已被其它容器占用。如果有所需的HostPort不满足需求，那么Pod不能调度到这个主机上。
- HostName：检查主机名称是不是Pod指定的HostName。
- MatchNodeSelector：检查主机的标签是否满足Pod的*nodeSelector*属性需求。
- MaxEBSVolumeCount：确保已挂载的EBS存储卷不超过设置的最大值。默认值是39。它会检查直接使用的存储卷，和间接使用这种类型存储的PVC。计算不同卷的总目，如果新的Pod部署上去后卷的数目会超过设置的最大值，那么Pod不能调度到这个主机上。
- MaxGCEPDVolumeCount：确保已挂载的GCE存储卷不超过设置的最大值。默认值是16。规则同上。

可以通过配置修改kubernetes默认支持的过滤规则。

经过过滤后，再对符合需求的主机列表进行打分，最终选择一个分值最高的主机部署Pod。kubernetes用一组优先级函数处理每一个待选的主机（在kubernetes/plugin/pkg/scheduler/algorithm/priorities中实现）。每一个优先级函数会返回一个0-10的分数，分数越高表示主机越“好”， 同时每一个函数也会对应一个表示权重的值。最终主机的得分用以下公式计算得出：

finalScoreNode = (weight1 * priorityFunc1) + (weight2 * priorityFunc2) + … + (weightn * priorityFuncn)

现在支持的优先级函数包括以下几种：

- LeastRequestedPriority：如果新的pod要分配给一个节点，这个节点的优先级就由节点空闲的那部分与总容量的比值（即（总容量-节点上pod的容量总和-新pod的容量）/总容量）来决定。CPU和memory权重相当，比值最大的节点的得分最高。需要注意的是，这个优先级函数起到了按照资源消耗来跨节点分配pods的作用。计算公式如下：

cpu((capacity – sum(requested)) * 10 / capacity) + memory((capacity – sum(requested)) * 10 / capacity) / 2

- BalancedResourceAllocation：尽量选择在部署Pod后各项资源更均衡的机器。*BalancedResourceAllocation*不能单独使用，而且必须和*LeastRequestedPriority*同时使用，它分别计算主机上的cpu和memory的比重，主机的分值由cpu比重和memory比重的“距离”决定。计算公式如下：

score = 10 – abs(cpuFraction-memoryFraction)*10

- SelectorSpreadPriority：对于属于同一个service、replication controller的Pod，尽量分散在不同的主机上。如果指定了区域，则会尽量把Pod分散在不同区域的不同主机上。调度一个Pod的时候，先查找Pod对于的service或者replication controller，然后查找service或replication controller中已存在的Pod，主机上运行的已存在的Pod越少，主机的打分越高。
- CalculateAntiAffinityPriority：对于属于同一个service的Pod，尽量分散在不同的具有指定标签的主机上。
- ImageLocalityPriority：根据主机上是否已具备Pod运行的环境来打分。ImageLocalityPriority会判断主机上是否已存在Pod运行所需的镜像，根据已有镜像的大小返回一个0-10的打分。如果主机上不存在Pod所需的镜像，返回0；如果主机上存在部分所需镜像，则根据这些镜像的大小来决定分值，镜像越大，打分就越高。
- NodeAffinityPriority（Kubernetes1.2实验中的新特性）：Kubernetes调度中的亲和性机制。Node Selectors（调度时将pod限定在指定节点上），支持多种操作符（In, NotIn, Exists, DoesNotExist, Gt, Lt），而不限于对节点labels的精确匹配。另外，Kubernetes支持两种类型的选择器，一种是“hard（requiredDuringSchedulingIgnoredDuringExecution）”选择器，它保证所选的主机必须满足所有Pod对主机的规则要求。这种选择器更像是之前的nodeselector，在nodeselector的基础上增加了更合适的表现语法。另一种是“soft（preferresDuringSchedulingIgnoredDuringExecution）”选择器，它作为对调度器的提示，调度器会尽量但不保证满足NodeSelector的所有要求。

### **多层次资源限制**

kubernetes包含多种资源限制，用来控制Container、Pod和多租户级别的资源共享。

![resource-limit-1](images/resource-limit-1.jpg)



每一个容器都可以指定*spec.container[].resources.limits.cpu*，*spec.container[].resources.limits.memory*，*spec.container[].resources.requests.cpu*和*spec.container[].resources.requests.memory*。对容器的资源限制是可选的，可以通过修改集群配置设置默认的资源限制属性。

LimitRange是在namespace级别设置的pod容量限制。所有在对应的命名空间中的Pod，都会受到LimitRange的资源限制。

Pod的每一类资源限制是Pod中对应的资源类型限制的总和，在调度的过程中调度器使用这个总和值和主机上可用容量做比较，决定主机是否满足资源需求。这种调度属于静态的资源调度，即使主机上的真实负载很低，只要容量限制不满足需求，也不能在主机上部署Pod。

Resource Quota是在命名空间级别设置的资源限制，主要是解决多租户共享资源的问题。Resource Quota中的cpu指对应的命名空间中所有Pod可以使用的cpu的总和，memory指对应的命名空间中所有Pod可以使用的memory的总和。

### **结语**

kubernetes的调度器是完全插件化的实现，可以很方便的集成其它的调度器进行扩展。目前的调度器包含多个级别的资源限制，但是调度相关的实现相对简单，使用一些静态的规则去做调度，对于提升集群资源使用率、保障业务的QoS效果不是很明显。

kubernetes调度器以后可能支持使用不同的调度器去调度不同的任务，这个实验中的新特性对于有多种类型业务混合部署在kubernetes集群中的用户会有很大帮助。

kubernetes正在开发中的QoS借鉴Borg的成熟经验，重点关注提高集群资源利用率的问题，这个特性非常值得期待。





## 11.2  Kubernetes高级调度方式

参考：<https://blog.fleeto.us/post/adv-scheduler-in-k8s/>

<https://www.cnblogs.com/xzkzzz/p/9963511.html>

Kubernetes 的调度器能够满足绝大多数要求，例如保证 Pod 只在资源足够的节点上运行，会尝试把同一个集合的 Pod 分散在不同的节点上，还会尝试平衡不同节点的资源使用率等。

不过有时候你希望控制 Pod 的调度。例如你希望确认某个 Pod 只运行在有特定硬件的节点上；或者想要让频繁互相通信的服务能就近部署；又或者你希望用独立的节点给部分用户提供服务。而且最终，用户总是比 Kubernetes 更了解自己的应用。

所以 Kubernetes 1.6 提供了四个高级调度功能：

- 节点亲和/互斥
- Taint（污染、变质） 和 Tolerations（容忍、耐受）
- Pod 的亲和/互斥
- 以及自定义调度

上述功能在 Kubernetes 1.6 中还属于 Beta 阶段。

## 节点亲和/互斥

节点的亲和和互斥是一种设置调度器选择节点的规则。这个规则是 nodeSelector（1.0 开始就有的功能）的衍生物。这一规则使用类似给 Node 添加自定义标签，在 Pod 中定义选择器的方式。规则在调度器中可以有必要和推荐两种级别。

必要的规则要求 Pod 必须调度到某指定节点上。如果没有符合条件（当然也包括通用的调度要求，例如节点必须有足够的资源）。如果没有符合要求的节点，Pod 就不会被调度，必要规则在 `nodeAffinity` 的 `requiredDuringSchedulingIgnoredDuringExecution` 字段中定义。

例如在一个 GCE 上的多区域 Kubernetes 集群中，我们希望把 Pod 运行在一个 `us-central1-a` 的区域中，我们可以在 Pod 中使用如下的亲和规则：

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "failure-domain.beta.kubernetes.io/zone"
            operator: In
            values: ["us-central1-a"]
```

`IgnoredDuringExecution` 表示在 Pod 已经成功运行后，如果 Node 的标签发生了变化导致其不再符合 Pod 的调度要求，Pod 依然会继续运行；`requiredDuringSchedulingRequiredDuringExecution` 则相反，一旦出现这种变化，他会立即从 Node 上驱逐 Pod。

推荐级别的规则表示优先选择符合规则要求的节点，如果找不到，则降级选择普通节点。我们可以用优先规则代替必要规则，选择`us-central1-a`进行 Pod 的运行，只要修改成`preferredDuringSchedulingIgnoredDuringExecution`：

```yaml
affinity:
  nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "failure-domain.beta.kubernetes.io/zone"
            operator: In
            values: ["us-central1-a"]
```

节点的互斥可以利用否定操作符来实现。所以如果让 Pod 避免运行在`us-central1-a`，可以这样实现：

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
        - matchExpressions:
          - key: "failure-domain.beta.kubernetes.io/zone"
            operator: NotIn
            values: ["us-central1-a"]
```

可用的操作符包括：

- In
- NotIn
- Exists
- DoesNotExist
- Gt
- Lt

需要这一功能的场景还包括节点的硬件结构、操作系统版本或者特殊硬件等。节点的亲和与互斥在 Kubernetes 1.6 之中处于 Beta 阶段。

## Taint（污染、变质）和 Tolerations（容忍、耐受）

> 这俩名词让我非常挠头，不好下嘴。
>
> 另外这里的阐述比起 Kubectl help taint 来说，清晰程度差了太多。

这一功能让用户可以把一个节点标记为 taint 的话，除非 Pod 被标识为可以耐受污染节点，否则不会有任何 Pod 被调度到该节点上。之所以把 taint 标记到节点而不是像亲和性一样标记在 Pod 上，是因为在这种情况下，绝大多数的 Pod 都不应该部署到 Taint 的节点上。例如用户可能希望把主节点保留给 Kubernetes 系统组件使用，或者把一部分节点保留给一组用户，或者把一组具有特殊硬件的服务器保留给有需求的 Pod。

可以用 `kubectl` 命令对节点进行 taint 操作：

```
kubectl taint nodes node1 key=value:NoSchedule
```

在节点上创建了一个 tiant，一个 Pod 必须在 Spec 中做出这样的 Toleration 定义，才能调度到该节点：

```yaml
tolerations: 
- key: "key"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"
```

effect 除了 NoSchedule 这个值之外，还有一个 Prefer 版本的 `PreferNoSchedule`，另外还有一个 `NoExecute` 选项，这个选项意味着这一 Taint 生效之时，如果该节点内正在运行的 Pod 没有对应的 Tolerate 设置，会被直接逐出。

目前这一特性在 Kubernetes 1.6 升级为 Beta，我们加入了一个 Alpha 特性，可以指定在节点遇到问题的时候，该节点之上的 Pod 可以保持该绑定的时间长度（缺省五分钟）。

> 参考： <https://kubernetes.io/docs/user-guide/node-selection/#per-pod-configurable-eviction-behavior-when-there-are-node-problems-alpha-feature>

## Pod 的亲和与互斥

Node 的亲和与互斥特性允许用户通过对 Pod 的定义来选择运行的 Node。但是还有一种需求就是，Pod 的相互关系，例如对同一个服务里面的 Pod 进行分布或者集中，或者和其他服务的 Pod 如何相处？Pod 的亲和与互斥就应运而生，这一特性在 Kubernetes 1.6 中也处于 Beta 阶段。

看一个例子。假设有一个叫 S1 的前端服务，会经常和一个叫 S2 的后端服务进行通信（南北通信模式），所以我们希望这两个服务能够被安排在同一个云服务区域，但是我们也不想做手工选择——一旦某个区域出了问题，我们希望这些 Pod 能够再次迁移到同一个区域。这里就可以定义 Pod 亲和性来达成这一目的了（假设我们给两组服务都设置 Label，service=s1/s2）：

```yaml
affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: service
            operator: In
            values: ["S1"]
        topologyKey: failure-domain.beta.kubernetes.io/zone
```

和节点的亲和性类似，这里也有一个变量：`preferredDuringSchedulingIgnoredDuringExecution`。

Pod 的亲和性弹性很大。设想在性能测试的过程中，发现两个服务的容器处于同一个节点时，S1 的容器会干扰 S2 的容器的性能，这可能会是由缓存或者网络的拥堵造成的。或者出于安全考虑，我们不想两个服务共享同一个节点。要实现这种互斥操作，只要稍微改动一下哎上面的代码：

- `podAffinity` 改为 `podAntiAffinity`
- `topologyKey` 改为 `kubernetes.io/hostname`

## 自定义调度

如果 Kubernetes 调度器的众多特性还没能满足你的控制欲，可以用自己独立运行的调度器来对指定的 Pod 进行调度。在 Kubernetes 1.6 中，多调度器特性也进入了 Beta 阶段。

一般情况下，每个新 Pod 都会由缺省调度器进行调度。但是如果 Pod 中提供了自定义的调度器名称，那么缺省调度器就会忽略该 Pod，转由指定的调度器把该 Pod 分配给节点。下面举例说明。

代码中的 Pod 指定了`schedulerName`字段：

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  schedulerName: my-scheduler
  containers:
  - name: nginx
    image: nginx:1.10
```

如果我们在不部署自定义调度器的情况下，创建这个 Pod，缺省调度器会忽略这个 Pod，后果是他会在`Pending`状态下停滞不前。所以我们需要为他创建一个`schedulerName`值为`my-scheduler`的调度器。

可以用任何语言来实现简单或复杂的调度器。下面的简单例子是用 Bash 实现的——随机指派一个节点。注意首先要运行`kubectl proxy`来支持这一脚本的运行。

```bash
#!/bin/bash
SERVER='localhost:8001'
while true;
do
    for PODNAME in $(kubectl --server $SERVER get pods -o json | jq '.items[] | select(.spec.schedulerName == "my-scheduler") | select(.spec.nodeName == null) | .metadata.name' | tr -d '"')
;
    do
        NODES=($(kubectl --server $SERVER get nodes -o json | jq '.items[].metadata.name' | tr -d '"'))
        NUMNODES=${#NODES[@]}
        CHOSEN=${NODES[$[ $RANDOM % $NUMNODES ]]}
        curl --header "Content-Type:application/json" --request POST --data '{"apiVersion":"v1", "kind": "Binding", "metadata": {"name": "'$PODNAME'"}, "target": {"apiVersion": "v1", "kind"
: "Node", "name": "'$CHOSEN'"}}' http://$SERVER/api/v1/namespaces/default/pods/$PODNAME/binding/
        echo "Assigned $PODNAME to $CHOSEN"
    done
    sleep 1
done
```



## 11.3  资源指标API及自定义指标API

以前是用heapster来收集资源指标才能看，现在heapster要废弃了。

​    从k8s v1.8开始后，引入了新的功能，即把资源指标引入api。 

​    资源指标：metrics-server 

​    自定义指标： prometheus,k8s-prometheus-adapter 

​    因此，新一代架构： 

​    1） 核心指标流水线：由kubelet、metrics-server以及由API server提供的api组成；cpu累计利用率、内存实时利用率、pod的资源占用率及容器的磁盘占用率 

​    2） 监控流水线：用于从系统收集各种指标数据并提供终端用户、存储系统以及HPA，他们包含核心指标以及许多非核心指标。非核心指标不能被k8s所解析。 

​    metrics-server是个api server，仅仅收集cpu利用率、内存利用率等。

```
`[root@master ~]``# kubectl api-versions``admissionregistration.k8s.io``/``v1beta1``apiextensions.k8s.io``/``v1beta1``apiregistration.k8s.io``/``v1``apiregistration.k8s.io``/``v1beta1``apps``/``v1``apps``/``v1beta1``apps``/``v1beta2``authentication.k8s.io``/``v1``authentication.k8s.io``/``v1beta1``authorization.k8s.io``/``v1`
```

　　

 访问 <https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/metrics-server>  获取yaml文件，但这个里面的yaml文件更新了。和视频内的有差别

贴出我修改后的yaml文件，留作备用

```
[root@master metrics-server]# cat auth-delegator.yaml 
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: metrics-server:system:auth-delegator
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: system:auth-delegator
subjects:
- kind: ServiceAccount
  name: metrics-server
  namespace: kube-system
```

```
[root@master metrics-server]# cat auth-reader.yaml 
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: metrics-server-auth-reader
  namespace: kube-system
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: extension-apiserver-authentication-reader
subjects:
- kind: ServiceAccount
  name: metrics-server
  namespace: kube-system
```

```
[root@master metrics-server]# cat metrics-apiservice.yaml 
apiVersion: apiregistration.k8s.io/v1beta1
kind: APIService
metadata:
  name: v1beta1.metrics.k8s.io
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
spec:
  service:
    name: metrics-server
    namespace: kube-system
  group: metrics.k8s.io
  version: v1beta1
  insecureSkipTLSVerify: true
  groupPriorityMinimum: 100
  versionPriority: 100
```

```
[root@master metrics-server]# cat metrics-server-deployment.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: metrics-server
  namespace: kube-system
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: metrics-server-config
  namespace: kube-system
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: EnsureExists
data:
  NannyConfiguration: |-
    apiVersion: nannyconfig/v1alpha1
    kind: NannyConfiguration
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: metrics-server-v0.3.1
  namespace: kube-system
  labels:
    k8s-app: metrics-server
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
    version: v0.3.1
spec:
  selector:
    matchLabels:
      k8s-app: metrics-server
      version: v0.3.1
  template:
    metadata:
      name: metrics-server
      labels:
        k8s-app: metrics-server
        version: v0.3.1
      annotations:
        scheduler.alpha.kubernetes.io/critical-pod: ''
        seccomp.security.alpha.kubernetes.io/pod: 'docker/default'
    spec:
      priorityClassName: system-cluster-critical
      serviceAccountName: metrics-server
      containers:
      - name: metrics-server
        image: mirrorgooglecontainers/metrics-server-amd64:v0.3.1
        command:
        - /metrics-server
        - --metric-resolution=30s
        - --kubelet-insecure-tls
        - --kubelet-preferred-address-types=InternalIP,Hostname,InternalDNS,ExternalDNS,ExternalIP
        # These are needed for GKE, which doesn't support secure communication yet.
        # Remove these lines for non-GKE clusters, and when GKE supports token-based auth.
        #- --kubelet-port=10250
        #- --deprecated-kubelet-completely-insecure=true

        ports:
        - containerPort: 443
          name: https
          protocol: TCP
      - name: metrics-server-nanny
        image: mirrorgooglecontainers/addon-resizer:1.8.4
        resources:
          limits:
            cpu: 100m
            memory: 300Mi
          requests:
            cpu: 5m
            memory: 50Mi
        env:
          - name: MY_POD_NAME
            valueFrom:
              fieldRef:
                fieldPath: metadata.name
          - name: MY_POD_NAMESPACE
            valueFrom:
              fieldRef:
                fieldPath: metadata.namespace
        volumeMounts:
        - name: metrics-server-config-volume
          mountPath: /etc/config
        command:
          - /pod_nanny
          - --config-dir=/etc/config
          - --cpu=100m
          - --extra-cpu=0.5m
          - --memory=100Mi
          - --extra-memory=50Mi
          - --threshold=5
          - --deployment=metrics-server-v0.3.1
          - --container=metrics-server
          - --poll-period=300000
          - --estimator=exponential
          # Specifies the smallest cluster (defined in number of nodes)
          #           # resources will be scaled to.
          - --minClusterSize=10

      volumes:
        - name: metrics-server-config-volume
          configMap:
            name: metrics-server-config
      tolerations:
        - key: "CriticalAddonsOnly"
          operator: "Exists"
```



```
[root@master metrics-server]# cat metrics-server-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: metrics-server
  namespace: kube-system
  labels:
    addonmanager.kubernetes.io/mode: Reconcile
    kubernetes.io/cluster-service: "true"
    kubernetes.io/name: "Metrics-server"
spec:
  selector:
    k8s-app: metrics-server
  ports:
  - port: 443
    protocol: TCP
    targetPort: https
```



```
[root@master metrics-server]# cat metrics-server-service.yaml
apiVersion: v1
kind: Service
metadata:
  name: metrics-server
  namespace: kube-system
  labels:
    addonmanager.kubernetes.io/mode: Reconcile
    kubernetes.io/cluster-service: "true"
    kubernetes.io/name: "Metrics-server"
spec:
  selector:
    k8s-app: metrics-server
  ports:
  - port: 443
    protocol: TCP
    targetPort: https
[root@master metrics-server]# cat resource-reader.yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: system:metrics-server
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
rules:
- apiGroups:
  - ""
  resources:
  - pods
  - nodes
  - namespaces
  - nodes/stats
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - "extensions"
  resources:
  - deployments
  verbs:
  - get
  - list
  - update
  - watch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: system:metrics-server
  labels:
    kubernetes.io/cluster-service: "true"
    addonmanager.kubernetes.io/mode: Reconcile
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: system:metrics-server
subjects:
- kind: ServiceAccount
  name: metrics-server
  namespace: kube-system
```







如果从github上下载以上文件apply出错，就用上面的metrics-server-deployment.yaml文件，删掉重新apply一下就可以了

```
`[root@master metrics``-``server]``# kubectl apply -f ./`
```

　　

```
`[root@master ~]``#  kubectl proxy --port=8080`
```

　　

确保metrics-server-v0.3.1-76b796b-4xgvp是running状态，我当时出现了Error发现是yaml里面有问题，最后该掉running了，该来该去该到上面的最终版

```
`[root@master metrics``-``server]``# kubectl get pods -n kube-system``NAME                                    READY   STATUS    RESTARTS   AGE``canal``-``mgbc2                             ``3``/``3`     `Running   ``12`         `3d23h``canal``-``s4xgb                             ``3``/``3`     `Running   ``23`         `3d23h``canal``-``z98bc                             ``3``/``3`     `Running   ``15`         `3d23h``coredns``-``78d4cf999f``-``5shdq`                `1``/``1`     `Running   ``0`          `6m4s``coredns``-``78d4cf999f``-``xj5pj                ``1``/``1`     `Running   ``0`          `5m53s``etcd``-``master                             ``1``/``1`     `Running   ``13`         `17d``kube``-``apiserver``-``master                   ``1``/``1`     `Running   ``13`         `17d``kube``-``controller``-``manager``-``master          ``1``/``1`     `Running   ``19`         `17d``kube``-``flannel``-``ds``-``amd64``-``8xkfn`             `1``/``1`     `Running   ``0`          `<invalid>``kube``-``flannel``-``ds``-``amd64``-``t7jpc             ``1``/``1`     `Running   ``0`          `<invalid>``kube``-``flannel``-``ds``-``amd64``-``vlbjz             ``1``/``1`     `Running   ``0`          `<invalid>``kube``-``proxy``-``ggcbf                        ``1``/``1`     `Running   ``11`         `17d``kube``-``proxy``-``jxksd                        ``1``/``1`     `Running   ``11`         `17d``kube``-``proxy``-``nkkpc                        ``1``/``1`     `Running   ``12`         `17d``kube``-``scheduler``-``master                   ``1``/``1`     `Running   ``19`         `17d``kubernetes``-``dashboard``-``76479d66bb``-``zr4dd   ``1``/``1`     `Running   ``0`          `<invalid>``metrics``-``server``-``v0.``3.1``-``76b796b``-``4xgvp`     `2``/``2`     `Running   ``0`          `9s`
```

　　

查看出错日志 -c指定容器名，该pod内有两个容器，metrcis-server只是其中一个，另一个查询方法一样，把名字改掉即可

```
`[root@master metrics``-``server]``# kubectl logs metrics-server-v0.3.1-76b796b-4xgvp   -c metrics-server -n kube-system`
```

　　

大致出错的日志内容如下几条；

```
`403` `Forbidden``", response: "``Forbidden (user``=``system:anonymous, verb``=``get, resource``=``nodes, subresource``=``stats)` `E0903  ``1` `manager.go:``102``] unable to fully collect metrics: [unable to fully scrape metrics ``from` `source kubelet_summary:<hostname>: unable to fetch metrics ``from` `Kubelet <hostname> (<hostname>): Get https:``/``/``<hostname>:``10250``/``stats``/``summary``/``: dial tcp: lookup <hostname> on ``10.96``.``0.10``:``53``: no such host`  `no response ``from` `https:``/``/``10.101``.``248.96``:``443``: Get https:``/``/``10.101``.``248.96``:``443``: Proxy Error ( Connection refused )`  `E1109 ``09``:``54``:``49.509521`       `1` `manager.go:``102``] unable to fully collect metrics: [unable to fully scrape metrics ``from` `source kubelet_summary:linuxea.node``-``2.com``: unable to fetch metrics ``from` `Kubelet linuxea.node``-``2.com` `(``10.10``.``240.203``): Get https:``/``/``10.10``.``240.203``:``10255``/``stats``/``summary``/``: dial tcp ``10.10``.``240.203``:``10255``: connect: connection refused, unable to fully scrape metrics ``from` `source kubelet_summary:linuxea.node``-``3.com``: unable to fetch metrics ``from` `Kubelet linuxea.node``-``3.com` `(``10.10``.``240.143``): Get https:``/``/``10.10``.``240.143``:``10255``/``stats``/``summary``/``: dial tcp ``10.10``.``240.143``:``10255``: connect: connection refused, unable to fully scrape metrics ``from` `source kubelet_summary:linuxea.node``-``4.com``: unable to fetch metrics ``from` `Kubelet linuxea.node``-``4.com` `(``10.10``.``240.142``): Get https:``/``/``10.10``.``240.142``:``10255``/``stats``/``summary``/``: dial tcp ``10.10``.``240.142``:``10255``: connect: connection refused, unable to fully scrape metrics ``from` `source kubelet_summary:linuxea.master``-``1.com``: unable to fetch metrics ``from` `Kubelet linuxea.master``-``1.com` `(``10.10``.``240.161``): Get https:``/``/``10.10``.``240.161``:``10255``/``stats``/``summary``/``: dial tcp ``10.10``.``240.161``:``10255``: connect: connection refused, unable to fully scrape metrics ``from` `source kubelet_summary:linuxea.node``-``1.com``: unable to fetch metrics ``from` `Kubelet linuxea.node``-``1.com` `(``10.10``.``240.202``): Get https:``/``/``10.10``.``240.202``:``10255``/``stats``/``summary``/``: dial tcp ``10.10``.``240.202``:``10255``: connect: connection refused]`
```

　　

当时我按照网上的方法尝试修改coredns配置，结果搞的日志出现获取所有pod都unable，如下，然后又取消掉了修改，删掉了coredns，让他自己重新生成了俩新的coredns容器

`- --kubelet-insecure-tls`这种方式是禁用tls验证，一般不建议在生产环境中使用。并且由于DNS是无法解析到这些主机名，使用`- --kubelet-preferred-address-types=InternalIP,Hostname,InternalDNS,ExternalDNS,ExternalIP`进行规避。还有另外一种方法，修改coredns，不过，我并不建议这样做。

参考这篇：https://github.com/kubernetes-incubator/metrics-server/issues/131

```
`metrics``-``server unable to fetch pdo metrics ``for` `pod`
```

　　

以上为遇到的问题，反正用我上面的yaml绝对保证解决以上所有问题。还有那个flannel改了directrouting之后为啥每次重启集群机器，他就失效呢，我不得不在删掉flannel然后重新生成，这个问题前面文章写到了。

此时执行如下命令就都成功了，item里也有值了

```
`[root@master ~]``# curl http://localhost:8080/apis/metrics.k8s.io/v1beta1``{``  ``"kind"``: ``"APIResourceList"``,``  ``"apiVersion"``: ``"v1"``,``  ``"groupVersion"``: ``"metrics.k8s.io/v1beta1"``,``  ``"resources"``: [``    ``{``      ``"name"``: ``"nodes"``,``      ``"singularName"``: "",``      ``"namespaced"``: false,``      ``"kind"``: ``"NodeMetrics"``,``      ``"verbs"``: [``        ``"get"``,``        ``"list"``      ``]``    ``},``    ``{``      ``"name"``: ``"pods"``,``      ``"singularName"``: "",``      ``"namespaced"``: true,``      ``"kind"``: ``"PodMetrics"``,``      ``"verbs"``: [``        ``"get"``,``        ``"list"``      ``]``    ``}``  ``]`
```

　　

```
`[root@master metrics``-``server]``# curl http://localhost:8080/apis/metrics.k8s.io/v1beta1/pods | more``  ``%` `Total    ``%` `Received ``%` `Xferd  Average Speed   Time    Time     Time  Current``                                 ``Dload  Upload   Total   Spent    Left  Speed``100` `14868`    `0` `14868`    `0`     `0`  `1521k`      `0` `-``-``:``-``-``:``-``-` `-``-``:``-``-``:``-``-` `-``-``:``-``-``:``-``-` `1613k``{``  ``"kind"``: ``"PodMetricsList"``,``  ``"apiVersion"``: ``"metrics.k8s.io/v1beta1"``,``  ``"metadata"``: {``    ``"selfLink"``: ``"/apis/metrics.k8s.io/v1beta1/pods"``  ``},``  ``"items"``: [``    ``{``      ``"metadata"``: {``        ``"name"``: ``"pod1"``,``        ``"namespace"``: ``"prod"``,``        ``"selfLink"``: ``"/apis/metrics.k8s.io/v1beta1/namespaces/prod/pods/pod1"``,``        ``"creationTimestamp"``: ``"2019-01-29T02:39:12Z"``      ``},`
```

　　

```
`[root@master metrics``-``server]``# kubectl top pods``NAME                CPU(cores)   MEMORY(bytes)  ``filebeat``-``ds``-``4llpp`   `1m`           `2Mi`            `filebeat``-``ds``-``dv49l   ``1m`           `5Mi`            `myapp``-``0`             `0m`           `1Mi`            `myapp``-``1`             `0m`           `2Mi`            `myapp``-``2`             `0m`           `1Mi`            `myapp``-``3`             `0m`           `1Mi`            `myapp``-``4`             `0m`           `2Mi`   
```

　　

```
`[root@master metrics``-``server]``# kubectl top nodes``NAME     CPU(cores)   CPU``%`   `MEMORY(bytes)   MEMORY``%`  `master   ``206m`         `5``%`     `1377Mi`          `72``%`      `node1    ``88m`          `8``%`     `534Mi`           `28``%`      `node2    ``78m`          `7``%`     `935Mi`           `49``%`
```

　　

 

# 自定义指标（prometheus)

​    大家看到，我们的metrics已经可以正常工作了。不过，metrics只能监控cpu和内存，对于其他指标如用户自定义的监控指标，metrics就无法监控到了。这时就需要另外一个组件叫prometheus。

![img](http://img.blog.itpub.net/blog/2018/10/16/0d4d544aa912e332.png?x-oss-process=style/bb)

​    prometheus的部署非常麻烦。

​    node_exporter是agent;

​    PromQL相当于sql语句来查询数据; 

​    k8s-prometheus-adapter:prometheus是不能直接解析k8s的指标的，需要借助k8s-prometheus-adapter转换成api

​    kube-state-metrics是用来整合数据的。

![img](http://img.blog.itpub.net/blog/2018/10/16/525053af871a9b7e.png?x-oss-process=style/bb)

​    下面开始部署。

​    访问 <https://github.com/ikubernetes/k8s-prom>

 

```
`[root@master pro]``# git clone https://github.com/iKubernetes/k8s-prom.git`
```

　　

先创建一个叫prom的名称空间： 

```
`[root@master k8s``-``prom]``# kubectl apply -f namespace.yaml``namespace``/``prom created`
```

　　

 部署node_exporter： 

 

```
`[root@master k8s``-``prom]``# cd node_exporter/``[root@master node_exporter]``# ls``node``-``exporter``-``ds.yaml  node``-``exporter``-``svc.yaml``[root@master node_exporter]``# kubectl apply -f .``daemonset.apps``/``prometheus``-``node``-``exporter created``service``/``prometheus``-``node``-``exporter created`
```

　　

```
`[root@master node_exporter]``# kubectl get pods -n prom``NAME                             READY     STATUS    RESTARTS   AGE``prometheus``-``node``-``exporter``-``dmmjj   ``1``/``1`       `Running   ``0`          `7m``prometheus``-``node``-``exporter``-``ghz2l   ``1``/``1`       `Running   ``0`          `7m``prometheus``-``node``-``exporter``-``zt2lw   ``1``/``1`       `Running   ``0`          `7m`
```

　　

​    部署prometheus: 

 

```
`[root@master k8s``-``prom]``# cd prometheus/``[root@master prometheus]``# ls``prometheus``-``cfg.yaml  prometheus``-``deploy.yaml  prometheus``-``rbac.yaml  prometheus``-``svc.yaml``[root@master prometheus]``# kubectl apply -f .``configmap``/``prometheus``-``config created``deployment.apps``/``prometheus``-``server created``clusterrole.rbac.authorization.k8s.io``/``prometheus created``serviceaccount``/``prometheus created``clusterrolebinding.rbac.authorization.k8s.io``/``prometheus created``service``/``prometheus created`
```

　　

看prom名称空间中的所有资源： pod/prometheus-server-76dc8df7b-hw8xc  处于 Pending   状态，日志显示内存不足

```
`[root@master prometheus]``# kubectl logs prometheus-server-556b8896d6-dfqkp -n prom ``Warning  FailedScheduling  ``2m52s` `(x2 over ``2m52s``)  default``-``scheduler  ``0``/``3` `nodes are available: ``3` `Insufficient memory.`
```

　　

修改prometheus-deploy.yaml，删掉内存那三行

```
`resources:``  ``limits:``    ``memory: ``2Gi`
```

　　

重新apply

```
`[root@master prometheus]``# kubectl apply -f prometheus-deploy.yaml`
```

　　

```
`[root@master prometheus]``# kubectl get all -n prom``NAME                                     READY     STATUS    RESTARTS   AGE``pod``/``prometheus``-``node``-``exporter``-``dmmjj       ``1``/``1`       `Running   ``0`          `10m``pod``/``prometheus``-``node``-``exporter``-``ghz2l       ``1``/``1`       `Running   ``0`          `10m``pod``/``prometheus``-``node``-``exporter``-``zt2lw       ``1``/``1`       `Running   ``0`          `10m``pod``/``prometheus``-``server``-``65f5d59585``-``6l8m8`   `1``/``1`       `Running   ``0`          `55s``NAME                               ``TYPE`        `CLUSTER``-``IP      EXTERNAL``-``IP   PORT(S)          AGE``service``/``prometheus                 NodePort    ``10.111``.``127.64`   `<none>        ``9090``:``30090``/``TCP   ``56s``service``/``prometheus``-``node``-``exporter   ClusterIP   ``None`            `<none>        ``9100``/``TCP         ``10m``NAME                                      DESIRED   CURRENT   READY     UP``-``TO``-``DATE   AVAILABLE   NODE SELECTOR   AGE``daemonset.apps``/``prometheus``-``node``-``exporter   ``3`         `3`         `3`         `3`            `3`           `<none>          ``10m``NAME                                DESIRED   CURRENT   UP``-``TO``-``DATE   AVAILABLE   AGE``deployment.apps``/``prometheus``-``server   ``1`         `1`         `1`            `1`           `56s``NAME                                           DESIRED   CURRENT   READY     AGE``replicaset.apps``/``prometheus``-``server``-``65f5d59585`   `1`         `1`         `1`         `56s`
```

　　

上面我们看到通过NodePorts的方式，可以通过宿主机的30090端口，来访问prometheus容器里面的应用。 

 

![img](http://img.blog.itpub.net/blog/2018/10/16/1fc8c9cd6599b3b2.png?x-oss-process=style/bb)

​    最好挂载个pvc的存储，要不这些监控数据过一会就没了。 

​    部署kube-state-metrics，用来整合数据：  

```
`[root@master k8s``-``prom]``# cd kube-state-metrics/``[root@master kube``-``state``-``metrics]``# ls``kube``-``state``-``metrics``-``deploy.yaml  kube``-``state``-``metrics``-``rbac.yaml  kube``-``state``-``metrics``-``svc.yaml``[root@master kube``-``state``-``metrics]``# kubectl apply -f .``deployment.apps``/``kube``-``state``-``metrics created``serviceaccount``/``kube``-``state``-``metrics created``clusterrole.rbac.authorization.k8s.io``/``kube``-``state``-``metrics created``clusterrolebinding.rbac.authorization.k8s.io``/``kube``-``state``-``metrics created``service``/``kube``-``state``-``metrics created`
```

　　

```
`[root@master kube``-``state``-``metrics]``# kubectl get all -n prom``NAME                                      READY     STATUS    RESTARTS   AGE``pod``/``kube``-``state``-``metrics``-``58dffdf67d``-``v9klh   ``1``/``1`       `Running   ``0`          `14m``NAME                               ``TYPE`        `CLUSTER``-``IP      EXTERNAL``-``IP   PORT(S)          AGE``service``/``kube``-``state``-``metrics         ClusterIP   ``10.111``.``41.139`   `<none>        ``8080``/``TCP         ``14m`
```

　　

部署k8s-prometheus-adapter,这个需要自制证书：

```
`[root@master k8s``-``prometheus``-``adapter]``# cd /etc/kubernetes/pki/``[root@master pki]``# (umask 077; openssl genrsa -out serving.key 2048)``Generating RSA private key, ``2048` `bit ``long` `modulus``...........................................................................................``+``+``+``...............``+``+``+``e ``is` `65537` `(``0x10001``)`
```

　　

​    证书请求： 

```
`[root@master pki]``#  openssl req -new -key serving.key -out serving.csr -subj "/CN=serving"`
```

　　

​    开始签证： 

 

```
`[root@master pki]``# openssl  x509 -req -in serving.csr -CA ./ca.crt -CAkey ./ca.key -CAcreateserial -out serving.crt -days 3650``Signature ok``subject``=``/``CN``=``serving``Getting CA Private Key`
```

　　

​    创建加密的配置文件： 

 

```
`[root@master pki]``# kubectl create secret generic cm-adapter-serving-certs --from-file=serving.crt=./serving.crt --from-file=serving.key=./serving.key  -n prom``secret``/``cm``-``adapter``-``serving``-``certs created`
```

　　

​    注：cm-adapter-serving-certs是custom-metrics-apiserver-deployment.yaml文件里面的名字。

 

```
`[root@master pki]``# kubectl get secrets -n prom``NAME                             ``TYPE`                                  `DATA      AGE``cm``-``adapter``-``serving``-``certs         Opaque                                ``2`         `51s``default``-``token``-``knsbg              kubernetes.io``/``service``-``account``-``token   ``3`         `4h``kube``-``state``-``metrics``-``token``-``sccdf   kubernetes.io``/``service``-``account``-``token   ``3`         `3h``prometheus``-``token``-``nqzbz           kubernetes.io``/``service``-``account``-``token   ``3`         `3h`
```

　　

  部署k8s-prometheus-adapter：

```
`[root@master k8s``-``prom]``# cd k8s-prometheus-adapter/``[root@master k8s``-``prometheus``-``adapter]``# ls``custom``-``metrics``-``apiserver``-``auth``-``delegator``-``cluster``-``role``-``binding.yaml   custom``-``metrics``-``apiserver``-``service.yaml``custom``-``metrics``-``apiserver``-``auth``-``reader``-``role``-``binding.yaml              custom``-``metrics``-``apiservice.yaml``custom``-``metrics``-``apiserver``-``deployment.yaml                            custom``-``metrics``-``cluster``-``role.yaml``custom``-``metrics``-``apiserver``-``resource``-``reader``-``cluster``-``role``-``binding.yaml  custom``-``metrics``-``resource``-``reader``-``cluster``-``role.yaml``custom``-``metrics``-``apiserver``-``service``-``account.yaml                       hpa``-``custom``-``metrics``-``cluster``-``role``-``binding.yaml`
```

　　

 由于k8s v1.11.2和k8s-prometheus-adapter最新版不兼容，1.13的也不兼容，解决办法就是访问https://github.com/DirectXMan12/k8s-prometheus-adapter/tree/master/deploy/manifests下载最新版的custom-metrics-apiserver-deployment.yaml文件，并把里面的namespace的名字改成prom；同时还要下载custom-metrics-config-map.yaml文件到本地来，并把里面的namespace的名字改成prom。

```
`[root@master k8s``-``prometheus``-``adapter]``# kubectl apply -f .``clusterrolebinding.rbac.authorization.k8s.io``/``custom``-``metrics:system:auth``-``delegator created``rolebinding.rbac.authorization.k8s.io``/``custom``-``metrics``-``auth``-``reader created``deployment.apps``/``custom``-``metrics``-``apiserver created``clusterrolebinding.rbac.authorization.k8s.io``/``custom``-``metrics``-``resource``-``reader created``serviceaccount``/``custom``-``metrics``-``apiserver created``service``/``custom``-``metrics``-``apiserver created``apiservice.apiregistration.k8s.io``/``v1beta1.custom.metrics.k8s.io created``clusterrole.rbac.authorization.k8s.io``/``custom``-``metrics``-``server``-``resources created``clusterrole.rbac.authorization.k8s.io``/``custom``-``metrics``-``resource``-``reader created``clusterrolebinding.rbac.authorization.k8s.io``/``hpa``-``controller``-``custom``-``metrics created`
```

　　

```
`[root@master k8s``-``prometheus``-``adapter]``# kubectl get all -n prom``NAME                                           READY     STATUS    RESTARTS   AGE``pod``/``custom``-``metrics``-``apiserver``-``65f545496``-``64lsz`   `1``/``1`       `Running   ``0`          `6m``pod``/``kube``-``state``-``metrics``-``58dffdf67d``-``v9klh        ``1``/``1`       `Running   ``0`          `4h``pod``/``prometheus``-``node``-``exporter``-``dmmjj             ``1``/``1`       `Running   ``0`          `4h``pod``/``prometheus``-``node``-``exporter``-``ghz2l             ``1``/``1`       `Running   ``0`          `4h``pod``/``prometheus``-``node``-``exporter``-``zt2lw             ``1``/``1`       `Running   ``0`          `4h``pod``/``prometheus``-``server``-``65f5d59585``-``6l8m8`         `1``/``1`       `Running   ``0`          `4h``NAME                               ``TYPE`        `CLUSTER``-``IP      EXTERNAL``-``IP   PORT(S)          AGE``service``/``custom``-``metrics``-``apiserver   ClusterIP   ``10.103``.``87.246`   `<none>        ``443``/``TCP          ``36m``service``/``kube``-``state``-``metrics         ClusterIP   ``10.111``.``41.139`   `<none>        ``8080``/``TCP         ``4h``service``/``prometheus                 NodePort    ``10.111``.``127.64`   `<none>        ``9090``:``30090``/``TCP   ``4h``service``/``prometheus``-``node``-``exporter   ClusterIP   ``None`            `<none>        ``9100``/``TCP         ``4h``NAME                                      DESIRED   CURRENT   READY     UP``-``TO``-``DATE   AVAILABLE   NODE SELECTOR   AGE``daemonset.apps``/``prometheus``-``node``-``exporter   ``3`         `3`         `3`         `3`            `3`           `<none>          ``4h``NAME                                       DESIRED   CURRENT   UP``-``TO``-``DATE   AVAILABLE   AGE``deployment.apps``/``custom``-``metrics``-``apiserver   ``1`         `1`         `1`            `1`           `36m``deployment.apps``/``kube``-``state``-``metrics         ``1`         `1`         `1`            `1`           `4h``deployment.apps``/``prometheus``-``server          ``1`         `1`         `1`            `1`           `4h``NAME                                                  DESIRED   CURRENT   READY     AGE``replicaset.apps``/``custom``-``metrics``-``apiserver``-``5f6b4d857d`   `0`         `0`         `0`         `36m``replicaset.apps``/``custom``-``metrics``-``apiserver``-``65f545496`    `1`         `1`         `1`         `6m``replicaset.apps``/``custom``-``metrics``-``apiserver``-``86ccf774d5`   `0`         `0`         `0`         `17m``replicaset.apps``/``kube``-``state``-``metrics``-``58dffdf67d`         `1`         `1`         `1`         `4h``replicaset.apps``/``prometheus``-``server``-``65f5d59585`          `1`         `1`         `1`         `4h`
```

　　

 

  最终看到prom名称空间里面的所有资源都是running状态了。 

 

```
`[root@master k8s``-``prometheus``-``adapter]``# kubectl api-versions``custom.metrics.k8s.io``/``v1beta1`
```

　　

  可以看到custom.metrics.k8s.io/v1beta1这个api了。我那没看到上面这个东西，但是不影响使用

  开个代理： 

```
`[root@master k8s``-``prometheus``-``adapter]``# kubectl proxy --port=8080`
```

　　

​     可以看到指标数据了：

 

```
`[root@master pki]``# curl  http://localhost:8080/apis/custom.metrics.k8s.io/v1beta1/`` ``{``      ``"name"``: ``"pods/ceph_rocksdb_submit_transaction_sync"``,``      ``"singularName"``: "",``      ``"namespaced"``: true,``      ``"kind"``: ``"MetricValueList"``,``      ``"verbs"``: [``        ``"get"``      ``]``    ``},``    ``{``      ``"name"``: ``"jobs.batch/kube_deployment_created"``,``      ``"singularName"``: "",``      ``"namespaced"``: true,``      ``"kind"``: ``"MetricValueList"``,``      ``"verbs"``: [``        ``"get"``      ``]``    ``},``    ``{``      ``"name"``: ``"jobs.batch/kube_pod_owner"``,``      ``"singularName"``: "",``      ``"namespaced"``: true,``      ``"kind"``: ``"MetricValueList"``,``      ``"verbs"``: [``        ``"get"``      ``]``    ``},`
```

　　

  下面我们就可以愉快的创建HPA了（水平Pod自动伸缩）。

​    另外，prometheus还可以和grafana整合。如下步骤。

​    先下载文件grafana.yaml，访问https://github.com/kubernetes/heapster/blob/master/deploy/kube-config/influxdb/grafana.yaml

```
`[root@master pro]``# wget https://raw.githubusercontent.com/kubernetes-retired/heapster/master/deploy/kube-config/influxdb/grafana.yaml`
```

　　

​    修改grafana.yaml文件内容：

 

```
`把namespace: kube``-``system改成prom，有两处；`` ``把env里面的下面两个注释掉：``        ``-` `name: INFLUXDB_HOST``          ``value: monitoring``-``influxdb`` ``在最有一行加个``type``: NodePort`` ``ports:``  ``-` `port: ``80``    ``targetPort: ``3000``  ``selector:``    ``k8s``-``app: grafana``  ``type``: NodePort`
```

　　

```
`[root@master pro]``# kubectl apply -f grafana.yaml``deployment.extensions``/``monitoring``-``grafana created``service``/``monitoring``-``grafana created`
```

　　

```
`[root@master pro]``# kubectl get pods -n prom``NAME                                       READY     STATUS    RESTARTS   AGE``monitoring``-``grafana``-``ffb4d59bd``-``gdbsk         ``1``/``1`       `Running   ``0`          `5s`
```

　　

如果还有问题就删掉上面的那几个，重新在apply一下

​    看到grafana这个pod运行起来了。 

 

```
`[root@master pro]``# kubectl get svc -n prom``NAME                       ``TYPE`        `CLUSTER``-``IP       EXTERNAL``-``IP   PORT(S)          AGE``monitoring``-``grafana         NodePort    ``10.106``.``164.205`   `<none>        ``80``:``32659``/``TCP     ``19m`
```

　　

 我们可以访问宿主机master ip： [http://172.16.1.100:32659](http://172.16.1.100:32659/)

 

![img](http://img.blog.itpub.net/blog/2018/10/16/604625f54aacf6a3.png?x-oss-process=style/bb)

 ![img](http://img.blog.itpub.net/blog/2018/10/16/41ece597528e5a7b.png?x-oss-process=style/bb)

 

**上图端口号是9090**，根据自己svc实际端口去填写。除了把80 改成9090.其余不变，为什么是上面的格式，因为他们都处于一个名称空间内，可以通过服务名访问到的。

```
`[root@master pro]``# kubectl get svc -n prom    ``NAME                       ``TYPE`        `CLUSTER``-``IP      EXTERNAL``-``IP   PORT(S)          AGE``custom``-``metrics``-``apiserver   ClusterIP   ``10.109``.``58.249`   `<none>        ``443``/``TCP          ``52m``kube``-``state``-``metrics         ClusterIP   ``10.103``.``52.45`    `<none>        ``8080``/``TCP         ``69m``monitoring``-``grafana         NodePort    ``10.110``.``240.31`   `<none>        ``80``:``31128``/``TCP     ``17m``prometheus                 NodePort    ``10.110``.``19.171`   `<none>        ``9090``:``30090``/``TCP   ``145m``prometheus``-``node``-``exporter   ClusterIP   ``None`            `<none>        ``9100``/``TCP         ``146m`
```

　　

![img](http://img.blog.itpub.net/blog/2018/10/16/7c2d036861fa3ef9.png?x-oss-process=style/bb)

![img](http://img.blog.itpub.net/blog/2018/10/16/524cf9fbd35a52c5.png?x-oss-process=style/bb)

​    然后，就能从界面上看到相应的数据了。 

​    登录下面的网站下载个grafana监控k8s-prometheus的模板： https://grafana.com/dashboards/6417

![img](http://img.blog.itpub.net/blog/2018/10/16/66f01c7316924cee.png?x-oss-process=style/bb)

​    然后再grafana的界面中导入上面下载的模板： 

![img](http://img.blog.itpub.net/blog/2018/10/16/2b9c5500592f8252.png?x-oss-process=style/bb)

![img](http://img.blog.itpub.net/blog/2018/10/16/ad93e088a4d9af04.png?x-oss-process=style/bb)

​    导入模板之后，就能看到监控数据了： 

![img](http://img.blog.itpub.net/blog/2018/10/16/72081d613d18803a.png?x-oss-process=style/bb)

 

 HPA的没去实际操作，因为以前自己做过了，就不做了，直接复制过来，如有问题自己单独解决

# HPA（水平pod自动扩展） 

​    当pod压力大了，会根据负载自动扩展Pod个数以均匀压力。 

​    目前，HPA只支持两个版本，v1版本只支持核心指标的定义（只能根据cpu利用率的指标进行pod的扩展）； 

```
`[root@master pro]``# kubectl explain hpa.spec.scaleTargetRef``scaleTargetRef：表示基于什么指标来计算pod伸缩的标准`
```

　　

```
`[root@master pro]``# kubectl api-versions |grep auto``autoscaling``/``v1``autoscaling``/``v2beta1`
```

　　

​    上面看到分别支持hpav1和hpav2。 

​    下面我们用命令行的方式重新创建一个带有资源限制的pod myapp： 

```
`[root@master ~]``# kubectl run myapp --image=ikubernetes/myapp:v1 --replicas=1 --requests='cpu=50m,memory=256Mi' --limits='cpu=50m,memory=256Mi' --labels='app=myapp' --expose --port=80``service``/``myapp created``deployment.apps``/``myapp created`
```

　　

```
`[root@master ~]``# kubectl get pods``NAME                     READY     STATUS    RESTARTS   AGE``myapp``-``6985749785``-``fcvwn   ``1``/``1`       `Running   ``0`          `58s`
```

　　

​    下面我们让myapp 这个pod能自动水平扩展，用kubectl autoscale，其实就是指明HPA控制器的。 

 

```
`[root@master ~]``# kubectl autoscale deployment myapp --min=1 --max=8 --cpu-percent=60``horizontalpodautoscaler.autoscaling``/``myapp autoscaled`
```

　　

 --min：表示最小扩展pod的个数 

​    --max：表示最多扩展pod的个数 

​    --cpu-percent：cpu利用率 

```
`[root@master ~]``# kubectl get hpa``NAME      REFERENCE          TARGETS   MINPODS   MAXPODS   REPLICAS   AGE``myapp     Deployment``/``myapp   ``0``%``/``60``%`    `1`         `8`         `1`          `4m`
```

　　

```
`[root@master ~]``# kubectl get svc``NAME         ``TYPE`        `CLUSTER``-``IP       EXTERNAL``-``IP   PORT(S)             AGE``myapp        ClusterIP   ``10.105``.``235.197`   `<none>        ``80``/``TCP              ``19`
```

　　

​    下面我们把service改成NodePort的方式：

 

```
`[root@master ~]``# kubectl patch svc myapp -p '{"spec":{"type": "NodePort"}}'``service``/``myapp patched`
```

　　

```
`[root@master ~]``# kubectl get svc``NAME         ``TYPE`        `CLUSTER``-``IP       EXTERNAL``-``IP   PORT(S)             AGE``myapp        NodePort    ``10.105``.``235.197`   `<none>        ``80``:``31990``/``TCP        ``22m`
```

　　

```
`[root@master ~]``# yum install httpd-tools #主要是为了安装ab压测工具`
```

　　

```
`[root@master ~]``# kubectl get pods -o wide``NAME                     READY     STATUS    RESTARTS   AGE       IP            NODE``myapp``-``6985749785``-``fcvwn   ``1``/``1`       `Running   ``0`          `25m`       `10.244``.``2.84`   `node2`
```

　　

​    开始用ab工具压测 

 

```
`[root@master ~]``# ab -c 1000 -n 5000000 http://172.16.1.100:31990/index.html``This ``is` `ApacheBench, Version ``2.3` `<$Revision: ``1430300` `$>``Copyright ``1996` `Adam Twiss, Zeus Technology Ltd, http:``/``/``www.zeustech.net``/``Licensed to The Apache Software Foundation, http:``/``/``www.apache.org``/``Benchmarking ``172.16``.``1.100` `(be patient)`
```

　　

​    多等一会，会看到pods的cpu利用率为98%，需要扩展为2个pod了： 

 

```
`[root@master ~]``# kubectl describe hpa``resource cpu on pods  (as a percentage of request):  ``98``%` `(``49m``) ``/` `60``%``Deployment pods:                                       ``1` `current ``/` `2` `desired`
```

　　

```
`[root@master ~]``# kubectl top pods``NAME                     CPU(cores)   MEMORY(bytes)  ``myapp``-``6985749785``-``fcvwn   ``49m` `（我们设置的总cpu是``50m``）         ``3Mi`
```

　　

```
`[root@master ~]``#  kubectl get pods -o wide``NAME                     READY     STATUS    RESTARTS   AGE       IP             NODE``myapp``-``6985749785``-``fcvwn   ``1``/``1`       `Running   ``0`          `32m`       `10.244``.``2.84`    `node2``myapp``-``6985749785``-``sr4qv   ``1``/``1`       `Running   ``0`          `2m`        `10.244``.``1.105`   `node1`
```

　　

​    上面我们看到已经自动扩展为2个pod了，再等一会，随着cpu压力的上升，还会看到自动扩展为4个或更多的pod： 

 

```
`[root@master ~]``#  kubectl get pods -o wide``NAME                     READY     STATUS    RESTARTS   AGE       IP             NODE``myapp``-``6985749785``-``2mjrd`   `1``/``1`       `Running   ``0`          `1m`        `10.244``.``1.107`   `node1``myapp``-``6985749785``-``bgz6p   ``1``/``1`       `Running   ``0`          `1m`        `10.244``.``1.108`   `node1``myapp``-``6985749785``-``fcvwn   ``1``/``1`       `Running   ``0`          `35m`       `10.244``.``2.84`    `node2``myapp``-``6985749785``-``sr4qv   ``1``/``1`       `Running   ``0`          `5m`        `10.244``.``1.105`   `node1`
```

　　

​    等压测一停止，pod个数还会收缩为正常个数的。

​    上面我们用的是hpav1来做的水平pod自动扩展的功能，我们前面也说过，hpa v1版本只能根据cpu利用率括水平自动扩展pod。 

​    下面我们介绍一下hpa v2的功能，它可以根据自定义指标利用率来水平扩展pod。 

​    在使用hpa v2版本前，我们先把前面创建的hpa v1版本删除了，以免和我们测试的hpa v2版本冲突： 

```
`[root@master hpa]``# kubectl delete hpa myapp``horizontalpodautoscaler.autoscaling ``"myapp"` `deleted`
```

　　

好了，下面我们创建一个hpa v2： 

```
`[root@master hpa]``# cat hpa-v2-demo.yaml``apiVersion: autoscaling``/``v2beta1   ``#从这可以看出是hpa v2版本``kind: HorizontalPodAutoscaler``metadata:``  ``name: myapp``-``hpa``-``v2``spec:``  ``scaleTargetRef: ``#根据什么指标来做评估压力``    ``apiVersion: apps``/``v1 ``#对谁来做自动扩展``    ``kind: Deployment``    ``name: myapp``  ``minReplicas: ``1` `#最少副本数量``  ``maxReplicas: ``10``  ``metrics: ``#表示依据哪些指标来进行评估``  ``-` `type``: Resource ``#表示基于资源进行评估``    ``resource:``      ``name: cpu``      ``targetAverageUtilization: ``55` `#表示pod cpu使用率超过55%，就自动水平扩展pod个数``  ``-` `type``: Resource``    ``resource:``      ``name: memory ``#我们知道hpa v1版本只能根据cpu来进行评估，而到了我们的hpa v2版本就可以根据内存来进行评估了``      ``targetAverageValue: ``50Mi` `#表示pod内存使用超过50M，就自动水平扩展pod个数`
```

　　

```
`[root@master hpa]``# kubectl apply -f hpa-v2-demo.yaml``horizontalpodautoscaler.autoscaling``/``myapp``-``hpa``-``v2 created`
```

　　

```
`[root@master hpa]``# kubectl get hpa``NAME           REFERENCE          TARGETS                MINPODS   MAXPODS   REPLICAS   AGE``myapp``-``hpa``-``v2   Deployment``/``myapp   ``3723264``/``50Mi``, ``0``%``/``55``%`   `1`         `10`        `1`          `37s`
```

　　

​    我们看到现在只有一个pod 

 

```
`[root@master hpa]``# kubectl get pods -o wide``NAME                     READY     STATUS    RESTARTS   AGE       IP            NODE``myapp``-``6985749785``-``fcvwn   ``1``/``1`       `Running   ``0`          `57m`       `10.244``.``2.84`   `node2`
```

　　

​    开始压测： 

 

```
`[root@master ~]``# ab -c 100 -n 5000000 http://172.16.1.100:31990/index.html`
```

　　

​    看hpa v2的检测情况： 

 

```
`[root@master hpa]``# kubectl describe hpa``Metrics:                                               ( current ``/` `target )``  ``resource memory on pods:                             ``3756032` `/` `50Mi``  ``resource cpu on pods  (as a percentage of request):  ``82``%` `(``41m``) ``/` `55``%``Min` `replicas:                                          ``1``Max` `replicas:                                          ``10``Deployment pods:                                       ``1` `current ``/` `2` `desired`
```

　　

```
`[root@master hpa]``# kubectl get pods -o wide``NAME                     READY     STATUS    RESTARTS   AGE       IP             NODE``myapp``-``6985749785``-``8frq4`   `1``/``1`       `Running   ``0`          `1m`        `10.244``.``1.109`   `node1``myapp``-``6985749785``-``fcvwn   ``1``/``1`       `Running   ``0`          `1h`        `10.244``.``2.84`    `node2`
```

　　

  看到自动扩展出了2个Pod。等压测一停止，pod个数还会收缩为正常个数的。 

​    将来我们不光可以用hpa v2，根据cpu和内存使用率进行伸缩Pod个数，还可以根据http并发量等。 

​    比如下面的： 

```
`[root@master hpa]``# cat hpa-v2-custom.yaml``apiVersion: autoscaling``/``v2beta1  ``#从这可以看出是hpa v2版本``kind: HorizontalPodAutoscaler``metadata:``  ``name: myapp``-``hpa``-``v2``spec:``  ``scaleTargetRef: ``#根据什么指标来做评估压力``    ``apiVersion: apps``/``v1 ``#对谁来做自动扩展``    ``kind: Deployment``    ``name: myapp``  ``minReplicas: ``1` `#最少副本数量``  ``maxReplicas: ``10``  ``metrics: ``#表示依据哪些指标来进行评估``  ``-` `type``: Pods ``#表示基于资源进行评估``    ``pods:``      ``metricName: http_requests``#自定义的资源指标``        ``targetAverageValue: ``800m` `#m表示个数,表示并发数800`
```

　　关于并发数的hpa，具体镜像可以参考https://hub.docker.com/r/ikubernetes/metrics-app/

参考：<https://www.cnblogs.com/dribs/p/10332957.html>



## 11.4  容器资源需求、资源限制及HeapSter

**一、容器资源需求、资源限制**

资源需求、资源限制：指的是cpu、内存等资源；

资源需求、资源限制的两个关键字：

- request：需求，最低保障，在调度时，这个节点必须要满足request需求的资源大小；
- limits：限制、硬限制。这个限制容器无论怎么运行都不会超过limits的值；

CPU：k8s的一个cpu对应一颗宿主机逻辑cpu。一个逻辑cpu还可以划分为1000个毫核（millcores）。所以1cpu=1000m；500m=0.5个CPU，0.5m相当于二分之一的核心；

内存的计量单位：E、P、T、G、M、K

```
[root@master ~]# kubectl explain pods.spec.containers.resources
[root@master ~]# kubectl explain pods.spec.containers.resources.requests
[root@master ~]# kubectl explain pods.spec.containers.resources.limits
```

用法参考：<https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/>

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@master metrics]# pwd
/root/manifests/metrics
[root@master metrics]# vim pod-demo.yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod-demo
  labels:
    app: myapp
    tier: frontend
spec:
  containers:
  - name: myapp
    image: ikubernetes/stress-ng
    command: ["/usr/bin/stress-ng", "-c 1", "--metrics-brief"]       #-c 1表示启动一个子进程对cpu做压测.默认stress-ng的一个子进程使用256M内存
    resources:
      requests:
        cpu: "200m"
        memory: "128Mi"
      limits:
        cpu: "500m"
        memory: "512Mi"

#创建pod
[root@master metrics]# kubectl apply -f pod-demo.yaml 
pod/pod-demo created

[root@master metrics]# kubectl get pods
NAME       READY   STATUS    RESTARTS   AGE
pod-demo   1/1     Running   0          6s

[root@master metrics]# kubectl exec pod-demo -- top
Mem: 1378192K used, 487116K free, 12540K shrd, 2108K buff, 818184K cached
CPU:  26% usr   1% sys   0% nic  71% idle   0% io   0% irq   0% sirq
Load average: 0.78 0.96 0.50 2/479 11
  PID  PPID USER     STAT   VSZ %VSZ CPU %CPU COMMAND
    6     1 root     R     6884   0%   1  26% {stress-ng-cpu} /usr/bin/stress-ng
    7     0 root     R     1504   0%   0   0% top
    1     0 root     S     6244   0%   1   0% /usr/bin/stress-ng -c 1 --metrics-
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

我们对容器分配了资源限制后，k8s会自动分配一个QoS，叫服务质量，通过kubectl describe pods pod_name可以查看这个字段；

```
[root@master metrics]# kubectl describe pods pod-demo |grep QoS
QoS Class:       Burstable
```

QoS可以分为三类(根据资源设置，自动归类)：

- Guranteed：表示每个容器的cpu和内存资源设置了相同的requests和limits值，即cpu.requests=cpu.limits和memory.requests=memory.limits，Guranteed会确保这类pod有最高的优先级，会被优先运行的，即使节点上的资源不够用；
- Burstable:表示pod中至少有一个容器设置了cpu或内存资源的requests属性，可能没有定义limits属性，那么这类pod具有中等优先级；
- BestEffort：指没有任何一个容器设置了requests或者limits属性，那么这类pod是最低优先级。当这类pod的资源不够用时，BestEffort中的容器会被优先终止，以便腾出资源来，给另外两类pod中的容器正常运行；

 

**二、HeapSter**

**1、介绍**

HeapSter的作用是收集个节点pod的资源使用情况，然后以图形界面展示给用户。

[![image](https://img2018.cnblogs.com/blog/1190780/201903/1190780-20190325162908760-1963104393.png)](https://img2018.cnblogs.com/blog/1190780/201903/1190780-20190325162908125-1541852228.png)

kubelet中的cAdvisor负责收集每个节点上的资源使用情况，然后把信息存储HeapSter中，HeapSter再把数据持久化的存储在数据库InfluxDB中。然后我们再通过非常优秀的Grafana来图形化展示；

一般我们监控的指标包括k8s集群的系统指标、容器指标和应用指标。

默认InfluxDB使用的是存储卷是emptyDir，容器一关数据就没了，所以我们生产要换成glusterfs等存储卷才行。

 

**2、部署influxdb**：

InfluxDB github：<https://github.com/kubernetes-retired/heapster>

在node节点上先拉取镜像：

```
#node01
[root@node01 ~]# docker pull fishchen/heapster-influxdb-amd64:v1.5.2

#node02
[root@node02 ~]# docker pull fishchen/heapster-influxdb-amd64:v1.5.2
```

在master节点上，拉取yaml文件，并修改、执行：

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
[root@master metrics]# wget https://raw.githubusercontent.com/kubernetes-retired/heapster/master/deploy/kube-config/influxdb/influxdb.yaml

[root@master metrics]# vim influxdb.yaml
apiVersion: apps/v1        #此处不修改也可以，如果改成apps/v1，要加下面 selector那几行
kind: Deployment
metadata:
  name: monitoring-influxdb
  namespace: kube-system
spec:
  replicas: 1
  selector:            #加此行
    matchLabels:        #加此行
      task: monitoring        #加此行
      k8s-app: influxdb    #加此行
  template:
    metadata:
      labels:
        task: monitoring
        k8s-app: influxdb
    spec:
      containers:
      - name: influxdb
        image: fishchen/heapster-influxdb-amd64:v1.5.2    #修改此处镜像地址    
        volumeMounts:
        - mountPath: /data
          name: influxdb-storage
      volumes:
      - name: influxdb-storage
        emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    task: monitoring
    # For use as a Cluster add-on (https://github.com/kubernetes/kubernetes/tree/master/cluster/addons)
    # If you are NOT using this as an addon, you should comment out this line.
    kubernetes.io/cluster-service: 'true'
    kubernetes.io/name: monitoring-influxdb
  name: monitoring-influxdb
  namespace: kube-system
spec:
  ports:
  - port: 8086
    targetPort: 8086
  selector:
    k8s-app: influxdb

#创建资源
[root@master metrics]# kubectl apply -f influxdb.yaml 
deployment.apps/monitoring-influxdb created
service/monitoring-influxdb created

#查看
[root@master metrics]# kubectl get pods -n kube-system |grep influxdb
monitoring-influxdb-5899b7fff9-2r58w    1/1     Running   0          6m59s

[root@master metrics]# kubectl get svc -n kube-system |grep influxdb
monitoring-influxdb    ClusterIP   10.101.242.217   <none>        8086/TCP        7m6s
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**3、部署rbac**

下面我们开始部署heapster，但heapster依赖rbac，所以我们先部署rbac：

```
[root@master metrics]# wget https://raw.githubusercontent.com/kubernetes-retired/heapster/master/deploy/kube-config/rbac/heapster-rbac.yaml

[root@master metrics]# kubectl apply -f heapster-rbac.yaml 
clusterrolebinding.rbac.authorization.k8s.io/heapster created
```

**4、部署heapster**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
#node01拉取镜像
[root@node01 ~]# docker pull rancher/heapster-amd64:v1.5.4

#node02拉取镜像
[root@node02 ~]# docker pull rancher/heapster-amd64:v1.5.4

#master拉取yaml文件
[root@master metrics]# wget https://raw.githubusercontent.com/kubernetes-retired/heapster/master/deploy/kube-config/influxdb/heapster.yaml

[root@master metrics]# vim heapster.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: heapster
  namespace: kube-system
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: heapster
  namespace: kube-system
spec:
  replicas: 1
  selector:
    matchLabels:
      task: monitoring
      k8s-app: heapster
  template:
    metadata:
      labels:
        task: monitoring
        k8s-app: heapster
    spec:
      serviceAccountName: heapster
      containers:
      - name: heapster
        image: rancher/heapster-amd64:v1.5.4    #修改此处镜像地址
        imagePullPolicy: IfNotPresent
        command:
        - /heapster
        - --source=kubernetes:https://kubernetes.default
        - --sink=influxdb:http://monitoring-influxdb.kube-system.svc:8086
---
apiVersion: v1
kind: Service
metadata:
  labels:
    task: monitoring
    # For use as a Cluster add-on (https://github.com/kubernetes/kubernetes/tree/master/cluster/addons)
    # If you are NOT using this as an addon, you should comment out this line.
    kubernetes.io/cluster-service: 'true'
    kubernetes.io/name: Heapster
  name: heapster
  namespace: kube-system
spec:
  ports:
  - port: 80
    targetPort: 8082
  type: NodePort        #我添加了此行，
  selector:
    k8s-app: heapster

#创建
[root@master metrics]# kubectl apply -f heapster.yaml 
serviceaccount/heapster created
deployment.apps/heapster created

#查看
[root@master metrics]# kubectl get pods -n kube-system |grep heapster-
heapster-7c8f7dc8cb-kph29               1/1     Running   0          3m55s
[root@master metrics]# 
[root@master metrics]# kubectl get svc -n kube-system |grep heapster
heapster               NodePort    10.111.93.84     <none>        80:31410/TCP    4m16s    #由于用了NodePort，所以pod端口映射到了节点31410端口上

#查看pod日志
[root@master metrics]# kubectl  logs heapster-7c8f7dc8cb-kph29 -n kube-system
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

**5、部署Grafana**

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

```
#node01拉取镜像
[root@node01 ~]# docker pull angelnu/heapster-grafana:v5.0.4

#node02拉取镜像
[root@node02 ~]# docker pull angelnu/heapster-grafana:v5.0.4

#master拉取yaml文件
[root@master metrics]# wget https://raw.githubusercontent.com/kubernetes-retired/heapster/master/deploy/kube-config/influxdb/grafana.yaml

#编辑yaml文件
[root@master metrics]# vim grafana.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: monitoring-grafana
  namespace: kube-system
spec:
  replicas: 1
  selector:
    matchLabels:
      task: monitoring
      k8s-app: grafana

  template:
    metadata:
      labels:
        task: monitoring
        k8s-app: grafana
    spec:
      containers:
      - name: grafana
        image: angelnu/heapster-grafana:v5.0.4    #修改镜像地址
        ports:
        - containerPort: 3000
          protocol: TCP
        volumeMounts:
        - mountPath: /etc/ssl/certs
          name: ca-certificates
          readOnly: true
        - mountPath: /var
          name: grafana-storage
        env:
        - name: INFLUXDB_HOST
          value: monitoring-influxdb
        - name: GF_SERVER_HTTP_PORT
          value: "3000"
          # The following env variables are required to make Grafana accessible via
          # the kubernetes api-server proxy. On production clusters, we recommend
          # removing these env variables, setup auth for grafana, and expose the grafana
          # service using a LoadBalancer or a public IP.
        - name: GF_AUTH_BASIC_ENABLED
          value: "false"
        - name: GF_AUTH_ANONYMOUS_ENABLED
          value: "true"
        - name: GF_AUTH_ANONYMOUS_ORG_ROLE
          value: Admin
        - name: GF_SERVER_ROOT_URL
          # If you're only using the API Server proxy, set this value instead:
          # value: /api/v1/namespaces/kube-system/services/monitoring-grafana/proxy
          value: /
      volumes:
      - name: ca-certificates
        hostPath:
          path: /etc/ssl/certs
      - name: grafana-storage
        emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  labels:
    # For use as a Cluster add-on (https://github.com/kubernetes/kubernetes/tree/master/cluster/addons)
    # If you are NOT using this as an addon, you should comment out this line.
    kubernetes.io/cluster-service: 'true'
    kubernetes.io/name: monitoring-grafana
  name: monitoring-grafana
  namespace: kube-system
spec:
  # In a production setup, we recommend accessing Grafana through an external Loadbalancer
  # or through a public IP.
  # type: LoadBalancer
  # You could also use NodePort to expose the service at a randomly-generated port
  # type: NodePort
  ports:
  - port: 80
    targetPort: 3000
  type: NodePort        #为了能在集群外部访问Grafana，所以我们需要定义NodePort
  selector:
    k8s-app: grafana


#创建
[root@master metrics]# kubectl apply -f grafana.yaml 
deployment.apps/monitoring-grafana created
service/monitoring-grafana created

#查看
[root@master metrics]# kubectl get pods -n kube-system |grep grafana
monitoring-grafana-84786758cc-7txwr     1/1     Running   0          3m47s

[root@master metrics]# kubectl get svc -n kube-system |grep grafana
monitoring-grafana     NodePort    10.102.42.86     <none>        80:31404/TCP    3m55s    #可见pod的端口映射到了node上的31404端口上
```

[![复制代码](https://common.cnblogs.com/images/copycode.gif)](javascript:void(0);)

pod的端口已经映射到了node上的31404端口上；

此时，在集群外部，用浏览器访问：[http://ip:31404](http://ip:31404/)

如下图：

[![image](https://img2018.cnblogs.com/blog/1190780/201903/1190780-20190325162909321-1962597975.png)](https://img2018.cnblogs.com/blog/1190780/201903/1190780-20190325162909035-259232262.png)

但是如何使用，可能还需要进一步学习influxbd、grafana等；

最后，HeapSter可能快被废除了…

新型的监控系统比如有：Prometheus(普罗米修斯)

# 12.Kubernetes运维指南

## 12.1  集群共享与隔离

## 12.2  资源管理

## 12.3  高可用方案

## 12.4  集群监控

## 12.5  日志汇聚与查询显示

## 12.6  环境迁移

# 13.Kubernetes总结

答疑
回顾，课后布置