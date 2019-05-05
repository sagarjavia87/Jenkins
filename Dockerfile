FROM openjdk
COPY target/*.jar /demo.jar
CMD ["java" , "-jar", "/demo.jar"]
