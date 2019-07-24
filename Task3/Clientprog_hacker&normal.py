#VIGNESH 114118068
#CLIENT PROG
import socket
import pymysql
import array
#CONNECTING TO SOCKET
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('127.0.0.1', 65431))
#ASKING IF IT IS NEW USER
opt=input("If new user enter n or else enter any key")
if(opt=='n'):
   user=input("Create username: ")
   mpass=input("Create password: ")
   mypass=""
   #ENCRYPTING PASSWORD AND STORING IN PASSWORD TABLE
   for i in mpass:
     a=ord(i)
     b=ord(i)>>2
     k=a+b
     mypass=mypass+chr(k)
   mydb = pymysql.connect(host="localhost",database="mydb1",user="admin",password="qwerty")
   mycursor = mydb.cursor()
   mycursor.execute("INSERT INTO Datauser(username,password) VALUES(%s,%s)",(user,mypass))  #INSERTING NEW USERNAME AND PASSWORD
   mydb.commit()
   s.close()
else:    #IF IT IS AN OLD USER SIGNING IN
  user=input("Enter username: ")
  data=user
  user= user.encode('utf-8')
  s.send(user)  #SENDING USERNAME
  password=input("Enter password: ")
  password=password.encode('utf-8')
  s.send(password)  #SENDING PASSWORD
  u=s.recv(1024)
  if(u.decode('utf-8')=="0"):  #IF PASSWORD ENTERED IS WRONG
     print("Access denied")
     s.close()
  else:
     i=0 
     k=0
     h=0
     while True:   
        mydb = pymysql.connect(host="localhost",database="mydb1",user="admin",password="qwerty")
        sql = "SELECT number,username,msg FROM Messages WHERE number > %s"
        mycursor=mydb.cursor()
        mycursor.execute(sql,(int(h)))
        result=mycursor.fetchall()
        for row in result:
           h=row[0]
           print("%s  : %s" %(row[1],row[2]))
        msg=input("Enter your message: ")
        s.send(msg.encode('utf-8'))
        i=i+1
        if(msg=="exit"):
          break
        if(msg=="export"):  #EXPORTING ALL MESSAGES TO A TEXT FILE
           file1=open("Chatfile.txt","w+")
           dbconn = pymysql.connect(host="localhost",database="mydb1",user="admin",password="qwerty")
           sql = "SELECT username,msg FROM Messages"
           mycursor=dbconn.cursor()
           mycursor.execute(sql)
           result=mycursor.fetchall()
           for row in result:
              file1.write("%s : %s \n" % (row[0],row[1]))
s.close()