#!/bin/sh -l

composer install --prefer-dist

ssh-keyscan $1 >> ~/.ssh/known_hosts

composer run dep deploy production