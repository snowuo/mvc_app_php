<?php
    $token = isset($_SESSION['token']) ? $_SESSION['token'] : '';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php';echo $menu?>    
    <div class="container d-flex justify-content-center align-items-center" >
    <div class="container">
        <?php
        $data = json_decode($content, true);

        // Comenzar la tabla

        echo '  
  <div class="row bg-dark text-white">
        <div class="col">Institución Clave</div>
        <div class="col">Folio</div>
        <div class="col">Año</div>
        <div class="col">Mes</div>
        <div class="col">Acción</div>
    </div>';
        
        // Iterar sobre el array de "quejas"
        foreach ($data['quejas'] as $queja) {
            echo '<div class="row">';
            echo  '<div class="col">'. htmlspecialchars($queja['institucionClave']) .'</div>';
            echo '<div class="col">'. htmlspecialchars($queja['folio']) .'</div>';
            echo '<div class="col">'. htmlspecialchars($queja['year']) .'</div>';
            echo '<div class="col">'. htmlspecialchars($queja['month']) .'</div>';
            echo '<div class="col"> <button class="btn btn-primary">Borrar</button>
            <button class="btn btn-primary">Consultar</button></div>';


            
        }
        
        
        
        
        ;?>
    
</div>
        </div>
    <?php echo $scripts?>
</body>
</html>