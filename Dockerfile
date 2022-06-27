FROM openjdk:8
#RUN apt-get update
#RUN apt-get install -y maven
#COPY pom.xml /JavaProject/FirstProject/pom.xml
COPY FirstProject-1.0-SNAPSHOT.jar / 
#WORKDIR  /JavaProject/FirstProject
#RUN mvn package
CMD ["java", "-cp", "/FirstProject-1.0-SNAPSHOT.jar", "MavenSample.app.App"]
