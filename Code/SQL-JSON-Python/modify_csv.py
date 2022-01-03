import numpy 
import csv
import sys

import csv

# open the file in the write mode

# create the csv writer


# close the file
file = open(sys.argv[1])
csvreader = csv.reader(file)
header = next(csvreader)
with open('laposte.txt', 'w') as f:
    f.write(header[0]+"\n")
rows = []
for row in csvreader:
    if(len(row)>1):
        #print(row[1])
        content=row[0].split(";")
        #rows.append(content[2][1:3])
        rows.append(content[0]+";"+content[1]+";"+content[2][1:3]+";"+content[3]+";"+content[4]+","+row[1])
        with open('laposte.txt', 'a') as f:
            f.write(content[0]+";"+content[1]+";"+content[2][1:3]+";"+content[3]+";"+content[4]+","+row[1]+"\n")
        # write a row to the csv file
print(rows)
file.close()