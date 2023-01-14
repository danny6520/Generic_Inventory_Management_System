
  <?php
  //$sql3 = "SELECT tb.tr_bill_customer_id, tb.tr_bill_product_id, tb.tr_bill_outbound_quantity, tb.tr_bill_outbound_date_time, tb.tr_bill_inbound_quantity, tb.tr_bill_inbound_date_time, tb.tr_bill_user_company_id, pd.product_name, pd.product_id, cd.customer_id, cd.customer_name FROM transaction_bill tb, product_details pd, customer_details cd WHERE pd.product_id = tb.tr_bill_product_id AND cd.customer_id = tb.tr_bill_customer_id AND tb.tr_bill_user_company_id = '$_SESSION[company_id_for_db_update]'";
  /*
  $sql3 = "SELECT `tr_product_id`, tr_customer_id,tr_updated_date_time,DATE_FORMAT(tr_updated_date_time,'%d') dt,
  sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '07', `tr_product_quantity`, NULL)) as '07' ,
  sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '14', `tr_product_quantity`, NULL)) as '14' ,
  sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '25', `tr_product_quantity`, NULL)) as '25'
     from transaction_details GROUP by tr_product_id,tr_customer_id,`tr_updated_date_time`,dt";
     */
?>
<script>
  @import url(https://fonts.googleapis.com/css?family=Exo+2:200i);

:root {
  /* Base font size */
  font-size: 10px;   
  
  /* Set neon color */
  --neon-text-color: #f40;
  --neon-border-color: #08f;
}

body {
  font-family: 'Exo 2', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;  
  background: #000;
  min-height: 100vh;
}

h1 {
  font-size: 13rem;
  font-weight: 200;
  font-style: italic;
  color: #fff;
  padding: 4rem 6rem 5.5rem;
  border: 0.4rem solid #fff;
  border-radius: 2rem;
  text-transform: uppercase;
  animation: flicker 1.5s infinite alternate;     
}

h1::-moz-selection {
  background-color: var(--neon-border-color);
  color: var(--neon-text-color);
}

h1::selection {
  background-color: var(--neon-border-color);
  color: var(--neon-text-color);
}

h1:focus {
  outline: none;
}

/* Animate neon flicker */
@keyframes flicker {
    
    0%, 19%, 21%, 23%, 25%, 54%, 56%, 100% {
      
        text-shadow:
            -0.2rem -0.2rem 1rem #fff,
            0.2rem 0.2rem 1rem #fff,
            0 0 2rem var(--neon-text-color),
            0 0 4rem var(--neon-text-color),
            0 0 6rem var(--neon-text-color),
            0 0 8rem var(--neon-text-color),
            0 0 10rem var(--neon-text-color);
        
        box-shadow:
            0 0 .5rem #fff,
            inset 0 0 .5rem #fff,
            0 0 2rem var(--neon-border-color),
            inset 0 0 2rem var(--neon-border-color),
            0 0 4rem var(--neon-border-color),
            inset 0 0 4rem var(--neon-border-color);        
    }
    
    20%, 24%, 55% {        
        text-shadow: none;
        box-shadow: none;
    }    
}

</script>

<div id="example3">
  <form action="final_bill.php" method="POST">

  <label for="name">Select Report Type:</label><br>
  <input type="radio" id="daily_rep_id" name="report_filter_select" value="daily_rep" onclick="radio_daily_fn()" /required>
<label for="daily_rep">Daily report</label><br>
  <input type="radio" id="month_rep_id" name="report_filter_select" value="month_rep" onclick="radio_monthly_fn()" /required>
<label for="month_rep">Monthly report</label><br>
<input type="radio" id="year_rep_id" name="report_filter_select" value="year_rep" onclick="radio_yearly_fn()" /required>
<label for="year_rep">Yearly report</label><br>


<label for="date">Select Date</label><br>
<input type="date" name="rep_date" id="date_select" class="form-control"><br>

    <label for="name">Select Month:</label>
    <select name='month' class='form-control' id="month_select">
    <option value="01">January</option>
    <option value="02">February</option>
    <option value="03">March</option>
    <option value="04">April</option>
    <option value="05">May</option>
    <option value="06">June</option>
    <option value="07">July</option>
    <option value="08">August</option>
    <option value="09">September</option>
    <option value="10">October</option>
    <option value="11">November</option>
    <option value="12">December</option>
  </select>
  <br>

<label for="name">Select Year:</label>
    <select name="year" class="form-control" id="year_select">  
        
    <option value="2020">2020</option>
    <option value="2021">2021</option>
    <option value="2022">2022</option>
    <option value="2023">2023</option>
    <option value="2024">2024</option>
    <option value="2025">2024</option>
    <option value="2026">2026</option>
    <option value="2027">2027</option>
    <option value="2028">2028</option>
    <option value="2029">2029</option>
    <option value="2030">2030</option>
    <option value="2031">2031</option>
    
</select>
<br>
<center><button type="submit" name="submit" class="btn btn-success">Submit</button></center>




  </form>
  </div>
  <br><br><br>
  <?php
if(isset($_POST['submit']))
{

  $report_filter_select = $_POST['report_filter_select'];

  $bpl_profit = array();

  if($report_filter_select == "daily_rep")
{
  $rep_date = $_POST['rep_date'];
  ?>
  <h4><u>Daily Report:</u></h4>
  <h6>Date: <b><font color="maroon"> <?php echo $rep_date; ?></font></b></h6>
      <hr>
        <?php
}
else if($report_filter_select == "month_rep")
{
  $month = $_POST['month'];
  $year = $_POST['year'];

  $month_name = date("F", mktime(0, 0, 0, $month, 10));
  ?>
  <h4><u>Monthly Report:</u></h4>
  <h6>Month: <b><font color="maroon"> <?php echo $month_name; ?></font></b></h6>
        <h6>Year: <b> <font color="maroon"><?php echo $year; ?></font></b></h6><hr>
        <?php
}
else if($report_filter_select == "year_rep")
{
  $year = $_POST['year'];
  ?>
 <h4><u>Yearly Report:</u></h4>
        <h6>Year: <b> <font color="maroon"><?php echo $year; ?></font></b></h6><hr>
        <?php
}

/*  $month = $_POST['month'];
  $year = $_POST['year'];
  $rep_date = $_POST['rep_date'];
  $report_filter_select = $_POST['report_filter_select'];

  
  $month_name = date("F", mktime(0, 0, 0, $month, 10));
*/

  ?>
   
<div style="overflow-x:auto;">
<!--
<table border='1' cellspacing='10' cellpadding='20p'>
  <tr> <th>Product Name</th><th>Product Model</th><th>Current Rate</th><th>01</th><th>02</th><th>03</th><th>04</th><th>05</th><th>06</th><th>07</th><th>08</th><th>09</th><th>10</th><th>11</th><th>12</th><th>13</th><th>14</th><th>15</th><th>16</th><th>17</th><th>18</th><th>19</th><th>20</th><th>21</th><th>22</th><th>22</th><th>24</th><th>25</th><th>26</th><th>27</th><th>28</th><th>29</th><th>30</th><th>31</th><th>Total QTY</th><th>Total PRICE</th><th>Updated Date/Time</th></tr>
-->
<?php

  $sql3="SELECT 
pd.product_id,pd.product_name,pd.product_model,pp.current_rate, pp.current_rate, pp.mrp, td.tr_updated_date_time, 
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '01', `tr_product_quantity`, 0)) as 'one' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '02', `tr_product_quantity`, 0)) as 'two' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '03', `tr_product_quantity`, 0)) as 'three' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '04', `tr_product_quantity`, 0)) as 'four' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '05', `tr_product_quantity`, 0)) as 'five' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '06', `tr_product_quantity`, 0)) as 'six' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '07', `tr_product_quantity`, 0)) as 'seven' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '08', `tr_product_quantity`, 0)) as 'eight' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '09', `tr_product_quantity`, 0)) as 'nine' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '10', `tr_product_quantity`, 0)) as 'ten' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '11', `tr_product_quantity`, 0)) as 'eleven' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '12', `tr_product_quantity`, 0)) as 'twelve' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '13', `tr_product_quantity`, 0)) as 'thirteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '14', `tr_product_quantity`, 0)) as 'fourteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '15', `tr_product_quantity`, 0)) as 'fifteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '16', `tr_product_quantity`, 0)) as 'sixteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '17', `tr_product_quantity`, 0)) as 'seventeen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '18', `tr_product_quantity`, 0)) as 'eighteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '19', `tr_product_quantity`, 0)) as 'nineteen' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '20', `tr_product_quantity`, 0)) as 'twenty' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '21', `tr_product_quantity`, 0)) as 'twentyone' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '22', `tr_product_quantity`, 0)) as 'twentytwo' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '23', `tr_product_quantity`, 0)) as 'twentythree' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '24', `tr_product_quantity`, 0)) as 'twentyfour' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '25', `tr_product_quantity`, 0)) as 'twentyfive' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '26', `tr_product_quantity`, 0)) as 'twentysix' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '27', `tr_product_quantity`, 0)) as 'twentyseven' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '28', `tr_product_quantity`, 0)) as 'twentyeight' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '29', `tr_product_quantity`, 0)) as 'twentynine' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '30', `tr_product_quantity`, 0)) as 'thirty' ,
sum(IF(DATE_FORMAT(tr_updated_date_time,'%d') = '31', `tr_product_quantity`, 0)) as 'thirtyone' ,
sum( `tr_product_quantity`) as 'total_qty' , (sum( `tr_product_quantity`)*pp.mrp) as 'total_price' 
from transaction_details td, customer_details cd, product_details pd, product_pricing pp where td.tr_product_id = pd.product_id and pd.status ='y' and td.tr_customer_id = cd.customer_id AND pp.product_pricing_id = pd.product_id AND td.tr_user_company_id = '$_SESSION[company_id_for_db_update]'";
if($report_filter_select == "daily_rep")
{
  $sql3 = $sql3."AND date (td.tr_updated_date_time) = '$rep_date' group by pd.product_type, pd.product_id ,pd.product_name,pd.product_model,pp.current_rate,td.tr_updated_date_time";
}
else if($report_filter_select == "month_rep")
{
  $sql3 = $sql3."AND month (td.tr_updated_date_time) = '$month' AND year(td.tr_updated_date_time) = '$year' group by pd.product_type, pd.product_id ,pd.product_name,pd.product_model,pp.current_rate,td.tr_updated_date_time";
}
else if($report_filter_select == "year_rep")
{
  $sql3 = $sql3."AND year(td.tr_updated_date_time) = '$year' group by pd.product_type, pd.product_id ,pd.product_name,pd.product_model,pp.current_rate,td.tr_updated_date_time";
}
//echo $sql3;
//AND month (td.tr_updated_date_time) = '$month' AND year(td.tr_updated_date_time) = '$year' group by product_type, pd.product_id ,pd.product_name,product_model,current_rate,td.tr_updated_date_time
  
  //echo $sql3;
  /*
  echo "<h2>Report 1</h2>";
    if($result=$conn->query($sql3))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
     
      echo "<tr><td>$row->product_name</td><td>$row->product_model</td><td>$row->current_rate</td>
      <td>$row->one</td>
      <td>$row->two</td>
      <td>$row->three</td>
      <td>$row->four</td>
      <td>$row->five</td>
      <td>$row->six</td>
      <td>$row->seven</td>
      <td>$row->eight</td>
      <td>$row->nine</td>
      <td>$row->ten</td>
      <td>$row->eleven</td>
      <td>$row->twelve</td>
      <td>$row->thirteen</td>
      <td>$row->fourteen</td>
      <td>$row->fifteen</td>
      <td>$row->sixteen</td>
      <td>$row->seventeen</td>
      <td>$row->eighteen</td>
      <td>$row->nineteen</td>
      <td>$row->twenty</td>
      <td>$row->twentyone</td>
      <td>$row->twentytwo</td>
      <td>$row->twentythree</td>
      <td>$row->twentyfour</td>
      <td>$row->twentyfive</td>
      <td>$row->twentysix</td>
      <td>$row->twentyseven</td>
      <td>$row->twentyeight</td>
      <td>$row->twentynine</td>
      <td>$row->thirty</td>
      <td>$row->thirtyone</td>
<td>$row->total_qty</td>
<td>$row->total_price</td>
<td>$row->tr_updated_date_time</td>
</tr>";
     
    }
    }
    }
    */
?>
<!--
</table>
  -->
<table border='1' cellspacing='10' cellpadding='20p'>
  <tr> <th>Product Name</th><th>Product Model</th><th>Buying Price</th><th>MRP</th><th>Total QTY</th><th>Total PRICE</th><th>Updated Date/Time</th></tr>
  <?php
    //echo "<h2>Report 2</h2>";
    if($result=$conn->query($sql3))
    {
    if($result->num_rows)
    {
    while($row=$result->fetch_object())
    {
      echo "<tr><td>$row->product_name</td><td>$row->product_model</td><td>$row->current_rate</td><td>$row->mrp</td>
      <td>$row->total_qty</td>
<td>$row->total_price</td>
<td>$row->tr_updated_date_time</td>

</tr>";
$bpl_profit[] = ($row->mrp - $row->current_rate) * $row->total_qty;

    }
    }
    }
    $bpl_profit_for_display = array_sum($bpl_profit);
   
    echo "<b>Profit: <font color='green'>₹ ".$bpl_profit_for_display."</font></b>";
    
    
  }
?>

<script>
function radio_daily_fn() {
  var_daily = document.getElementById("daily_rep_id").value;
  if(var_daily == "daily_rep")
    {
      document.getElementById("date_select").disabled = false;
      document.getElementById("month_select").disabled = true;
      document.getElementById("year_select").disabled = true;
    }
}

function radio_monthly_fn() {
  var_monthly = document.getElementById("month_rep_id").value;
  if(var_monthly == "month_rep")
  {
    document.getElementById("date_select").disabled = true;
    document.getElementById("month_select").disabled = false;
    document.getElementById("year_select").disabled = false;
  }
}

function radio_yearly_fn() {
  var_yearly = document.getElementById("year_rep_id").value;
  if(var_yearly == "year_rep")
  {
    document.getElementById("date_select").disabled = true;
    document.getElementById("month_select").disabled = true;
    document.getElementById("year_select").disabled = false;
  }
}
  </script>

<?php

