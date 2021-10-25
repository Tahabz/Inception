# create user
adduser --disabled-password --gecos "" user
echo "user:pass1" | chpasswd

service vsftpd start
service vsftpd stop

# start ftp daemon
vsftpd