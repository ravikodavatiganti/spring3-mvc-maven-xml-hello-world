FROM tomcat:8
COPY target/spring3-mvc-maven-xml-hello-world-1.1.war /usr/local/tomcat/webapps/spring3.war
