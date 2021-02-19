#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd 
sudo systemctl enable httpd

/etc/yum.repos.d/r1soft.repo :  [r1soft]
name=R1Soft Repository Server
baseurl=http://repo.r1soft.com/yum/stable/$basearch/
enabled=1
gpgcheck=0 


yum install serverbackup-enterprise -y
yum install r1soft-cdp-enterprise-server
serverbackup-setup --user admin --pass r1soft
/etc/init.d/cdp-server restart
serverbackup-setup --http-port 8080 --https-port 8443
/etc/init.d/cdp-server restart



