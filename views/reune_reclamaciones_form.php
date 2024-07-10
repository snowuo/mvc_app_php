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
               <div class="table-responsive">
                   <form id = "form_rec">
                   <table class="table table-bordered">
                       <tr>
                           <td class="text-center w-50">
                           <label for="RecDenominacion">Denominación:</label>
                               <input type="text" name="RecDenominacion" id="RecDenominacion" value = "Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R." readonly>
                           </td>
                           <td class="text-center w-50">
                               <label for="RecSector">Sector:</label>
                               <input type="text" name="RecSector" id="RecSector" value = "Sociedades Financieras de Objeto Múltiple E.N.R." readonly>
                           </td>
                       </tr>
                       <tr>
                        <td class="text-center w-50">
                        <label for="RecTrimestre ">Trimestre a informar:</label>
                               <select name="RecTrimestre " id="RecTrimestre ">
                                    <option value="1">Primer Trimestre</option>
                                    <option value="2">Segundo Trimestre</option>
                                    <option value="3">Tercer Trimestre</option>
                                    <option value="4">Cuarto Trimestre</option>
                               </select>
                        </td>
                            <td class="text-center w-50">
                                <label for="RecNumero">Numero de Consultas :</label>
                                <input type="number" name="RecNumero" id="RecNumero" value = 1 readonly>
                            </td>
                       </tr>
                        <tr>
                            <td class="text-center w-50">
                                <label for="RecFolioAtencion">Numero de folio de atención:</label>
                                <input type="text" name="RecFolioAtencion" id="RecFolioAtencion" readonly>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecEstadoConPend">Estado de concluido o Pendiente:</label>
                                <select name="RecEstadoConPend" id="RecEstadoConPend">
                                    <option value="1">Pendiente</option>
                                    <option value="2">Concluido</option>
                                </select>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecFechaReclamacion">Fecha de Reclamación:</label>
                                <input type="date" name="RecFechaReclamacion" id="RecFechaReclamacion" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                            </td>
                            <td class="text-center w-50">
                            <label for="RecFechaAtencion">Fecha de atención :</label>
                            <input type="date" name="RecFechaAtencion" id="RecFechaAtencion" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecMedioRecepcionCanal">Medio de recepción o canal:</label>
                                <select name="RecMedioRecepcionCanal" id="RecMedioRecepcionCanal" required>
                                <?php foreach ($catalogo_reune_cmr as $cmr): ?>
                                    <option value="<?= htmlspecialchars($cmr['clave']) ?>">
                                    <?= htmlspecialchars($cmr['Descripcion']) ?>                               
                                    </option>
                                <?php endforeach; ?>
                                        
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecProductoServicio">Producto y/o servicio :</label>
                                <select name="RecProductoServicio" id="RecProductoServicio" required>
                                    <?php foreach ($catalogo as $cmr): ?>
                                        <option value="<?= htmlspecialchars($cmr['codigo_producto']) ?>">
                                        <?= htmlspecialchars($cmr['tipo_credito']) ?>  
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecCausaMotivo">Causa o motivo:</label>                               
                                <select name="RecCausaMotivo" id="RecCausaMotivo" required>
                                        <option value="">Ocurrió un error al consultar el catalogo</option>
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecFechaResolucion">Fecha de resolución:</label>
                                <input type="date" name="RecFechaResolucion" id="RecFechaResolucion" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecFechaNotifiUsuario">Fecha de notificacion al usuario:</label>
                                <input type="date" name="RecFechaNotifiUsuario" id="RecFechaNotifiUsuario" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecEntidadFederativa">Entidad Federativa</label>
                                <input type="text"  id="dspRecEntidadFederativa" Value = "Selecciona el cdigo postal">
                                <input type="number" name="RecEntidadFederativa" id="RecEntidadFederativa" style="display:none">                               
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecCodigoPostal">Código postal</label>
                                <input type="number" name="RecCodigoPostal" id="RecCodigoPostal" required>
                            </td>
                            <td class="text-center w-50">
                            <label for="RecMunicipioAlcaldia">Municipio: </label>
                                <input type="text" id="dspRecMunicipioAlcaldia" Value = "Selecciona el código postal">
                                <input type="number" style="display:none" name="RecMunicipioAlcaldia" id="RecMunicipioAlcaldia" ó>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecLocalidad">Localidad: </label>
                                <input type="text" id="dspRecLocalidad" Value = "Selecciona el código postal">
                                <input type="number" style="display:none" name="RecLocalidad" id="RecLocalidad" ó>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecColonia">Colonia: </label>
                                <select name="RecColonia" id="RecColonia">
                                    <option value="">Selecciona el código postal</option>
                                </select>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                    <label for="RecMonetario">Monetario:</label>
                                    <select name="RecMonetario" id="RecMonetario">
                                        <option value="SI">Si</option>
                                        <option value="NO">No</option>
                                    </select>
                            </td>
                            <td class="text-center w-50">
                                    <label for="RecMontoReclamado">Monto Reclamado:</label>
                                    <input type="number" name="RecMontoReclamado" id="RecMontoReclamado">
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecImporteAbonado">Importe Abonado:</label>
                                <input type="number" name="RecImporteAbonado" id="RecImporteAbonado">
                            </td>
                            <td class="text-center w-50">
                                <label for="RecFechaAbonoImporte">Fecha de Abono:</label>
                                <input type="date" name="RecFechaAbonoImporte" id="RecFechaAbonoImporte" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                            <label for="RecPori">PORI</label>
                                <select name="RecPori" id="RecPori">
                                    <option value="NO">No</option>
                                    <option value="SI">Si</option>                                    
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecTipoPersona">Tipo de Persona:</label>
                                <select name="RecTipoPersona" id="RecTipoPersona">
                                    <option value="1">Persona Fisica</option>
                                    <option value="2">Persona Moral</option>
                                </select>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecSexo">Sexo:</label>
                                <select name="RecSexo" id="RecSexo">
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecEdad">Edad:</label>
                                <input type="number" name="RecEdad" id="RecEdad" required>                                
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecSentidoResolucion">Sentido de la Resolución</label>
                                <select name="RecSentidoResolucion" id="RecSentidoResolucion">
                                    <option value="1">Totalmente favorable al Usuario</option>
                                    <option value="2">Desfavorable al Usuario</option>
                                    <option value="3">Parcialmente favorable al Usuario</option>
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="RecNivelAtencion">Nivel de atención o contacto:</label>                              
                                <select name="RecNivelAtencion" id="RecNivelAtencion">
                                    <option value="1">UNE</option>
                                    <option value="2">Sucursal</option>
                                    <option value="3">Centro de atención telefónica</option>
                                    <option value="4">Oficinas de atención</option>
                                </select>
                                
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="RecFolioCondusef">Folio asignado por CONDUSEF</label>
                                <input type="text" name="RecFolioCondusef" id="RecFolioCondusef" required>
                            </td>
                            <td class="text-center w-50">
                                    <label for="RecReversa">ReversaSIGE</label>
                                    <select name="RecReversa" id="RecReversa">
                                        <option value="0">NO es reversa SIGE (Gestión electrónica)</option>
                                        <option value="1">Si es reversa SIGE (Gestión electrónica)</option>
                                    </select>                                
                            </td>
                       </tr>
                       <!-- Más filas y celdas aquí -->
                   </table>
                       <button type="submit">Guardar Reclamación</button>
                   </form>
               </div>
           </div>
         </div>
       </div>
        <?php
            echo $message;
        ?>
    </form>
    
    <script src="js/reune_reclamaciones_form.js"></script>
    <?php echo $scripts?>
</body>
</html>