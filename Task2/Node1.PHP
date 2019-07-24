<?php

$cpuneed= $_GET['cpureqd'];
$memoryneed=$_GET['memoryneed'];
$timeneed=$_GET['timereqd'];
$name=$_GET['allocated_node_name'];
$time=$_GET['starttime'];
$timeneed=$_GET['timereqd'];    

define("DB_HOST", "localhost");
define("DB_USER", "admin");
define("DB_PASSWORD", "qwerty");
define("DB_DATABASE", "mydb1"); 

$con = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_DATABASE);
$sql="UPDATE nodes SET availcpu = '".$cpuavail."'+availcpu,availmemory='".$memoryavail."'+availmemory WHERE Name='".$name."'";
mysqli_select_db($con,DB_DATABASE);
$retvalue = mysqli_query($con,$sql); 
   
if(!$retvalue ) 
{
     die('Could not update data: ' . mysql_error());
}
$conn = mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_DATABASE);
$sql = "SELECT * FROM  requests WHERE allocated_node_name = '".$name."'"; 
mysqli_select_db($conn,DB_DATABASE);
$retval = mysqli_query($conn,$sql);
$row=1;
echo "History: Node1";
echo "<br>";
while($row) 
   {
      $row = mysqli_fetch_array($retval,MYSQL_ASSOC);
      $id=($row['ID']);  
      echo "Requestid: " . $row["id"]."cpuneeded: " . $row["cpureqd"] . "memoryneeded: " . $row["memoryreqd"] ;
      echo "<br>";
   }

mysqli_close($con);
?>
