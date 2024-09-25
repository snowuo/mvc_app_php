<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu; ?>       

    <!--$consultas-->
    <div class="card text-center">
        <div class="card-header">
            <div class="row">
                <div class="col"></div>
                <div class="col"><h1>Consultas</h1></div>
                <div class="col"><a href="index.php?action=reune_consultas_form" class="btn btn-primary">+</a></div>
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
            <?php foreach($consultas as $queja): ?>
                <tr>                
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php echo htmlspecialchars($queja['id'])?></td>
                    <td id="<?php echo htmlspecialchars($queja['id'])?>"><?php 
                        $data = json_decode($queja['descripcion_queja'], true);
                        if (!empty($data)){
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
                                echo "<td>Trimestre : " . htmlspecialchars($item['ConsultasTrim']) . "</td>";        
                                echo "<td>Folio : " . htmlspecialchars($item['ConsultasFolio']) . "</td>";
                                echo "<td>Fecha Recepción : " . htmlspecialchars($item['ConsultasFecAten']) . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Medio : " . htmlspecialchars($item['MediosId']) . "</td>";                                
                                echo "<td>Producto : " . htmlspecialchars($item['Producto']) . "</td>";
                                echo "<td>Causa : " . htmlspecialchars($item['CausaId']) . "</td>";
                                echo "</tr><tr>";
                                        
                                echo "<td>Estatus : " . htmlspecialchars($item['ConsultasEstatusCon']) . "</td>";
                                echo "<td>Estados : " . htmlspecialchars($item['EstadosId']) . "</td>";
                                echo "<td>C.P. : " . htmlspecialchars($item['ConsultasCP']) . "</td>";
                                echo "</tr><tr>";
                                echo "<td>Col. ID : " . htmlspecialchars($item['ConsultasColId']) . "</td>";
                                echo "<td>Loc. ID : " . htmlspecialchars($item['ConsultasLocId']) . "</td>";
                                echo "<td>Mun. ID : " . htmlspecialchars($item['ConsultasMpioId']) . "</td>";
                                
                                
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
                                                                                            <a href="index.php?action=curl_consultas&id=<?php echo $queja['id']; ?>" class="btn btn-primary">Enviar</a>
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