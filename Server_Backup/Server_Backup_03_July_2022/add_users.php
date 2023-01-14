<?php
session_start();
$login_admin_email_for_session = $_SESSION['login_admin_email'];
if($_SESSION['login_admin_email']=$login_admin_email_for_session)
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
    <title>Add Users </title>

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
      <li class="nav-item">
        <a class="nav-link" href="add_company.php">Add Company <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="add_users.php">Add Users </a>
      </li>
      <!--
      <li class="nav-item">
        <a class="nav-link" href="add_customer.php">Add Customer </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="add_products.php">Add Products </a>
      </li>
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
  <a href="admin_logout_process.php"> <button type="button" class="btn btn-danger">LOGOUT</button></a>
  </div>
</nav>


</div>
<div class="container">
  <h1>Add Users</h1>
  <h6>Logged in as: <b><font color="maroon"><?php echo $_SESSION['login_admin_email']; ?></font></b></h6><hr>
  <div id="example3">
  <form action="add_users_process.php" method="POST">
  <label for="name">User name:</label>
    <input type="text" name="user_name" class="form-control" placeholder="Enter user name" /required>
    <br>
    <label for="name">User Email:</label>
    <input type="email" name="user_email" class="form-control" placeholder="Enter user email" /required>
    <br>
    <label for="name">Password:</label>
    <input type="password" name="user_password" class="form-control" placeholder="Create new password" /required>
    <br>
    <label for="name">Select Company name:</label>
    <select name="company_name" class="form-control">                                 
<?php
$sql ="SELECT * FROM company_details where status='y' AND created_by='$_SESSION[login_admin_email]'";  
$result = $conn->query($sql);
if ($result->num_rows > 0) {
while($row=$result->fetch_assoc())
{
$company_id=$row['company_id'];
$company_name=$row['company_name'];
?>

<option value="<?php echo $company_id; ?>"> <?php echo $company_name; ?> </option>
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
    <label for="user_designation">User Designation:</label>
    <select name="user_designation" id="user_designation" class="form-control">
  <option value="Employee">Employee</option>
  <option value="Manager">Manager</option>
  <option value="Accountant">Accountant</option>
  <option value="Consultant">Consultant</option>
  <option value="Administrator">Adminstrator</option>
  <option value="Others">Others</option>
</select>
    <br>
    <label for="user_role">Select User Role:</label>
    <select name="user_role" id="user_role" class="form-control">
  <option value="Admin">Admin (Full access)</option>
  <!-- <option value="System_Admin">System Admin</option> -->
  <option value="Viewer">Viewer (Limited access)</option>
  
</select>
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
    echo "<script> location.href='index.html'</script>";
}
?>