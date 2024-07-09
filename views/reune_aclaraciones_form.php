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
                   <form id = "form_aclaraciones">
                   <table class="table table-bordered">
                       <tr>
                           <td class="text-center w-50">
                           <label for="AclaracionDenominacion">Denominación:</label>
                               <input type="text" name="AclaracionDenominacion" id="AclaracionDenominacion" value = "Sefi Estratégicos, S.A.P.I. de C.V., SOFOM, E.N.R." readonly>
                           </td>
                           <td class="text-center w-50">
                               <label for="AclaracionSector">Sector:</label>
                               <input type="text" name="AclaracionSector" id="AclaracionSector" value = "Sociedades Financieras de Objeto Múltiple E.N.R." readonly>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="AclaracionTrimestre ">Trimestre a informar:</label>
                               <select name="AclaracionTrimestre " id="AclaracionTrimestre ">
                                    <option value="1">Primer Trimestre</option>
                                    <option value="2">Segundo Trimestre</option>
                                    <option value="3">Tercer Trimestre</option>
                                    <option value="4">Cuarto Trimestre</option>
                               </select>
                           </td>
                           <td class="text-center w-50">
                               <label for="AclaracionNumero">Numero de Consultas :</label>
                               <input type="number" name="AclaracionNumero" id="AclaracionNumero" value = 1 readonly>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                           <label for="AclaracionFolioAtencion">Numero de folio de atención:</label>
                               <input type="text" name="AclaracionFolioAtencion" id="AclaracionFolioAtencion" readonly>
                           </td>
                           <td class="text-center w-50">
                               <label for="AclaracionEstadoConPend">Estado de concluido o Pendiente:</label>
                               <select name="AclaracionEstadoConPend" id="AclaracionEstadoConPend">
                                <option value="1">Pendiente</option>
                                <option value="2">Concluido</option>
                               </select>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                                <label for="AclaracionFechaReclamacion">Fecha de aclaración:</label>
                                <input type="date" name="AclaracionFechaReclamacion" id="AclaracionFechaReclamacion" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                           </td>
                           <td class="text-center w-50">
                                <label for="AclaracionFechaAtencion">Fecha de atención :</label>
                                <input type="date" name="AclaracionFechaAtencion" id="AclaracionFechaAtencion" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                           </td>
                       </tr>
                       <tr>
                           <td class="text-center w-50">
                               <label for="AclaracionMedioRecepcionCanal">Medio de recepción o canal:</label>
                               <select name="AclaracionMedioRecepcionCanal" id="AclaracionMedioRecepcionCanal" required>
                                    <option value="">Ocurrió un error al consultar el catalogo</option>
                               </select>
                           </td>
                           <td class="text-center w-50">
                           <label for="AclaracionProductoServicio">Producto y/o servicio :</label>
                                <select name="AclaracionProductoServicio" id="AclaracionProductoServicio" required>
                                <option value="">Ocurrió un error al consultar el catalogo</option>
                              </select>
                            </td>

                       </tr>
                       <tr>
                           <td class="text-center w-50">
                               <label for="AclaracionCausaMotivo">Causa o motivo:</label>                               
                               <select name="AclaracionCausaMotivo" id="AclaracionCausaMotivo" required>
                                    <option value="">Ocurrió un error al consultar el catalogo</option>
                               </select>
                           </td>
                           <td class="text-center w-50">
                                <label for="AclaracionFechaResolucion">Fecha de resolución:</label>
                                <input type="date" name="AclaracionFechaResolucion" id="AclaracionFechaResolucion" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                           </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="AclaracionFechaNotifiUsuario">Fecha de notificacion al usuario:</label>
                                <input type="date" name="AclaracionFechaNotifiUsuario" id="AclaracionFechaNotifiUsuario" pattern="\d{1,2}/\d{1,2}/\d{4}" required>
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionEntidadFederativa">Entidad Federativa</label>
                                <input type="text"  id="dspAclaracionEntidadFederativa" Value = "Selecciona el cdigo postal">                               
                                <input type="number" name="AclaracionEntidadFederativa" id="AclaracionEntidadFederativa" style="display:none">
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="AclaracionCodigoPostal">Código postal</label>
                                <input type="number" name="AclaracionCodigoPostal" id="AclaracionCodigoPostal" required>
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionMunicipioAlcaldia">Municipio </label>
                                <input type="text" id="dspAclaracionMunicipioAlcaldia" Value = "Selecciona el código postal">
                                <input type="number" style="display:none" name="AclaracionMunicipioAlcaldia" id="AclaracionMunicipioAlcaldia" >                                                  
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="AclaracionLocalidad">Localidad </label>
                                <input type="text" id="dspAclaracionLocalidad" Value = "Selecciona el código postal">
                                <input type="number" style="display:none" name="AclaracionLocalidad" id="AclaracionLocalidad" >    
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionColonia">Colonia </label>
                                <input type="text" id="dspAclaracionColonia" Value = "Selecciona el código postal">
                                <input type="number" style="display:none" name="AclaracionColonia" id="AclaracionColonia" >    
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="AclaracionMonetario">Monetario:</label>
                                <select name="AclaracionMonetario" id="AclaracionMonetario">
                                    <option value="SI">Si</option>
                                    <option value="NO">No</option>
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionMontoReclamado">Monto Reclamado:</label>
                                <input type="number" name="AclaracionMontoReclamado" id="AclaracionMontoReclamado">
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="AclaracionPori">PORI</label>
                                <select name="AclaracionPori" id="AclaracionPori">
                                    <option value="NO">No</option>
                                    <option value="SI">Si</option>
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionTipoPersona">Tipo de Persona:</label>
                                <select name="AclaracionTipoPersona" id="AclaracionTipoPersona">
                                    <option value="1">Persona Fisica</option>
                                    <option value="2">Persona Moral</option>
                                </select>
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                                <label for="AclaracionSexo">Sexo:</label>
                                <select name="AclaracionSexo" id="AclaracionSexo">
                                    <option value="H">Hombre</option>
                                    <option value="M">Mujer</option>
                                </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionEdad">Edad:</label>
                                <input type="number" name="AclaracionEdad" id="AclaracionEdad" required>                                
                            </td>
                       </tr>
                       <tr>
                            <td class="text-center w-50">
                            <label for="AclaracionNivelAtencion">Nivel de atención o contacto:</label>                              
                              <select name="AclaracionNivelAtencion" id="AclaracionNivelAtencion">
                                <option value="1">UNE</option>
                                <option value="2">Sucursal</option>
                                <option value="3">Centro de atención telefónica</option>
                                <option value="4">Oficinas de atención</option>
                              </select>
                            </td>
                            <td class="text-center w-50">
                                <label for="AclaracionFolioCondusef">Folio asignado por CONDUSEF</label>
                                <input type="text" name="AclaracionFolioCondusef" id="AclaracionFolioCondusef" required>
                            </td>
                       </tr>
                       <tr>
                                <td class="text-center w-50">
                                    <label for="AclaracionReversa">ReversaSIGE</label>
                                    <select name="AclaracionReversa" id="AclaracionReversa">
                                        <option value="0">NO es reversa SIGE (Gestión electrónica)</option>
                                        <option value="1">Si es reversa SIGE (Gestión electrónica)</option>
                                    </select>
                                </td>
                                <td class="text-center w-50">
                                    <label for="AclaracionOperacionExtranjero">Operación en el extranjero:</label>
                                    <select name="AclaracionOperacionExtranjero" id="AclaracionOperacionExtranjero">
                                        <option value="SI">Si</option>
                                        <option value="NO">No</option>
                                    </select>
                                </td>
                       </tr>
                       <!-- Más filas y celdas aquí -->
                   </table>
                       <button type="submit">Guardar queja</button>
                   </form>
               </div>
           </div>
         </div>
       </div>
        <?php
            echo $message;
        ?>
    </form>
    
    <script src="js/reune_aclaraciones_form.js"></script>
    <?php echo $scripts?>
</body>
</html>