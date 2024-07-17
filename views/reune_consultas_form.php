<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu;?>    
         <div class="container d-flex justify-content-center align-items-center" >
         <div class="card" style="width: 90%;">
           <div class="card-body">
             <button id="ayuda" class="btn btn-primary">Ayuda</button>
               <div class="table-responsive">
                   <form id = "form_consultas">
                   <table class="table table-bordered">
                       <tr>
                           <td class="text-center w-50">
                           <label for="InstitucionClave">Denominación:</label>                           
                           <input type="text" name="InstitucionClave" id="InstitucionClave" value = "<?php echo $denominacion?>" readonly>
                           <td class="text-center w-50">
                               <label for="Sector">Sector:</label>
                               <input type="text" name="Sector" id="Sector" value = "<?php echo $sector?>" readonly>
                               
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultasTrim ">Trimestre a informar:</label>
                               <select name="ConsultasTrim " id="ConsultasTrim ">
                                    <option value="1">Primer Trimestre</option>
                                    <option value="2">Segundo Trimestre</option>
                                    <option value="3">Tercer Trimestre</option>
                                    <option value="4">Cuarto Trimestre</option>
                               </select>
                           </td>
                           <td class="text-center w-50">
                               <label for="NumConsultas ">Numero de Consultas :</label>
                               <input type="number" name="NumConsultas " id="NumConsultas " value = 1 readonly>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultasFolio">Numero de folio de atención:</label>
                               <input type="text" name="ConsultasFolio" id="ConsultasFolio" readonly>
                           </td>
                           <td class="text-center w-50">
                               <label for="ConsultasEstatusCon">Estado de concluido o Pendiente:</label>
                               <select name="ConsultasEstatusCon" id="ConsultasEstatusCon">
                                <option value="1">Pendiente</option>
                                <option value="2">Concluido</option>
                               </select>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultasFecAten">Fecha de atención :</label>
                               <input type="date" name="ConsultasFecAten" id="ConsultasFecAten" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                           </td>
                           <td class="text-center w-50">
                               <label for="EstadosId">Entidad federativa:</label>                               
                               <select name="EstadosId" id="EstadosId">
                                    <?php foreach ($entidades_federativas as $cmr): ?>
                                            <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                            <?= htmlspecialchars($cmr['descripcion']) ?> 
                                            </option>
                                    <?php endforeach; ?>
                               </select>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultasFecRecepcion">Fecha de Consulta:</label>
                               <input type="date" name="ConsultasFecRecepcion" id="ConsultasFecRecepcion" required>
                           </td>
                           <td class="text-center w-50">
                               <label for="MediosId">Medio de recepción o canal:</label>
                               <select name="MediosId" id="MediosId" required>
                               <?php foreach ($catalogo_reune_cmr as $cmr): ?>
                                    <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                    <?= htmlspecialchars($cmr['Descripcion']) ?> 
                               </option>
                               <?php endforeach; ?>
                               </select>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="Producto">Producto y/o servicio :</label>
                              <select name="Producto" id="Producto" required>
                                <?php foreach ($catalogo as $cmr): ?>
                                    <option value="<?= htmlspecialchars($cmr['codigo_producto']) ?>">
                                    <?= htmlspecialchars($cmr['tipo_credito']) ?>  
                               </option>
                               <?php endforeach; ?>
                              </select>
                           </td>
                           <td class="text-center w-50">
                               <label for="CausaId">Causa o motivo:</label>
                               <select name="CausaId" id="CausaId" style="width: 200px;">
                               <option value="">Ocurrió un error al consultar el catalogo</option>                               
                               </select>
                               
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultasCP" id = "lblcp">Código postal:</label>
                              <input type="number" name="ConsultasCP" id="ConsultasCP" required>
                           </td>
                           <td class="text-center w-50">
                               <label for="ConsultasMpioId ">Municipio:</label>                               
                               <input type="number" name="ConsultasMpioId" id="ConsultasMpioId" style="display:none"> 
                                <input type="text"  id="dspConsultasMpioId" Value = "Selecciona el código postal" readonly>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultasLocId">Localidad:</label>
                              <input type="number" name="ConsultasLocId" id="ConsultasLocId" style="display:none"> 
                                <input type="text"  id="dspConsultasLocId" Value = "Selecciona el código postal" readonly>
                           </td>
                           <td class="text-center w-50">
                               <label for="ConsultasColId">Colonia:</label>
                                <select name="ConsultasColId" id="ConsultasColId">
                                    <option value="">introduce el codigo postal</option>
                                </select>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="ConsultascatnivelatenId">Nivel de atención o contacto:</label>                              
                              <select name="ConsultascatnivelatenId" id="ConsultascatnivelatenId">
                                <option value="1">UNE</option>
                                <option value="2">Sucursal</option>
                                <option value="3">Centro de atención telefónica</option>
                                <option value="4">Oficinas de atención</option>
                              </select>
                           </td>
                           <td class="text-center w-50">
                               <label for="ConsultasPori">PORI:</label>
                               <select name="ConsultasPori" id="ConsultasPori" required>
                               <option value="NO">No</option>
                                <option value="SI">Si</option>                                
                               </select>
                           </td>
                       </tr>
                       <!-- Más filas y celdas aquí -->
                   </table>
                       <button class="btn btn-primary" type="submit">Guardar Aclaración</button>
                   </form>
               </div>
           </div>
         </div>
       </div>
        <?php
            echo $message;
        ?>
    </form>
    
    <script src="js/reune_consultas_form.js"></script>
    <?php echo $scripts?>
</body>
</html>