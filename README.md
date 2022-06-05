# fluentd-es
fluentd with elasticsearch plugin(fluent-plugin-elasticsearch)
> 增加java 的log4j的多行日志插件支持

## build
```
    docker build -t xiaojun207/fluentd-es:v1.14.1 .
```

## start
```
    docker run -d --name fluentd -p "24224:24224" -p "24224:24224/udp"\
 -v `pwd`/logs:/tmp/logs\
 xiaojun207/fluentd-es:v1.14.1


//  -v `pwd`/conf:/fluentd/etc\ 容器中，默认包含了配置，大家需要自行配置的。可以自己做映射
```

## docker-compose
```
  docker-compose -d up
```

## eg.
```
docker stop fluentd-test 
docker rm fluentd-test 
docker run -d --name fluentd-test --log-driver fluentd --log-opt fluentd-address=localhost:24224 --log-opt tag="log-test-container-A" busybox sh -c 'for((i=1;i<=10;i++));do echo "${date} this is ${i} log message"; sleep 1; done;'
```


## 增加docker log 多行支持
如：

```
    2020-07-24 16:26:52,398 ERROR o.a.c.ConnectionState [Quartz Shutdown-Hook WorkJob] Connection timed out for connection string (172.1.2.1:2181) and timeout (15000) / elapsed (46792)
    org.apache.curator.CuratorConnectionLossException: KeeperErrorCode = ConnectionLoss
        at org.apache.curator.ConnectionState.checkTimeouts(ConnectionState.java:197) [curator-client-2.10.0.jar!/:?]
        at org.apache.curator.ConnectionState.getZooKeeper(ConnectionState.java:88) [curator-client-2.10.0.jar!/:?]
        at org.apache.curator.CuratorZookeeperClient.getZooKeeper(CuratorZookeeperClient.java:116) [curator-client-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.CuratorFrameworkImpl.getZooKeeper(CuratorFrameworkImpl.java:489) [curator-framework-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.ExistsBuilderImpl$3.call(ExistsBuilderImpl.java:226) [curator-framework-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.ExistsBuilderImpl$3.call(ExistsBuilderImpl.java:215) [curator-framework-2.10.0.jar!/:?]
        at org.apache.curator.RetryLoop.callWithRetry(RetryLoop.java:108) [curator-client-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.ExistsBuilderImpl.pathInForegroundStandard(ExistsBuilderImpl.java:212) [curator-framework-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.ExistsBuilderImpl.pathInForeground(ExistsBuilderImpl.java:205) [curator-framework-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.ExistsBuilderImpl.forPath(ExistsBuilderImpl.java:168) [curator-framework-2.10.0.jar!/:?]
        at org.apache.curator.framework.imps.ExistsBuilderImpl.forPath(ExistsBuilderImpl.java:39) [curator-framework-2.10.0.jar!/:?]
        at com.dangdang.ddframe.job.reg.zookeeper.ZookeeperRegistryCenter.isExisted(ZookeeperRegistryCenter.java:205) [elastic-job-common-core-2.1.2.jar!/:?]
        at com.dangdang.ddframe.job.lite.internal.storage.JobNodeStorage.isJobNodeExisted(JobNodeStorage.java:62) [elastic-job-lite-core-2.1.2.jar!/:?]
        at com.dangdang.ddframe.job.lite.internal.storage.JobNodeStorage.removeJobNodeIfExisted(JobNodeStorage.java:118) [elastic-job-lite-core-2.1.2.jar!/:?]
        at com.dangdang.ddframe.job.lite.internal.instance.InstanceService.removeInstance(InstanceService.java:58) [elastic-job-lite-core-2.1.2.jar!/:?]
        at com.dangdang.ddframe.job.lite.internal.schedule.JobShutdownHookPlugin.shutdown(JobShutdownHookPlugin.java:36) [elastic-job-lite-core-2.1.2.jar!/:?]
        at org.quartz.core.QuartzScheduler.shutdownPlugins(QuartzScheduler.java:2381) [quartz-2.3.2.jar!/:?]
        at org.quartz.core.QuartzScheduler.shutdown(QuartzScheduler.java:730) [quartz-2.3.2.jar!/:?]
        at org.quartz.impl.StdScheduler.shutdown(StdScheduler.java:206) [quartz-2.3.2.jar!/:?]
        at org.quartz.plugins.management.ShutdownHookPlugin$1.run(ShutdownHookPlugin.java:128) [quartz-2.3.2.jar!/:?]
```
