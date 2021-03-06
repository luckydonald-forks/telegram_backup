FROM openjdk:8

ENV JAR_VERSION 1.0.5-test.5
ENV JAR_DOWNLOAD_URL https://github.com/fabianonline/telegram_backup/releases/download/${JAR_VERSION}/telegram_backup.jar

RUN apt-get update -y && apt-get install -y curl && \
    curl -L "https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64" -o /bin/dumb-init && \
    curl -L $JAR_DOWNLOAD_URL -o telegram_backup.jar && mkdir /data/ && chmod +x /bin/dumb-init

ENTRYPOINT ["/bin/dumb-init", "--"]

CMD ["java", "-jar", "telegram_backup.jar", "--target", "/data/", "--help"]
