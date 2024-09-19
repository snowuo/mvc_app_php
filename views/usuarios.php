<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuarios</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    </style>
</head>
<body>
    <?php require 'partials/menu.php';echo $menu;?>    

    <div class="container">
        <div class="row">
            <div class="col">Usuario</div>
            <div class="col">Fecha de actualización de token</div>
            <div class="col">Acciones</div>
        </div>

<?php
$usuarios = array();
$usuarios = $controller->get_user_list(); // Supongamos que devuelve un array de arrays

if (is_array($usuarios) && count($usuarios) > 0) { // Comprobamos que $usuarios es un array y tiene elementos
    // Recorrer los resultados y generar filas de la tabla
    foreach ($usuarios as $row) {
       echo "<div class='row'>";
            echo "<div class='col'>". htmlspecialchars($row['username']) ."</div>";
            echo "<div class='col'>". htmlspecialchars($row['last_update']) ."</div>";
            if ($row['tipo_usuario'] === '1') {
                echo "<div class='col'><form action='index.php?action=update_redeco_token' method='POST'>
                            <input type='hidden' name='username' value=". htmlspecialchars($row['username'], ENT_QUOTES) .">
                            <input type='hidden' name='id' value=". htmlspecialchars($row['id'], ENT_QUOTES) .">
                            <input type='hidden' name='password' value=". htmlspecialchars($row['password'], ENT_QUOTES) .">
                            <button class='btn btn-primary' type='submit'>Actualizar Token</button>
                        </form></div>"; 
            }
            if ($row['tipo_usuario'] === '2') {
                echo "<div class='col'><form action='index.php?action=update_reune_token' method='POST'>
                            <input type='hidden' name='username' value=". htmlspecialchars($row['username'], ENT_QUOTES) .">
                            <input type='hidden' name='id' value=". htmlspecialchars($row['id'], ENT_QUOTES) .">
                            <input type='hidden' name='password' value=". htmlspecialchars($row['password'], ENT_QUOTES) .">
                            <button class='btn btn-primary' type='submit'>Actualizar Token</button>
                        </form></div>";
            }
        echo "</div>";
    }
} else {
    echo "<div class='row'><div class='col'>No hay usuarios que requieran actualización de token.</div></div>";
}
?>


    </div>  

    <?php echo $scripts?>
    
</body>
</html>