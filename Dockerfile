FROM flokkr/base:26
ARG URL
ENV CONF_DIR /opt/spark/conf
WORKDIR /opt
RUN wget $URL -O spark.tar.gz && tar zxf spark.tar.gz && rm spark.tar.gz && mv spark* spark
WORKDIR /opt/spark
ENV HADOOP_CONF_DIR=/opt/spark/conf
ENV PATH $PATH:/opt/spark/bin
