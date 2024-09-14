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

    <!--$consultas-->
    <div class="card text-center">
        <div class="card-header">
            <h1>Consultas</h1>
            <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Errores</th>
                    <th scope="col">Fecha de creación</th>
                    <th scope="col">Acciones</th>

                </tr>
            </thead>
            <tbody>
            <?php foreach($consultas as $queja): ?>
                <tr>                
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo htmlspecialchars($queja['id'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo $queja['data_json']?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo $queja['respuesta_api']?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo htmlspecialchars($queja['f_creacion'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php if (!$queja['enviada']) { ?>
                                                                                            <a href="index.php?action=curl&id=<?php echo $queja['id']; ?>" class="btn btn-primary">Enviar</a>
                                                                                <?php }else{echo "Ya fue enviada";} ?>
                                                                                            </tr>
            <?php endforeach;  ?>
            </tbody>
        </table>                  
        </div>

    <div class="card-body">
            <a href="index.php?action=reune_consultas_form" class="btn btn-primary">Registrar Nueva</a>
        </div>
    <?php echo $scripts?>
</body>
</html>