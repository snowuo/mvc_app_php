<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Condusef</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu; ?>    
    <div class="card text-center">
        <div class="card-header">
            <h1>Quejas</h1>
            <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Queja</th>
                    <th scope="col">Fecha de creación</th>
                    <th scope="col">Acciones</th>

                </tr>
            </thead>
            <tbody>
            <?php foreach($quejas as $queja): ?>
                <tr>                
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php echo htmlspecialchars($queja['id_quejas'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php echo htmlspecialchars($queja['data_queja'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php echo htmlspecialchars($queja['fcreacion_queja'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php if (!$queja['enviada']) { ?>
                                                                                            <a href="index.php?action=curl&id=<?php echo $queja['id_quejas']; ?>" class="btn btn-primary">Enviar</a>
                                                                                <?php }else{echo "Ya fue enviada";} ?>

                </tr>
            <?php endforeach;  ?>
            </tbody>
        </table>

                    

        </div>
        <div class="card-body">
            <a href="index.php?action=alta_queja" class="btn btn-primary">Registrar Queja</a>
        </div>
    </div>
    

    <?php echo $scripts?>
</body>
</html>