<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start   
include('db_connection/inventory_management_db_connect.php');




//$sql = "DELETE FROM product_details WHERE product_id='$_SESSION[product_id_for_delete]'";
//$sql = "UPDATE product_details SET status='d' WHERE product_id='$_SESSION[product_id_for_delete]'";
$sql = "UPDATE product_details pd, product_pricing pp SET pd.status='d', PP.status='d' WHERE pd.product_id='$_SESSION[product_id_for_delete]' AND pd.product_id=pp.product_pricing_id";
//echo $sql;
if($conn->query($sql) === TRUE)
  {
    echo "<h1>Loading..Please Wait..!</h1>";
    echo "<script>alert('Product Deleted successfully..!')</script>";
    echo "<script>location.href='add_products.php'</script>";
  }	
  else
  {
    echo "<h1>Loading..Please Wait..!</h1>";
    echo "<script>alert('Error..! Please contact your website admin..!')</script>";
    echo "<script>location.href='add_products.php'</script>";
    echo "Insert data fail" . $sql . "<br>" . $conn->error;
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