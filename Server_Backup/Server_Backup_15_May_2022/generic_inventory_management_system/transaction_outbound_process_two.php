<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start  

include('db_connection/inventory_management_db_connect.php');



for($m = 0; $m < $_SESSION['req_quantity_array_limit']; $m++)
{
  //$outbound_tr_uid = uniqid();
 //$sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_price, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$outbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$price_array_for_db[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','o')";
  //$sql2 = "INSERT INTO transaction_bill (tr_bill_id, tr_bill_customer_id, tr_bill_product_id, tr_bill_outbound_quantity, tr_bill_updated_by, tr_bill_user_company_id) VALUES ('$outbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]')";
  //echo $sql2;
  
  //$query_run2 = mysqli_query($conn, $sql2);

  $sql = $_SESSION['sql_array_session_for_outbound_transaction'][$m];
  $query_run = mysqli_query($conn, $sql);
}
if($query_run)
{
  echo "<h1>Loading..Please Wait..!</h1>";
  echo "<script>alert('Data updated successfully..!')</script>";
  echo "<script>location.href='transaction_outbound.php'</script>";

    
  //$sql2 ="SELECT count(*)as count_for_product_quantity_update FROM outbound_transaction_details WHERE outbound_transaction_id = '$outbound_tr_uid'";  
//echo $sql;
//if($result=$conn->query($sql2))
//{
//if($result->num_rows)
//{
//while($row=$result->fetch_object())
//{

  //$_SESSION['count_product_quantity_update'] = $row->count_for_product_quantity_update;

    //$sql2="UPDATE product_details SET quantity='' WHERE product_id=''";
           // if($conn->query($sql2)==TRUE)
            //{

            //}

//}
//}
//}

$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pd.quantity, pd.product_id FROM transaction_details td, product_details pd WHERE td.tr_id = '$_SESSION[outbound_tr_uid_for_update]' AND td.tr_product_id = pd.product_id";  
//echo $sql;
if($result=$conn->query($sql3))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{

$updated_quantity = $row->quantity - $row->tr_product_quantity;

$sql4="UPDATE product_details SET quantity='$updated_quantity' WHERE product_id='$row->tr_product_id'";
  if($conn->query($sql4)==TRUE)
  {
      echo "Data updated!";
  }


}
}
}

}
else{
  echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='transaction_outbound.php'</script>";
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