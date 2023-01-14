<?php
//Database Connection:
//$conn=new mysqli('localhost','root','','inventory');
$conn=new mysqli('localhost','root','Admin@123#','inventory_v_one');
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