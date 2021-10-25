# create user
adduser --disabled-password --gecos "" ${FTP_USER}
echo "${FTP_USER}:${FTP_PASS}" | chpasswd

service vsftpd start
service vsftpd stop

# start ftp daemon
vsftpd