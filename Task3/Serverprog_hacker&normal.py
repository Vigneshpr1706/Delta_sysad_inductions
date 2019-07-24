#VIGNESH 114118068
#SERVER PROGRAM
import socket
import pymysql
import _thread
HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
PORT = 65431       # Port to listen on (non-privileged ports are > 1023)
online=0 # STORES NUMBER OF USERS ONLINE
s=socket.socket(socket.AF_INET, socket.SOCK_STREAM) 
s.bind((HOST,PORT))
s.listen(100)
def server(conn,addr,online):
        mypass=""
        mydb = pymysql.connect(host="localhost",database="mydb1",user="admin",password="qwerty") # CONNECTING TO DATABASE
        mycursor = mydb.cursor()
        data = conn.recv(1024)  # RECIEVING USERNAME THROUGH CONNECTION
        user=data
        mycursor.execute("SELECT password FROM Datauser WHERE username = %s",user.decode('utf-8')) # FETCHING ENCRYPTED PASSWORD FROM TABLE 
        result = mycursor.fetchall()
        for x in result:
          mypass=x[0]
        data =  conn.recv(1024)  #RECIEVING PASSWORD THROUGH CONNECTION
        data=data.decode('utf-8')
        password=data
        # ENCRYPTING PASSWORD ENTERED AND CHECKING WITH DATABASE
        h=""
        for i in password:
           a=ord(i)
           b=ord(i)>>2
           k=a+b
           h=h+chr(k)  #ALGORITHM TO ENCRYPT
        if (h!= mypass):
           conn.sendall(b'0')  # SENDING 0 IF PASSWORD ENTERED IS WRONG
           conn.close()
        else:
           conn.sendall(b'1')  #SENDING 1 IF PASSWORD ENTERED IS RIGHT
           i=0
           print('Connected by', addr)
           online=online+1
           while True:
             data =  conn.recv(1024) # RECIEVING MESSAGE
             if(data):
              if(data.decode('utf-8')!="exit"):  # STORING THE MESSAGE IN DATABASE IF THEY DONT "EXIT"
                if(data.decode('utf-8')!="export"): # IF MESSAGE IS NOT EXPORT
                  i=i+1
                  mydb = pymysql.connect(host="localhost",database="mydb1",user="admin",password="qwerty")
                  mycursor=mydb.cursor()
                  sql = "INSERT INTO Messages(number,username,msg) VALUES(%s,%s,%s)" #INSERTING MESSAGE INTO TABLE
                  mycursor.execute(sql,(int(i),user.decode('utf-8'),data.decode('utf-8')))
                  mydb.commit()
              else:   #IF USER ENTERS EXIT
                break
                online=online-1
        return online
while True:
    online=0
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
      s.bind((HOST,PORT))
      s.listen(100)
      conn,addr = s.accept()  #ACCEPTING CONNECTION
      online=_thread.start_new_thread(server,(conn,addr,online))  # CREATING NEW THREAD FOR EACH CONNECTION
conn.close()
s.close()
