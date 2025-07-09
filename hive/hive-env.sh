export HADOOP_HOME=$HOME/Desktop/setup/hadoop
export HIVE_HOME=$HOME/Desktop/setup/hive
export HIVE_CONF_DIR=$HOME/Desktop/setup/hive/conf
export HIVE_LOG_DIR=/tmp/hadoop/hive


if [ "$SERVICE" = "beeline" ]; then
    export HADOOP_HEAPSIZE=128
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=$HIVE_LOG_DIR \
        -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$HIVE_LOG_DIR \
        -Dhive.log.file=beeline.log -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

fi
if [ "$SERVICE" = "metastore" ]; then
    export HADOOP_HEAPSIZE=2048
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=$HIVE_LOG_DIR \
        -Dhive.log.file=hivemetastore.log -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$HIVE_LOG_DIR \
        -Xlog:gc*=info:file=$HIVE_LOG_DIR/gc-${SERVICE}-%p-%t.log:time,uptime,level,tags:filecount=5,filesize=16M \
        -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5006 \
        -agentpath:$HOME/Desktop/software/async-profiler-4.0-macos/lib/libasyncProfiler.dylib=start,event=cpu,file=$HIVE_LOG_DIR/hms_profile.html"
fi

if [ "$SERVICE" = "hiveserver2" ]; then
    export HADOOP_HEAPSIZE=2048
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=$HIVE_LOG_DIR \
        -Dhive.log.file=hiveserver2.log -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$HIVE_LOG_DIR \
        -Xlog:gc*=info:file=$HIVE_LOG_DIR/gc-${SERVICE}-%p-%t.log:time,uptime,level,tags:filecount=5,filesize=16M \
        -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5007 \
        -agentpath:$HOME/Desktop/software/async-profiler-4.0-macos/lib/libasyncProfiler.dylib=start,event=cpu,file=$HIVE_LOG_DIR/hs2_profile.html"
fi

