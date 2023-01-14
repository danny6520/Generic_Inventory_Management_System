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
    <title>Inbound Transaction</title>

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
  <h1>Inbound Transaction (for other dates)</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>

  </font></b></h6>
  <hr>
  <div id="btntxtalign">
  <a href="transaction_inbound.php"><button type="button" class="btn btn-primary">Go back</button></a>
</div><br>
  <div id="example3">
  <form action="transaction_inbound_other_dates.php" method="POST">

    <label for="name">Select Customer name:</label>
    <select name="customer_id" id="custnamevalid" class="form-control">    
    <option value="na">----------</option>                               
<?php
//$sql2 ="SELECT cd.customer_name, cd.customer_id, ud.user_email, ud.user_company_id, ccm.company_id, ccm.customer_id FROM customer_details cd, user_details ud, company_customer_mapping ccm WHERE ud.user_email='$_SESSION[login_inv_user_email]' AND ud.user_company_id=ccm.company_id AND ccm.customer_id=cd.customer_id";  
$sql2 = "SELECT customer_name, customer_id, created_user_company_id FROM customer_details WHERE created_user_company_id = '$_SESSION[company_id_for_db_update]'";
//echo $sql;
$result = $conn->query($sql2);
if ($result->num_rows > 0) {
while($row=$result->fetch_assoc())
{
$customer_id=$row['customer_id'];
$customer_name=$row['customer_name'];
?>

<option value="<?php echo $customer_id; ?>"> <?php echo $customer_name; ?> </option>
<?php
}
}
else
{
echo "0 results";
}
?>
</select>

    <br>
    <center><button type="submit" name="submit" onclick="dropdownvalidation()" class="btn btn-success">Submit</button></center>
    </form>


    <?php

if(isset($_POST['submit']))
{
    $customer_id=$_POST['customer_id'];
    //$product_id=$_POST['product_id'];
if($customer_id == "na")
{
  ?>
  <h5>Customer Name: <b><font color="maroon"> Customer Name Not Selected!</font></b></h5>
  <?php
}
else {


    $sql44 = "SELECT customer_id, customer_name from customer_details WHERE customer_id = '$customer_id'";
    if($result=$conn->query($sql44))
        {
        if($result->num_rows)
        {
        while($row=$result->fetch_object())
        {
          ?>
    <h5>Customer Name: <b><font color="maroon"> <?php echo $row->customer_name; ?></font></b></h5>
    <?php  
    }
      }
    }
  }


    ?>
    <hr>











    <form action="transaction_inbound_other_dates_process.php" method="POST">

    <label for="date">Select Transaction Date:</label><br>
<input type="datetime-local" name="inbound_date" class="form-control" /required>
    <br>
    <label for="name">Select Product:</label><br>
    
    <div style="overflow-x:auto;">
<table border='1' cellspacing='10' cellpadding='20p'>
<tr><th>Product Name</th><th>Available Quantity</th><th>Returned Quantity</th><th>Delivered quantity</th><th>Customer Name</th><th>Transaction ID</th><th>Transaction Date</th></tr>        
<?php
//$sql3 ="SELECT pd.product_name, pd.product_id, pd.quantity, ud.user_email, ud.user_company_id, cpm.company_id, cpm.product_id FROM product_details pd, user_details ud, company_product_mapping cpm WHERE ud.user_email='$_SESSION[login_inv_user_email]' AND ud.user_company_id=cpm.company_id AND cpm.product_id=pd.product_id";  
//$sql3 = "SELECT product_id, product_name, quantity FROM product_details WHERE created_user_company_id = '$_SESSION[company_id_for_db_update]'";
$sql3 = "SELECT pd.product_id, pd.product_name, pd.quantity, td.tr_product_id, td.tr_product_quantity, td.tr_id, td.tr_updated_date_time, td.tr_customer_id, cd.customer_id, cd.customer_name FROM product_details pd, transaction_details td, customer_details cd WHERE pd.created_user_company_id = '$_SESSION[company_id_for_db_update]' AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]' AND td.tr_type = 'o' AND pd.product_id = td.tr_product_id AND cd.customer_id = td.tr_customer_id AND td.tr_customer_id = '$customer_id'";
//echo $sql3;
$random=1;
if($result=$conn->query($sql3))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{
echo "<tr><td><input type='checkbox' name='product_id[]' onclick='enable$random()' value=$row->product_id>&nbsp<label>$row->product_name</label></td>
<td><label>$row->quantity</label></td>
<td><input type='number' name='req_quantity[]' value='0' min='0' max='$row->quantity' id='duplicate_value$random' disabled> </td>
<td>$row->tr_product_quantity</td><td>$row->customer_name<input type='hidden' name='customer_id' value='$customer_id'></td><td>$row->tr_id</td><td>".substr("$row->tr_updated_date_time",0,10)."</td></tr>";   
//$date_format_change_for_displaying = strtotime($row->tr_updated_date_time);
//echo date('y-m-d', $date_format_change_for_displaying);


$random++;
}
}
}
?>
</table>
   
    <br>
    
    
    <center><button type="submit" name="submit" class="btn btn-success">Submit</button></center>
  </form>
  <?php 
}
?>
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
<?php
for($u=1; $u<1000; $u++)
{
  ?>
<script>
 function enable<?php echo $u; ?>(){
	document.getElementById("duplicate_value<?php echo $u; ?>").disabled = "";
  }
  </script>
  <?php
}
?>

<script>
 function dropdownvalidation() {
    var5 = document.getElementById("custnamevalid").value;
    
    if(var5 == "na")
    {
      alert("Customer Name not selected! Please select a Customer Name.");
    }
  }
  </script>
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