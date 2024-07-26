<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
    <?php require 'partials/menu.php';?>    

    <div class="login-container">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title text-center mb-4">Iniciar sesión</h5>
                <form action="index.php" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Nombre de Usuario</label>
                        <input type="text" name="username" class="form-control" id="email" placeholder="Nombre de Usuario" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="********" required>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Iniciar sesión</button>
                    <?php
                        echo $message;
                    ?>
                </form>
            </div>
        </div>
    </div>

<!--

    <form action="index.php" method="post">
        <input type="text" name="username" id="">
        <input type="password" name="password" id="">
        <input type="submit" value="Log in">

    </form>
    

    <?php echo $scripts?>
</body>
</html>



