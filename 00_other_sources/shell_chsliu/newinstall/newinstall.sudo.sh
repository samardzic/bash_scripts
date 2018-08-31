if [ ! "root" = $(whoami) ]; then
	echo -e "only work while been root"
	exit
fi

apt-get install -y sudo

newuser=sita

adduser $newuser

echo -e "$newuser ALL=(ALL) ALL" > /etc/sudoers.d/$newuser
