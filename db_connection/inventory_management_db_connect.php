<?php
//Database Connection:
$conn=new mysqli('hostname','user_name','password','database_name');

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