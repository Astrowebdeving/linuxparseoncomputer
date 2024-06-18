 #!/usr/bin/bash
touch storage3.txt
touch storage3.csv
touch updatedstorage3.csv
dateinfo=$(date)
echo $dateinfo
top -n 1 | sed -n '/PID/,$p' | grep -v top | grep s |  cat > storage3.txt
awk '{OFS=","};NR>1 {print $1,$2,$3,$9,$10,$13}' storage3.txt > storage3.csv
awk -v data="$dateinfo" -F"," 'BEGIN{OFS = ","}{$7=data; print}' storage3.csv > updatedstorage3.csv
touch sPID.txt
touch userfound.txt
touch PRstoring.txt
touch cpupercentage.txt
touch mempercentage.txt
touch location3.txt
touch date3.txt
awk 'NR>1 {print $1}' storage3.txt > sPID.txt
awk 'NR>1 {print $2}' storage3.txt > userfound.txt
awk 'NR>1 {print $3}' storage3.txt > PRstoring.txt
awk 'NR>1 {print $4}' storage3.txt > cpupercentage.txt
awk 'NR>1 {print $5}' storage3.txt > mempercentage.txt
awk 'NR>1 {print $6}' storage3.txt > location3.txt
awk -F"," 'NR>1 {print $7}' updatedstorage3.csv > date3.txt
cat updatedstorage3.csv

