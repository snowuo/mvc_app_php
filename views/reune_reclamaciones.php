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



    <div class="card-body">
            <a href="index.php?action=reune_reclamaciones_form" class="btn btn-primary">Registrar Nueva</a>
        </div>
    <?php echo $scripts?>
</body>
</html>