<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu;?>    
         <div class="container d-flex justify-content-center align-items-center" >
         <div class="card" style="width: 90%;">
           <div class="card-body">
               <div class="table-responsive">
                   <form id = "form_queja">
                   <table class="table table-bordered">
                       <tr>
                           <td class="text-center w-50">
                           <label for="QuejasDenominacion">Denominación:</label>
                               <input type="text" name="QuejasDenominacion" id="QuejasDenominacion" value = "Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R." readonly>
                           </td>
                           <td class="text-center w-50">
                               <label for="QuejasSector">Sector:</label>
                               <input type="text" name="QuejasSector" id="QuejasSector" value = "Sociedades Financieras de Objeto Múltiple E.N.R." readonly>
                           </td>
                       </tr>
                       <!-- Más filas y celdas aquí -->
                   </table>
                       <button type="submit">Guardar queja</button>
                   </form>
               </div>
           </div>
         </div>
       </div>
        <?php
            echo $message;
        ?>
    </form>
    

    <?php echo $scripts?>
</body>
</html>