<?php include('includes/constant.php'); ?>
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
      
  <?php
      
        if ($_SESSION['company_id_for_db_update'] != $bharat_petrolium_company_id)
        {
          ?>
          <li class="nav-item">
            <a class="nav-link" href="add_customer.php">Add Customer </a>
          </li>
<?php
        }
      ?>

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
<?php
      
      if ($_SESSION['company_id_for_db_update'] == $bharat_petrolium_company_id)
      {
        ?>
      <li class="nav-item">
        <a class="nav-link" href="transaction_outbound.php">Sales<span class="sr-only">(current)</span></a>
      </li>

      <!--li class="nav-item">
        <a class="nav-link" href="add_to_inventory.php">Add to Inventory<span class="sr-only">(current)</span></a>
      </li -->


      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Add to Inventory</a>
        <div class="dropdown-menu" aria-labelledby="dropdown06">
        <a class="dropdown-item" href="add_to_inventory.php">New Inventory</a>
        <a class="dropdown-item" href="add_to_existing_inventory.php">Existing Inventory</a>
      </div>
      </li>


<?php
      }
      else {
        ?>
        <li class="nav-item">
          <a class="nav-link" href="transaction_outbound.php">Outbound Transaction<span class="sr-only">(current)</span></a>
        </li>
  <?php
      }
      ?>
      <?php
      
if ($_SESSION['company_id_for_db_update'] != $bharat_petrolium_company_id)
{
  ?>
      <li class="nav-item">
        <a class="nav-link" href="month_end_outbound_transfer.php">Month End Outbound Transfer<span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="transaction_inbound.php">Inbound Transaction<span class="sr-only">(current)</span></a>
      </li>
      <?php
}
?>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown06" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Reports</a>
        <div class="dropdown-menu" aria-labelledby="dropdown06">
        <?php
      
      if ($_SESSION['company_id_for_db_update'] != $bharat_petrolium_company_id)
      {
        ?>
          <a class="dropdown-item" href="transaction_outbound_report.php">Outbound Transaction Report</a>
          <a class="dropdown-item" href="transaction_inbound_report.php">Inbound Transaction Report</a>
          <a class="dropdown-item" href="company_customer_report.php">Customer Report</a>
          <?php
}
?>
          <a class="dropdown-item" href="company_product_report.php">Product Report</a>
          <a class="dropdown-item" href="inventory_report.php">Inventory Report</a>
          <?php
          if ($_SESSION['company_id_for_db_update'] != $bharat_petrolium_company_id)
      {
        ?>
         
          <a class="dropdown-item" href="billing.php">Billing</a>
          <a class="dropdown-item" href="unbilled.php">UnBilled Current Month</a>
          <?php
}
?>
          
          <a class="dropdown-item" href="final_bill.php">Final Bill</a>
          <?php
          if ($_SESSION['company_id_for_db_update'] != $bharat_petrolium_company_id)
      {
        ?>
          <a class="dropdown-item" href="unbilledDate.php">UnBilled Current Date</a>
          <?php
}
?>
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