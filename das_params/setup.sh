#!/bin/sh

echo "this script is intended for server setups and will modify some system files"
echo "you have 10 seconds to exit if you do not want this"
sleep 10

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable --profile minimal -y

# install go
cd /tmp && wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
rm -rf $(HOME)/go && tar -C ~ -xzf /tmp/go1.23.0.linux-amd64.tar.gz
rm /tmp/go1.23.0.linux-amd64.tar.gz

# set arcane properties
echo "fs.nr_open = 10485760" | sudo tee -a /etc/sysctl.conf
echo "fs.file-max = 10485760" | sudo tee -a /etc/sysctl.conf
sudo systemctl set-property user-$UID.slice TasksMax=infinity
echo "vm.max_map_count = 1073741824" | sudo tee -a /etc/sysctl.conf
echo "kernel.pid_max = 4194304" | sudo tee -a /etc/sysctl.conf
echo "kernel.threads-max = 4194304" | sudo tee -a /etc/sysctl.conf

echo "$USER soft nofile 10485760
$USER hard nofile 10485760
$USER soft nproc unlimited
$USER hard nproc unlimited
$USER soft stack unlimited
$USER hard stack unlimited" | sudo tee -a /etc/security/limits.conf

echo "DefaultLimitNOFILE=10485760" | sudo tee -a /etc/systemd/user.conf
echo "DefaultLimitNOFILE=10485760" | sudo tee -a /etc/systemd/system.conf

echo "!!! pls reboot !!!"
