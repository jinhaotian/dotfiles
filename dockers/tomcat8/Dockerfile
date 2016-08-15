FROM centos:7
MAINTAINER "Haotian Jin" <jinhaotian@gmail.com>

ENV VERSION 0.1

RUN groupadd -r software && useradd -r -g software -m -d /home/tom8080 tom8080 && yum -y install sudo

ENV SOFTWARE_REPO  http://hjinlivax.corp.rhapsody.com/software

ENV JAVA_HOME /usr/lib/jvm/java
ENV CATALINA_BASE /var/tom8080
ENV CATALINA_HOME=/var/tomcat8
ENV CATALINA_OPTS -server -Xms1536m -Xmx1536m -XX:MaxPermSize=256m -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=54321 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false

ENV JAVA_VERSION jdk1.8.0_101
ENV TOMCAT_VERSION 8.5.4

ENV JAVA_FILE jdk-8u101-linux-x64.tar.gz
ENV TOMCAT_FILE apache-tomcat-8.5.4.tar.gz

RUN curl -s $SOFTWARE_REPO/$JAVA_FILE \
    | tar -xzv -C /usr/local/ && \
    curl -s $SOFTWARE_REPO/$TOMCAT_FILE \
    | tar -xzv -C /usr/local/ 


RUN mkdir -p /var/tom8080 &&  mkdir -p /var/tom8080/{bin  conf  logs  temp  webapps  work} && mkdir -p /usr/lib/jvm  \
    && ln -s -T /usr/local/$JAVA_VERSION  $JAVA_HOME && ln -s -T /usr/local/apache-tomcat-$TOMCAT_VERSION $CATALINA_HOME \
    &&  chmod -R 777 /usr/local/apache-tomcat-$TOMCAT_VERSION && chmod -R 777  /usr/local/apache-tomcat-$TOMCAT_VERSION


RUN curl  $SOFTWARE_REPO/tomcat -o tomcat && mv tomcat /etc/init.d/ && chmod +x /etc/init.d/tomcat &&\
    echo "$CATALINA_HOME/bin/catalina.sh run" >/etc/init.d/start_tomcat.sh && chmod +x /etc/init.d/start_tomcat.sh

EXPOSE 8080

CMD ["/var/tomcat8/bin/catalina.sh","run"]



