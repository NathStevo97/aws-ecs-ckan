FROM python:3.9-slim-bookworm@sha256:e11ce62ece77a134eae605d7c76a2515b65f882d7f6d1fa57096a1dff9b723af

# install dependencies
RUN apt-get -q -y update \
    && DEBIAN_FRONTEND=noninteractive apt-get -q -y upgrade \
    && apt-get -q -y install \
        python3-wheel \
        libpq-dev \
        libmagic-dev \
        libxml2-dev \
        libxslt-dev \
        libgeos-dev \
        libssl-dev \
        libffi-dev \
        postgresql-client \
        build-essential \
        git-core \
        vim \
        wget \
        gettext-base \
        netcat-traditional \
    && apt-get -y autoremove \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade awscli
RUN pip install --upgrade virtualenv


# --- install Poetry & plugin ---
RUN apt-get update && apt-get install -y --no-install-recommends curl \
 && curl -sSL https://install.python-poetry.org | python3 - \
 && ln -s /root/.local/bin/poetry /usr/local/bin/poetry \
 && poetry self add poetry-plugin-export \
 && poetry --version

# --- CKAN environment variables ---
ENV CKAN_HOME=/usr/lib/ckan \
    CKAN_VENV=/usr/lib/ckan/venv \
    CKAN_CONFIG=/etc/ckan \
    CKAN_STORAGE_PATH=/var/lib/ckan \
    CKAN_SRC=/usr/lib/ckan/src

# ckan user account
RUN useradd -r -u 900 -m -c "ckan account" -d $CKAN_HOME -s /bin/false ckan

# --- set up virtualenv and directories ---
RUN mkdir -p $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH \
 && python3 -m venv $CKAN_VENV

# --- clone CKAN source ---
RUN git clone --depth 1 --branch ckan-2.11.3 https://github.com/ckan/ckan.git $CKAN_SRC

# --- copy your Poetry files somewhere safe (not inside CKAN source) ---
COPY pyproject.toml poetry.lock /tmp/

# --- export dependencies using Poetry ---
WORKDIR /tmp
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

# --- install dependencies into CKAN virtualenv ---
RUN $CKAN_VENV/bin/pip install --upgrade pip setuptools wheel \
 && $CKAN_VENV/bin/pip install --no-cache-dir -r requirements.txt

# --- install CKAN itself into the same venv ---
RUN $CKAN_VENV/bin/pip install --no-cache-dir -e $CKAN_SRC

# --- optional CKAN plugins/extensions ---
RUN $CKAN_VENV/bin/pip install --no-cache-dir -e 'git+https://github.com/ckan/ckanext-pages.git#egg=ckanext-pages'

# --- finalize runtime setup ---
RUN ln -s $CKAN_SRC/ckan/config/who.ini $CKAN_CONFIG/who.ini \
 && chown -R ckan:ckan $CKAN_HOME $CKAN_VENV $CKAN_CONFIG $CKAN_STORAGE_PATH

# --- ensure CKAN CLI available globally ---
ENV PATH="$CKAN_VENV/bin:$PATH"

# --- set working dir back to CKAN source ---
WORKDIR $CKAN_SRC

# customize container entrypoint that will configure the application
COPY ckan-entrypoint.sh /ckan-entrypoint.sh
COPY production.ini $CKAN_CONFIG/production.ini.unconfigured
RUN chmod +x /ckan-entrypoint.sh
#RUN cat /ckan-entrypoint.sh | sed '1 s/\r$//' > /ckan-entrypoint.sh
#ENV CKAN_INI=/etc/ckan/production.ini.unconfigured
ENV CKAN_INI=/etc/ckan/production.ini
ENV CKAN_PORT=5000

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD curl -fsS http://localhost:5000/api/action/status_show || exit 1

ENTRYPOINT ["/ckan-entrypoint.sh"]
CMD ["bash", "-c", "ckan run --host 0.0.0.0 --port $CKAN_PORT --threaded"]
