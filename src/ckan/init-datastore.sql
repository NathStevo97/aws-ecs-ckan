\getenv datastore_password DATASTORE_PASSWORD
CREATE ROLE datastore_ro WITH LOGIN PASSWORD :'datastore_password';
CREATE DATABASE datastore OWNER ckan_default;
