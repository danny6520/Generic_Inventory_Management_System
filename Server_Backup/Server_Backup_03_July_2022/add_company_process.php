<?php
session_start();
$login_admin_email_for_session = $_SESSION['login_admin_email'];
if($_SESSION['login_admin_email']=$login_admin_email_for_session)
{
//start 

include('db_connection/inventory_management_db_connect.php');

if(isset($_POST['submit']))
{

$company_name=$_POST['company_name'];
$company_type=$_POST['company_type'];
$company_details=$_POST['company_details'];
$company_head_office=$_POST['company_head_office'];
$company_email=$_POST['company_email'];
$company_website=$_POST['company_website'];

$uid = uniqid();
$company_name_str_opr = substr($company_name,0,4);
$company_uid = $company_name_str_opr.$uid;

$sql="INSERT INTO company_details (company_id,company_name,company_type,company_details,company_head_office,company_email,company_website,created_by) VALUES ('$company_uid','$company_name','$company_type','$company_details','$company_head_office','$company_email','$company_website','$_SESSION[login_admin_email]')";
//echo $sql;
if($conn->query($sql) === TRUE)
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Company addedd successfully..!')</script>";
echo "<script>location.href='add_company.php'</script>";
}	
else
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='add_company.php'</script>";
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