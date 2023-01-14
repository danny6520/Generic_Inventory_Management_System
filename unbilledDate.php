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

  

<div style="overflow-x:auto;">
<table border='1' cellspacing='10' cellpadding='20p'>
  <tr>  <th>Current Month Trnasction</th><th>Customer Name</th><th>Product Name</th><th> Quantity</th><th>PRICE</th><th>Number of Days</th><th>TYPE</th><th>Total Price</th></tr>
  <?php
  //$sql3="SELECT cd.customer_id, cd.customer_name, pd.product_id, pd.product_name, td.tr_product_id, td.tr_customer_id, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_product_quantity FROM transaction_details td, product_details pd, customer_details cd WHERE td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' AND cd.customer_id = td.tr_customer_id AND pd.product_id = td.tr_product_id";
  
  $sql3 = " SELECT `tr_customer_id`,`tr_product_id`,`tr_product_quantity`,`tr_price`, DATE_FORMAT(`tr_updated_date_time`,'%Y/%m') as transaction_date, CONVERT( DATEDIFF(LAST_DAY(`tr_updated_date_time` + MONTH(`tr_updated_date_time`)) ,`tr_updated_date_time`),CHARACTER) as 'no_of_days' , `tr_type` as 'TYPE' ,  pd.product_name, pd.product_id, 
  cd.customer_id, cd.customer_name FROM `transaction_details` tb, product_details pd, customer_details cd ";
  $sql3 = $sql3 ." WHERE pd.product_id = tb.`tr_product_id` AND cd.customer_id = tb.tr_customer_id AND ";
  $sql3 = $sql3 . "DATE(tr_updated_date_time) = DATE(now()) and MONTH(tr_updated_date_time) = MONTH(now()) AND YEAR(tr_updated_date_time) = YEAR(now()) and ";
  $sql3 = $sql3 ." tb.tr_user_company_id = '$_SESSION[company_id_for_db_update]' order by cd.customer_name , pd.product_name , TYPE";
  echo $sql3;
  if($result=$conn->query($sql3))
  {
  if($result->num_rows)
  {
  while($row=$result->fetch_object())
  {  
   // Number of Days = no_of_days
    $outbound_date_for_calculation = date_create("$row->tr_bill_outbound_date_time");
    $inbound_date_for_calculation = date_create("$row->tr_bill_inbound_date_time");
    
   // $outbound_date_for_calculation = date_create("2022-03-08 20:08:45");
     //$inbound_date_for_calculation = date_create("2022-03-17 11:04:32");
    
    
    $number_of_days = date_diff($outbound_date_for_calculation,$inbound_date_for_calculation);
$updateDateTime = $row->tr_updated_date_time;
    $sql = "<tr><td>".$row->transaction_date."</td><td>".$row->customer_name."</td><td>".$row->product_name."</td><td>";
    $sql = $sql .$row->tr_product_quantity."</td><td>".$row->tr_price."</td><td>".$row->no_of_days."</td><td>".$row->TYPE."</td><td>";
    $sql = $sql .($row->tr_price)*($row->no_of_days)*($row->tr_price)."</td></tr>";
    echo $sql;
  }
  }
  }
?>
 </table>
</div>
</div>
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