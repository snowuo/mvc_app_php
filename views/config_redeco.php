<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Super Usuario Redeco</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    </style>
</head>
<body>
    <?php require 'partials/menu.php';echo $menu;?>    

        <div class="container d-flex justify-content-center align-items-center">
            <div class="card" style="width: 90%;">
                <div class="card-body">
                    <form method = "POST" action="index.php?action=superuser_redeco">
                        <p>Crear super usuario para Redeco</p>
                        <input type="text" name="nombre" id="" placeholder="Nombre de usuario">
                        <input type="password" name="password" id="" placeholder="Contraseña">
                        <button class = "btn btn-primary"type="submit">Crear Super Usuario</button>
                    </form>
                </div>
            </div>
        </div>

    <?php echo $scripts?>
</body>
</html>