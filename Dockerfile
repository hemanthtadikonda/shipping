FROM         amazoncorretto:17
RUN          mkdir /app
WORKDIR      /app
COPY         target/shipping-1.0.jar shipping.jar
COPY         run.sh /app/run.sh
ENTRYPOINT   [ "bash", "/app/run.sh" ]

