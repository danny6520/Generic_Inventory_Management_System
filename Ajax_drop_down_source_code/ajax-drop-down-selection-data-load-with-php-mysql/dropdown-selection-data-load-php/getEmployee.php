<?php
include_once("include/db_connect.php");
if($_REQUEST['empid']) {
	$sql = "SELECT id, employee_name, employee_salary, employee_age 
	FROM employee 
	WHERE id='".$_REQUEST['empid']."'";
	$resultSet = mysqli_query($conn, $sql);	
	$empData = array();
	while( $emp = mysqli_fetch_assoc($resultSet) ) {
		$empData = $emp;
	}
	echo json_encode($empData);
} else {
	echo 0;	
}
?>