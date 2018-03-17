#!/usr/bin/env bash
if [ -f "/opt/hadoop/bin/oz" ]; then
   export HADOOP_SHELL_PROFILES=ozone
fi
if [ -f "/opt/hadoop/bin/hadoop" ]; then
   export SPARK_DIST_CLASSPATH=$(/opt/hadoop/bin/hadoop classpath)
fi
$@
