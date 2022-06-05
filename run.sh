containerName="fluentd"

docker ps -aq --filter "name=${containerName}" | grep -q . && docker stop ${containerName} && docker rm -fv ${containerName}



docker run -d --name ${containerName} -p "24224:24224" -p "24224:24224/udp"\
 -v `pwd`/conf:/fluentd/etc\
 -v `pwd`/logs:/fluentd/log\
 xiaojun207/fluentd-es:latest


# docker run -d --name ${containerName} -p 24224:24224 -p 24224:24224/udp -u fluent -v `pwd`/fluentd/:/fluentd/log fluentd
