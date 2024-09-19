<?php
    $token = isset($_SESSION['token']) ? $_SESSION['token'] : '';
?>

<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quejast</title>
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
                echo /*'<div class="col-1"> <form class="form-inline" action = "index.php?action=modifica_queja_redeco" method="POST">
                                            <input type="hidden" name="queja" id="queja" value="'. htmlspecialchars($queja['folio']) .'">
                                            <button type="submit" class="btn btn-primary">🔎</button>
                                        </form></div>'*/
                                        '<button type="button" class="btn btn-primary open-modal-btn" /*data-toggle="modal" data-target="#Modal_info_quejas"*/ data-id="'.htmlspecialchars($queja['folio'], ENT_QUOTES, 'UTF-8').'">
  🔎
</button>';
                
            echo '</div>';   
        }
       ?>    
    </div>
    </div>

         <!-- Button trigger modal -->



<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalTitle">Título del Modal</h5>
        <!--<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>-->
      </div>
      <div class="modal-body" id="modalBody">
        Cuerpo del Modal
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
        var base_url = "<?php echo htmlspecialchars($controller->get_base_url(), ENT_QUOTES, 'UTF-8'); ?>";
        console.log(base_url)
    </script>
    <?php echo $scripts?>
    <script src="js/procesa_quejas_redeco.js"></script>
</body>
</html>