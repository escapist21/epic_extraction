import pandas as pd
import re
import numpy as np

ac_list = ['Baghmara', 'Baharagora', 'Barhait', 'Barkagaon', 'Bermo',
           'Bishunpur', 'Borio', 'Chaibasa', 'Chakradharpur', 'Dumka',
           'Dumri', 'Gandey', 'Ghatshila', 'Giridih', 'Gomia',
           'Gumla', 'Hatia', 'Ichagarh', 'Jama', 'Jamshedpur East',
           'Jamshedpur West', 'Jamtara', 'Jarmundi', 'Jugsalai', 'Kharasawan',
           'Khunti', 'Kolebira', 'Littipara', 'Lohardaga', 'Madhupur',
           'Maheshpur', 'Majhgaon', 'Mandar', 'Mandu', 'Manoharpur',
           'Nala', 'Nirsa', 'Pakur', 'Potka', 'Rajmahal', 'Saraikella',
           'Sarath', 'Shikaripara', 'Silli', 'Sindri', 'Sisai',
           'Torpa', 'Tundi']

def epic_cleaner():
    ac_name = input("Enter name of constituency: ")
    try:
        if ac_name.title() in ac_list:
            file_name = ac_name.title()+'-master_EPIC_data.csv'
            df = pd.read_csv(file_name,header = None, name=['epics', 'booth_no'])
            print("Initial no of records: {}".format(df.shape[0]))
            print('Removing unwanted characters from EPIC nos if any...')
            print('-'*80)

            epics = [re.sub(r"(-)+", "", str(x)) for x in df['epics']]
            epics = np.asarray(epics)

            print('Unwanted characters removed')
            print('Now dropping duplicates from the dataframe...')

            df.drop_duplicates(subset='epics', keep='first', inplace=True)
            df.reset_index(inplace=True)

            print('No of records in clean dataframe: {}'.format(df.shape[0]))

            df_final = pd.DataFrame(epics)
            df_final.to_csv('{}_cleaned_epics.csv'.format(ac_name))
    except:
        print('sorry! constituency name not found')


def main():
    epic_cleaner()

if __name__ == "__main__":
        main()