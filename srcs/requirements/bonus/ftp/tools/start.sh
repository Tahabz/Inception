# create user
adduser --disabled-password --gecos "" user
echo "user:pass1" | chpasswd

# start ftp daemon
vsftpd