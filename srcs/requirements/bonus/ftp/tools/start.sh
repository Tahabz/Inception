# create user
adduser --disabled-password --gecos "" mobaz
echo "mobaz:pass1" | chpasswd

service vsftpd start
service vsftpd stop

# start ftp daemon
vsftpd