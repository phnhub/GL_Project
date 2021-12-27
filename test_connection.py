import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(
      host="localhost",
      database="inse",
      user="Michele",
      password="root"
    )

    print(connection) 

    if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            cursor = connection.cursor()
            cursor.execute("select database();")
            record = cursor.fetchone()
            print("You're connected to database: ", record)

except Error as e:
    print("Error while connecting to MySQL", e)
