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
    <div class="container d-flex justify-content-center align-items-center mt-5" >
    <div class="container">
        <?php
        $data = json_decode($content, true);

        // Comenzar la tabla

        echo '  
  <div class="row bg-dark text-white">
        
        <div class="col">Folio</div>
        <div class="col-2">Año</div>
        <div class="col-2">Mes</div>
        <div class="col-1">Eliminar</div>
        <div class="col-1">Consultar</div>
    </div>';
        
        // Iterar sobre el array de "quejas"
        foreach ($data['quejas'] as $queja) {
            echo '<div class="row border">';
                
                echo '<div class="col">'. htmlspecialchars($queja['folio']) .'</div>';
                echo '<div class="col-2">'. htmlspecialchars($queja['year']) .'</div>';
                echo '<div class="col-2">'. htmlspecialchars($queja['month']) .'</div>';
                echo '<div class="col-1"> <form class = "form-inline" action="index.php?action=delete_queja" method = "POST">
                                            <input type="hidden" name="folio_queja" value="'.htmlspecialchars($queja['folio']).'">
                                            <button class="btn btn-white text-danger border-danger">X</button>
                                        </form></div>';
                echo '<div class="col-1"> <form class="form-inline">
                                            <button class="btn btn-primary">🔎</button>
                                        </form></div>';
                
            echo '</div>';   
        }
       ?>    
    </div>
    </div>
    <?php echo $scripts?>
</body>
</html>