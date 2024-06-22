export JAVA_HOME=$JAVA_HOME

export HADOOP_HOME=/Users/raghav/Desktop/setup/hadoop
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME

export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

export TEZ_JARS=/Users/raghav/Desktop/setup/tez
export TEZ_CONF_DIR=/Users/raghav/Desktop/setup/tez/conf
export HADOOP_CLASSPATH=${TEZ_CONF_DIR}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*:$HADOOP_CLASSPATH

# export HADOOP_HEAPSIZE_MAX=1024
