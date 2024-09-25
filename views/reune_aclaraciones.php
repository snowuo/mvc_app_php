<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aclaraciones</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu; ?>       
    <!--$aclaraciones-->
    <div class="card text-center">
        <div class="card-header">
            <div class="row">
                <div class="col"></div>
                <div class="col"><h1>Aclaraciones</h1></div>
                <div class="col"><a href="index.php?action=reune_aclaraciones_form" class="btn btn-primary">+</a></div>
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
            <?php foreach($aclaraciones as $queja): ?>
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
                                if (isset($item['AclaracionTrimestre'])) {
                                    echo "<td>Trimestre : " . htmlspecialchars($item['AclaracionTrimestre']) . "</td>";
                                }else{echo "<td></td>";}        
                                if (isset($item['AclaracionFolioAtencion'])) {
                                    echo "<td>Folio : " . htmlspecialchars($item['AclaracionFolioAtencion']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionFechaAclaracion'])) {
                                    echo "<td>Fecha Recepción : " . htmlspecialchars($item['AclaracionFechaAclaracion']) . "</td>";
                                }else{echo "<td></td>";}
                                echo "</tr><tr>";
                                if (isset($item['AclaracionMedioRecepcionCanal'])) {
                                    echo "<td>Medio : " . htmlspecialchars($item['AclaracionMedioRecepcionCanal']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionProductoServicio'])) {
                                    echo "<td>Producto : " . htmlspecialchars($item['AclaracionProductoServicio']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionCausaMotivo'])) {
                                    echo "<td>Causa : " . htmlspecialchars($item['AclaracionCausaMotivo']) . "</td>";
                                }else{echo "<td></td>";}
                                echo "</tr><tr>";                                        
                                if (isset($item['AclaracionEstadoConPend'])) {
                                    echo "<td>Estatus : " . htmlspecialchars($item['AclaracionEstadoConPend']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionTipoPersona'])) {
                                    echo "<td>Tipo de persona: " . htmlspecialchars($item['AclaracionTipoPersona']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionCodigoPostal'])) {
                                    echo "<td>C.P. : " . htmlspecialchars($item['AclaracionCodigoPostal']) . "</td>";
                                }else{echo "<td></td>";}
                                echo "</tr><tr>";
                                if (isset($item['AclaracionEntidadFederativa'])) {
                                    echo "<td>Estados : " . htmlspecialchars($item['AclaracionEntidadFederativa']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionColonia'])) {
                                    echo "<td>Col. ID : " . htmlspecialchars($item['AclaracionColonia']) . "</td>";
                                }else{echo "<td></td>";}
                                if (isset($item['AclaracionMunicipioAlcaldia'])) {
                                    echo "<td>Mun. ID : " . htmlspecialchars($item['AclaracionMunicipioAlcaldia']) . "</td>";
                                }else{echo "<td></td>";}
                                echo "</tr>";

                            }

                            // Cerrar la tabla HTML
                            echo "<tbody></table></div>";
                        } else {
                            echo "No hay datos disponibles.";
                        
                        }
                    ?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo $queja['respuesta_api']?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo htmlspecialchars($queja['f_creacion'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php if (!$queja['enviada']) { ?>
                                                                                            <a href="index.php?action=curl_aclaraciones&id=<?php echo $queja['id']; ?>" class="btn btn-primary">Enviar</a>
                                                                                <?php }else{echo "Ya fue enviada";} ?>
                                                                                            </tr>
            <?php endforeach;  ?>
            </tbody>
        </table>                  
        </div>


    

    
    <div class="card-body">
            <a href="index.php?action=reune_aclaraciones_form" class="btn btn-primary">Registrar Nueva</a>
        </div>

    <?php echo $scripts?>
</body>
</html>