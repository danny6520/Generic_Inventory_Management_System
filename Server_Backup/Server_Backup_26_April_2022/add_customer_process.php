<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start 

include('db_connection/inventory_management_db_connect.php');

if(isset($_POST['submit']))
{

$customer_name=$_POST['customer_name'];
//$customer_type=$_POST['customer_type'];
//$customer_details=$_POST['customer_details'];
//$customer_head_office=$_POST['customer_head_office'];
$customer_email=$_POST['customer_email'];
//$customer_website=$_POST['customer_website'];
$customer_mobile=$_POST['customer_mobile'];
$uid = uniqid();
$customer_name_str_opr = substr($customer_name,0,4);
$customer_uid = $customer_name_str_opr.$uid;

//$sql="INSERT INTO customer_details (customer_id,customer_name,customer_type,customer_details,customer_head_office,customer_email,customer_website,created_by,created_user_company_id) VALUES ('$customer_uid','$customer_name','$customer_type','$customer_details','$customer_head_office','$customer_email','$customer_website','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]')";
$sql="INSERT INTO customer_details (customer_id,customer_name,customer_email,customer_mobile,created_by,created_user_company_id) VALUES ('$customer_uid','$customer_name','$customer_email','$customer_mobile','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]')";
//echo $sql;
if($conn->query($sql) === TRUE)
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Customer addedd successfully..!')</script>";
echo "<script>location.href='add_customer.php'</script>";
}	
else
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='add_customer.php'</script>";
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
    echo "<script> location.href='inventory_login.html'</script>";
}
?>