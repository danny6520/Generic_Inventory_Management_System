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
    <title>Modify Products </title>

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
  <h1>Modify / Delete Products</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  
  </font></b></h6>
  
  <hr>
  <div id="btntxtalign">
  <a href="modify_products.php"><button type="button" class="btn btn-primary">Modify / Delete Products</button></a>
</div>
<br>

<?php
if(isset($_POST['submit']))
{
    ?>
    <div id="example4">
    <?php
$product_id=$_POST['product_id'];
$_SESSION['product_id_for_update'] = $product_id;

echo "<h4><u>You have selected: </u></h4>";
//$sql = "SELECT product_id, product_name, quantity, current_rate FROM product_details WHERE product_id = '$product_id'";
$sql = "SELECT pd.product_id, pd.product_name, pp.product_pricing_id, pp.quantity, pp.current_rate FROM product_details pd, product_pricing pp WHERE pd.product_id = '$product_id' AND pd.product_id=pp.product_pricing_id";
//echo $sql;
if($result=$conn->query($sql))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{
echo "Product Name: <b>".$row->product_name."</b><br>";
echo "Quantity: <b>".$row->quantity."</b><br>";
echo "Price: <b>₹ ".$row->current_rate."</b><br>";
}
}
}
?>
</div>
<br><br>
<div id="example3">
<h4><b>Enter new product details:</b></h4>
<form action="modify_products_process_done.php" method="POST">
    <label for="name">Product name:</label>
    <input type="text" name="product_name" class="form-control" placeholder="Enter Product Name" /required>
    <br>
    <!--
    <label for="name">Product Details:</label>
    <input type="text" name="product_details" class="form-control" placeholder="Enter Product Details" /required>
    <br>
    <label for="name">Product Model:</label>
    <input type="text" name="product_model" class="form-control" placeholder="Enter Product Model" /required>
    <br>
    <label for="name">Product Type:</label>
    <input type="text" name="product_type" class="form-control" placeholder="Enter Product Type" /required>
    <br>
-->
    <label for="name">Product Quantity:</label>
    <input type="text" name="product_quantity" class="form-control" placeholder="Enter Product Quantity" /required>
    <br>
    <!--
    <label for="name">Calculation unit:</label>
    <input type="text" name="calculation_unit" class="form-control" placeholder="Enter Calculation Unit" /required>
    <br>
-->
    <label for="name">Current rate: (Rate per product)</label>
    <input type="text" name="current_rate" class="form-control" placeholder="Enter Current Rate" /required>
    <br>
    <center><button type="submit" name="submit" class="btn btn-success">Update</button></center>
  </form>



</div>
<?php


}
?>

<?php
if(isset($_POST['submit_for_delete']))
{
    ?>
    <div id="example4">
    <?php
$product_id=$_POST['product_id'];
$_SESSION['product_id_for_delete'] = $product_id;

echo "<h4><u>You have selected: </u></h4>";
//$sql2 = "SELECT product_id, product_name, quantity, current_rate FROM product_details WHERE product_id = '$product_id'";
$sql2 = "SELECT pd.product_id, pd.product_name, pp.product_pricing_id, pp.quantity, pp.current_rate FROM product_details pd, product_pricing pp WHERE pd.product_id = '$product_id' AND pd.product_id=pp.product_pricing_id";
//echo $sql;
if($result=$conn->query($sql2))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{
echo "Product Name: <b>".$row->product_name."</b><br>";
echo "Quantity: <b>".$row->quantity."</b><br>";
echo "Price: <b>₹ ".$row->current_rate."</b><br><br>";
echo "<b>Are you sure, do you want to delete this data permanantly?</b>";
echo "<br><br>"
?>
<a href="delete_products.php"><button type="button" class="btn btn-danger">Yes (Delete)</button></a> &nbsp; &nbsp;<a href="modify_products.php"><button type="button" class="btn btn-warning">No (Cancel)</button></a>
<?php
}
}
}
?>
</div>
<br><br>
<?php
}
?>






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