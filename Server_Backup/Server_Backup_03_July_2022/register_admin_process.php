<?php
include('db_connection/inventory_management_db_connect.php');

if(isset($_POST['submit']))
{
$name=$_POST['name'];
$email=$_POST['email'];
$mobile=$_POST['mobile'];
$password=$_POST['password'];
//$company_name=$_POST['company_name'];
//$company_website=$_POST['company_website'];

$sql="INSERT INTO register_admin (admin_name,admin_mobile,admin_email,admin_password) VALUES ('$name','$mobile','$email','$password')";
//$sql="INSERT INTO register_admin (admin_name,admin_mobile,admin_email,admin_password,admin_company,admin_company_website) VALUES ('$name','$mobile','$email','$password','$company_name','$company_website')";
//echo $sql;
if($conn->query($sql) === TRUE)
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Registration successful..!')</script>";
echo "<script>location.href='index.html'</script>";
}	
else
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='index.html'</script>";
echo "Insert data fail" . $sql . "<br>" . $conn->error;
}
}
?>