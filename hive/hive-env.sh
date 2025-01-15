export HADOOP_HOME=/Users/raghav/Desktop/setup/hadoop
export HIVE_HOME=/Users/raghav/Desktop/setup/hive
export HIVE_CONF_DIR=/Users/raghav/Desktop/setup/hive/conf

# export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.util.concurrent.atomic=ALL-UNNAMED --add-opens java.base/java.util.regex=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.sql/java.sql=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED"


if [ "$SERVICE" = "beeline" ]; then
    export HADOOP_HEAPSIZE=512
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=/tmp/hadoop/hive -Dhive.log.file=beeline.log -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

fi
if [ "$SERVICE" = "metastore" ]; then
    export HADOOP_HEAPSIZE=2048
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=/tmp/hadoop/hive -Dhive.log.file=hivemetastore.log -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5006 -agentpath:/Users/raghav/Desktop/software/async-profiler-3.0-macos/lib/libasyncProfiler.dylib=start,event=cpu,file=/tmp/hadoop/hive/hms_profile.html"
fi

if [ "$SERVICE" = "hiveserver2" ]; then
    export HADOOP_HEAPSIZE=2048
    export HADOOP_CLIENT_OPTS="$HADOOP_CLIENT_OPTS -Djava.io.tmpdir=/tmp -Dhive.log.dir=/tmp/hadoop/hive -Dhive.log.file=hiveserver2.log -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5007 -agentpath:/Users/raghav/Desktop/software/async-profiler-3.0-macos/lib/libasyncProfiler.dylib=start,event=cpu,file=/tmp/hadoop/hive/hs2_profile.html"
fi
