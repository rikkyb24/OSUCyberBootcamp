#This script will check whether the days in the list given are weekdays or weekends

#!/bin/bash
day=(mon tues wed thurs fri sat sun)

for i in ${day[@]}
do
if [ $i = "sat" ];then
echo "It's the weekend, time to relax!!"
elif [ $i = "sun" ]; then
echo "It's the weekend, time to relax!!"
else 
echo "It's" $i "time to go to work"
fi
done 
