# Use Tomcat 10.1 on JDK 17
FROM tomcat:10.1-jdk17

# (Optional) remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR and deploy it as ROOT (served at "/")
COPY target/PortfolioProject.war /usr/local/tomcat/webapps/ROOT.war

# (Optional) basic container health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=40s --retries=3 \
  CMD wget -qO- http://localhost:8080/ || exit 1
