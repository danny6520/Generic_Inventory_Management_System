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
    <title>Add Customer </title>

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

    </style>
    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">
  </head>
  <body>
    <center><img src="#" alt="Company Logo" style="float:centre";></center>
<nav class="navbar navbar-expand-xl navbar-dark bg-dark">
    <a class="navbar-brand" href="#">
        <img src="#" alt="logo" style="width:40px;">
      </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample06" aria-controls="navbarsExample06" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample06">
  <ul class="navbar-nav mr-auto">
      
      <li class="nav-item active">
        <a class="nav-link" href="add_customer.php">Add Customer </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_products.php">Add Products </a>
      </li>
<!--
      <li class="nav-item">
        <a class="nav-link" href="company_product_mapping.php">Company - Product Mapping</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="company_customer_mapping.php">Company - Customer Mapping</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reports</a>
        <div class="dropdown-menu" aria-labelledby="dropdown06">
          <a class="dropdown-item" href="reports.php">Company - User report</a>
          <a class="dropdown-item" href="company_product_report.php">Company - Product report</a>
          <a class="dropdown-item" href="company_customer_report.php">Company - Customer report</a>
        </div>
      </li>
-->
      <li class="nav-item">
        <a class="nav-link" href="transaction_outbound.php">Outbound Transaction<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="month_end_outbound_transfer.php">Month End Outbound Transfer<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="transaction_inbound.php">Inbound Transaction<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reports</a>
        <div class="dropdown-menu" aria-labelledby="dropdown06">
          <a class="dropdown-item" href="transaction_outbound_report.php">Outbound Transaction Report</a>
          <a class="dropdown-item" href="transaction_inbound_report.php">Inbound Transaction Report</a>
          <a class="dropdown-item" href="company_customer_report.php">Customer Report</a>
          <a class="dropdown-item" href="company_product_report.php">Product Report</a>
          <a class="dropdown-item" href="inventory_report.php">Inventory Report</a>
          <a class="dropdown-item" href="billing.php">Billing</a>
        </div>
      </li>
      <!--
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
        <div class="dropdown-menu" aria-labelledby="dropdown06">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    -->
    </ul>
  <a href="inventory_logout_process.php"> <button type="button" class="btn btn-danger">LOGOUT</button></a>
  </div>
</nav>


</div>
<div class="container">
  <h1>Add Customer</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php
$sql ="SELECT cd.company_name, cd.company_id, ud.user_company_id, ud.user_email FROM company_details cd, user_details ud where ud.user_email = '$_SESSION[login_inv_user_email]' AND ud.user_company_id = cd.company_id";  
//echo $sql;
if($result=$conn->query($sql))
{

if($result->num_rows)
{
while($row=$result->fetch_object())
{
$_SESSION['company_name_for_displaying'] = $row->company_name;
$_SESSION['company_id_for_db_update'] = $row->company_id;
}
}
}
?>
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  </font></b></h6>
  
  
  <hr>
  <div id="example3">
  <form action="add_customer_process.php" method="POST">
    <label for="name">Customer name:</label>
    <input type="text" name="customer_name" class="form-control" placeholder="Enter Customer name" /required>
    <br>

    <!--
    <label for="company_type">Select Company Type:</label><br>

<select name="customer_type" id="customer_type" class="form-control">
  <option value="Head Office">Head Office</option>
  <option value="Branch">Branch</option>
</select>
    <br>
    <label for="name">Customer Details:</label>
    <input type="text" name="customer_details" class="form-control" placeholder="About the Customer" /required>
    <br>
    <label for="name">Customer Head office:</label>
    <input type="text" name="customer_head_office" class="form-control" placeholder="Enter Customer Head office location" /required>
    <br>
-->
    <label for="name">Customer Email:</label>
    <input type="email" name="customer_email" class="form-control" placeholder="Enter Customer Email" /required>
    <br>
    <!--
    <label for="name">Customer Website:</label>
    <input type="text" name="customer_website" class="form-control" placeholder="Enter Customer Website" /required>
    <br>
-->
<label for="name">Customer Mobile:</label>
    <input type="text" name="customer_mobile" class="form-control" placeholder="Enter Customer Mobile" /required>
    <br>
    <center><button type="submit" name="submit" class="btn btn-success">Submit</button></center>
  </form>
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