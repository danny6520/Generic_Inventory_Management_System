<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start   
include('db_connection/inventory_management_db_connect.php');
?>

<?php



$db_nxtmnth_customer_id = $_SESSION['ar_nxtmnth_customer_id'];
$db_nxtmnth_customer_name = $_SESSION['ar_nxtmnth_customer_name'];
$db_nxtmnth_product_id = $_SESSION['ar_nxtmnth_product_id'];
$db_nxtmnth_product_name = $_SESSION['ar_nxtmnth_product_name'];
$db_nxtmnth_product_quantity = $_SESSION['ar_nxtmnth_product_quantity'];
$db_nxtmnth_price = $_SESSION['ar_nxtmnth_price'];
$db_nxtmnth_tr_id = $_SESSION['ar_nxtmnth_tr_id'];





//print_r($_SESSION['ar_nxtmnth_price']);
$ar_count = sizeof($_SESSION['ar_nxtmnth_customer_name']);
//echo $ar_count;
for($i = 0; $i < $ar_count; $i++)
{
  $sql2 = "UPDATE transaction_details SET tr_status = 'i' WHERE tr_id = '$db_nxtmnth_tr_id[$i]' AND tr_customer_id = '$db_nxtmnth_customer_id[$i]' AND tr_product_id = '$db_nxtmnth_product_id[$i]' AND tr_product_quantity = '$db_nxtmnth_product_quantity[$i]' AND tr_price = '$db_nxtmnth_price[$i]' AND tr_user_company_id = '$_SESSION[company_id_for_db_update]'";
  $query_run2 = mysqli_query($conn, $sql2);

  $sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_price, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$db_nxtmnth_tr_id[$i]','$db_nxtmnth_customer_id[$i]','$db_nxtmnth_product_id[$i]','$db_nxtmnth_product_quantity[$i]','$db_nxtmnth_price[$i]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','o')";
  $query_run = mysqli_query($conn, $sql);

  

  //echo $sql;
//echo "<br>";

}
if($query_run && $query_run2)
{
  echo "<h1>Loading..Please Wait..!</h1>";
  echo "<script>alert('Month end data transferred successfully..!')</script>";
  echo "<script>location.href='transaction_outbound.php'</script>";
}
else
{
    echo "<h1>Loading..Please Wait..!</h1>";
    echo "<script>alert('Error..! Please contact your website admin..!')</script>";
    echo "<script>location.href='transaction_outbound.php'</script>";
      echo "Insert data fail" . $sql . "<br>" . $conn->error;
}

?>








<?php
//$_SESSION['session_status'] = "failed";
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