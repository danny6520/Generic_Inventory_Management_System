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
    $outbound_date = $_POST['outbound_date'];
    //$product_price=$_POST['product_price'];
    //$product_price="sample_value";

    if($customer_id == "na")
    {
      echo "<script>alert('Customer Name not selected! Please select a Customer Name.')</script>";
      echo "<script>location.href='transaction_outbound_other_dates.php'</script>";
    }
    else {

    
    $product_id_array = array();
    $quantity_array = array();
    $price_array = array();
    $price_array_for_db = array();
    /*
    $product_price_array = array();

    $product_price_array[] = $product_price;
    print_r($product_price_array[0]);
*/

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
        for($k=0; $k < $product_id_count; $k++)
        {
        $sql5 = "SELECT current_rate, product_id FROM product_details WHERE product_id = '$product_id_array[$k]'";
        //echo $sql5;
        if($result=$conn->query($sql5))
        {
        if($result->num_rows)
        {
        while($row=$result->fetch_object())
        {
          
          $price_array[] = $row->current_rate;
          //echo $row->current_rate;
          
        } 
       
        }
        
        }
        
      }

/*

      for($pr=0; $pr < $product_id_count; $pr++)
      {
          $calculated_price = $quantity_array[$pr] * $price_array[$pr];
          $price_array_for_db[] = $calculated_price;
      }

*/


        $outbound_tr_uid = uniqid();
        //$outbound_tr_date = date("Y.m.d H:i");

for($m = 0; $m < $_SESSION['req_quantity_array_limit']; $m++)
{
  //$outbound_tr_uid = uniqid();
  $sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_price, tr_updated_by, tr_user_company_id, tr_type, tr_updated_date_time) VALUES ('$outbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$price_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','o','$outbound_date')";
  //$sql2 = "INSERT INTO transaction_bill (tr_bill_id, tr_bill_customer_id, tr_bill_product_id, tr_bill_outbound_quantity, tr_bill_updated_by, tr_bill_user_company_id) VALUES ('$outbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]')";
  //echo $sql2;
  $query_run = mysqli_query($conn, $sql);
  //$query_run2 = mysqli_query($conn, $sql2);
}
if($query_run)
{
  echo "<h1>Loading..Please Wait..!</h1>";
  echo "<script>alert('Data updated successfully..!')</script>";
  //echo "<script>location.href='transaction_outbound_other_dates.php'</script>";

    
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
/*
$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pd.quantity, pd.product_id FROM transaction_details td, product_details pd WHERE td.tr_id = '$outbound_tr_uid' AND td.tr_product_id = pd.product_id";  
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
*/
//$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pd.quantity, pd.product_id FROM transaction_details td, product_details pd WHERE td.tr_id = '$_SESSION[outbound_tr_uid_for_update]' AND td.tr_product_id = pd.product_id";  
$sql3 ="SELECT td.tr_id, td.tr_product_id, td.tr_product_quantity, pp.quantity, pd.product_id, pp.product_pricing_id FROM transaction_details td, product_details pd, product_pricing pp WHERE pp.product_pricing_id = pd.product_id AND td.tr_id = '$_SESSION[outbound_tr_uid_for_update]' AND td.tr_product_id = pd.product_id";  
//echo $sql;
if($result=$conn->query($sql3))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{

$updated_quantity = $row->quantity - $row->tr_product_quantity;

$sql4="UPDATE product_pricing SET quantity='$updated_quantity' WHERE product_pricing_id='$row->tr_product_id'";
  if($conn->query($sql4)==TRUE)
  {
      echo "Product quantity updated!";
  }


}
}
}
}
else{
  echo "<h1>Loading..Please Wait..!</h1>";
   echo "<script>alert('Error..! Please contact your website admin..!')</script>";
   echo "<script>location.href='transaction_outbound_other_dates.php'</script>";
    echo "Insert data fail" . $sql2 . "<br>" . $conn->error;
}
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