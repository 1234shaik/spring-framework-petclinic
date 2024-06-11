# # Use the specified base image
# FROM rapidfort/tomcat10-openjdk17-ib

# # Set the working directory in the container
# WORKDIR /usr/local/tomcat/webapps

# # Copy the contents from the local target directory to the container's webapps directory
# COPY spring-framework-petclinic/target/*.war .

# # Expose the default Tomcat port
# EXPOSE 8080

# # Set the entry point to run Tomcat
# ENTRYPOINT ["catalina.sh", "run"]

# FROM ubuntu
# COPY /ProgramData/Jenkins/.jenkins/workspace/spring-pet-frame/target/ /home
# CMD ["BASH"]
