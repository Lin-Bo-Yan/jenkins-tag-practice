
例行性工作排程(crontab)
crontab -l
crontab -e


# 每分鐘 去刪除超過7天的檔案檔案
# wells test
* * 1 * * ansible-playbook /home/ci-user/wells_lin/schedule.yaml -e host=test*


-ctime 搜尋 距離當天往前回推  建立的檔案 -ctime 0指的是當天   -ctime 1指的是前一天
find /home/ci-user/wells_lin/docker-compose-nginx-php/release -name "dev-*-*" -ctime 1 -exec rm -rf {} \;

-mtime 搜尋 距離當天往前回推 修改的檔案
find /home/ci-user/wells_lin/docker-compose-nginx-php/release -name "dev-*-*" -mtime 1





我要在跳板機設定排程 每多久就執行playbook，playbook 內容就是去找到檔案刪除他

1. 在 border 設排程
比較好，因為設定排成的動作比較繁瑣，所以我只要設定一次，每多久就執行playbook 去刪除檔案

2. 在 VM 設排程
比較差，VM機器多，就要一台一台設定，只要機器多動作就有可能出錯