<?php
session_start(); 
include('db_connection/inventory_management_db_connect.php');
if(isset($_POST['submit']))
{

    $email=$_POST['email'];
	$password=$_POST['password'];
	//$only_admin_access = "Admin";

	$result=mysqli_query($conn, 'SELECT * from user_details where user_email="'.$email.'" AND user_password="'.$password.'" AND user_role="Admin"');
	if(mysqli_num_rows($result)==1)
	{
			$_SESSION['login_inv_user_email']="$email";
			echo "<h1>Loading..Please Wait..!</h1>";
            echo "<script>alert('Login Successful..!')</script>";
		   	echo "<script>location.href='add_customer.php'</script>";

	}
	else {
		$result=mysqli_query($conn, 'SELECT * from user_details where user_email="'.$email.'" AND user_password="'.$password.'" AND user_role="Viewer"');
		if(mysqli_num_rows($result)==1)
		{
				$_SESSION['login_inv_user_email_viewer']="$email";
				echo "<h1>Loading..Please Wait..!</h1>";
				echo "<script>alert('Login Successful..!')</script>";
			   	echo "<script>location.href='transaction_outbound_report_viewer.php'</script>";
		}
		else {
			echo "<script>alert('User name or password is incorrect!')</script>";
			echo "<script>location.href='inventory_login.html'</script>";
		}

	}
	
}
	
?>
