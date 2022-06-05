num=$((RANDOM%100+1))

containerName="fluentd-test"

docker ps -aq --filter "name=${containerName}" | grep -q . && docker stop ${containerName} && docker rm -fv ${containerName}


for i in {1..1} ; do
 docker run --rm --name ${containerName} --log-driver=fluentd --log-opt fluentd-address=192.168.3.67:24224 --log-opt tag="{{.Name}}" busybox echo "2021-06-12 16:26:52,398 ERROR o.a.c.ConnectionState-${num}-${i}-1 [Quartz Shu 1
2021-06-12 16:26:53,398 ERROR o.a.c.ConnectionState-${num}-${i}-2 [Quartz Shutd 2
2021-06-12 16:26:54,398 ERROR o.a.c.ConnectionState-${num}-${i}-3 [Quartz Shutdown-Hook WorkJob] ERROR 3
2021-06-12 16:26:55,398 ERROR o.a.c.ConnectionState-${num}-${i}-4 [Quartz Shutdown-Hook WorkJob] ERROR 4
2021-06-12 16:26:56,398 ERROR o.a.c.ConnectionState-${num}-${i}-5 [Quartz Shutdown-Hook WorkJob] ERROR 5
2021-06-12 16:26:57,398 ERROR o.a.c.ConnectionState-${num}-${i}-6 [Quartz Shutdown-Hook WorkJob] ERROR 6
"
 sleep 1
done
