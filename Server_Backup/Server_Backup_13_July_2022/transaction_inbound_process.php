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
    $transaction_id_array = array();
    $transaction_product_quantity_array = array();
    $transaction_outbound_date_time = array();
    $inbound_price_array = array();

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



        for($q = 0; $q < $_SESSION['req_quantity_array_limit']; $q++)
        {
          $sql5 = "SELECT * FROM transaction_details WHERE tr_customer_id = '$customer_id' AND tr_product_id = '$product_id_array[$q]'";
          //echo $sql5;
          if($result=$conn->query($sql5))
            {
              if($result->num_rows)
                {
                  while($row=$result->fetch_object())
                      {
          //$transaction_id_array[] = $row->tr_id;
          //echo $row->tr_id;
          $transaction_id_for_inbound_transaction = $row->tr_id;
          //echo "TRID = $transaction_id_for_inbound_transaction";
                        break;
                      }
                }
           }
           break;
        }



        for($r = 0; $r < $_SESSION['req_quantity_array_limit']; $r++)
        {
          $sql7 = "SELECT tr_product_quantity, tr_updated_date_time FROM transaction_details WHERE tr_customer_id = '$customer_id' AND tr_product_id = '$product_id_array[$r]' AND tr_type = 'o' AND tr_id = '$transaction_id_for_inbound_transaction'";
          //echo $sql5;
          if($result=$conn->query($sql7))
            {
              if($result->num_rows)
                {
                  while($row=$result->fetch_object())
                      {
          
                        $transaction_product_quantity_array[] = $row->tr_product_quantity;
                        $transaction_outbound_date_time[] = $row->tr_updated_date_time;
                      }
                }
           }
           //break;
        }

        for($s=0; $s < $_SESSION['req_quantity_array_limit']; $s++)
        {
        $sql8 = "SELECT current_rate, product_id FROM product_details WHERE product_id = '$product_id_array[$s]'";
        //echo $sql5;
        if($result=$conn->query($sql8))
        {
        if($result->num_rows)
        {
        while($row=$result->fetch_object())
        {
          
          $inbound_price_array[] = $row->current_rate;
          //echo $row->current_rate;
          
        } 
       
        }
        
        }
        
      }
//$transaction_date = date("Y.m.d H:i");



for($m = 0; $m < $_SESSION['req_quantity_array_limit']; $m++)
{
  //$inbound_tr_uid = uniqid();



  //$sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$inbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','i')";
  $sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_price, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$transaction_id_for_inbound_transaction','$customer_id','$product_id_array[$m]','$quantity_array[$m]', '$inbound_price_array[$m]', '$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','i')";
  //$sql6 = "UPDATE transaction_bill SET tr_bill_inbound_quantity = '$quantity_array[$m]',tr_bill_inbound_date_time=CURRENT_TIMESTAMP() WHERE tr_bill_id = '$transaction_id_for_inbound_transaction' AND tr_customer_id = '$customer_id' AND tr_product_id = '$product_id_array[$m]'";
  //$mm = $m + 2;
  
  $sql6 = "INSERT INTO transaction_bill (tr_bill_id, tr_bill_customer_id, tr_bill_product_id, tr_bill_outbound_quantity, tr_bill_outbound_date_time, tr_bill_inbound_quantity, tr_bill_updated_by, tr_bill_user_company_id) VALUES ('$transaction_id_for_inbound_transaction','$customer_id','$product_id_array[$m]','$transaction_product_quantity_array[$m]','$transaction_outbound_date_time[$m]','$quantity_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]')";
  //echo $sql6;
  
  //print_r($transaction_product_quantity_array[0]);
  //echo "<br><br>";
  //print_r($transaction_outbound_date_time[0]);
  
  $query_run = mysqli_query($conn, $sql);
  $query_run2 = mysqli_query($conn, $sql6);

  
}
if($query_run && $query_run2)
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

//$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pd.quantity, pd.product_id FROM transaction_details td, product_details pd WHERE td.tr_id = '$inbound_tr_uid' AND td.tr_product_id = pd.product_id";  
//$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pd.quantity, pd.product_id FROM transaction_details td, product_details pd WHERE td.tr_id = '$transaction_id_for_inbound_transaction' AND td.tr_product_id = pd.product_id";  
$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pp.quantity, pp.product_pricing_id, pd.product_id FROM transaction_details td, product_details pd, product_pricing pp WHERE pp.product_pricing_id = pd.product_id AND td.tr_id = '$transaction_id_for_inbound_transaction' AND td.tr_product_id = pd.product_id";  
//echo $sql3;
if($result=$conn->query($sql3))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{

  $updated_quantity = $row->quantity + $row->tr_product_quantity;
  

  $sql4="UPDATE product_pricing SET quantity='$updated_quantity' WHERE product_pricing_id='$row->tr_product_id'";
  //echo $sql4;
  if($conn->query($sql4)==TRUE)
  {
      echo "Data quantity updated!";
  }


}
}
}

}
else{
  echo "<h1>Loading..Please Wait..!</h1>";
    echo "<script>alert('Error..! Please contact your website admin..!')</script>";
    echo "<script>location.href='transaction_inbound.php'</script>";
    echo "Insert data fail" . $sql6 . "<br>" . $conn->error;
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