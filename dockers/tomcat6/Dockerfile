FROM centos:7
MAINTAINER "Haotian Jin" <jinhaotian@gmail.com>

ENV VERSION 0.2

RUN groupadd -r software && useradd -r -g software -m -d /home/tom8080 tom8080 && yum -y install sudo

ENV SOFTWARE_REPO  http://hjinlivax.corp.rhapsody.com/software

ENV JAVA_FILE jdk-6u45-linux-x64.bin
ENV TOMCAT_FILE apache-tomcat-6.0.44.tar.gz

ENV JAVA_HOME /usr/lib/jvm/java
ENV CATALINA_BASE /var/tom8080
ENV CATALINA_HOME=/var/tomcat6

ENV CATALINA_OPTS -server -Xms512m -Xmx1512m -XX:MaxPermSize=150m -XX:+UseConcMarkSweepGC -XX:+DisableExplicitGC -XX:+PrintGC -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCApplicationStoppedTime -XX:+PrintTenuringDistribution -XX:+PrintHeapAtGC -Xloggc:/var/tom8080/logs/gclog.txt

ENV JAVA_VERSION jdk1.6.0_45
ENV TOMCAT_VERSION 6.0.44


RUN  cd /usr/local/ && curl $SOFTWARE_REPO/$JAVA_FILE -o $JAVA_FILE && chmod +x $JAVA_FILE &&  ./$JAVA_FILE  && rm $JAVA_FILE

RUN curl -s $SOFTWARE_REPO/$TOMCAT_FILE \
    | tar -xzv -C /usr/local/ 

RUN mkdir -p /var/tom8080 && \
           mkdir -p /var/tom8080/bin  && \
           mkdir -p /var/tom8080/conf && \
           mkdir -p /var/tom8080/logs && \
           mkdir -p /var/tom8080/temp && \
           mkdir -p /var/tom8080/webapps && \
           mkdir -p /var/tom8080/work
RUN mkdir -p /usr/lib/jvm  \
    && ln -s -T /usr/local/$JAVA_VERSION  $JAVA_HOME && ln -s -T /usr/local/apache-tomcat-$TOMCAT_VERSION $CATALINA_HOME \
    &&  chmod -R 777 /usr/local/apache-tomcat-$TOMCAT_VERSION && chmod -R 777  /usr/local/apache-tomcat-$TOMCAT_VERSION


RUN curl  $SOFTWARE_REPO/tomcat -o tomcat && mv tomcat /etc/init.d/ && chmod +x /etc/init.d/tomcat &&\
    echo "$CATALINA_HOME/bin/catalina.sh run" >/etc/init.d/start_tomcat.sh && chmod +x /etc/init.d/start_tomcat.sh

EXPOSE 8080

CMD ["/var/tomcat6/bin/catalina.sh","run"]



