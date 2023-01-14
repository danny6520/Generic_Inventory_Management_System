<?php
session_start();
$login_inv_user_email_for_session = $_SESSION['login_inv_user_email'];
if($_SESSION['login_inv_user_email']=$login_inv_user_email_for_session)
{
//start 
 include('db_connection/inventory_management_db_connect.php');
 if(isset($_POST['submit']))
 {
  //$product_name=$_POST['product_name'];
  //$product_details=$_POST['product_details'];
  //$product_model=$_POST['product_model'];
  //$product_type=$_POST['product_type'];
  $product_quantity=$_POST['product_quantity'];
  $product_id = $_POST['product_id'];
  //$calculation_unit=$_POST['calculation_unit'];
  //$current_rate=$_POST['current_rate'];


  //$product_uid = uniqid();

  $sql1 = "SELECT product_pricing_id, quantity from product_pricing WHERE product_pricing_id = '$product_id'";
  if($result=$conn->query($sql1))
  {
      if($result->num_rows)
      {
          while($row=$result->fetch_object())
          {
              $product_quantity_from_db = $row->quantity;
          }
      }
  }

  $product_quantity_update = $product_quantity + $product_quantity_from_db;
  $sql2 = "UPDATE product_pricing SET quantity = '$product_quantity_update' WHERE product_pricing_id = '$product_id'";




  if($conn->query($sql2) === TRUE)
    {
      echo "<h1>Loading..Please Wait..!</h1>";
      echo "<script>alert('Inventory updated successfully..!')</script>";
      echo "<script>location.href='add_to_inventory.php'</script>";
    }	
    else
    {
      echo "<h1>Loading..Please Wait..!</h1>";
      echo "<script>alert('Error..! Please contact your website admin..!')</script>";
      echo "<script>location.href='add_to_inventory.php'</script>";
      echo "Insert data fail" . $sql2 . "<br>" . $conn->error;
    }


 }









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