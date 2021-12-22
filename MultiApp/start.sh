#!/bin/bash
source $NVM_DIR/nvm.sh
cd /app/scripts

echo Start App12...
nvm use $APP12_NODE_VERSION
npm install -g pm2
pm2 start ./app12.config.js

echo Start App14...
nvm use $APP14_NODE_VERSION
pm2 start ./app14.config.js
