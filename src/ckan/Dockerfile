FROM ckan/ckan-base:2.12.0

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir \
    --editable git+https://github.com/ckan/ckanext-xloader.git@2.6.0#egg=ckanext-xloader \
    --editable git+https://github.com/ckan/ckanext-pages.git#egg=ckanext-pages

COPY --chown=ckan-sys:ckan-sys docker-entrypoint.d/ /docker-entrypoint.d/
COPY --chown=ckan-sys:ckan-sys start_ckan_worker.sh /srv/app/start_ckan_worker.sh
RUN chmod +x /docker-entrypoint.d/10-xloader-token.sh /srv/app/start_ckan_worker.sh

USER ckan
