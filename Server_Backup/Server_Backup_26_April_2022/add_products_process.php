<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start 
include('db_connection/inventory_management_db_connect.php');
if(isset($_POST['submit']))
{
$product_name=$_POST['product_name'];
//$product_details=$_POST['product_details'];
//$product_model=$_POST['product_model'];
//$product_type=$_POST['product_type'];
$product_quantity=$_POST['product_quantity'];
//$calculation_unit=$_POST['calculation_unit'];
$current_rate=$_POST['current_rate'];


$product_uid = uniqid();

//$sql="INSERT INTO product_details (product_id, product_name, product_detail, product_model, product_type, quantity, calculation_unit, current_rate, created_by, created_user_company_id) VALUES ('$product_uid','$product_name','$product_details','$product_model','$product_type','$product_quantity','$calculation_unit','$current_rate', '$_SESSION[login_inv_user_email]', '$_SESSION[company_id_for_db_update]')";
$sql="INSERT INTO product_details (product_id, product_name, quantity, current_rate, created_by, created_user_company_id) VALUES ('$product_uid','$product_name','$product_quantity','$current_rate', '$_SESSION[login_inv_user_email]', '$_SESSION[company_id_for_db_update]')";
//echo $sql;
if($conn->query($sql) === TRUE)
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Product addedd successfully..!')</script>";
echo "<script>location.href='add_products.php'</script>";
}	
else
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='add_products.php'</script>";
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