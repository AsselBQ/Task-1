#!/bin/sh

temp_dir="$HOME/temp"
mkdir -p "$temp_dir"

read -p "Enter your first name : " first_name
read -p "Please Enter your last name : " last_name

for i in {1..5}; do
        sub_dir="$temp_dir/training_project_$i"
        mkdir -p "$sub_dir"
        echo "The Directory $sub_dir has been created." 
        touch "$sub_dir/module_${i}_a.txt"
        touch "$sub_dir/module_${i}_b.txt"
        echo "The sub Directory module_${i}_a and module _${i}_b has been created in $sub_dir"
        echo "Hello $first_name $last_name Welcome to file $i.A" > "$sub_dir/module_${i}_a.txt"
        echo "Hello $first_name $last_name Welcome to file $i.B" > "$sub_dir/module_${i}_b.txt"
        echo "The welcome message is added to files in $sub_dir" 
done


