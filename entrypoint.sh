#!/bin/sh -l

composer install --prefer-dist

composer run dep deploy production