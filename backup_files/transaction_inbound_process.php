<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start   


include('db_connection/inventory_management_db_connect.php');
if(isset($_POST['submit']))
{
    $customer_id=$_POST['customer_id'];
    $product_id=$_POST['product_id'];
    $req_quantity=$_POST['req_quantity'];

    $product_id_array = array();
    $quantity_array = array();

    //echo "Customer ID: $customer_id";
    //echo "<br>";
    //echo "Product ID: $product_id";
    //echo "<br>";
   // echo "Required Quantity: $req_quantity";
    //echo "<br>";


    $product_id_count = count($product_id);
    $_SESSION['product_id_array_limit'] = $product_id_count;
    //echo "Product id count disp ".$_SESSION['product_id_array_limit'];
       // echo("<p>You selected $product_id_count Product(s): ");
        for($i=0; $i < $product_id_count; $i++)
        {
            $var1=$product_id[$i];
            $product_id_array[] = $var1;

          //echo $var1;
          //echo "<br>";  
        }


        $req_quantity_count = count($req_quantity);
        $_SESSION['req_quantity_array_limit'] = $req_quantity_count;
        //echo "Req quantity count disp ".$_SESSION['req_quantity_array_limit'];
        //echo("<p>You selected $req_quantity_count Product(s): ");
        for($j=0; $j < $req_quantity_count; $j++)
        {
            
            $var2=$req_quantity[$j];
            $quantity_array[] = $var2;
          //echo $var2;
          //echo "<br>";  
        }

       // for ($k = 0; $k < $_SESSION['req_quantity_array_limit']; $k++) 
        //{
          //  print_r($quantity_array[$k]);
            //echo "<br>";
        //}

        //for ($l = 0; $l < $_SESSION['product_id_array_limit']; $l++) 
        //{
          //  print_r($product_id_array[$l]);
            //echo "<br>";
        //}


        //$inbound_tr_uid = uniqid();

for($m = 0; $m < $_SESSION['req_quantity_array_limit']; $m++)
{
  $inbound_tr_uid = uniqid();
  $sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$inbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','i')";
  //echo $sql;
  $query_run = mysqli_query($conn, $sql);
}
if($query_run)
{
  echo "<h1>Loading..Please Wait..!</h1>";
  echo "<script>alert('Data updated successfully..!')</script>";
  echo "<script>location.href='transaction_inbound.php'</script>";


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

$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pd.quantity, pd.product_id FROM transaction_details td, product_details pd WHERE td.tr_id = '$inbound_tr_uid' AND td.tr_product_id = pd.product_id";  
//echo $sql3;
if($result=$conn->query($sql3))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{

  $updated_quantity = $row->quantity + $row->tr_product_quantity;
  

  $sql4="UPDATE product_details SET quantity='$updated_quantity' WHERE product_id='$row->tr_product_id'";
  //echo $sql4;
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
    echo "<script>location.href='transaction_inbound.php'</script>";
    echo "Insert data fail" . $sql . "<br>" . $conn->error;
}
}

?>

<?php

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