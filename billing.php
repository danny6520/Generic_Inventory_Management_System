<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start    
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
    <title>Reports</title>

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
<div class="container">
  <h1>Billing</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  </font></b></h6>
  <hr>

  

<?php
  //$sql3="SELECT cd.customer_id, cd.customer_name, pd.product_id, pd.product_name, td.tr_product_id, td.tr_customer_id, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_product_quantity FROM transaction_details td, product_details pd, customer_details cd WHERE td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' AND cd.customer_id = td.tr_customer_id AND pd.product_id = td.tr_product_id";
  $billing_array = array();
  $billing_array_two = array();
  $billing_customer_name_array = array();
  $customer_grand_total_price_array = array();
  $outbound_tr_price_array = array();
  $billing_customer_name_array_two = array();
  $outbound_tr_price_array_sum = array();
  $inbound_tr_price_array = array();
  //$sql3 = "SELECT tb.tr_bill_customer_id, tb.tr_bill_product_id, tb.tr_bill_outbound_quantity, tb.tr_bill_outbound_date_time, tb.tr_bill_inbound_quantity, tb.tr_bill_inbound_date_time, tb.tr_bill_user_company_id, pd.product_name, pd.product_id, cd.customer_id, cd.customer_name FROM transaction_bill tb, product_details pd, customer_details cd WHERE pd.product_id = tb.tr_bill_product_id AND cd.customer_id = tb.tr_bill_customer_id AND tb.tr_bill_user_company_id = '$_SESSION[company_id_for_db_update]'";
  $sql3 = "SELECT td.tr_id, td.tr_customer_id, td.tr_product_id, td.tr_product_quantity, td.tr_price, td.tr_updated_by, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_status, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name, CONVERT( DATEDIFF(LAST_DAY(`tr_updated_date_time` + MONTH(`tr_updated_date_time`)) ,`tr_updated_date_time`),CHARACTER) as 'no_of_days' FROM transaction_details td, customer_details cd, product_details pd WHERE td.tr_customer_id = cd.customer_id AND td.tr_product_id = pd.product_id AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' ORDER BY cd.customer_name";
  //echo $sql3;
  if($result=$conn->query($sql3))
  {
  if($result->num_rows)
  {
  while($row=$result->fetch_object())
  {
    //$outbound_date_for_calculation = date_create("$row->tr_bill_outbound_date_time");
    //$inbound_date_for_calculation = date_create("$row->tr_bill_inbound_date_time");

    $transaction_date_for_calculation = date_create("$row->tr_updated_date_time");
    $transaction_date_for_calculation_substr = substr("$row->tr_updated_date_time",0,19);
    
   // $outbound_date_for_calculation = date_create("2022-03-08 20:08:45");
     //$inbound_date_for_calculation = date_create("2022-03-17 11:04:32");
    
    
   // $number_of_days = date_diff($outbound_date_for_calculation,$inbound_date_for_calculation);

    //$bill_outbound_date_substr = substr("$row->tr_bill_outbound_date_time",0,19);
    //$bill_inbound_date_substr = substr("$row->tr_bill_inbound_date_time",0,19);


    //$bill_no_of_days = $number_of_days->format('%a days');
    //$bill_no_of_days = "To be calculated";
    //$price_calculated = "To be calculated";
    $calculated_total_price = $row->tr_product_quantity * $row->tr_price * $row->no_of_days;
    
 //echo "<tr><td>$row->customer_name</td><td>$row->product_name</td><td>$row->tr_bill_outbound_quantity</td><td>".substr("$row->tr_bill_outbound_date_time",0,19)."</td><td>$row->tr_bill_inbound_quantity</td><td>".substr("$row->tr_bill_inbound_date_time",0,19)."</td><td>".$number_of_days->format('%a days')."</td></tr>";
  $billing_array[] = array ($row->customer_name,$row->product_name,$row->tr_product_quantity,$row->tr_price,$transaction_date_for_calculation_substr,$row->tr_type,$row->no_of_days,$calculated_total_price);
  $billing_customer_name_array[] = array ($row->customer_name);
  $billing_customer_name_array_two[] = $row->customer_name;
}
  }
  }
?>
 
<?php
//print_r($billing_array[0][1]);
$bill_array_size = sizeof($billing_array);
//echo $bill_array_size;
?>
<div style="overflow-x:auto;">
<table border='1' cellspacing='10' cellpadding='20p'>
  <tr>  <th>Customer Name</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Transaction Date</th><th>Transaction Type</th><th>Number of Days</th><th>Total Price</th></tr>
<?php
/*
for($k=0; $k<$bill_array_size; $k++)
{
  for($l=0; $l<1; $l++)
  {
    $customer_grand_total_price_array[] = $billing_array[$k][7];
  }

}
*/

for($i=0; $i<$bill_array_size; $i++)
{
 
  $billing_customer_name_array[$bill_array_size] = 0;
 echo "<tr>";
  for($j=0; $j<8; $j++)
  {
    
    echo "<td>";
    echo $billing_array[$i][$j];    
    echo "</td>";
    
  }
  echo "</tr>";
  $customer_grand_total_price_array[] = $billing_array[$i][7];
  if($billing_customer_name_array[$i] != $billing_customer_name_array[$i+1])
  {
    echo "<tr><td colspan='7'>";
    $customer_grand_total_price = array_sum($customer_grand_total_price_array);
    echo "<div id='btntxtalign'><b>Grand Total:</b></td><td><b><font color='maroon'> ₹ ";
    echo $customer_grand_total_price;
    echo "</font></b>";
    $customer_grand_total_price_array = array();
    echo "</td></tr>";

    $sql4 = "SELECT td.tr_customer_id, td.tr_price, td.tr_type, td.tr_user_company_id, cd.customer_id, cd.customer_name FROM transaction_details td, customer_details cd WHERE td.tr_customer_id = cd.customer_id AND cd.customer_name = '$billing_customer_name_array_two[$i]' AND td.tr_type='o' AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' ORDER BY cd.customer_name";
    //echo $sql4;
    if($result=$conn->query($sql4))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
      $outbound_tr_price_array[] = $row->tr_price;
    }
    }
    }
    $outbound_tr_price_array_sum[] = array_sum($outbound_tr_price_array);
    $outbound_tr_price_sum = array_sum($outbound_tr_price_array);
    $outbound_tr_price_array = array();
    $sql5 = "SELECT td.tr_customer_id, td.tr_price, td.tr_type, td.tr_user_company_id, cd.customer_id, cd.customer_name FROM transaction_details td, customer_details cd WHERE td.tr_customer_id = cd.customer_id AND cd.customer_name = '$billing_customer_name_array_two[$i]' AND td.tr_type='i' AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' ORDER BY cd.customer_name";
    //echo $sql4;
    if($result=$conn->query($sql5))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
      $inbound_tr_price_array[] = $row->tr_price;
    }
    }
    }
    $inbound_tr_price_array_sum[] = array_sum($inbound_tr_price_array);
    $inbound_tr_price_sum = array_sum($inbound_tr_price_array);
    $inbound_tr_price_array = array();

    $gross_tr_total = $outbound_tr_price_sum + $inbound_tr_price_sum;
    echo "<tr><td colspan='2'><b>Outbound Total:<font color='maroon'> ₹ ".$outbound_tr_price_sum."</font></b></td><td></td><td colspan='2'><b>Inbound Total: <font color='maroon'>₹ ".$inbound_tr_price_sum."</font></b></td><td></td><td colspan='2'><b>Gross Total: <font color='maroon'>₹ ".$gross_tr_total."</font></b></td></tr>";
    echo "</table>";
    echo "<br>";
    echo "<hr>";
    echo "<br>";
    if($billing_customer_name_array[$i+1] != 0)
    {
      echo "<table border='1' cellspacing='10' cellpadding='20p'>";
      echo " <tr>  <th>Customer Name</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Transaction Date</th><th>Transaction Type</th><th>Number of Days</th><th>Total Price</th></tr>";
    }
  }
  
}

/*
$bill_array_size_two = sizeof($billing_array_two);
for($k=0; $k<$bill_array_size_two; $k++)
{
echo "<tr><td>";
echo $billing_array_two[$k];
echo "</td></tr>";
}
*/

/*
$j=0;
for($i=0; $i<$bill_array_size; $i++)
{
  
  echo $billing_array[$i][$j];
  $j++;
}
*/
?>
  </table>
</div>
</div>
<?php
//print_r($inbound_tr_price_array_sum);
?>

<br><br><br><br><br><br><br>
<nav class="navbar fixed-bottom navbar-expand-sm navbar-dark bg-dark">
  <marquee><font color="white" align="center">Generic Inventory Management System</font></marquee>
  <!--
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
  -->
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="assets/dist/js/bootstrap.bundle.js"></script></body>
</html>

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