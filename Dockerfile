FROM tomcat:8.0-alpine

#RUN apk get update

#RUN wget https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.tar.gz 
#RUN tar -xvf jdk-19_linux-x64_bin.tar.gz -C /usr/local

#ENV JAVA_HOME /usr/local/jdk-19
#ENV PATH $PATH:$JAVA_HOME/bin


#RUN wget https://www-eu.apache.org/dist//ant/binaries/apache-ant-1.10.12-bin.tar.gz
#RUN tar -xvf apache-ant-1.10.12-bin.tar.gz -C /usr/local
#RUN ln -s /usr/local/apache-ant-1.10.12/ /usr/local/ant  

#ENV ANT_HOME /usr/local/apache-ant-1.10.12
#ENV PATH $PATH:$ANT_HOME/bin



ADD ./src /usr/local/MainWebApplication/src
COPY build.xml /usr/local/MainWebApplication/ 

#WORKDIR /usr/local/MainWebApplication/

#RUN ant

ADD mainwebapp.war /usr/local/tomcat/webapps/

#ENV CATALINA_HOME /usr/local/jdk-19

#WORKDIR /usr/local/tomcat/

EXPOSE 8080
CMD ["catalina.sh","run"]

#docker run -p 8085:8080 webapp:v9

#start the jenkins java -jar jenkins.war --httpPort=9090