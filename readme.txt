Let's begin the story, mate. 

Problem: How to extract the information from seriously shitty un-unicoded files?

Context: I was given the electoral data which contained the demographics data of all the people belonging to a particular booth in all the constituencies.
The task was to extract information related to age, gender, relative_name, and booth number from all. Sounds fairly simple? Had it been, I would not have 
used 3 days, 3 languages, and a couple of people at Stackoverflow. Let me tell you what I did. 

Step 1: Removal of unnecessary pages from the documents. In this, first 2 pages and the last page were useless for my cause. So, I used the bash script for
this task. 

Step 2: Extracting the information about age, gender, and relative's name from the above generated files. I used Java for this. 

Step 3: Combining all the separate files generated in Step 2 to make a booth-wise combined data. I used Python for this. 

Step 4: Concatenating the files generated in Step 3 to make a master_data for all the constituencies. 

Step 5: Handing them over to my Boss. Easiest of all the steps. 

Attached in this repository are files and codes that I used. 

