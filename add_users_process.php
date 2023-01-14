<?php
session_start();
$login_admin_email_for_session = $_SESSION['login_admin_email'];
if($_SESSION['login_admin_email']=$login_admin_email_for_session)
{
//start 
include('db_connection/inventory_management_db_connect.php');
if(isset($_POST['submit']))
{
$user_name=$_POST['user_name'];
$user_email=$_POST['user_email'];
$user_password=$_POST['user_password'];
$user_company_id=$_POST['company_name'];
$user_designation=$_POST['user_designation'];
$user_role=$_POST['user_role'];

$user_uid = uniqid();

$sql="INSERT INTO user_details (user_id,user_name,user_email,user_password,user_company_id,user_designation,user_role,user_updated_by) VALUES ('$user_uid','$user_name','$user_email','$user_password','$user_company_id','$user_designation','$user_role','$_SESSION[login_admin_email]')";
//echo $sql;
if($conn->query($sql) === TRUE)
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('User addedd successfully..!')</script>";
echo "<script>location.href='add_users.php'</script>";
}	
else
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='add_users.php'</script>";
echo "Insert data fail" . $sql . "<br>" . $conn->error;
}
}
//end
}
else
{
    echo "<h1>Unauthorized User..!</h1>";
    echo "<h1>Please Login..!</h1>";
    echo "<h1>Redirecting...Please Wait..!</h1>";
    echo "<script> alert('Please Login..!')</script>";
    echo "<script> location.href='index.html'</script>";
}
?>