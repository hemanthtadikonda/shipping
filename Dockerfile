FROM     amazoncorretto:17
RUN      mkdir /app
WORKDIR  /app
COPY     target/shipping-1.0.jar shipping.jar
RUN      java -jar shipping.jar
