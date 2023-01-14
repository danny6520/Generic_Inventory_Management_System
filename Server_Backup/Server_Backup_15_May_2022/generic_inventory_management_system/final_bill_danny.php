<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start    
include('db_connection/inventory_management_db_connect.php');
include('includes/constant.php');
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

  if ($_SESSION['company_id_for_db_update'] == $bharat_petrolium_company_id)
  {
  //$sql3 = "SELECT tb.tr_bill_customer_id, tb.tr_bill_product_id, tb.tr_bill_outbound_quantity, tb.tr_bill_outbound_date_time, tb.tr_bill_inbound_quantity, tb.tr_bill_inbound_date_time, tb.tr_bill_user_company_id, pd.product_name, pd.product_id, cd.customer_id, cd.customer_name FROM transaction_bill tb, product_details pd, customer_details cd WHERE pd.product_id = tb.tr_bill_product_id AND cd.customer_id = tb.tr_bill_customer_id AND tb.tr_bill_user_company_id = '$_SESSION[company_id_for_db_update]'";
  /*
  $sql3 = "SELECT `tr_product_id`, tr_customer_id,tr_updated_date_time,DATE_FORMAT(tr_updated_date_time,'%d') dt,
  sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '07', `tr_product_quantity`, NULL)) as '07' ,
  sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '14', `tr_product_quantity`, NULL)) as '14' ,
  sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '25', `tr_product_quantity`, NULL)) as '25'
     from transaction_details GROUP by tr_product_id,tr_customer_id,`tr_updated_date_time`,dt";
     */
?>
<div style="overflow-x:auto;">
<table border='1' cellspacing='10' cellpadding='20p'>
  <tr> <th>Customer Name</th><th>Product Name</th><th>Updated Date/Time</th><th>Transaction Date</th><th>07</th><th>14</th><th>25</th></tr>
<?php
    $sql3 = "SELECT td.tr_product_id, td.tr_customer_id, td.tr_updated_date_time, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name, td.tr_user_company_id, 
    DATE_FORMAT(tr_updated_date_time,'%d') dt,
    sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '07', `tr_product_quantity`, NULL)) as s ,
    sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '14', `tr_product_quantity`, NULL)) as 'f' ,
    sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '25', `tr_product_quantity`, NULL)) as 't'
       from transaction_details td, customer_details cd, product_details pd 
       WHERE td.tr_product_id = pd.product_id AND td.tr_customer_id = cd.customer_id AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' GROUP by tr_product_id,tr_customer_id,cd.customer_name,pd.product_name,`tr_updated_date_time`,dt";
  echo $sql3;
    if($result=$conn->query($sql3))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
      echo "<tr><td>$row->customer_name</td><td>$row->product_name</td><td>$row->tr_updated_date_time</td><td>$row->dt</td><td>$row->s</td><td>$row->f</td><td>$row->t</td></tr>";

      
    }
    }
    }
  }
  else {
    //$sql3 = "SELECT tb.tr_bill_customer_id, tb.tr_bill_product_id, tb.tr_bill_outbound_quantity, tb.tr_bill_outbound_date_time, tb.tr_bill_inbound_quantity, tb.tr_bill_inbound_date_time, tb.tr_bill_user_company_id, pd.product_name, pd.product_id, cd.customer_id, cd.customer_name FROM transaction_bill tb, product_details pd, customer_details cd WHERE pd.product_id = tb.tr_bill_product_id AND cd.customer_id = tb.tr_bill_customer_id AND tb.tr_bill_user_company_id = '$_SESSION[company_id_for_db_update]'";
  $sql3 = "SELECT td.tr_id, td.tr_customer_id, td.tr_product_id, td.tr_product_quantity, td.tr_price, td.tr_updated_by, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_status, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name,DATE_FORMAT(`tr_updated_date_time`,'%Y/%m') as transaction_date, CONVERT( DATEDIFF(LAST_DAY(`tr_updated_date_time` + MONTH(`tr_updated_date_time`)) ,`tr_updated_date_time`),CHARACTER) as 'no_of_days' FROM transaction_details td, customer_details cd, product_details pd WHERE td.tr_customer_id = cd.customer_id AND td.tr_product_id = pd.product_id AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' ORDER BY cd.customer_name";
  echo $sql3;
  
  
  
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

    $calculated_total_price = $row->tr_product_quantity * $row->tr_price * $row->no_of_days;
    
 //echo "<tr><td>$row->customer_name</td><td>$row->product_name</td><td>$row->tr_bill_outbound_quantity</td><td>".substr("$row->tr_bill_outbound_date_time",0,19)."</td><td>$row->tr_bill_inbound_quantity</td><td>".substr("$row->tr_bill_inbound_date_time",0,19)."</td><td>".$number_of_days->format('%a days')."</td></tr>";
  $billing_array[] = array ($row->customer_name,$row->product_name,$row->tr_product_quantity,$row->tr_price,$transaction_date_for_calculation_substr,$row->tr_type,$row->no_of_days,$calculated_total_price,$row->transaction_date);
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
  <tr>  <th>Transaction Month</th> <th>Customer Name</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Transaction Date</th><th>Transaction Type</th><th>Number of Days</th><th>Total Price</th></tr>
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
$outboundTotalPrice = 0;
$inboundTotalPrice = 0;
$amountToBePaid = 0;
for($i=0; $i<$bill_array_size; $i++)
{
 
  $billing_customer_name_array[$bill_array_size] = 0;
 echo "<tr>";
 $j=0;
 $customerName = $billing_array[$i][$j]; 
 $nextCustomerName = $billing_array[$i+1][$j]; 
 $j=$j+1;
 $productName =$billing_array[$i][$j]; 
 $j=$j+1;
 $qty = $billing_array[$i][$j];  
 $j=$j+1;
 $price = $billing_array[$i][$j];  
 $j=$j+1; 
 $transactionDate=$billing_array[$i][$j]; 
 $j=$j+1; 
 $transactionType=$billing_array[$i][$j]; 
 $j=$j+1;
 $numberOfDay=$billing_array[$i][$j]; 
 $j=$j+1;
 $totalPrice=$billing_array[$i][$j]; 

 $j=$j+1;
 $transaction_date=$billing_array[$i][$j]; 
 
 $nextrecord_transaction_date=$billing_array[($i+1)][$j]; 
 
 if ( $transactionType=='o')
 {
  $outboundTotalPrice = $outboundTotalPrice + $totalPrice;
 }
 if ( $transactionType=='i')
 {
  $inboundTotalPrice = $inboundTotalPrice + $totalPrice;
 }
 $amountToBePaid = $amountToBePaid + $totalPrice;
 echo "<td>". $transaction_date. "</td>";
 echo "<td>". $customerName. "</td>";
 echo "<td>". $productName. "</td>";
 echo "<td>". $qty. "</td>";
 echo "<td>". $price. "</td>";
 echo "<td>". $transactionDate. "</td>";
 echo "<td>". $transactionType. "</td>";
 echo "<td>". $numberOfDay. "</td>";
 echo "<td>". $totalPrice. "</td>";
    
  
  echo "</tr>";
  if($customerName != $nextCustomerName && (($i+1)<$bill_array_size))
  {
    echo "<tr><th>&nbsp;</th><th>Total OutBound</th> <th>".$outboundTotalPrice. "</th><th>&nbsp</th><th>Total inBound </th><th>".$inboundTotalPrice."</th><th>&nbsp;</th><th>Amount To be Paid </th><th>".($outboundTotalPrice-$inboundTotalPrice)."</th></tr>";
    echo "<tr bgcolor=gray><th colspan=9>&nbsp;</th></tr>";
    echo "<tr><th>Transaction Month</th> <th>Customer Name</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Transaction Date</th><th>Transaction Type</th><th>Number of Days</th><th>Total Price</th></tr>";
    
    $outboundTotalPrice = 0;
    $inboundTotalPrice = 0;
    $amountToBePaid = 0;
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