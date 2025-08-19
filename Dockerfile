# Use Tomcat base image with Java 17
FROM tomcat:9.0-jdk17

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR into Tomcat as ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
