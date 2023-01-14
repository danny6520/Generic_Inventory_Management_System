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
<div class="container">
  <h1>Month End Outbound Transfer</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  
  </font></b></h6>
  <hr>
  
  <div id="example4">
 

    

    <div style="overflow-x:auto;">
<table border='1' cellspacing='10' cellpadding='20p'>
      <tr><th>Customer Name</th><th>Product Name</th><th>Quantity</th><th>Price</th><th>Outbound Transaction Date</th><th>Inbound Transaction Date</th><th>Transaction ID</th></tr>
                                 
<?php


$nxtmnth_customer_name = array();
$nxtmnth_product_name = array();
$nxtmnth_product_quantity = array();
$nxtmnth_tr_id = array();


$sql = "SELECT td.tr_id, td.tr_customer_id, td.tr_product_id, td.tr_product_quantity, td.tr_price, td.tr_updated_by, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_status, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name FROM transaction_details td, customer_details cd, product_details pd WHERE td.tr_customer_id = cd.customer_id AND td.tr_product_id = pd.product_id AND td.tr_type='o' AND td.tr_type NOT IN('i') AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' AND td.tr_status = 'a' AND MONTH(td.tr_updated_date_time) < MONTH(CURRENT_DATE())";


if($result=$conn->query($sql))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{

echo "<tr><td>$row->customer_name</td>
<td>$row->product_name</td>
<td>$row->tr_product_quantity</td>
<td>$row->tr_price</td>
<td>$row->tr_updated_date_time</td>
<td>NA</td>
<td>$row->tr_id</td></tr>";

$nxtmnth_customer_id[] = $row->tr_customer_id;
$nxtmnth_customer_name[] = $row->customer_name;
$nxtmnth_product_id[] = $row->tr_product_id;
$nxtmnth_product_name[] = $row->product_name;
$nxtmnth_product_quantity[] = $row->tr_product_quantity;
$nxtmnth_price[] = $row->tr_price;
$nxtmnth_tr_id[] = $row->tr_id;

$_SESSION['ar_nxtmnth_customer_id'] = $nxtmnth_customer_id;
$_SESSION['ar_nxtmnth_customer_name'] = $nxtmnth_customer_name;
$_SESSION['ar_nxtmnth_product_id'] = $nxtmnth_product_id;
$_SESSION['ar_nxtmnth_product_name'] = $nxtmnth_product_name;
$_SESSION['ar_nxtmnth_product_quantity'] = $nxtmnth_product_quantity;
$_SESSION['ar_nxtmnth_price'] = $nxtmnth_price;
$_SESSION['ar_nxtmnth_tr_id'] = $nxtmnth_tr_id;

}
}
}




?>

</table>
<br>

    <br>
    
    <!--
    <input id="date" name="date" type="datetime-local">
<script type="text/javascript">
  document.getElementById('date').value = Date();
</script>
-->
    <center><a href="month_end_outbound_transfer_process.php"><button type="button" class="btn btn-success">Transfer to Next Month</button></a></center>

  <!--span id="result"></span>
<script src="jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="my_script.js" type="text/javascript"></script -->
</div>
</div>
<?php

//print_r($nxtmnth_customer_name);
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