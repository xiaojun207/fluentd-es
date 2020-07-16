for i in $(seq 1 9);do
  echo "2020-07-16 21:0${i}:15,076 INFO com.g.job.TestJob 23 INFO.trace" >> logs/common-info.log;
  echo "2020-07-16 21:0${i}:25,076 ERROR com.g.job.TestJob 29 error.trace" >> logs/common-error.log;
  sleep 1;
done;

