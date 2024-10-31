#!/bin/sh

cd ../repositories
git clone --branch master git@github.com:ivanrmnvch/tg_vpn_shop_backend.git api-gateway
git clone --branch master git@github.com:ivanrmnvch/tg_vpn_shop_bot.git tg-bot
git clone --branch master git@github.com:ivanrmnvch/tg_vpn_server.git xray-manager

