<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu;?>  
    <div class="card"><div class="card-body"><button id="ayuda" class="btn btn-primary">Ayuda</button></div></div>  
    <div class="container d-flex justify-content-center align-items-center">    
        <form action="" class="form_consultas" id = "form_consultas">
            <div class="row p-1">
                <div class="col-3"><label for="InstitucionClave">Denominación:</label> </div>
                <div class="col-3"><input class="form-control w-100" type="text" name="InstitucionClave" id="InstitucionClave" value = "<?php echo $denominacion?>" readonly></div>
                <div class="col-3"><label for="Sector">Sector:</label></div>
                <div class="col-3"><input class="form-control w-100" type="text" name="Sector" id="Sector" value = "<?php echo $sector?>" readonly></div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultasTrim">Trimestre a informar:</label></div>
                <div class="col-3">                
                               <select class="form-control w-100" name="ConsultasTrim" id="ConsultasTrim">
                                    <option value="1">Primer Trimestre</option>
                                    <option value="2">Segundo Trimestre</option>
                                    <option value="3">Tercer Trimestre</option>
                                    <option value="4">Cuarto Trimestre</option>
                               </select>
                </div>
                <div class="col-3"><label for="NumConsultas">Numero de Consultas :</label></div>
                <div class="col-3"><input class="form-control w-100" type="number" name="NumConsultas" id="NumConsultas" value = 1 readonly></div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultasFolio">Numero de folio de atención:</label></div>
                <div class="col-3"><input class="form-control w-100" type="text" name="ConsultasFolio" id="ConsultasFolio" readonly></div>
                <div class="col-3"><label for="ConsultasEstatusCon">Estado de concluido o Pendiente:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="ConsultasEstatusCon" id="ConsultasEstatusCon">
                                <option value="1">Pendiente</option>
                                <option value="2">Concluido</option>
                               </select>
                </div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultasFecAten">Fecha de atención :</label></div>
                <div class="col-3"><input class="form-control w-100" type="date" name="ConsultasFecAten" id="ConsultasFecAten" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
                <div class="col-3"><label for="EstadosId">Entidad federativa:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="EstadosId" id="EstadosId">
                                    <?php foreach ($entidades_federativas as $cmr): ?>
                                            <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                            <?= htmlspecialchars($cmr['descripcion']) ?> 
                                            </option>
                                    <?php endforeach; ?>
                               </select>
                </div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultasFecRecepcion">Fecha de Consulta:</label></div>
                <div class="col-3"><input class="form-control w-100" type="date" name="ConsultasFecRecepcion" id="ConsultasFecRecepcion" required></div>
                <div class="col-3"><label for="MediosId">Medio de recepción o canal:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="MediosId" id="MediosId" required>
                               <?php foreach ($catalogo_reune_cmr as $cmr): ?>
                                    <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                    <?= htmlspecialchars($cmr['Descripcion'],ENT_QUOTES, 'UTF-8') ?> 
                               </option>
                               <?php endforeach; ?>
                               </select>
                </div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="Producto">Producto y/o servicio :</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="Producto" id="Producto"  required>
                                <?php foreach ($catalogo as $cmr): ?>
                                    <option value="<?= $cmr['codigo_producto'] ?>">
                                    <?= htmlspecialchars($cmr['tipo_credito']) ?>  
                               </option>
                               <?php endforeach; ?>
                              </select>
                </div>
                <div class="col-3"><label for="CausaId">Causa o motivo:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="CausaId" id="CausaId" style="width: 200px;">
                               <option value="">Ocurrió un error al consultar el catalogo</option>                               
                               </select>
                </div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultasCP" id = "lblcp">Código postal:</label></div>
                <div class="col-3"><input class="form-control w-100" type="number" name="ConsultasCP" id="ConsultasCP" required></div>
                <div class="col-3"><label for="ConsultasMpioId ">Municipio:</label></div>
                <div class="col-3">
                    <input class="form-control w-100" type="number" name="ConsultasMpioId" id="ConsultasMpioId" style="display:none"> 
                    <input class="form-control w-100" type="text"  id="dspConsultasMpioId" Value = "Selecciona el código postal" readonly>
                </div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultasLocId">Localidad:</label></div>
                <div class="col-3">
                    <input class="form-control w-100" type="number" name="ConsultasLocId" id="ConsultasLocId" style="display:none"> 
                    <input class="form-control w-100" type="text"  id="dspConsultasLocId" Value = "Selecciona el código postal" readonly>
                </div>
                <div class="col-3"><label for="ConsultasColId">Colonia:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="ConsultasColId" id="ConsultasColId">
                                    <option value = "">introduce el codigo postal</option>
                                </select>
                </div>
            </div>
            <div class="row p-1">
                <div class="col-3"><label for="ConsultascatnivelatenId">Nivel de atención o contacto:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="ConsultascatnivelatenId" id="ConsultascatnivelatenId">
                                <option value="1">UNE</option>
                                <option value="2">Sucursal</option>
                                <option value="3">Centro de atención telefónica</option>
                                <option value="4">Oficinas de atención</option>
                              </select>
                </div>
                <div class="col-3"> <label for="ConsultasPori">PORI:</label></div>
                <div class="col-3">
                <select class="form-control w-100" name="ConsultasPori" id="ConsultasPori" required>
                               <option value="NO">No</option>
                                <option value="SI">Si</option>                                
                               </select>
                </div>
            </div>
                <button class="btn btn-primary" type="submit">Guardar</button>
        </form>
    </div>
    
    <script src="js/reune_consultas_form.js"></script>
    <?php echo $scripts?>
</body>
</html>