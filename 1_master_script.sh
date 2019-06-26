#the list of constituencies that was give, it doesn't contain Torpa and Saraikella, as those were the folders on which I learnt, how to write this code
#declare -a consti=("Baharagora" "Barhait" "Barkagaon" "Bishunpur" "Borio" "Chaibasa" "Chakradharpur" "Dumka" "Dumri" "Gandey" "Ghatsila" "Giridih" "Gomia" "Gumla" "Hatia" "Ichagarh" "Jama" "Jarmundi" "Jugsalai" "Kharasawan" "Khunti" "Littipara" "Lohardaga" "Madhupur" "Maheshpur" "Majhgaon" "Mandu" "Manoharpur" "Nala" "Nirsa" "Pakur" "Potka" "Shikaripara" "Silli" "Sindri" "Sisai" "Tundi" "Torpa" "Saraikella" "Shikaripara_part")
declare -a consti=("Saraikella")
#so for every folder baby, do this
for folder in "${consti[@]}"; do

#taking all the files and scrap the first two and last single page from them and save the new files as given below
  for file in "/home/pdag-admin/Documents/Data/erolls/"$folder/*.pdf; do
    echo "$file"
    page_nb=$(pdfinfo $file | awk '/^Pages/ { print $2 }')

    file_name=$(echo $file | cut -d'.' -f 1)

    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dFirstPage=3 -dLastPage=$(expr $page_nb - 1) -sOutputFile=$file_name"-trimmed.pdf" $file

  done

#using tabula tool to extract particular columns from the pdf
#use this website to leaarn how to do this 
#https://github.com/tabulapdf/tabula-java/wiki/Using-the-command-line-tabula-extractor-tool
#I followed the steps there
  for f in "/home/pdag-admin/Documents/Data/erolls/$folder/"*trimmed.pdf; do
  	#java -jar ~/tabula_target/tabula-1.0.2-jar-with-dependencies.jar -p all -a 108.959,250.644,790.234,330.969 -o $f-rel.csv $f #extracting relative
  	#java -jar ~/tabula_target/tabula-1.0.2-jar-with-dependencies.jar -p all -a 110.447,385.263,790.978,404.6 -o $f-age.csv $f #extracting age
  	#java -jar ~/tabula_target/tabula-1.0.2-jar-with-dependencies.jar -p all -a 108.216,340.638,790.234,372.619 -o $f-gender.csv $f #extracting gender
    java -jar /home/pdag-admin/Downloads/tabula.jar -p all -a 108.076,406.738,796.82,490.41 -o $f-epic.csv $f #extracting epic no

    
  done

  python master_merger.py $folder #the argument passed to the function is $folder, look at the master_merger.py file for the code

  #cat *combined.csv > ~/Documents/ElectoralRollPDFs/completed/$folder-master_combined_data.csv 
  #the command above did not work so I created a new script for this task, the files is named master_concat_script.sh
done
