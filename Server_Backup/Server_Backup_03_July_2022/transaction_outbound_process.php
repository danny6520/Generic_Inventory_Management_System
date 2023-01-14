<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start   
?>
 
<?php

include('db_connection/inventory_management_db_connect.php');
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Outbound Transaction</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/navbars/">

    <!-- Bootstrap core CSS -->
<link href="assets/dist/css/bootstrap.css" rel="stylesheet">




    <style>
 
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .bg-dark {
    background-color: black !important;
}
.navbar-toggler {
    
    background-color: black;
}


        #example3 {
           border: 1px solid;
           padding: 20px;
           box-shadow: 15px 10px 18px gray;
           background: wheat;
         }
         #example4 {
           border: 1px solid;
           padding: 20px;
           box-shadow: 15px 10px 18px gray;
           background: #f2f2f2;
         }
       
body{
    background-image: url("white.jpg");
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}

table {
            
            border-collapse: collapse;
           
width: 100% ;
}
th, td {

text-align: center;
padding: 8px;
} 
tr:nth-child(even) {background-color: #f2f2f2;}

#btntxtalign {
  text-align: right;
}
    </style>
    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">
  </head>
  <body>

  <?php include('includes/navbar.php'); ?>
<?php
if(isset($_POST['submit']))
{
    $customer_id=$_POST['customer_id'];
    $product_id=$_POST['product_id'];
    $req_quantity=$_POST['req_quantity'];
    
    if($customer_id == "na")
    {
echo "<script>alert('Customer Name not selected! Please select a Customer Name.')</script>";
echo "<script>location.href='transaction_outbound.php'</script>";
    }
    else {

    
    //$product_price=$_POST['product_price'];
    //$product_price="sample_value";
//print_r($product_price);
    $product_id_array = array();
    $quantity_array = array();
    $price_array = array();
    $price_array_for_db = array();
    $sql_array_for_outbound_transaction = array();
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
        //echo "Quantity array print:";
        //print_r($quantity_array);
        //echo "<br>";

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
        $sql5 = "SELECT current_rate, product_pricing_id FROM product_pricing WHERE product_pricing_id = '$product_id_array[$k]'";
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


     // echo "Printing array:";
      //print_r($price_array);
        
/*
      for($pr=0; $pr < $product_id_count; $pr++)
      {
          $calculated_price = $quantity_array[$pr] * $price_array[$pr];
          $price_array_for_db[] = $calculated_price;
      }
*/

      //echo "Printing the array  price for DB";
      //print_r($price_array_for_db);

        $outbound_tr_uid = uniqid();
        $_SESSION['outbound_tr_uid_for_update'] = $outbound_tr_uid;
        //$outbound_tr_date = date("Y.m.d H:i");




?>
<div class="container">
<h1>Outbound Transaction</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  
  </font></b></h6>
  <hr>
<div id="example4">

<?php
  for($st = 0; $st < $_SESSION['req_quantity_array_limit']; $st++)
{

  $sql10 = "SELECT cd.customer_id, cd.customer_name, pd.product_id, pd.product_name FROM customer_details cd, product_details pd WHERE cd.customer_id = '$customer_id' AND pd.product_id = '$product_id_array[$st]'";

  if($result=$conn->query($sql10))
  {
  if($result->num_rows)
  {
  while($row=$result->fetch_object())
  {
    echo "<b>Customer Name:<font color='maroon'> $row->customer_name </font></b><br>";
    echo "<b>Product Name:<font color='maroon'> $row->product_name </font></b><br>";
    echo "<b>Quantity: <font color='maroon'>$quantity_array[$st] </font></b><br>";
    //echo "<b>Price: <font color='maroon'>₹ $price_array[$st]</font></b><br>";
    echo "<b>Price: <font color='maroon'>₹ ".$quantity_array[$st] * $price_array[$st]."</font></b><br>";
  }
  }
  }



/*
  echo "Customer ID: ".$customer_id."<br>";
  echo "Product ID: ".$product_id_array[$st]."<br>";
  echo "Quantity: ".$quantity_array[$st]."<br>";
  echo "Price: ".$price_array_for_db[$st]."<br>";
  */

  $sql_for_outbound_transaction = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_price, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$_SESSION[outbound_tr_uid_for_update]','$customer_id','$product_id_array[$st]','$quantity_array[$st]','$price_array[$st]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','o')";
  $sql_array_for_outbound_transaction[] = $sql_for_outbound_transaction;
  $_SESSION['sql_array_session_for_outbound_transaction'] = $sql_array_for_outbound_transaction;
  //print_r($sql_array_for_outbound_transaction);
  echo "<hr>";
}
echo "<p>Are you sure, do you want to proceed with the above data? </p>";
echo "<a href='transaction_outbound_process_two.php'><button type='button' class='btn btn-success'>Proceed</button></a> &nbsp &nbsp";
echo "<a href='transaction_outbound.php'><button type='button' class='btn btn-danger'>Cancel</button></a><br>";
?>
</div>
</div>

<?php

//need to cut/paste all the below codes in new page




/*

for($m = 0; $m < $_SESSION['req_quantity_array_limit']; $m++)
{
  //$outbound_tr_uid = uniqid();
 $sql = "INSERT INTO transaction_details (tr_id, tr_customer_id, tr_product_id, tr_product_quantity, tr_price, tr_updated_by, tr_user_company_id, tr_type) VALUES ('$outbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$price_array_for_db[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]','o')";
  //$sql2 = "INSERT INTO transaction_bill (tr_bill_id, tr_bill_customer_id, tr_bill_product_id, tr_bill_outbound_quantity, tr_bill_updated_by, tr_bill_user_company_id) VALUES ('$outbound_tr_uid','$customer_id','$product_id_array[$m]','$quantity_array[$m]','$_SESSION[login_inv_user_email]','$_SESSION[company_id_for_db_update]')";
  //echo $sql2;
  $query_run = mysqli_query($conn, $sql);
  //$query_run2 = mysqli_query($conn, $sql2);
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

}
else{
  echo "<h1>Loading..Please Wait..!</h1>";
echo "<script>alert('Error..! Please contact your website admin..!')</script>";
echo "<script>location.href='transaction_outbound.php'</script>";
  echo "Insert data fail" . $sql2 . "<br>" . $conn->error;
}

*/

}

}

?>

<br><br><br><br><br><br><br>
<nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
  <marquee><font color="white" align="center">Generic Inventory Management System</font></marquee>
 
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="assets/dist/js/bootstrap.bundle.js"></script></body>


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