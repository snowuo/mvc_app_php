<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Queja</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php';echo $menu;?> 


            <div class="container border p-3">
            <div class="row ">
                <div class="col-md-6">
                <h5>Identificación de la SOFOM <?php echo $_POST['queja'] ?? 'no se encontró';?></h5>
            </div>            
            </div>
            <div class="row">
            <div class="col">
                <label for="QuejasDenominacion">Denominación:</label>
                <input type="text" name="QuejasDenominacion" id="QuejasDenominacion" value = "<?php echo $denominacion?>" readonly>
            </div>
            <div class="col">
                
            <label for="QuejasSector">Sector:</label>
                        <input type="text" name="QuejasSector" id="QuejasSector" value = "<?php echo $sector?>" readonly>
            </div>
        </div>
        </div>    
    <?php echo $scripts?>
</body>
</html>
