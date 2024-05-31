 #!/usr/bin/bash
touch storage.txt
touch storage.csv
touch updatedstorage.csv
dateinfo=$(date)
echo $dateinfo
df -m | grep t | cat> storage.txt
awk '{OFS=","};NR>1 {print $1,$2,$3,$4,$5,$NF}' storage.txt > storage.csv
awk -v data="$dateinfo" -F"," 'BEGIN{OFS = ","}{$7=data; print}' storage.csv > updatedstorage.csv
touch sysname.txt
touch overallstorage.txt
touch amountused.txt
touch amountavailabe.txt
touch usage.txt
touch location.txt
touch date.txt
awk 'NR>1 {print $1}' storage.txt > sysname.txt
awk 'NR>1 {print $2}' storage.txt > overallstorage.txt
awk 'NR>1 {print $3}' storage.txt > amountused.txt
awk 'NR>1 {print $4}' storage.txt > amountavailable.txt
awk 'NR>1 {print $5}' storage.txt > usage.txt
awk 'NR>1 {print $6}' storage.txt > location.txt
awk -F"," 'NR>1 {print $7}' updatedstorage.csv > date.txt
python3 newpylink.txt

