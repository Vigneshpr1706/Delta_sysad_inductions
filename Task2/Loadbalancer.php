<?php

$cpuneed= $_REQUEST['cpureqd'];
$memoryneed=$_REQUEST['memoryneed'];
$timeneed=$_REQUEST['timereqd'];   
define("DB_HOST", "localhost");
define("DB_USER", "admin");
define("DB_PASSWORD", "qwerty");
define("DB_DATABASE", "mydb1");

$conn = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_DATABASE);
$sql = 'SELECT Name,availmemory,availcpu FROM nodes';
mysqli_select_db($conn,DB_DATABASE);
$retval = mysqli_query($conn,$sql);   
   if(!$retval ) 
   {
      die('Could not get data: ' . mysql_error());
   }
   $name="none";
   $row=1;
   while($row) 
   {
      $row = mysqli_fetch_array($retval,MYSQL_ASSOC);
      $max=0;
      if(($row['availmemory']>$memoryneed && $row['availcpu']>$cpuneed))
      {
         if($max<($row['availmemory']-$memoryneed+$row['availcpu']-$cpuneed))
         {
           $max=($row['availmemory']-$memoryneed+$row['availcpu']-$cpuneed);
           $name=$row['Name'];
           $memoryavail=$row['availmemory']-$memoryneed;
           $cpuavail=$row['availcpu']-$cpuneed;
         }
      }
   }
   if($name=="none")
   {
      echo "server busy";
   }
   else 
   {     
        $con = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_DATABASE);
        $sql="UPDATE nodes SET availcpu = '".$cpuavail."',availmemory='".$memoryavail."' WHERE Name='".$name."'";
        mysqli_select_db($con,DB_DATABASE);
        $retvalue = mysqli_query($con,$sql);    
         if(!$retvalue ) 
            {
               die('Could not update data: ' . mysql_error());
            }
            mysqli_close($con);
   }
if($name!="none")
{
   $con = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_DATABASE);
   $sql = "INSERT INTO requests(ID,allocated_node_name,starttime,cpureqd,memoryreqd,timereqd)" . "VALUES( '".$id."','".$name."','".$time."','".$cpuneed."','".$memoryneed."','".$timeneed."')";
   mysqli_select_db($con,DB_DATABASE);
   $retval = mysqli_query($conn,$sql);   
   if(!$retval ) 
   {
      die("no data" . mysql_error());
   }
}
if($name=="NODE1"){
echo '<a href="http://localhost/test/Node1.php?ID=$id&&allocated_node_name=NODE1&&starttime=$time&&cpureqd=$cpuneed,memoryreqd=$memoryneed&&timereqd=timeneed">CLICK TO PROCEED</a>';
}
if($name=="NODE2"){
echo '<a href="http://localhost/test/Node2.php?ID=$id&&allocated_node_name=NODE2&&starttime=$time&&cpureqd=$cpuneed,memoryreqd=$memoryneed&&timereqd=timeneed">CLICK TO PROCEED</a>';
}
if($name=="NODE3"){
echo '<a href="http://localhost/test/Node3.php?ID=$id&&allocated_node_name=NODE3&&starttime=$time&&cpureqd=$cpuneed,memoryreqd=$memoryneed&&timereqd=timeneed">CLICK TO PROCEED</a>';
}
if($name=="NODE4"){
echo '<a href="http://localhost/test/Node4.php?ID=$id&&allocated_node_name=NODE4&&starttime=$time&&cpureqd=$cpuneed,memoryreqd=$memoryneed&&timereqd=timeneed">CLICK TO PROCEED</a>';
}
?>