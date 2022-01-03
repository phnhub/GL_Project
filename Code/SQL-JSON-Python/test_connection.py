import mysql.connector
from mysql.connector import Error
import json
import sys

try:
    connection = mysql.connector.connect(
      host="localhost",
      database="inse",
      user="Michele",
      password="root"
    )

    print(connection) 
    lista=["SC","S","L","F","P","A"]
    if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            cursor = connection.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("You're connected to database: ", record)
            with open("regions-avec-outre-mer.json","rb",) as f:
                data= json.load(f, encoding="utf-8")
                print(data.keys())
                for j in lista:
                    if(j=="F"):
                        cursor.execute("SELECT code_region,(val_1 + val_2 + val_3+val_4+ val_5) as val_A from  F;")
                    elif(j=="A"):
                        cursor.execute("select code_region,(val_1+val_2+val_3+val_4+val_5+S_val_A+L_val_A+SC_val_A +P_val_A) as val_A  from S natural join F natural join P natural join L natural join SC;")
                    else:
                        cursor.execute("SELECT code_region,"+j+"_val_A FROM poste natural join "+j+";")
                    myresult = cursor.fetchall()
                    for i in range(len(data["features"])):
                        data["features"][i]["properties"]["val_A"]=0
                    for i in range(len(data["features"])):
                        print(data["features"][i]["properties"]["code"])
                        for x in myresult:
                            if(x[0]==data["features"][i]["properties"]["code"]):
                               if(j!="F" and j!="A"):
                                 data["features"][i]["properties"]["val_A"]=float(x[1][0:5].replace(",","."))
                               else:
                                 data["features"][i]["properties"]["val_A"]=float(x[1])
                        with open("data"+j+"_"+str(i)+".json", 'w') as outfile:
                             print("Creating output file:"+"data"+j+"_"+str(i)+".json")
                             json.dump(data["features"][i], outfile)
                             print(data["features"][i]["properties"]["val_A"])
                 
except Error as e:
    print("Error while connecting to MySQL", e)


