<?php session_start(); 
if(isset($_SESSION['login_inv_user_email']))
{
    
    
    session_destroy();
   
    echo "<h1>Logging you out...Please Wait..!</h1>";
    echo "<script>location.href='inventory_login.html'</script>";
   
    }
    else{
        echo "<script>location.href='inventory_login.html'</script>";
     
     
}
if(isset($_SESSION['login_inv_user_email_viewer']))
    {
        session_destroy();
        echo "<h1>Logging you out...Please Wait..!</h1>";
    echo "<script>location.href='inventory_login.html'</script>";
    }
    else{
        echo "<script>location.href='inventory_login.html'</script>";
     
     
}
?>