<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start 
include('db_connection/inventory_management_db_connect.php');
if(isset($_POST['submit']))
{
$product_id=$_POST['product_id'];
$product_quantity=$_POST['product_quantity'];
$current_rate=$_POST['current_rate'];
$mrp=$_POST['mrp'];
$sql = "UPDATE product_pricing SET quantity = '$product_quantity', current_rate = '$current_rate', mrp = '$mrp' WHERE product_pricing_id = '$product_id'";
//echo $sql;
if($conn->query($sql) === TRUE)
{
    echo "<h1>Loading..Please Wait..!</h1>";        
    echo "<script>alert('Data added to inventory successfully..!')</script>";
    echo "<script>location.href='add_to_inventory.php'</script>";
}	
else
{
echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='add_to_inventory.php'</script>";
echo "Insert data fail" . $sql . "<br>" . $conn->error."<br><br><br>";
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