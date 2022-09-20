read -p "你確定要clone嗎？(Y/N)" clone
clone=${clone}
if [ "${clone}" == "Y" ] || [ "${clone}" == "y" ]; then
	git clone http://wells_lin:deathlove074@gitlab-pid.vir888.com/wells_lin/docker-compose-nginx-php
	echo -e "clone完畢"
elif [ "${clone}" == "N" ] || [ "${clone}" == "n" ]; then
	echo -e "結束"
	exit 0
fi

read -p "你確定要部署嗎？(Y/N)" deploy
deploy=${deploy}
if [ "${deploy}" == "Y" ] || [ "${deploy}" == "y" ]; then
	ansible test* -m copy -a "src=/home/ci-user/wells_lin/docker-compose-nginx-php dest=/home/ci-user/wells_lin"
	echo -e "部署完畢"
elif [ "${deploy}" == "N" ] || [ "${deploy}" == "n" ]; then
	rm -rf docker-compose-nginx-php
	echo -e "結束"
	exit 0
fi

read -p "你確定要執行嗎？(Y/N)" implement
implement=${implement}
if [ "${implement}" == "Y" ] || [ "${implement}" == "y" ]; then
	ansible test* -m shell -a "docker-compose -f /home/ci-user/wells_lin/docker-compose-nginx-php/docker-compose.yaml up -d"
elif [ "${implement}" == "N" ] || [ "${implement}" == "n" ]; then
	ansible test* -m shell -a "cd /home/ci-user/wells_lin && rm -rf docker-compose-nginx-php"
	rm -rf docker-compose-nginx-php
	echo -e "結束"
	exit 0
fi