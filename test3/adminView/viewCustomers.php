<div >
  <h2>All Customers</h2>
  <table class="table ">
    <thead>
      <tr>
        <th>S.N.</th>
        <th>Username </th>
        <th>Email</th>
        <th>Contact Number</th>
        <th>Joining Date</th>
      </tr>
    </thead>
    <?php
      include_once "../config/dbconnect.php";
      $sql="SELECT * from users where isAdmin=0";
      $result=$conn-> query($sql);
      $count=1;
      if ($result-> num_rows > 0){
        while ($row=$result-> fetch_assoc()) {
           
    ?>
    <tr>
      <td><?=$count?></td>
      <td><?=$row["name"]?></td>
      <td><?=$row["email"]?></td>
      <td><?=$row["phone_number"]?></td>
      <td><?=$row["created_at"]?></td>
    </tr>
    <?php
            $count=$count+1;
           
        }
    }
    ?>
  </table>