#!/usr/bin/env bash
set -Eeo pipefail

CONFIG_TEMPLATE_PATH="/usr/share/mhserveremu/Config.ini.template"
CONFIG_OUTPUT_PATH="/usr/share/mhserveremu/Config.ini"

FRONTEND_BIND_IP=${FRONTEND_BIND_IP:="127.0.0.1"}
FRONTEND_PORT=${FRONTEND_PORT:="4306"}
FRONTEND_PUBLIC_ADDRESS=${FRONTEND_PUBLIC_ADDRESS:="127.0.0.1"}
AUTH_ADDRESS=${AUTH_ADDRESS:="localhost"}
AUTH_PORT=${AUTH_PORT:="8080"}
NEWS_URL=${NEWS_URL:="http://localhost/news"}
USE_JSON_DB_MANAGER=${USE_JSON_DB_MANAGER:="false"}
DB_MANAGER_BACKEND=${DB_MANAGER_BACKEND:="sqlite"}
MAX_BACKUP_NUMBER=${MAX_BACKUP_NUMBER:="5"}
BACKUP_INTERVAL_MINUTES=${BACKUP_INTERVAL_MINUTES:="15"}
POSTGRESQL_HOST=${POSTGRESQL_HOST:="localhost"}
POSTGRESQL_PORT=${POSTGRESQL_PORT:="5432"}
POSTGRESQL_DATABASE=${POSTGRESQL_DATABASE:="mhserveremu"}
POSTGRESQL_USER=${POSTGRESQL_USER:="mhserveremu"}
POSTGRESQL_PASSWORD=${POSTGRESQL_PASSWORD:="mhserveremu"}
LOAD_ALL_PROTOTYPES=${LOAD_ALL_PROTOTYPES:="false"}
USE_EQUIPMENT_SLOT_TABLE_CACHE=${USE_EQUIPMENT_SLOT_TABLE_CACHE:="false"}
STORE_HOME_PAGE_URL=${STORE_HOME_PAGE_URL:="http://localhost/store"}
STORE_HOME_BANNER_PAGE_URL=${STORE_HOME_BANNER_PAGE_URL:="http://localhost/store/images/banner.png"}
STORE_HEROES_BANNER_PAGE_URL=${STORE_HEROES_BANNER_PAGE_URL:="http://localhost/store/images/banner.png"}
STORE_COSTUMES_BANNER_PAGE_URL=${STORE_COSTUMES_BANNER_PAGE_URL:="http://localhost/store/images/banner.png"}
STORE_BOOSTS_BANNER_PAGE_URL=${STORE_BOOSTS_BANNER_PAGE_URL:="http://localhost/store/images/banner.png"}
STORE_CHESTS_BANNER_PAGE_URL=${STORE_CHESTS_BANNER_PAGE_URL:="http://localhost/store/images/banner.png"}
STORE_SPECIALS_BANNER_PAGE_URL=${STORE_SPECIALS_BANNER_PAGE_URL:="http://localhost/store/images/banner.png"}
STORE_REAL_MONEY_URL=${STORE_REAL_MONEY_URL:="http://localhost/store/gs-bundles.html"}

populate_template() {
    sed -i \
        -e "s/%%FRONTEND_BIND_IP%%/${FRONTEND_BIND_IP}/g" \
        -e "s/%%FRONTEND_PORT%%/${FRONTEND_PORT}/g" \
        -e "s/%%FRONTEND_PUBLIC_ADDRESS%%/${FRONTEND_PUBLIC_ADDRESS}/g" \
        -e "s/%%AUTH_ADDRESS%%/${AUTH_ADDRESS}/g" \
        -e "s/%%AUTH_PORT%%/${AUTH_PORT}/g" \
        -e "s,%%NEWS_URL%%,${NEWS_URL},g" \
        -e "s/%%USE_JSON_DB_MANAGER%%/${USE_JSON_DB_MANAGER}/g" \
        -e "s/%%DB_MANAGER_BACKEND%%/${DB_MANAGER_BACKEND}/g" \
        -e "s/%%MAX_BACKUP_NUMBER%%/${MAX_BACKUP_NUMBER}/g" \
        -e "s/%%BACKUP_INTERVAL_MINUTES%%/${BACKUP_INTERVAL_MINUTES}/g" \
        -e "s/%%POSTGRESQL_HOST%%/${POSTGRESQL_HOST}/g" \
        -e "s/%%POSTGRESQL_PORT%%/${POSTGRESQL_PORT}/g" \
        -e "s/%%POSTGRESQL_DATABASE%%/${POSTGRESQL_DATABASE}/g" \
        -e "s/%%POSTGRESQL_USER%%/${POSTGRESQL_USER}/g" \
        -e "s/%%POSTGRESQL_PASSWORD%%/${POSTGRESQL_PASSWORD}/g" \
        -e "s/%%LOAD_ALL_PROTOTYPES%%/${LOAD_ALL_PROTOTYPES}/g" \
        -e "s/%%USE_EQUIPMENT_SLOT_TABLE_CACHE%%/${USE_EQUIPMENT_SLOT_TABLE_CACHE}/g" \
        -e "s,%%STORE_HOME_PAGE_URL%%,${STORE_HOME_PAGE_URL},g" \
        -e "s,%%STORE_HOME_BANNER_PAGE_URL%%,${STORE_HOME_BANNER_PAGE_URL},g" \
        -e "s,%%STORE_HEROES_BANNER_PAGE_URL%%,${STORE_HEROES_BANNER_PAGE_URL},g" \
        -e "s,%%STORE_COSTUMES_BANNER_PAGE_URL%%,${STORE_COSTUMES_BANNER_PAGE_URL},g" \
        -e "s,%%STORE_BOOSTS_BANNER_PAGE_URL%%,${STORE_BOOSTS_BANNER_PAGE_URL},g" \
        -e "s,%%STORE_CHESTS_BANNER_PAGE_URL%%,${STORE_CHESTS_BANNER_PAGE_URL},g" \
        -e "s,%%STORE_SPECIALS_BANNER_PAGE_URL%%,${STORE_SPECIALS_BANNER_PAGE_URL},g" \
        -e "s,%%STORE_REAL_MONEY_URL%%,${STORE_REAL_MONEY_URL},g" \
        "$CONFIG_OUTPUT_PATH"
}

cp "$CONFIG_TEMPLATE_PATH" "$CONFIG_OUTPUT_PATH"
populate_template
exec "$@"