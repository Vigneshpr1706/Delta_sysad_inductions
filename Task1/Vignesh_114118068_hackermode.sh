useradd MasterH   #creating users
useradd Heisenberg
useradd Hertz
useradd Holland
for a in {1..20}  
do
useradd Heisenberg-Intern$a
useradd Hertz-Intern$a
useradd Holland-Intern$a
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
cd /home/ubuntu/Downloads   #accessing logs file
inp=server_logs.txt
while read line
do
t1=$( echo "$line" |cut -d" " -f1)    #cutting lines using delimiter space
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
y1=$( echo "$t2" |cut -d"-" -f1)       #cutting using '-' 
y2=$( echo "$t4" |cut -d"-" -f1)
y3=$( echo "$t2" |cut -d"-" -f2)
y4=$( echo "$t4" |cut -d"-" -f2)
if [ "$t2" == "MasterH" ] || [  "$t2" == "$t4" ]
then
t=1
elif [ "$y1" == "$y2" ] && [ "$y3" == NULL ]
then
t=1
else
t=0
fi
cd /home/$t4
if(( $t==1 ))
then 
echo "$line" >> success      #storing success attempts in success file in user's home directory
else
echo "$line" >> failure      #storing failure attempts in failure file in user's home directory
fi
done < ${inp}
i=0
j=0
cd /home/MasterH
echo "MasterH"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/MasterH
fl=failure
echo "Failures: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k" 
##Heisenberg
i=0
j=0
cd /home/Heisenberg
echo "Heisenberg"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/Heisenberg
fl=failure
echo "Failure: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k"
##Hertz
i=0
j=0
cd /home/Hertz
echo "Hertz"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/Hertz
fl=failure
echo "Failure: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k"
##Holland
i=0
j=0
cd /home/Holland
echo "Holland"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/Holland
fl=failure
echo "Failure: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k"
##Heisenberg-Interns
for a in {1..20}
do
i=0
j=0
cd /home/Heisenberg-Intern$a
echo "Heisenberg-Intern$a"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/Heisenberg-Intern$a
fl=failure
echo "Failure: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k"
done
##Hertz-Interns
for a in {1..20}
i=0
j=0
cd /home/Hertz-Intern$a
echo "Hertz-Intern$a"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/Hertz-Intern$a
fl=failure
echo "Failure: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k"
done
##Holland-Interns
for a in {1..20}
i=0
j=0
cd /home/Holland-Intern$a
echo "Holland-Intern$a"
fl=success
echo "Success: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
i=$((i+1))
echo "$t1 : $t2"
done < ${fl}
cd /home/Holland-Intern$a
fl=failure
echo "Failure: "
while read line
do
t1=$( echo "$line" |cut -d" " -f1)
t2=$( echo "$line" |cut -d" " -f2)
t3=$( echo "$line" |cut -d" " -f3)
t4=$( echo "$line" |cut -d" " -f4)
j=$((j+1))
echo "$t1 : $t2"
done < ${fl}
echo "Success: $i"
echo "Failure: $j"
k=$(($i+$j))
echo "Total hits: $k"
done
