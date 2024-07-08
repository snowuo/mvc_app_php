<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu?>    
    <div class="container d-flex justify-content-center align-items-center" >
         <div class="card" style="width: 90%;">
           <div class="card-body">
               <div class="table-responsive">
                   <table class="table table-bordered">
                    <tr>
                        <td class="text-center w-50"><a href="index.php?action=reune_consultas"><h2>Consultas</h2></a></td>
                        <td class="text-center w-50"><a href="index.php?action=reune_reclamaciones"><h2>Reclamaciones</h2></a></td>
                        <td class="text-center w-50"><a href="index.php?action=reune_aclaraciones"><h2>Aclaraciones</h2></a></td>
                    </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    

    <?php echo $scripts?>
</body>
</html>