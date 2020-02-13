#!/bin/sh -l

eval $(ssh-agent -s)

echo "$SSH_PRIVATE_KEY" | tr -d '\r' > /tmp/id_rsa
chmod 600 /tmp/id_rsa
ssh-add /tmp/id_rsa
ssh-keyscan 212.147.34.198 >> ~/.ssh/known_hosts

composer install --prefer-dist

composer run dep deploy production