#!/bin/bash

echo -e "Enter Code Server Password: c"
read password
CODE_SERVER_CONFIG_PATH="~/.config/code-server/config.yaml"

curl -fsSL https://code-server.dev/install.sh | sh
cp -f ./code-server-config.yaml $CODE_SERVER_CONFIG_PATH
sed -i "s|\$CODE_SERVER_PASSWORD|$password|g" $CODE_SERVER_CONFIG_PATH
sudo systemctl enable --now code-server@$USER