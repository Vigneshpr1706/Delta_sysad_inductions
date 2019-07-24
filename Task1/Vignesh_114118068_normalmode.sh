#114118068 #P.R.Vignesh #deltaSystemAD #normal mode
useradd MasterH        #adding scientists and master scientist
useradd Heisenberg  
useradd Hertz
useradd Holland
for a in {1..20}        #adding interns
do
useradd Heisenberg$a
useradd Hertz$a
useradd Holland$a
done
cd /home  
mkdir MasterH        #creating directories
mkdir Heisenberg
mkdir Hertz
mkdir Holland
for a in {1..20}
do
mkdir Heisenberg-Intern$a
mkdir Hertz-Intern$a
mkdir Holland-Intern$a
done
cd /home/MasterH  #creating files success and failure
touch success
touch failure
cd /home/Heisenberg
touch success
touch failure
cd /home/Hertz
touch success
touch failure
cd /home/Holland
touch success
touch failure
for a in {1..20}
do
cd /home/Heisenberg-Intern$a
touch success
touch failure
cd /home/Hertz-Intern$a
touch success
touch failure
cd /home/Holland-Intern$a
touch success
touch failure
done
groupadd Scient1                #creating groups for scientists with their master user
groupadd Scient2
groupadd Scient3
usermod -a -G Scient1 MasterH    #adding scientists to the group with their master
usermod -a -G Scient1 Heisenberg
usermod -a -G Scient2 MasterH
usermod -a -G Scient2 Hertz
usermod -a -G Scient3 MasterH
usermod -a -G Scient3 Holland
for a in {1..20}                   #creating group for each student with their scientist and master scientist
do
groupadd HeisenIntern$a
usermod -a -G HeisenIntern$a MasterH
usermod -a -G HeisenIntern$a Heisenberg
usermod -a -G HeisenIntern$a Heisenberg$a
groupadd HertzIntern$a
usermod -a -G HertzIntern$a MasterH
usermod -a -G HertzIntern$a Hertz
usermod -a -G HertzIntern$a Hertz$a
groupadd HollandIntern$a
usermod -a -G HollandIntern$a MasterH
usermod -a -G HollandIntern$a Holland
usermod -a -G HollandIntern$a Holland$a
done
chown Heisenberg:Scient1 Heisenberg     #allowing master scientist to access scientist's directory
chown Hertz:Scient2 Hertz
chown Holland:Scient3 Holland
for a in {1..20}
do
chown Heisenberg$a:HeisenbergIntern$a Heisenberg$a    #allowing scientist to access their intern's directory
chown Hertz$a:HertzIntern$a Hertz$a
chown Holland$a:HollandIntern$a Holland$a
done
for a in {1..5}                     #creating 5 folders in scientist's directory
do
cd /home/Heisenberg
mkdir task$a  
chmod 550 task$a
cd /home/Hertz
mkdir task$a
chmod 550 task$a
cd /home/Holland
mkdir task$a
chmod 550 task$a
done
for a in {1..5}                       #creating 50 files in each directory of scientist
do
for b in {1..50}
do
cd /home/Heisenberg/task$a
base64 /dev/urandom | head -c 1024 >Heisenberg_task$b.txt   #filling the text files randomly with 128 random ASCII characters1024 bits
chmod 550 Heisenberg_task$b
cd /home/Hertz/task$a
base64 /dev/urandom | head -c 1024 >Hertz_task$b.txt
chmod 550 Hertz_task$b
cd /home/Holland/task$a
base64 /dev/urandom | head -c 1024 >Holland_task$b.txt
chmod 550 Holland_task$b
done
done 
for a in {1..20}          #creating task directory for each intern
do
cd /home/Heisenberg$a   
mkdir task$a
cd /home/Hertz$a
mkdir task$a
cd /home/Holland$a
mkdir task$a
done
for a in {1..20}
do
cd /home/Heisenberg$a
mkdir task$a
cd /home/Hertz$a
mkdir task$a
cd /home/Holland$a
mkdir task$a
done
umask u-x,g-x,o-w-r-x      #setting no execution permissions as default for files to be created henceforth for the interns 
for a in {1..20}                              #randomly selecting a directory from scientist and randomly selecting 5 files from it to upload in the interns directory
do
DIV=$((4))
R=$(($RANDOM%$DIV))+1
cd /home/Heisenberg/task$R
crontab -e                                                                #scheduling upload at 12 am everyday
00 00 * * * shuf -zn5 -e *.txt | xargs -0 cp -vt /home/Heisenberg$a/task$R 
cd /home/Heisenberg$a/task$R
chown Heisenberg$a:HeisenbergIntern$a task$R
chmod 550 task$R
cd /home/Hertz/task$R
00 00 * * * shuf -zn5 -e *.txt | xargs -0 cp -vt /home/Hertzg$a/task$R
cd /home/Hertz$a/task$R
chown Hertzg$a:HertzIntern$a task$R
chmod 550 task$R
cd /home/Holland/task$R
00 00 * * * shuf -zn5 -e *.txt | xargs -0 cp -vt /home/Holland$a/task$R
cd /home/Holland$a/task$R
chown Holland$a:HollandIntern$a task$R
chmod 550 task$R
done