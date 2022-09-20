read -p "你確定要關閉docker？(Y/N)" clone 
clone=${clone}
if [ "${clone}" == "Y" ] || [ "${clone}" == "y" ]; then
	ansible test* -m shell -a "docker-compose -f /home/ci-user/wells_lin/docker-compose-nginx-php/docker-compose.yaml down"
	ansible test* -m shell -a "cd /home/ci-user/wells_lin && rm -rf docker-compose-nginx-php"
	rm -rf docker-compose-nginx-php
	echo -e "docker已關閉"
elif [ "${clone}" == "N" ] || [ "${clone}" == "n" ]; then
	exit 0
fi