<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reclamaciones </title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu; ?>       

    <!--$reclamaciones-->
    <div class="card text-center">
        <div class="card-header">
            <div class="row">
                <div class="col"></div>
                <div class="col"><h1>Reclamaciones</h1></div>
                <div class="col"><a href="index.php?action=reune_reclamaciones_form" class="btn btn-primary">+</a></div>
            </div>
            
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
            <?php foreach($reclamaciones as $queja): ?>
                <tr>                
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo htmlspecialchars($queja['id'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php 
                                            $data = json_decode($queja['descripcion_queja'], true);
                                            if (!empty($data)){
                                                echo "<div class='container'>";
                                                echo "<div class='row'><div class='col'><h4>Contenido:</h4></div></div>";
                                                echo "<table class='table table-striped' border='1'>";
                                                    
                                                foreach ($data as $item) {
                                                  
                                                    echo "<tr>";
                                                    if (isset($item['RecTrimestre'])) {
                                                        echo "<td>Trimestre : " . htmlspecialchars($item['RecTrimestre']) . "</td>";
                                                    }else{echo "<td></td>";}        
                                                    if (isset($item['RecFolioAtencion'])) {
                                                        echo "<td>Folio : " . htmlspecialchars($item['RecFolioAtencion']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecFechaReclamacion'])) {
                                                        echo "<td>Fecha Recepción : " . htmlspecialchars($item['RecFechaReclamacion']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    echo "</tr><tr>";
                                                    if (isset($item['RecMedioRecepcionCanal'])) {
                                                        echo "<td>Medio : " . htmlspecialchars($item['RecMedioRecepcionCanal']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecProductoServicio'])) {
                                                        echo "<td>Producto : " . htmlspecialchars($item['RecProductoServicio']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecCausaMotivo'])) {
                                                        echo "<td>Causa : " . htmlspecialchars($item['RecCausaMotivo']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    echo "</tr><tr>";                                        
                                                    if (isset($item['RecEstadoConPend'])) {
                                                        echo "<td>Estatus : " . htmlspecialchars($item['RecEstadoConPend']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecTipoPersona'])) {
                                                        echo "<td>Tipo de persona: " . htmlspecialchars($item['RecTipoPersona']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecCodigoPostal'])) {
                                                        echo "<td>C.P. : " . htmlspecialchars($item['RecCodigoPostal']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    echo "</tr><tr>";
                                                    if (isset($item['RecEntidadFederativa'])) {
                                                        echo "<td>Estados : " . htmlspecialchars($item['RecEntidadFederativa']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecColonia'])) {
                                                        echo "<td>Col. ID : " . htmlspecialchars($item['RecColonia']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    if (isset($item['RecMunicipioAlcaldia'])) {
                                                        echo "<td>Mun. ID : " . htmlspecialchars($item['RecMunicipioAlcaldia']) . "</td>";
                                                    }else{echo "<td></td>";}
                                                    echo "</tr>";
                    
                                                }
                    
                                                // Cerrar la tabla HTML
                                                echo "<tbody></table></div>";
                                            } else {
                                                echo "No hay datos disponibles.";
                                            
                                            }

                    
                    ?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>">

                    <?php if (!empty($queja['respuesta_api'])):?>
                            <?php $data=json_decode($queja['respuesta_api'],true);
                            $errors = $data['errores'];
                            $message = $data['message'];?>
                             <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Folio</th>
                                            <th>Error</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($errors as $folio => $mensajes): ?>
                                            <?php foreach ($mensajes as $mensaje): ?>
                                                <tr>
                                                    <td><?php echo htmlspecialchars($folio); ?></td>
                                                    <td><?php echo htmlspecialchars($mensaje); ?></td>
                                                </tr>
                                            <?php endforeach; ?>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                                <div class="alert alert-warning mt-4">
                                    <strong>Mensaje:</strong> <?php echo htmlspecialchars($message); ?>
                                </div>
                        <?php endif?> 

                    </td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo htmlspecialchars($queja['f_creacion'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php if (!$queja['enviada']): ?>
                                                                            <?php if(empty($queja['respuesta_api'])):?>
                                                                                <a href="index.php?action=curl_reclamaciones&id=<?php echo $queja['id']; ?>" class="btn btn-primary">Enviar</a>
                                                                             <?php else: ?>
                                                                                <a href="index.php?action=modifica_reclamacion&id=<?php echo $queja['id']; ?>" class="btn btn-warning">Modificar</a>
                                                                            <?php endif; ?>
                                                                        <?php else: ?>
                                                                            <p class="btn btn-success">Enviada correctamente</p>  
                                                                        <?php endif;?>
                                                                                </td></tr>
            <?php endforeach;  ?>
            </tbody>
        </table>                  
        </div>

    <div class="card-body">
            <a href="index.php?action=reune_reclamaciones_form" class="btn btn-primary">Registrar Nueva</a>
        </div>
    <?php echo $scripts?>
</body>
</html>