FROM tomcat:10.1-jdk17

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy your app as ROOT (served at "/")
COPY target/PortfolioProject.war /usr/local/tomcat/webapps/ROOT.war

# Help Render detect the port
EXPOSE 8080

# Start Tomcat in foreground
CMD ["catalina.sh", "run"]
