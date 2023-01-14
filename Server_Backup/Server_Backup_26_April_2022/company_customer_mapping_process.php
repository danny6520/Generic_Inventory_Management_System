<?php
session_start();
$login_admin_email_for_session = $_SESSION['login_admin_email'];
if($_SESSION['login_admin_email']=$login_admin_email_for_session)
{
//start   
include('db_connection/inventory_management_db_connect.php');
?>
<?php
if(isset($_POST['submit']))
{
    $company_id=$_POST['company_id'];
    $customer_id=$_POST['customer_id'];


foreach($customer_id as $customer_mapping_id)
{
    $customer_mapping_uid = uniqid();

    $sql = "INSERT INTO company_customer_mapping (customer_mapping_id, company_id, customer_id, c_mapping_updated_by) VALUES ('$customer_mapping_uid','$company_id','$customer_mapping_id','$_SESSION[login_admin_email]')";
    $query_run = mysqli_query($conn, $sql);
    //echo $sql;
}
if($query_run)
{
    echo "<h1>Loading..Please Wait..!</h1>";
    echo "<script>alert('Data updated successfully..!')</script>";
    echo "<script>location.href='company_customer_mapping.php'</script>";
    }	
    else
    {
    echo "<h1>Loading..Please Wait..!</h1>";
    echo "<script>alert('Error..! Please contact your website admin..!')</script>";
    echo "<script>location.href='company_customer_mapping.php'</script>";
    echo "Insert data fail" . $sql . "<br>" . $conn->error;
    }

}
?>

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