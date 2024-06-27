<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu; ?>    
    <div class="card text-center">
        <div class="card-header">
            <h1>Quejas</h1>
        </div>
        <div class="card-body">
            <a href="http://localhost/app_php/index.php?action=alta_queja" class="btn btn-primary">Registrar Queja</a>
        </div>
    </div>
    

    <?php echo $scripts?>
</body>
</html>