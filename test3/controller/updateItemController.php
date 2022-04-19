<?php
    include_once "../config/dbconnect.php";

    $news_id=$_POST['news_id'];
    $p_name= $_POST['p_name'];
    $p_desc= $_POST['p_desc'];
    $category= $_POST['category'];

    if( isset($_FILES['newImage']) ){
        
        $location="uploadNews/";
        $img = $_FILES['newImage']['name'];
        $tmp = $_FILES['newImage']['tmp_name'];
        $dir = '../uploadNews/';
        $ext = strtolower(pathinfo($img, PATHINFO_EXTENSION));
        $valid_extensions = array('jpeg', 'jpg', 'png', 'gif','webp');
        $image =rand(1000,1000000).".".$ext;
        $final_image=$location. $image;
        if (in_array($ext, $valid_extensions)) {
            $path = UPLOAD_PATH . $image;
            move_uploaded_file($tmp, $dir.$image);
        }
    }else{
        $final_image=$_POST['existingImage'];
    }
    $updateItem = mysqli_query($conn,"UPDATE news SET 
        news_title='$p_name', 
        description='$p_desc', 
        category_id=$category,
        feature_image='$final_image' 
        WHERE news_id=$news_id");


    if($updateItem)
    {
        echo "true";
    }
    // else
    // {
    //     echo mysqli_error($conn);
    // }
?>