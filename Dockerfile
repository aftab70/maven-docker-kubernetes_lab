FROM ubuntu:22.04 
USER root 
RUN apt-get update && apt-get upgrade -y
RUN apt-get install openjdk-11-jdk curl -y
RUN mkdir /opt/tomcat 
WORKDIR /tmp
RUN curl -O -L https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.71/bin/apache-tomcat-9.0.71.tar.gz
RUN tar -xzvf /tmp/apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
CMD ["/opt/tomcat/bin/startup.sh", "run"]
ADD target/*war /opt/tomcat/webapps/
EXPOSE 8080
