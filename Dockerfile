FROM openjdk:21-jdk
MAINTAINER Alammar
ADD target/spring-observability.jar /spring-observability.jar
ADD target/opentelemetry-javaagent-2.1.0.jar /opentelemetry-javaagent.jar

ENTRYPOINT java -javaagent:/opentelemetry-javaagent.jar \
                -Dotel.traces.exporter=otlp \
                -Dotel.metrics.exporter=otlp \
                -Dotel.logs.exporter=otlp \
                -Dotel.exporter.otlp.endpoint=http://host.docker.internal:4318 \
                -Dotel.service.name=my-service \
                -jar /spring-observability.jar

