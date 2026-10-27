FROM solr:9.10.1-slim@sha256:c6c1d061d56dd9ff1cf14ddd5ff8ef634b198d7e58e24cbfda3fb0ee041f7d10

EXPOSE 8983

ENV SOLR_CONFIG_DIR="/opt/solr/server/solr/configsets"
ENV SOLR_SCHEMA_FILE="$SOLR_CONFIG_DIR/ckan/conf/managed-schema"

USER root

RUN cd /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/ && \
    rm -f netty-handler-*.jar && \
    wget https://repo1.maven.org/maven2/io/netty/netty-handler/4.1.118.Final/netty-handler-4.1.118.Final.jar

RUN cp -R $SOLR_CONFIG_DIR/_default $SOLR_CONFIG_DIR/ckan

ADD https://raw.githubusercontent.com/ckan/ckan/ckan-2.12.0/ckan/config/solr/schema.xml $SOLR_SCHEMA_FILE
RUN chmod 644 $SOLR_SCHEMA_FILE

USER solr

CMD ["sh", "-c", "solr-precreate ckan $SOLR_CONFIG_DIR/ckan"]
