
containerName='fluentd-test3'

docker ps -aq --filter "name=${containerName}" | grep -q . && docker stop ${containerName} && docker rm -fv ${containerName}

docker run -d --name ${containerName} --log-driver fluentd --log-opt fluentd-address=172.16.20.205:24224 --log-opt tag="{{.Name}}" busybox sh -c 'for((i=1;i<=10;i++));do echo "${date} this is ${i} log message"; sleep 1; done;'
