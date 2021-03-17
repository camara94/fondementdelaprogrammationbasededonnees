import pyodbc 
# Some other example server values are
# server = 'localhost\sqlexpress' # for a named instance
# server = 'myserver,port' # to specify an alternate port
server = 'tcp:myserver.database.windows.net' 
database = 'vente' 
username = 'root' 
password = 'root' 
cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+database+';UID='+username+';PWD='+ password)
cursor = cnxn.cursor()

cursor.execute("select Nom, prenom from client")

row = cursor.fetchone()
# pour une ligne
if row:
	print(row)

# Pour parcourir 

for row in cursor.fetchall():
	print(row)

# Pour inserer une ligne
cursor.execute("INSERT client (Nom, Prenom) VALUES('Camara', 'Laby Damaro')")
cursor.commit()