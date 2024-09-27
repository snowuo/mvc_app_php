<!DOCTYPE html>
<html lang="es-LA">
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
            <div class="row">
                <div class="col"></div>
                <div class="col"><h1>Quejas</h1></div>
                <div class="col"><a href="index.php?action=alta_queja" class="btn btn-primary">Registrar Queja</a></div>
            </div>       
            
            <table class="table table-bordered table-striped">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Queja</th>
                    <th scope="col">Errores</th>
                    <th scope="col">Fecha de creación</th>
                    <th scope="col">Acciones</th>

                </tr>
            </thead>
            <tbody>
            <?php foreach($quejas as $queja): ?>
                <tr>                
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php echo htmlspecialchars($queja['id_quejas'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php                  
                    
                    //empieza
                    if(!empty($queja['descripcion_queja'])){
                        $data = json_decode($queja['descripcion_queja'], true);
                        //echo"tiene descripcion";
                    }else{
                        $data = json_decode($queja['data_queja'], true);
                        //echo"No tiene descripcion";
                    }
                    

// Verificamos si hay datos
                        if (!empty($data)) {
                            // Iniciar la tabla HTML
                            echo "<div class='container'>";
                            echo "<div class='row'><div class='col'><h4>Contenido:</h4></div></div>";
                            echo "<table class='table table-striped' border='1'>";
                           /* echo "<thead><tr>
                                    <th>Denominación</th>
                                    <th>Sector</th>
                                    <th>Sector</th>
                                </tr></thead><tbody>";*/

                            // Recorrer cada elemento del array
                            foreach ($data as $item) {
                                echo "<tr>";
                                echo "<td>No Mes : " . (isset($item['QuejasNoMes']) ? htmlspecialchars($item['QuejasNoMes']) : '') . "</td>";
                                echo "<td>Folio : " . (isset($item['QuejasFolio']) ? htmlspecialchars($item['QuejasFolio']) : '') . "</td>";
                                echo "<td>Fecha Recepción : " . (isset($item['QuejasFecRecepcion']) ? htmlspecialchars($item['QuejasFecRecepcion']) : '') . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Medio : " . (isset($item['QuejasMedio']) ? htmlspecialchars($item['QuejasMedio']) : '') . "</td>";
                                echo "<td>Nivel AT : " . (isset($item['QuejasNivelAT']) ? htmlspecialchars($item['QuejasNivelAT']) : '') . "</td>";
                                echo "<td>Producto : " . (isset($item['QuejasProducto']) ? htmlspecialchars($item['QuejasProducto']) : '') . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Causa : " . (isset($item['QuejasCausa']) ? htmlspecialchars($item['QuejasCausa']) : '') . "</td>";
                                echo "<td>Estatus : " . (isset($item['QuejasEstatus']) ? htmlspecialchars($item['QuejasEstatus']) : '') . "</td>";
                                echo "<td>C.P. : " . (isset($item['QuejasCP']) ? htmlspecialchars($item['QuejasCP']) : '') . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Col. ID : " . (isset($item['QuejasColId']) ? htmlspecialchars($item['QuejasColId']) : '') . "</td>";
                                echo "<td>Loc. ID : " . (isset($item['QuejasLocId']) ? htmlspecialchars($item['QuejasLocId']) : '') . "</td>";
                                echo "<td>Mun. ID : " . (isset($item['QuejasMunId']) ? htmlspecialchars($item['QuejasMunId']) : '') . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Estados : " . (isset($item['QuejasEstados']) ? htmlspecialchars($item['QuejasEstados']) : '') . "</td>";
                                echo "<td>Tipo Persona : " . (isset($item['QuejasTipoPersona']) ? htmlspecialchars($item['QuejasTipoPersona']) : '') . "</td>";
                                echo "<td>Fecha Resolución : " . (isset($item['QuejasFecResolucion']) ? htmlspecialchars($item['QuejasFecResolucion']) : 'N/A') . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Fecha Notificación : " . (isset($item['QuejasFecNotificacion']) ? htmlspecialchars($item['QuejasFecNotificacion']) : 'N/A') . "</td>";
                                echo "<td>Respuesta : " . (isset($item['QuejasRespuesta']) ? htmlspecialchars($item['QuejasRespuesta']) : 'N/A') . "</td>";
                                echo "<td>Número Penal : " . (isset($item['QuejasNumPenal']) ? htmlspecialchars($item['QuejasNumPenal']) : 'N/A') . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Penalización : " . (isset($item['QuejasPenalizacion']) ? htmlspecialchars($item['QuejasPenalizacion']) : '') . "</td>";
                                echo "<td></td><td></td>";
                                echo "</tr>";
                                
                            }

                            // Cerrar la tabla HTML
                            echo "<tbody></table></div>";
                        } else {
                            echo "No hay datos disponibles.";
                        }
                    //termina
                    
                    
                    ?>
                
                
                    </td>
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"> 

                        <?php if (!empty($queja['respuesta_api'])):?>
                            <?php $data=json_decode($queja['respuesta_api'],true);
                            $errors = $data['errors'];
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
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php echo htmlspecialchars($queja['fcreacion_queja'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id_quejas'])?>"><?php if (!$queja['enviada']) : ?>
                                                                                    <?php if(empty($queja['respuesta_api'])):?>
                                                                                            <a href="index.php?action=curl&id=<?php echo $queja['id_quejas']; ?>" class="btn btn-primary">Enviar</a>
                                                                                        <?php else: ?>
                                                                                            <a href="index.php?action=modifica_queja_redeco&id=<?php echo $queja['id_quejas']; ?>" class="btn btn-warning">Modificar</a>
                                                                                    <?php endif; ?>
                                                                                <?php else: ?>
                                                                                            <p class="btn btn-success">Enviada correctamente</p>
                                                                                <?php endif; ?>
                                                                                            </tr>
            <?php endforeach;  ?>
                </tbody>
                    </table>                  
                </div>

                <div class="card-body">
                    <a href="index.php?action=alta_queja" class="btn btn-primary">Registrar Queja</a>
                </div>
            </div>
    

    <?php echo $scripts;echo "hola si funciona"?>
</body>
</html><!--$queja['respuesta_api']-->