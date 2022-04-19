<?php

    include_once "../config/dbconnect.php";
    
    $p_id=$_POST['record'];
    $query="DELETE FROM news where news_id='$p_id'";

    $data=mysqli_query($conn,$query);

    if($data){
        echo"News Item Deleted";
    }
    else{
        echo"Not able to delete";
    }
    
?>