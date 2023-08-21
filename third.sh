#!/bin/sh

display_help() {
	echo "How to use: $0 [OPTIONS]"
	echo "create directories and txt files with a personalized message" 
	echo "Options:"
	echo "	-f <<firstname>> 	Your first name"
	echo "	-l <<lastname>> 	Your last name"
	echo "	-c			Capitalize the names"
	echo "	-h			Display this help message" 
	exit 1
}
first_name=""
last_name=""
capitalize=false

while [ $# -gt 0 ]; do 
	case "$1" in 
		-f) 
			first_name="$2"
			shift 2
			;;
		-l)
			last_name="$2"
			shift 2
			;;
		-c)
			capitalize=true
			shift
			;;
		-h) 
			display_help
			;;
		*)
			echo "You have enterd the invalid option: $1"
			display_help
			;;
	esac
done

if [ -z "$first_name" ] || [ -z "$last_name" ]; then 
	echo "Error : Both First and Last name are needed."
	display_help
fi
third_temp_dir="$HOME/third_temp"
mkdir -p "$third_temp_dir"


for i in {1..5}; do
        sub_dir="$third_temp_dir/training_project_$i"
        mkdir -p "$sub_dir"
        echo "The Directory $sub_dir has been created." 
        touch "$sub_dir/module_${i}_a.txt"
        touch "$sub_dir/module_${i}_b.txt"
        echo "The sub Directory module_${i}_a and module _${i}_b has been created in $sub_dir"
	if [ "$capitalize" = true ]; then
		echo "Hello $first_name $last_name Welcome to file $i.A" | tr '[:lower:]' '[:upper:]' > "$sub_dir/module_${i}_a.txt"
		echo "Hello $first_name $last_name Welcome to file $i.B" | tr '[:lower:]' '[:upper:]' > "$sub_dir/module_${i}_b.txt"
	else 
		echo "Hello $first_name $last_name Welcome to file $i.A" >  "$sub_dir/module_${i}_a.txt"
		echo "Hello $first_name $last_name Welcome to file $i.B" > "$sub_dir/module_${i}_b.txt"
	fi

        echo "The welcome message is added to files in $sub_dir" 
done

