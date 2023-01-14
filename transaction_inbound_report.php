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
    <title>Inbound Transaction Report</title>

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

#btntxtalign {
  text-align: right;
}

tr:nth-child(even) {background-color: #f2f2f2;}
    </style>
    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">
  </head>
  <body>
  <?php include('includes/navbar.php'); ?>
<div class="container">
  <h1>Inbound Transaction Report</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  </font></b></h6>
  <hr>
  <div id="btntxtalign">
  <a href="transaction_inbound_bill.php"><button type="button" class="btn btn-primary">Filter by Month</button></a>
</div>
<br>
  <div style="overflow-x:auto;">
  <table border='1' cellspacing='10' cellpadding='20p'>
  <tr>  <th>Customer Name</th><th>Product</th><th>Returned Quantity</th><th>Updated Date / Time</th><th>Updated by</th> </tr>

<?php

//$sql2="SELECT itd.itr_customer_id, itd.itr_products_returned, itd.itr_product_quantity, itd.itr_updated_by, itd.itr_updated_date_time, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name FROM customer_details cd, product_details pd, inbound_transaction_details itd WHERE itd.itr_customer_id=cd.customer_id AND itd.itr_products_returned=pd.product_id AND itd.itr_updated_by='$_SESSION[login_inv_user_email]'";
$sql2 = "SELECT td.tr_customer_id, td.tr_product_id, td.tr_product_quantity, td.tr_user_company_id, td.tr_type, td.tr_updated_date_time, td.tr_updated_by, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name FROM transaction_details td, customer_details cd, product_details pd WHERE td.tr_customer_id=cd.customer_id AND td.tr_product_id=pd.product_id AND td.tr_user_company_id='$_SESSION[company_id_for_db_update]' AND td.tr_type='i'";
//echo $sql2;
if($result=$conn->query($sql2))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{
echo "<tr><td>$row->customer_name</td><td>$row->product_name</td><td>$row->tr_product_quantity</td><td>".substr("$row->tr_updated_date_time",0,19)."</td><td>$row->tr_updated_by</td></tr>";
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