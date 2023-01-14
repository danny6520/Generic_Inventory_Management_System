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
      
      <li class="nav-item">
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
      <li class="nav-item active">
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
          <a class="dropdown-item" href="unbilled.php">UnBilled Current Month</a>
          <a class="dropdown-item" href="final_bill.php">Final Bill</a>
          <a class="dropdown-item" href="unbilledDate.php">UnBilled Current Date</a>
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
  <h1>Outbound Transaction</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_inv_user_email']; ?></font></b></h6>
  <h6>Your Organization: <b><font color="maroon">
  <?php echo $_SESSION['company_name_for_displaying']; ?>
  
  </font></b></h6>
  <hr>
  <div id="btntxtalign">
  <a href="transaction_outbound_other_dates.php"><button type="button" class="btn btn-primary">Transaction for other dates</button></a>
  <!--
  <br><br>
  <a href="transaction_outbound_next_month.php"><button type="button" class="btn btn-primary">Transfer Transaction to next month</button></a>
-->
</div><br>
  <div id="example3">
  <form id="myForm" action="transaction_outbound_process.php" method="POST">

    <label for="name">Select Customer name:</label>
    <select name="customer_id" class="form-control">  
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
   <!--
    <label for="date">Select Transaction Date:</label><br>
<input type="datetime-local" name="outbound_date" class="form-control">
    <br>
-->
    <label for="name">Select Product:</label><br>

    <div style="overflow-x:auto;">
<table border='1' cellspacing='10' cellpadding='20p'>
      <tr><th>Product Name</th><th>Available Quantity</th><th>Current price</th><th>Required Quantity</th><th>Price (₹)</th></tr>
                                 
<?php
//$sql3 ="SELECT pd.product_name, pd.product_id, pd.quantity, ud.user_email, ud.user_company_id, cpm.company_id, cpm.product_id FROM product_details pd, user_details ud, company_product_mapping cpm WHERE ud.user_email='$_SESSION[login_inv_user_email]' AND ud.user_company_id=cpm.company_id AND cpm.product_id=pd.product_id";  
$sql3 = "SELECT product_id, product_name, quantity, current_rate FROM product_details WHERE created_user_company_id = '$_SESSION[company_id_for_db_update]' AND status = 'y'";
//echo $sql;
$random=1;
if($result=$conn->query($sql3))
{
if($result->num_rows)
{
while($row=$result->fetch_object())
{
 

echo "<tr><td><input type='checkbox' name='product_id[]' onclick='enable$random()' value=$row->product_id>&nbsp$row->product_name</td><td>$row->quantity</td>
<td>₹$row->current_rate<input type='hidden' class='iprice' value='$row->current_rate'></td>
<td><input class='iquantity' onchange='subTotal()' type='number' name='req_quantity[]' value='0' min='0' max='$row->quantity' id='duplicate_value$random' disabled></td>
<td class='itotal'><input type='hidden' name='product_price[]'></td>
</tr>";
$random++;
}
}
}



?>

</table>
<br>
<p><b>Total Price (₹): </b></p>
<font color="maroon">
<b><p id="gtotal" ></p></b>
</font>
    <br>
    
    <!--
    <input id="date" name="date" type="datetime-local">
<script type="text/javascript">
  document.getElementById('date').value = Date();
</script>
-->
    <center><button id="sub" type="submit" name="submit" class="btn btn-success">Submit</button></center>
  </form>
  <!--span id="result"></span>
<script src="jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="my_script.js" type="text/javascript"></script -->
</div>
</div>


<script>
var gt=0;
var iprice=document.getElementsByClassName('iprice');
var iquantity=document.getElementsByClassName('iquantity');
var itotal=document.getElementsByClassName('itotal');
var gtotal=document.getElementById('gtotal');

function subTotal()
{
  gt=0;
  for(i=0; i<iprice.length; i++)
  {
    itotal[i].innerText=(iprice[i].value)*(iquantity[i].value);
    gt=gt+(iprice[i].value)*(iquantity[i].value);
  }
  gtotal.innerText=gt;
}


subTotal();

  </script>







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