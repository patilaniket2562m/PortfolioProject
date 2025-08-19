FROM tomcat:10.1-jdk17

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file
COPY target/PortfolioProject.war /usr/local/tomcat/webapps/ROOT.war

# Explicitly expose the HTTP port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
