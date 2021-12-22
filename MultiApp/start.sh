#!/bin/bash
source $NVM_DIR/nvm.sh
cd /app/scripts

echo "Start App12..."
nvm use $APP12_NODE_VERSION
shortversion=$(echo $nodeVersion | cut -d'.' -f 1)
if [ $shortversion != "v12" ]; then
    echo "Should use nodejs v12"
    exit 1;
fi
npm install -g pm2
pm2 start ./app12.config.js

echo "Start App14..."
nvm use $APP14_NODE_VERSION
shortversion=$(echo $nodeVersion | cut -d'.' -f 1)
if [ $shortversion != "v14" ]; then
    echo "Should use nodejs v14"
    exit 1;
fi
pm2 start ./app14.config.js

cat << EOF
Start Web succesfully. Guides:
1. `pm2 log app12` to view log of app12
2. `pm2 log app14` to view log of app14
3. `pm2 list` to show dashboard
Report bugs to: cs.tungthanh@gmail.com
EOF
