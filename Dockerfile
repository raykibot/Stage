FROM openjdk:17-jdk-slim

WORKDIR /app

COPY App/target/App-1.0.jar /app/App.jar

EXPOSE 9191

ENTRYPOINT ["java", "-jar", "App.jar"]