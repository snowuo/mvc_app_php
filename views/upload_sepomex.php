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

    <form action="index.php?action=sepomex" method="post" enctype="multipart/form-data">
        <label for="file">Selecciona un archivo XML:</label>
        <input type="file" name="file" id="file" accept=".xml">
        <input type="submit" name="submit" value="Subir Archivo">
    </form>
    

    <?php echo $scripts?>
</body>
</html>