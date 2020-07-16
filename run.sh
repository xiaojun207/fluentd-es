docker stop fluentd
docker rm fluentd

docker run -d --name fluentd --add-host=elasticsearch:192.168.3.32 -p "24224:24224" -p "24224:24224/udp"\
 -v `pwd`/logs:/tmp/logs\
 xiaojun207/fluentd-es:v1.11.3
