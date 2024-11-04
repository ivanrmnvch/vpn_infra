#!/bin/sh

# default log files
echo "" > ../logs/xray/access.log
echo "" > ../logs/xray/error.log
echo "" > ../logs/tg-bot/combined.log
echo "" > ../logs/tg-bot/error.log
echo "" > ../logs/tg-bot/transaction.log

# default xray config
echo '{
  "log": {
    "loglevel": "debug",
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "dnsLog": false
  },
  "api": {
    "tag": "api",
    "listen": "127.0.0.1:8080",
    "services": ["HandlerService", "LoggerService", "StatsService", "RoutingService"]
  },
  "routing": {
    "rules": [],
    "domainStrategy": "AsIs"
  },
  "inbounds": [
    {
      "port": 443,
      "protocol": "vless",
      "tag": "vless_tls",
      "settings": {
        "clients": [
          {
            "id": "f3a7efcc-2aa1-4eb7-bd16-bdb5c3153ba4",
            "email": "test@test.com",
            "flow": "xtls-rprx-vision"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "tcp",
        "security": "reality",
    "realitySettings": {
      "show": false,
      "dest": "www.microsoft.com:443",
      "xver": 0,
      "serverNames": [
        "www.microsoft.com"
      ],
      "privateKey": "OLuCQ6jSumfdjfRNFUj5VmyObEshi3dgMz1tUT66qCg",
      "minClientVer": "",
      "maxClientVer": "",
      "maxTimeDiff": 0,
      "shortIds": [
        "bf4ce2edf5e4ab61"
      ]
    }
      },
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "tag": "block"
    }
  ],
  "stats": {},
  "policy": {
    "levels": {
      "0": {
        "statsInboundUplink": true,
          "statsInboundDownlink": true,
          "statsOutboundUplink": true,
          "statsOutboundDownlink": true
      }
    }
  }
}' > ../config/xray/config.json
