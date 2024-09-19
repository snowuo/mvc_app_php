<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Conusef</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu; ?>       
        <div>
            
            <div></div>
        </div>
        <div class="container card-container">
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    
                    <div class="card-body">
                        <a href="index.php?action=redeco"><img src="imges/LOGO-API-REDECO.png" class="card-img-top" alt="Imagen 1" ></a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    
                    <div class="card-body">
                    <a href="index.php?action=reune"><img src="imges/LOGO-API-REUNE.png" class="card-img-top" alt="Imagen 2"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php echo $scripts?>
</body>
</html>