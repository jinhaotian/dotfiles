FROM centos:7
MAINTAINER "Haotian Jin" <jinhaotian@gmail.com>

ENV VERSION 0.2

RUN groupadd -r software && useradd -r -g software -m -d /home/tom8080 tom8080 && yum -y install sudo

ENV SOFTWARE_REPO  http://hjinlivax.corp.rhapsody.com/software

ENV JAVA_FILE jdk-6u45-linux-x64.bin
ENV TOMCAT_FILE apache-tomcat-5.5.36.tar.gz

ENV JAVA_HOME /usr/lib/jvm/java
ENV CATALINA_BASE /var/tom8080
ENV CATALINA_HOME=/var/tomcat5

ENV CATALINA_OPTS_JMX -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.port=8089 -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.password.file=${CATALINA_BASE}/conf/jmxremote.password -Dcom.sun.management.jmxremote.access.file=${CATALINA_BASE}/conf/jmxremote.access

ENV CATALINA_OPTS_GC_CMS="-XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=75 -XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:CMSFullGCsBeforeCompaction=0 -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled"

ENV CATALINA_OPTS_GC -XX:+DisableExplicitGC -XX:+UseParNewGC -Xms6g -Xmx8g -XX:NewSize=250m -XX:MaxNewSize=250m -XX:TargetSurvivorRatio=90 -XX:MaxPermSize=128m -XX:SoftRefLRUPolicyMSPerMB=75 -XX:MaxTenuringThreshold=4

ENV CATALINA_OPTS_JPDA -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8086

ENV CATALINA_OPTS_MISC -d64 -Duser.timezone=America/Los_Angeles

ENV CATALINA_OPTS $CATALINA_OPTS_MISC $CATALINA_OPTS_GC $CATALINA_OPTS_GC_CMS $CATALINA_OPTS_GC_LOG $CATALINA_OPTS_JMX $CATALINA_OPTS_JPDA $CATALINA_OPTS_YJP 

ENV JAVA_VERSION jdk1.6.0_45
ENV TOMCAT_VERSION 5.5.36

ENV JAVA_FILE jdk-6u45-linux-x64.bin
ENV TOMCAT_FILE apache-tomcat-5.5.36.tar.gz

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

CMD ["/var/tomcat5/bin/catalina.sh","run"]



