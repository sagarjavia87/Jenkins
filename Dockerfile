FROM openjdk:8
COPY target/demo-*.jar /demo.jar
CMD ["java" , "-jar", "/demo.jar"]
