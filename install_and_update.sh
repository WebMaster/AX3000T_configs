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
echo "Podkop user domains update successfully"

# Добавляем задание на выполнение скрипта каждый день в 4часа 10минут
#cronTask="*/1 * * * * sh <(wget -q -O - https://raw.githubusercontent.com/WebMaster/AX3000T_configs/refs/heads/main/install_and_update.sh) 2>&1 | tee /root/run.log"
cronTask="10 4 * * * sh <(wget -q -O - https://raw.githubusercontent.com/WebMaster/AX3000T_configs/refs/heads/main/install_and_update.sh) 2>&1 | tee /root/run.log"
#str=$(grep -i "\*\/1 \* \* \* \* sh \<\(wget -q -O - https:\/\/raw\.githubusercontent\.com\/WebMaster\/AX3000T_configs\/refs\/heads\/main\/install_and_update\.sh\) 2\>\&1 \| tee \/root\/run\.log" /etc/crontabs/root)
str=$(grep -i "10 4 \* \* \* sh \<\(wget -q -O - https://raw.githubusercontent.com/WebMaster/AX3000T_configs/refs/heads/main/install_and_update.sh\) 2\>&1 \| tee /root/run.log" /etc/crontabs/root)
if [ -z "$str" ] 
then
    echo "Add cron task auto run script install_and_update.sh"
    echo "$cronTask" >> /etc/crontabs/root
fi

echo "Complete"