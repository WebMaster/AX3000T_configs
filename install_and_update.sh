#!/bin/sh

#chmod +x /tmp/install_and_update.sh && /tmp/install_and_update.sh

uci set podkop.main.user_domains_text='myip.com
2ip.ru
whoer.net
lampa.mx
lampishe.cc
'
uci commit podkop
service podkop restart
echo "podkop user domains update successfully"