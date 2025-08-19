# Use Tomcat 9 with JDK 17
FROM tomcat:9.0-jdk17

# Remove default webapps (ROOT, docs, examples)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as ROOT.war
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Copy health.jsp directly into ROOT (for Render health checks)
COPY src/main/webapp/health.jsp /usr/local/tomcat/webapps/ROOT/health.jsp

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
