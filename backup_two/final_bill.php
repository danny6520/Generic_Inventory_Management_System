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
  <tr> <th>Product Name</th><th>Product Model</th><th>Current Rate</th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th><th>08</th><th>09</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th><th>16</th><th>17</th><th>18</th><th>19</th><th>20</th><th>21</th><th>22</th><th>22</th><th>24</th><th>25</th><th>26</th><th>27</th><th>28</th><th>29</th><th>30</th><th>31</th><th>Total QTY</th><th>Total PRICE</th></tr>
<?php

  $sql3="SELECT 
product_id,product_name,product_model,current_rate,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '01', `tr_product_quantity`, 0)) as 'one' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '02', `tr_product_quantity`, 0)) as 'two' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '03', `tr_product_quantity`, 0)) as 'three' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '04', `tr_product_quantity`, 0)) as 'four' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '05', `tr_product_quantity`, 0)) as 'five' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '06', `tr_product_quantity`, 0)) as 'six' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '07', `tr_product_quantity`, 0)) as 'seven' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '08', `tr_product_quantity`, 0)) as 'eight' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '09', `tr_product_quantity`, 0)) as 'nine' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '10', `tr_product_quantity`, 0)) as 'ten' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '11', `tr_product_quantity`, 0)) as 'eleven' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '12', `tr_product_quantity`, 0)) as 'twelve' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '13', `tr_product_quantity`, 0)) as 'thirteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '14', `tr_product_quantity`, 0)) as 'fourteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '15', `tr_product_quantity`, 0)) as 'fifteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '16', `tr_product_quantity`, 0)) as 'sixteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '17', `tr_product_quantity`, 0)) as 'seventeen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '18', `tr_product_quantity`, 0)) as 'eighteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '19', `tr_product_quantity`, 0)) as 'nineteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '20', `tr_product_quantity`, 0)) as 'twenty' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '21', `tr_product_quantity`, 0)) as 'twentyone' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '22', `tr_product_quantity`, 0)) as 'twentytwo' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '23', `tr_product_quantity`, 0)) as 'twentythree' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '24', `tr_product_quantity`, 0)) as 'twentyfour' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '25', `tr_product_quantity`, 0)) as 'twentyfive' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '26', `tr_product_quantity`, 0)) as 'twentysix' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '27', `tr_product_quantity`, 0)) as 'twentyseven' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '28', `tr_product_quantity`, 0)) as 'twentyeight' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '29', `tr_product_quantity`, 0)) as 'twentynine' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '30', `tr_product_quantity`, 0)) as 'thirty' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '31', `tr_product_quantity`, 0)) as 'thirtyone' ,
sum( `tr_product_quantity`) as 'total_qty' , (sum( `tr_product_quantity`)*`current_rate`) as 'total_price' 
from transaction_details td, customer_details cd, product_details pd where td.tr_product_id = pd.product_id and pd.status ='y' and td.tr_customer_id = cd.customer_id AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]'  group by product_type, pd.product_id ,pd.product_name,product_model,current_rate ";
  
  echo $sql3;
    if($result=$conn->query($sql3))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
     
      echo "<tr><td>$row->product_name</td><td>$row->product_model</td><td>$row->current_rate</td>
      <td>$row->one</td>
      <td>$row->two</td>
      <td>$row->three</td>
      <td>$row->four</td>
      <td>$row->five</td>
      <td>$row->six</td>
      <td>$row->seven</td>
      <td>$row->eight</td>
      <td>$row->nine</td>
      <td>$row->ten</td>
      <td>$row->eleven</td>
      <td>$row->twelve</td>
      <td>$row->thirteen</td>
      <td>$row->fourteen</td>
      <td>$row->fifteen</td>
      <td>$row->sixteen</td>
      <td>$row->seventeen</td>
      <td>$row->eighteen</td>
      <td>$row->nineteen</td>
      <td>$row->twenty</td>
      <td>$row->twentyone</td>
      <td>$row->twentytwo</td>
      <td>$row->twentythree</td>
      <td>$row->twentyfour</td>
      <td>$row->twentyfive</td>
      <td>$row->twentysix</td>
      <td>$row->twentyseven</td>
      <td>$row->twentyeight</td>
      <td>$row->twentynine</td>
      <td>$row->thirty</td>
      <td>$row->thirtyone</td>
<td>$row->total_qty</td>
<td>$row->total_price</td>
</tr>";
     
    }
    }
    }
  }
  else {
    //$sql3 = "SELECT tb.tr_bill_customer_id, tb.tr_bill_product_id, tb.tr_bill_outbound_quantity, tb.tr_bill_outbound_date_time, tb.tr_bill_inbound_quantity, tb.tr_bill_inbound_date_time, tb.tr_bill_user_company_id, pd.product_name, pd.product_id, cd.customer_id, cd.customer_name FROM transaction_bill tb, product_details pd, customer_details cd WHERE pd.product_id = tb.tr_bill_product_id AND cd.customer_id = tb.tr_bill_customer_id AND tb.tr_bill_user_company_id = '$_SESSION[company_id_for_db_update]'";
  $sql3 = "SELECT td.tr_id, td.tr_customer_id, td.tr_product_id, td.tr_product_quantity, td.tr_price, td.tr_updated_by, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_status, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name,DATE_FORMAT(`tr_updated_date_time`,'%Y/%m') as transaction_date, CONVERT( DATEDIFF(LAST_DAY(`tr_updated_date_time` + MONTH(`tr_updated_date_time`)) ,`tr_updated_date_time`),CHARACTER) as 'no_of_days' FROM transaction_details td, customer_details cd, product_details pd WHERE td.tr_customer_id = cd.customer_id AND td.tr_product_id = pd.product_id AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' ORDER BY cd.customer_name";
  echo $sql3;
  
  
  

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