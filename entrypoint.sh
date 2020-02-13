#!/bin/sh -l

composer install --prefer-dist

ssh-keyscan

composer run dep deploy production