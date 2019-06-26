#!/bin/bash
#declare -a consti=("Baharagora" "Barhait" "Barkagaon" "Bishunpur" "Borio" "Chaibasa" "Chakradharpur" "Dumka" "Dumri" "Gandey" "Ghatsila" "Giridih" "Gomia" "Gumla" "Hatia" "Ichagarh" "Jama" "Jarmundi" "Jugsalai" "Kharasawan" "Khunti" "Littipara" "Lohardaga" "Madhupur" "Maheshpur" "Majhgaon" "Mandu" "Manoharpur" "Nala" "Nirsa" "Pakur" "Potka" "Shikaripara" "Silli" "Sindri" "Sisai" "Tundi")
declare -a consti=("Chaibasa")

for folder in "${consti[@]}"; do
  echo "$folder"
  cat /home/pdag-admin/Documents/Data/erolls/$folder/*combined.csv > /home/pdag-admin/Documents/Data/erolls/$folder-master_EPIC_data.csv
done

#although the above code works, there must be a better way instead of declaring arrays, I think listing all the directories and passing the output to a text file can work, 
#more to be pondered over on that
