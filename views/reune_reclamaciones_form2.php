<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reclamaciones</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php'; echo $menu;?> 
    <div class="card">
                <div class="card-body"><button class="btn btn-primary">ayuda</button></div>
            </div>   
         <div class="container d-flex justify-content-center align-items-center" >

        <form action="" class="form_rec">
            <div class="row">
                <div class="col"><label for="RecDenominacion">Denominación:</label></div>
                <div class="col"><input class="form-control w-100" type="text" name="RecDenominacion" id="RecDenominacion" value = "<?php echo $denominacion?>" readonly></div>
                <div class="col"><label for="RecSector">Sector:</label></div>
                <div class="col"><input class="form-control w-100" type="text" name="RecSector" id="RecSector" value = "<?php echo $sector?>" readonly></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecTrimestre ">Trimestre a informar:</label></div>
                <div class="col"><select class="form-control w-100" name="RecTrimestre" id="RecTrimestre">
                                    <option value="1">Primer Trimestre</option>
                                    <option value="2">Segundo Trimestre</option>
                                    <option value="3">Tercer Trimestre</option>
                                    <option value="4">Cuarto Trimestre</option>
                               </select></div>
                <div class="col"><label for="RecNumero">Numero de Consultas :</label></div>
                <div class="col"><input class="form-control w-100" type="number" name="RecNumero" id="RecNumero" value = 1 readonly></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecFolioAtencion">Numero de folio de atención:</label></div>
                <div class="col"><input class="form-control w-100" type="text" name="RecFolioAtencion" id="RecFolioAtencion" readonly></div>
                <div class="col"><label for="RecEstadoConPend">Estado de concluido o Pendiente:</label></div>
                <div class="col"><select class="form-control w-100" name="RecEstadoConPend" id="RecEstadoConPend">
                                    <option value="1">Pendiente</option>
                                    <option value="2">Concluido</option>
                                </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecFechaReclamacion">Fecha de Reclamación:</label></div>
                <div class="col"><input class="form-control w-100" type="date" name="RecFechaReclamacion" id="RecFechaReclamacion" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
                <div class="col"><label for="RecFechaAtencion">Fecha de atención :</label></div>
                <div class="col"><input class="form-control w-100" type="date" name="RecFechaAtencion" id="RecFechaAtencion" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecMedioRecepcionCanal">Medio de recepción o canal:</label></div>
                <div class="col"><select class="form-control w-100" name="RecMedioRecepcionCanal" id="RecMedioRecepcionCanal" required>
                                <?php foreach ($catalogo_reune_cmr as $cmr): ?>
                                    <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                    <?= htmlspecialchars($cmr['Descripcion']) ?>                               
                                    </option>
                                <?php endforeach; ?>                                        
                                </select></div>
                <div class="col"><label for="RecProductoServicio">Producto y/o servicio :</label></div>
                <div class="col"><select class="form-control w-100" name="RecProductoServicio" id="RecProductoServicio" required>
                                    <?php foreach ($catalogo as $cmr): ?>
                                        <option value="<?= htmlspecialchars($cmr['codigo_producto']) ?>">
                                        <?= htmlspecialchars($cmr['tipo_credito']) ?>  
                                        </option>
                                    <?php endforeach; ?>
                                </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecCausaMotivo">Causa o motivo:</label></div>
                <div class="col"><select class="form-control w-100" name="RecCausaMotivo" id="RecCausaMotivo" style="width:200px" required>
                                        <option value="">Ocurrió un error al consultar el catalogo</option>
                                </select></div>
                <div class="col"><label for="RecFechaResolucion">Fecha de resolución:</label></div>
                <div class="col"><input class="form-control w-100" type="date" name="RecFechaResolucion" id="RecFechaResolucion" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecFechaNotifiUsuario">Fecha de notificacion al usuario:</label></div>
                <div class="col"><input class="form-control w-100" type="date" name="RecFechaNotifiUsuario" id="RecFechaNotifiUsuario" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
                <div class="col"><label for="RecEntidadFederativa">Entidad Federativa</label>                                             </div>
                <div class="col"><select class="form-control w-100" name="RecEntidadFederativa" id="RecEntidadFederativa">
                                <?php foreach ($entidades_federativas as $cmr): ?>
                                            <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                            <?= htmlspecialchars($cmr['descripcion']) ?> 
                                            </option>
                                    <?php endforeach; ?>
                                </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecCodigoPostal">Código postal</label></div>
                <div class="col"><input class="form-control w-100" type="number" name="RecCodigoPostal" id="RecCodigoPostal" required></div>
                <div class="col"><label for="RecMunicipioAlcaldia">Municipio: </label></div>
                <div class="col"><input class="form-control w-100" type="text" id="dspRecMunicipioAlcaldia" Value = "Selecciona el código postal">
                <input class="form-control w-100" type="number" style="display:none" name="RecMunicipioAlcaldia" id="RecMunicipioAlcaldia"></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecLocalidad">Localidad: </label></div>
                <div class="col"><input class="form-control w-100" type="text" id="dspRecLocalidad" Value = "Selecciona el código postal">
                <input class="form-control w-100" type="number" style="display:none" name="RecLocalidad" id="RecLocalidad"></div>
                <div class="col"><label for="RecColonia">Colonia: </label></div>
                <div class="col"><select class="form-control w-100" name="RecColonia" id="RecColonia">
                                    <option value="">Selecciona el código postal</option>
                                </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecMonetario">Monetario:</label></div>
                <div class="col"><select class="form-control w-100" name="RecMonetario" id="RecMonetario">
                                        <option value="NO">No</option>    
                                        <option value="SI">Si</option>                                        
                                    </select></div>
                <div class="col"><label for="RecMontoReclamado">Monto Reclamado:</label></div>
                <div class="col"><input class="form-control w-100" type="number" name="RecMontoReclamado" id="RecMontoReclamado"></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecImporteAbonado">Importe Abonado:</label></div>
                <div class="col"><input class="form-control w-100" type="number" name="RecImporteAbonado" id="RecImporteAbonado"></div>
                <div class="col"><label for="RecFechaAbonoImporte">Fecha de Abono:</label></div>
                <div class="col"><input class="form-control w-100" type="date" name="RecFechaAbonoImporte" id="RecFechaAbonoImporte" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecPori">PORI</label></div>
                <div class="col"><select class="form-control w-100" name="RecPori" id="RecPori">
                                    <option value="NO">No</option>
                                    <option value="SI">Si</option>                                    
                                </select></div>
                <div class="col"><label for="RecTipoPersona">Tipo de Persona:</label></div>
                <div class="col"><select class="form-control w-100" name="RecTipoPersona" id="RecTipoPersona">
                                    <option value="1">Persona Fisica</option>
                                    <option value="2">Persona Moral</option>
                                </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecSexo">Sexo:</label></div>
                <div class="col"><select class="form-control w-100" name="RecSexo" id="RecSexo">
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
                                </select></div>
                <div class="col"><label for="RecEdad">Edad:</label></div>
                <div class="col"><input class="form-control w-100" type="number" name="RecEdad" id="RecEdad" required></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecSentidoResolucion">Sentido de la Resolución</label></div>
                <div class="col"><select class="form-control w-100" name="RecSentidoResolucion" id="RecSentidoResolucion">
                                    <option value="1">Totalmente favorable al Usuario</option>
                                    <option value="2">Desfavorable al Usuario</option>
                                    <option value="3">Parcialmente favorable al Usuario</option>
                                </select></div>
                <div class="col"><label for="RecNivelAtencion">Nivel de atención o contacto:</label></div>
                <div class="col"><select class="form-control w-100" name="RecNivelAtencion" id="RecNivelAtencion">
                                    <option value="1">UNE</option>
                                    <option value="2">Sucursal</option>
                                    <option value="3">Centro de atención telefónica</option>
                                    <option value="4">Oficinas de atención</option>
                                </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="RecFolioCondusef">Folio asignado por CONDUSEF</label></div>
                <div class="col"><input class="form-control w-100" type="text" name="RecFolioCondusef" id="RecFolioCondusef" required></div>
                <div class="col"><label for="RecReversa">ReversaSIGE</label></div>
                <div class="col"><select class="form-control w-100" name="RecReversa" id="RecReversa">
                                        <option value="0">NO es reversa SIGE (Gestión electrónica)</option>
                                        <option value="1">Si es reversa SIGE (Gestión electrónica)</option>
                                    </select></div>
            </div>
            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
        </div>
        <?php
            echo $message;
        ?>
    </form>
    
    <script src="js/reune_reclamaciones_form.js"></script>
    <?php echo $scripts?>
</body>
</html>