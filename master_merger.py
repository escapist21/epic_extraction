import pandas as pd
import numpy as np
import os
import sys
from pandas.io.common import EmptyDataError

consti = sys.argv[1]
path = '/home/pdag-admin/Documents/Data/erolls/'+consti+'/'
num_booths = len(os.listdir(path))

def merged_data(i):
	try:
		epic = pd.read_csv(path + str(i) + '-trimmed.pdf-epic.csv',
							header=None, error_bad_lines=False, delim_whitespace=True)
	except EmptyDataError:
		epic = pd.DataFrame()
	'''
	try:
		age = pd.read_csv(path + str(i) + '-trimmed.pdf-age.csv',
        header=None, error_bad_lines=False, delim_whitespace=True)
	except EmptyDataError:
		age = pd.DataFrame()
	try:
		gender = pd.read_csv(path + str(i) + '-trimmed.pdf-gender.csv',
		header=None, error_bad_lines=False, delim_whitespace=True)
	except EmptyDataError:
		gender = pd.DataFrame()'''
	'''try:
		rel = pd.read_csv(path + str(i) + '-trimmed.pdf-rel.csv',
        header=None, error_bad_lines=False, delim_whitespace=True)
	except EmptyDataError:
		rel = pd.DataFrame()'''

	#combined = pd.concat([age, gender, rel, epic], axis=1)
	combined = pd.concat([epic], axis=1)
	combined['block'] = str(i)
	combined.to_csv(path+str(i)+'-combined.csv', header=None, index=None)

for num in range(1,num_booths):

	merged_data(num)
