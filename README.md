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
docker run -d --log-driver fluentd --log-opt fluentd-address=localhost:24224 --log-opt tag="log-test-container-A" busybox sh -c 'while true;do echo "this is a log message"'
```
