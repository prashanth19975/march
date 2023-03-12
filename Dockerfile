FROM tomcat:8.0.20-jre
COPY target/Example-41.1-SNAPSHOT*.war  /usr/local/tomcat/webapps/Example-41.1-SNAPSHOT.war

