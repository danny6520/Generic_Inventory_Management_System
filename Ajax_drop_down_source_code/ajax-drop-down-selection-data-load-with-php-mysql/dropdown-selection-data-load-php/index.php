<?php 
include('include/header.php');
include_once("include/db_connect.php");
?>
<title>Drop-down Selection Data Load with ajax, PHP & MySQL</title>
<script type="text/javascript" src="script/getData.js"></script>
<?php include('include/container.php');?>

<div class="container">
	<h2>Drop-down Selection Data Load with ajax, PHP & MySQL</h2>		
	
	<div class="page-header">
        <h3>
			<select id="employee" class="form-control" >
				<option value="" selected="selected">Select Employee Name</option>
				<?php
				$sql = "SELECT id, employee_name, employee_salary, employee_age FROM employee";
				$resultset = mysqli_query($conn, $sql);
				while( $rows = mysqli_fetch_assoc($resultset) ) { 
				?>
				<option value="<?php echo $rows["id"]; ?>"><?php echo $rows["employee_name"]; ?></option>
				<?php }	?>
			</select>
        </h3>	
    </div>	
	<div class="hidden" id="errorMassage"></div>
	<table class="table table-striped hidden" id="recordListing">
		<thead>
		  <tr>
			<th>Id</th>
			<th>Name</th>
			<th>Age</th>
			<th>Salary</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
			<td id="empId"></td>
			<td id="empName"></td>
			<td id="empAge"></td>
			<td id="empSalary"></td>
		  </tr>
		</tbody>			
	</table>       
</div>
<?php include('include/footer.php');?>