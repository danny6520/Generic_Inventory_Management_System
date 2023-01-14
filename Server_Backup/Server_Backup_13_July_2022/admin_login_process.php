<?php
session_start(); 
include('db_connection/inventory_management_db_connect.php');
if(isset($_POST['submit']))
{

    $email=$_POST['email'];
	$password=$_POST['password'];
	
	$result=mysqli_query($conn, 'SELECT * from register_admin where admin_email="'.$email.'" AND admin_password="'.$password.'"');
	if(mysqli_num_rows($result)==1)
	{
			$_SESSION['login_admin_email']="$email";
          

	echo "<h1>Loading..Please Wait..!</h1>";
            echo "<script>alert('Login Successful..!')</script>";
		   echo "<script>location.href='add_company.php'</script>";

	}
	else{
		echo "<script>alert('User name or password is incorrect! Please login with your Admin Credentials!')</script>";
		echo "<script>location.href='index.html'</script>";
	}

}
	

	
?>
