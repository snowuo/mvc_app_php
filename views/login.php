<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php';?>    
    <form action="index.php" method="post">
        <input type="text" name="username" id="">
        <input type="password" name="password" id="">
        <input type="submit" value="Log in">
        <?php
            echo $message;
        ?>
    </form>
    

    <?php echo $scripts?>
</body>
</html>



