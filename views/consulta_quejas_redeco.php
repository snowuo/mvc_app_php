<?php
    $token = isset($_SESSION['token']) ? $_SESSION['token'] : '';
?>

<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quejas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php';echo $menu?>    
    <div class="container d-flex justify-content-center align-items-center" >
         <div class="card" style="width: 90%;">
           <div class="card-body">
            <form id="consultar_quejas" action="index.php?action=procesa_quejas_redeco" method = "post">
                <input type="number" name="queja_año" placeholder="Año de consulta" id="queja_año" require>
                <input type="number" name="queja_mes" id="queja_mes" placeholder="Mes de consulta" require>
                <button id="envia_consulta" class="btn btn-primary"   type="submit">Buscar</button>
            </form>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var token = "<?php echo htmlspecialchars($token, ENT_QUOTES, 'UTF-8'); ?>";
        
    </script>
    <?php echo $scripts?>
    <!--<script src="js/consulta_quejas_reune.js"></script>-->
    
    
</body>
</html>