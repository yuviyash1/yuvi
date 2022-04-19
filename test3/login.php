
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="author" content="Bigyan Bista, Sushant Rahapal, Susant Basnet">
        <meta name="keywords" content="YC Kicks, Shoes">
        <meta name="description" content="Shoe Shop">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./assets/css/style.css"></link>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Admin Panel</title>
    </head>
    <body>
        <?php 
            include "./header.php";
        ?>
    
    <div class="container allContent-section">
        <div class="card-account card-container text-center">
            <h3>Login</h3>
            <hr>
            <img id="profile-img" class="profile-img-card" src="./assets/images/profile-pic.svg" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="./controller/loginValidateController.php" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" name="usernameemail" class="form-control" placeholder="Username /Email address" required autofocus>
                <input type="password" name="password" class="form-control" placeholder="Password" required>
                
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" name="login-submit">Sign in</button>
            </form><!-- /form -->
        </div><!-- /card-container -->
    </div><!-- /container -->
    
        
        <?php
    if (isset($_GET['error'])) {
        if ($_GET['error'] == "emptyfields") {
            echo '<script> alert("Empty fields")</script>';
        }
        else if ($_GET['error'] == "nouser") {
            echo '<script> alert("No such Username")</script>';
        }
        else if ($_GET['error'] == "noadmin") {
            echo '<script> alert("Login as an admin first!!")</script>';
        }
        else if ($_GET['error'] == "wrongpassword") {
            echo '<script> alert("Wrong Password")</script>';
        }
    }else if (isset($_GET['login']) && $_GET['login'] == "success") {
        echo '<script> alert("Login Successful")</script>';
    }
?> 
        <script type="text/javascript" src="./assets/js/ajaxWork.js"></script> 
        <script src="https://code.jquery.com/jquery-3.1.1.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
    </body>
</html>