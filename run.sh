docker stop fluentd
docker rm fluentd

docker run -d --name fluentd -p "24224:24224" -p "24224:24224/udp"\
 -v `pwd`/conf:/fluentd/etc\
 -v `pwd`/logs:/tmp/logs\
 xiaojun207/fluentd-es:v1.11.2
