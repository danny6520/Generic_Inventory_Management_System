<?php
//Database Connection:
//$conn=new mysqli('localhost','root','','inventory_v_two');
$conn=new mysqli('localhost','id19214176_myinventorydatabase','N?c>4pF*zH~7N>d<','id19214176_inventorydatabase');
//$conn=new mysqli('localhost','root','Admin@123#','inventory_v_one');
if($conn->connect_errno)
{
echo $conn->connect_error;
echo "Database not connected";
die();
}
else
{
//echo "Database connected";
}
?>