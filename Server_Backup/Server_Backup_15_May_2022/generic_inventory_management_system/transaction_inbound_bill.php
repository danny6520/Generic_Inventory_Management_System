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
    <title>Outbound Transaction Report</title>

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
  <a href="transaction_inbound_report.php"><button type="button" class="btn btn-primary">Show all data</button></a>
</div>
<br>


<div id="example3">
  <form action="transaction_inbound_bill.php" method="POST">
    

    <label for="name">Select Customer:</label>
    <select name="customer_id" class="form-control">                                 
<?php
//$sql3 ="SELECT cd.customer_name, cd.customer_id, ud.user_email, ud.user_company_id, ccm.company_id, ccm.customer_id FROM customer_details cd, user_details ud, company_customer_mapping ccm WHERE ud.user_email='$_SESSION[login_inv_user_email]' AND ud.user_company_id=ccm.company_id AND ccm.customer_id=cd.customer_id";  
$sql3 = "SELECT customer_name, customer_id, created_user_company_id FROM customer_details WHERE created_user_company_id = '$_SESSION[company_id_for_db_update]'";
//echo $sql;
$result = $conn->query($sql3);
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
<label for="name">Select Month:</label>
    <select name="month" class="form-control">  
        
    <option value="01">January</option>
    <option value="02">February</option>
    <option value="03">March</option>
    <option value="04">April</option>
    <option value="05">May</option>
    <option value="06">June</option>
    <option value="07">July</option>
    <option value="08">August</option>
    <option value="09">September</option>
    <option value="10">October</option>
    <option value="11">November</option>
    <option value="12">December</option>
    
</select>
<br>

<label for="name">Select Year:</label>
    <select name="year" class="form-control">  
        
    <option value="2020">2020</option>
    <option value="2021">2021</option>
    <option value="2022">2022</option>
    <option value="2023">2023</option>
    <option value="2024">2024</option>
    <option value="2025">2024</option>
    <option value="2026">2026</option>
    <option value="2027">2027</option>
    <option value="2028">2028</option>
    <option value="2029">2029</option>
    <option value="2030">2030</option>
    <option value="2031">2031</option>
    
</select>
<br>
<center><button type="submit" name="submit" class="btn btn-success">Submit</button></center>

</form>

</div>
<br><br><br>


<div style="overflow-x:auto;">
  <table border='1' cellspacing='10' cellpadding='20p'>
  

<?php
if(isset($_POST['submit']))
{
  

   $customer_id = $_POST['customer_id'];
   $month = $_POST['month'];
   $year = $_POST['year'];

   $month_name = date("F", mktime(0, 0, 0, $month, 10));

$sql4 = "SELECT customer_id, customer_name from customer_details WHERE customer_id = '$customer_id'";
if($result=$conn->query($sql4))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
        ?>
        <h5>Customer Name: <b> <?php echo $row->customer_name; ?></b></h5>
        <h6>Month: <b><font color="maroon"> <?php echo $month_name; ?></font></b></h6>
        <h6>Year: <b> <font color="maroon"><?php echo $year; ?></font></b></h6><hr>
        <?php
    }
    }
    }
    echo " <tr>  <th>Customer Name</th><th>Product</th><th>Quantity</th><th>Updated Date / Time</th><th>Updated by</th> </tr>";
    $sql2="SELECT td.tr_customer_id, td.tr_product_id, td.tr_product_quantity, td.tr_updated_by, td.tr_user_company_id, td.tr_updated_date_time, td.tr_type, cd.customer_id, cd.customer_name, pd.product_id, pd.product_name FROM customer_details cd, product_details pd, transaction_details td WHERE td.tr_customer_id = '$customer_id' AND td.tr_customer_id=cd.customer_id AND td.tr_product_id=pd.product_id AND td.tr_user_company_id='$_SESSION[company_id_for_db_update]' AND month (td.tr_updated_date_time) = '$month' AND year(td.tr_updated_date_time) = '$year' AND td.tr_type='i'";
    //echo $sql2;
    if($result=$conn->query($sql2))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
    echo "<tr><td>$row->customer_name</td><td>$row->product_name</td><td>$row->tr_product_quantity</td><td>".substr("$row->tr_updated_date_time",0,19)."</td><td>$row->tr_updated_by</tr>";
    }
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