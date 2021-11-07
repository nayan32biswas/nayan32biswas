# [Server security](https://christitus.com/secure-web-server/)

## Install UFW

```sh
  sudo apt-get update
  sudo apt-get install ufw
  sudo ufw limit 22/tcp
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  sudo ufw enable
```

## Verify

```sh
	sudo ufw status
```

## Do Global blocks

```sh
	sudo ufw default deny incoming  
	sudo ufw default allow outgoing
```

## Transfer to Server key

Method 1:
```sh
	scp ~/.ssh/id_rsa.pub user@server.com:~
	cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
```

Method 1:
```sh
	ssh-copy-id -i ~/.ssh/id_rsa.pub user@server.com
```

## Secure a Web Server Disabling Password Auth through SSH

Change the following lines in /etc/sshd_config
```sh
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
PermitRootLogin no
```

## Enable security features

Edit /etc/sysctl.conf
```sh
net.ipv4.conf.default.rp_filter=1
net.ipv4.conf.all.rp_filter=1

net.ipv4.conf.all.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0

net.ipv4.conf.all.send_redirects = 0

net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0

net.ipv6.conf.all.log_martians = 1
net.ipv4.conf.all.arp_notify = 1
```

## Change File to mirror below:

Prevent IP Spoof /etc/host.conf
```sh
	order bind,hosts
  multi on
  nospoof on
```

## Install Fail2Ban

```sh
sudo apt install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

## Check Listening Ports

```sh
netstat -tunlp
```
