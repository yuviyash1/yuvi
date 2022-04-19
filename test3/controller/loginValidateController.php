<?php

require '../config/dbconnect.php';

session_start();

if(isset($_POST['login-submit'])) {

    $uidmail = $_POST['usernameemail'];
    $password = $_POST['password'];

    if (empty($uidmail) || empty($password)) {
        header("Location: ../index.php?error=emptyfields");
        exit();
    }
    else {
        $sql = "SELECT * FROM users WHERE name=? OR email=?";
        $stmt = mysqli_stmt_init($conn);

        if (!mysqli_stmt_prepare($stmt, $sql)) {
            header("Location: ../index.php?error=sqlerror");
            exit();
        }
        else {
            mysqli_stmt_bind_param($stmt, "ss", $uidmail, $uidmail);
            mysqli_stmt_execute($stmt);
            $result=mysqli_stmt_get_result($stmt);

            if ($row=mysqli_fetch_assoc($result)) {
                $pwcheck=password_verify($password, $row['password']);
                if ($pwcheck == false) {
                    header("Location: ../index.php?error=wrongpassword");
                    exit();
                }
                else if ($pwcheck == true) {
                    $_SESSION['isAdmin'] = $row['isAdmin'];
                    $_SESSION['user_id'] = $row['user_id'];
                    $_SESSION['name'] = $row['name'];
                    $_SESSION['email']=$row['email'];
                    header("Location: ../profile.php?login=success");
                    exit();
                }
                else {
                    header("Location: ../login.php?error=wrongpassword");
                    exit();
                }
            }
            else {
                header("Location: ../login.php?error=nouser");
                exit();
            }
        }
    }

}

else {
    header("Location: ../index.php");
    exit();
}

?>