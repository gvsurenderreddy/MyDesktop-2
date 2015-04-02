#!/bin/ash
# load-balance(N-WAN) Script VER 0.10a-1 for openwrt  by QQ GROUP 120752328

# 1 setup need ipk
opkg update 
opkg update 
! opkg list-installed |grep -q -L kmod-macvlan  >/dev/null 2>&1 &&opkg install kmod-macvlan  >/dev/null 2>&1
opkg install ip iptables iptables-utils  iptables-mod-conntrack iptables-mod-conntrack-extra iptables-mod-ipopt >/dev/null 2>&1
opkg list-installed |grep -q iptables-mod-ipopt &&echo "所有的软件包已经安装完成"
! opkg list-installed |grep -q iptables-mod-ipopt &&echo "软件包已经安装 未 完成 检查网络 请重新执行 sh /tmp/nwan.sh 2 1"
cd /var
cp /var/nwan.tar.gz /
cd /
tar zxvf nwan.tar.gz >/dev/null 2>&1
tar zxvf nwan.tar.gz >/dev/null 2>&1
rm -f /nwan.tar.gz 

# 2 get wan config
echo "start congfig N-WAN....." 
echo "每增加一个WAN口大概需要 7秒种..." 

ifname=$(uci get network.wan.ifname) >/dev/null 2>&1
pppoe_name=$(uci get network.wan.username) >/dev/null 2>&1
pppoe_pw=$(uci get network.wan.password) >/dev/null 2>&1

# 3.2config  rc.local
cd / 
# delete exit 0
sed -i -e '/exit 0/d' /etc/rc.local

#3.1 config file total 5wan
# i从第几个wan口增加到 n 个wan口
i=$1
n=$2

while [ "$i" -le "$n" ]
do


#生成不同的mac
mac1=$(echo "" | awk '{srand(); printf("%X\n", rand()*90+16);}')
sleep 1
mac2=$(echo "" | awk '{srand(); printf("%X\n", rand()*90+16);}')
sleep 1
mac3=$(echo "" | awk '{srand(); printf("%X\n", rand()*90+16);}')
sleep 1
mac4=$(echo "" | awk '{srand(); printf("%X\n", rand()*90+16);}')
sleep 1
mac5=$(echo "" | awk '{srand(); printf("%X\n", rand()*90+16);}')
sleep 1
mac6=$(echo "" | awk '{srand(); printf("%X\n", rand()*90+16);}')
sleep 1
mac=$(echo ${mac1}:${mac2}:${mac3}:${mac4}:${mac5}:${mac6})
# add /etc/rc.local
echo "ip link add link $ifname eth"$i" type macvlan" >> /etc/rc.local
echo "ifconfig eth"$i" hw ether $mac" >> /etc/rc.local
echo "ifconfig eth"$i" up" >> /etc/rc.local
# add /etc/config/network
uci set network.wan${i}=interface >/dev/null 2>&1
uci set network.wan${i}.ifname=eth${i} >/dev/null 2>&1
uci set network.wan${i}.proto=pppoe >/dev/null 2>&1
uci set network.wan${i}.username=$pppoe_name >/dev/null 2>&1
uci set network.wan${i}.password=$pppoe_pw >/dev/null 2>&1
uci set network.wan${i}.defaultroute=0 >/dev/null 2>&1
uci set network.wan${i}.peerdns=1 >/dev/null 2>&1
uci commit network
echo " ">>/etc/config/network

# add /etc/config/nwan
echo " ">>/etc/config/nwan
uci set nwan.wan${i}=interface >/dev/null 2>&1
uci set nwan.wan${i}.route=balance >/dev/null 2>&1
uci set nwan.wan${i}.weight=1 >/dev/null 2>&1
uci set nwan.wan3.uptime=0day,0hour,0min >/dev/null 2>&1
uci commit nwan


# add /etc/config/firewal
fw_wanx=$(uci get firewall.@zone[1].network) >/dev/null 2>&1
uci set firewall.@zone[1].network="$fw_wanx wan${i}" >/dev/null 2>&1
uci commit firewall
echo "wan${i} 配置已经完成"
i=$((i+1))
done
echo "exit 0" >> /etc/rc.local
uci add ucitrack nwan >/dev/null 2>&1
uci set ucitrack.@nwan[0].init=nwan >/dev/null 2>&1
uci commit ucitrack

echo "所有的WAN 配置已经完成 请断电重启路由"
echo "all WAN config finshed please reboot route"




