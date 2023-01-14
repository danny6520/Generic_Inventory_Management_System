<?php session_start(); 
if(isset($_SESSION['login_admin_email']))
{
    
    session_destroy();
   
    echo "<h1>Logging you out...Please Wait..!</h1>";
    echo "<script>location.href='index.html'</script>";
   
    }
    else{
        echo "<script>location.href='index.html'</script>";
     
     
}
?>