# this is to test how the network reacts to large amounts of packets.
# in the past due not having limits, if a user did a large number of TCP connections to unique hosts, it could crash the router or cause it to start dropping packets
# this is used to check regression testing
# k6 is not optimized enough to cause these issues

#sudo apt-get -y install git make gcc libpcap-dev
dnf in git make gcc libpcap-devel

git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make -j
cd bin
# target should be an ipv6 range we own to create large numbers of unique host/port combos very quickly
# it should be a range we own to make sure we dont start scanning the public internet which can generate abuse reports and hurt our ip rep
# router-mac-ipv6 can be determined via `ip -6 neigh show dev eth0`
./masscan -p80 2602:f41f:10:3105::1/104 --exclude 255.255.255.255 --max-rate 1000000000000 --router-mac-ipv6 04-3f-72-24-5e-e1
