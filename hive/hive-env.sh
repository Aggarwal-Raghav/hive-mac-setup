export HADOOP_HOME=/Users/raghav/Desktop/setup/hadoop
export HIVE_HOME=/Users/raghav/Desktop/setup/hive
export HIVE_CONF_DIR=/Users/raghav/Desktop/setup/hive/conf

if [ "$SERVICE" = "metastore" ]; then
    export HADOOP_HEAPSIZE=2048
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=/tmp/hadoop/hive -Dhive.log.file=hivemetastore.log"
fi

if [ "$SERVICE" = "hiveserver2" ]; then
    export HADOOP_HEAPSIZE=2048
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=/tmp/hadoop/hive -Dhive.log.file=hiveserver2.log"
fi
