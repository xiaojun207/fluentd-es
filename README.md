# fluentd-es
fluentd with elasticsearch plugin(fluent-plugin-elasticsearch)


## build
```
    docker build -t xiaojun207/fluentd-es:v1.11.1 .
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
