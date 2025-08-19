FROM tomcat:9.0-jdk17

# Remove default Tomcat apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as ROOT
COPY target/PortfolioProject.war /usr/local/tomcat/webapps/ROOT.war

# Copy health.jsp for Render health checks
COPY src/main/webapp/health.jsp /usr/local/tomcat/webapps/ROOT/health.jsp

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
