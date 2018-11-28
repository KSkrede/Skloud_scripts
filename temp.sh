### Disk temp ###
drives="ada1 ada2"
for drive in $drives
do
    serial="$(smartctl -i /dev/${drive} | grep "Serial Number" )"
	storage="$(smartctl -i /dev/${drive} | grep "User Capacity" )"
    temp="$(smartctl -A /dev/${drive} | grep "Temperature_Celsius")"
    printf "%s \n" "$drive" "$serial" "$storage" "$temp"
	echo ""
done
