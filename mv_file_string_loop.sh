ls -ls |awk -F" " '{print $10}'|while read line; do mv $line `echo $line|awk -F "?crc" '{print $1}'`; done
