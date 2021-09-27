#!bin/bash
comm=$(find /home -type f -perm 777 2> /dev/null)

for c in ${comm[@]}
do
echo $c
done
