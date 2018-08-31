#!/bin/bash

domain=local

#-------------------------------------------------
add_uniq_to_file() {
	file=$1
	shift
	
	if [ ! -e $file ]; then
		sudo touch $file
	fi
	
	if ! sudo grep -Fxq "$@" $file; then
		echo -e "$@" | sudo tee -a $file
	fi
}

del_uniq_in_file() {
	file=$1
	shift
	
	line=$@
	line=$(echo -e "$line" | sed 's/\//\\\//g')
	sudo sed -i "/$line/d" $file
}

replace_uniq_in_file() {
	file=$1
	anchor=$2
	shift
	shift

	# echo -e file=$file
	# echo -e anchor=$anchor
	# echo -e line=$@
	
	lineno=$(grep -m 1 -n "$anchor" "$file" | cut -d ":" -f 1)
	if [[ "$lineno" == "" ]]; then echo -e $anchor not found in $file; return; fi

	cmd="$lineno"d
	# echo -e sudo sed -i -e "$cmd" $file
	sudo sed -i -e "$cmd" $file
	# echo -e done
	
	line=$@
	line=$(echo -e "$line" | sed 's/\//\\\//g')
	cmd="$lineno"i
	
	# echo -e sudo sed -i "$cmd $line" $file
	sudo sed -i "$cmd $line" $file
	# echo -e done
}

#-------------------------------------------------
if [ -z ${1+x} ]; then
	echo -e "new Hostname is needed"
	exit
fi

#-------------------------------------------------
#change hostname

# sudo vi /etc/hostname
echo -e $1 | sudo tee /etc/hostname

# sudo vi /etc/hosts
sudo sed -i "s/$(hostname)/$1/g" /etc/hosts
sudo sed -i "s/sitahome.ddns.org/.$domain/g" /etc/hosts
sudo sed -i "s/.home/.$domain/g" /etc/hosts

# echo -e sudo hostname xxxx
sudo hostname $1

# domain name
replace_uniq_in_file /etc/resolv.conf search "search $domain"


#-------------------------------------------------
#vi /etc/nsswitch.conf
#hosts:          files wins dns
sudo sed -i 's/hosts:          files dns/hosts:          files wins dns/g' /etc/nsswitch.conf
# replace_uniq_in_file /etc/nsswitch.conf hosts: "hosts: files wins dns"

# echo -e remove netbios name setting
del_uniq_in_file /etc/samba/smb.conf "netbios name ="

# echo -e sudo /etc/init.d/samba restart & exit
sudo /etc/init.d/samba restart

#-------------------------------------------------
echo -e Hostname: $(hostname --fqdn)

echo -e Samba: 
nmblookup -A localhost

