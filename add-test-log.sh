docker stop fluentd-test
docker rm fluentd-test
docker run -d --name fluentd-test --log-driver fluentd --log-opt fluentd-address=localhost:24224 --log-opt tag="log-test-A" busybox sh -c 'for i in $(seq 1 10);do echo "this is ${i} log message, at `date`"; sleep 1; done;'
