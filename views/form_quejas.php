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

    <div class="container d-flex justify-content-center align-items-center" >
  <div class="card" style="width: 90%;">
    <div class="card-body">
        <div class="table-responsive">
            <form action="inicio.php" method="post">
            <table class="table table-bordered">
                <tr>
                    <td class="text-center w-50">
   
                            Mes a informar

                            <select name="QuejasNoTrim" id="QuejasNoTrim" class="form-control" style="width: 50%;">
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                                <option value="4">Abril</option>
                                <option value="5">Mayo</option>
                                <option value="6">Junio</option>
                                <option value="7">Julio</option>
                                <option value="8">Agosto</option>
                                <option value="9">Septiembre</option>
                                <option value="10">Octubre</option>
                                <option value="11">Noviembre</option>
                                <option value="12">Diciembre</option>
                            </select>
               

                    </td >
                    <td class="text-center w-50">
                        <label for="QuejasNum">Número de quejas:</label>
                        <input type="number" id="quejasNum" name="QuejasNum" value="1" readonly>
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                            <label for="QuejasNum">Folio de queja:</label>
                            <input type="number" id="QuejasFolio" name="QuejasFolio" value="1" readonly>
                    </td>
                    <td class="text-center w-50">
                            <label for="quejasFecRecepcion">Fecha de la queja (dd/mm/aaaa):</label>
                            <input type="date" id="quejasFecRecepcion" name="QuejasFecRecepcion" pattern="\d{1,2}/\d{1,2}/\d{4}" required><br>

                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                    <label for="MedioId">Medio de recepción o canal</label>
                        <select name="MedioId" id="MedioId">
                            <option value="1">Al parecer hubo un error, intentalo mas tarde</option>
                        </select>
                   </td>
                    <td class="text-center w-50">
                    <label for="NivelATId">Nivel de atención o contacto</label>
                        <select name="NivelATId" id="nivelATSelect">
                            <option value="1">Al parecer hubo un error, intentalo mas tarde</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                        <label for="producto">Producto y/o servicio (máx. 12 caracteres):</label>
                        <select id="producto" name="product">
                        <?php
                            // Verificar si hay resultados de la consulta
                            if ($products) {
                                // Iterar sobre los resultados y generar las opciones del select
                                foreach ($products as $product) {
                                    echo '<option value="' . $product["productId"] . '">' . $product["product"] . '</option>';
                                }
                            } else {
                                // Si no hay resultados, mostrar un mensaje de error
                                echo '<option value="1">Al parecer hubo un error, inténtalo más tarde</option>';
                            }
                            ?>
                        </select>
                        
                   </td>
                    <td class="text-center w-50">
                        <label for="CausasId">Causa de la queja (máx. 4 caracteres):</label>
                        <input type="text" id="causasId" name="CausasId" maxlength="4">
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                        <label for="QuejasPORI">PORI</label>
                            <select name="QuejasPORI" id="QuejasPORI">
                                <option value="SI">Si</option>
                                <option value="NO">No</option>
                            </select><br>
                   </td>
                    <td class="text-center w-50">
                        <label for="QuejasEstatus">Estado de la queja</label>
                            <select name="QuejasEstatus" id="QuejasEstatus">
                                <option value="1">Pendiente</option>
                                <option value="2">Concluido</option>
                            </select><br>
                    </td>
                </tr>
                <!-- Sección de localidad -->
                <tr>
                    <td class="text-center w-50">
                    <label for="QuejasCP">Este es Codigo postal:</label>
                        <input type="number" id="QuejasCP" name="QuejasCP" required>

                   </td>
                    <td class="text-center w-50">
                        <label for="QuejasColId">Colonia:</label>
                        <select name="QuejasColId" id="QuejasColId">
                            <option value="1">Selecciona el codigo postal</option>                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                        <label for="QuejasLocId">Localidad:</label>
                        <input type="number" id="QuejasLocId" name="QuejasLocId" value="1" readonly style="display: none">
                        <input type="text" id="QuejasLocalidad" value = "localidad" readonly>
                   </td>
                   <td class="text-center w-50">
                   <label for="QuejasMunId">Municipio o alcaldia:</label>
                            <input type="number" id="QuejasMunId" name="QuejasMunId" value="1" readonly style="display: none">
                            <input type="text" id="Quejasmunicipio" value = "Municipio" readonly>                         
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">                        
                        <label for="EstadosId">Entidad federativa:</label>
                        <input type="number" id="EstadosId" name="EstadosId" value="1" readonly  style="display: none">
                        <input type="text" id="Quejasestado" value = "Estado" readonly>
                   </td>
                    <td class="text-center w-50">

                    </td>
                </tr><!-- Sección de localidad -->
                <tr><!-- Sección de identificación del clientes -->
                    <td class="text-center w-50">
                        
                   </td>
                    <td class="text-center w-50">

                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                        <label for="QuejasTipoPersona">Tipo de persona:</label>
                            <select name="QuejasTipoPersona" id="QuejasTipoPersona">
                                <option value="1">Persona Fisica</option>
                                <option value="2">Persona Moral</option>
                            </select>
                   </td>
                    <td class="text-center w-50">
                        <label for="QuejasSexo">Sexo:</label>
                            <select name="QuejasSexo" id="QuejasSexo">
                                <option value="H">Hombre</option>
                                <option value="M">Mujer</option>
                            </select>
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                        <label for="QuejasEdad">Edad:</label>
                          <input type="number" id="QuejasEdad" name="QuejasEdad" required><br>

                   </td>
                    <td class="text-center w-50">
                        <label for="quejasFecResolucion">Fecha de resolución (dd/mm/aaaa):</label>
                        <input type="date" id="quejasFecResolucion" name="QuejasFecResolucion" pattern="\d{1,2}/\d{1,2}/\d{4}" required><br>
                    </td>
                </tr>
                <tr>
                    <td class="text-center w-50">
                        <label for="quejasFecNotificacion">Fecha en la que se notificó al usuario (dd/mm/aaaa):</label>
                        <input type="date" id="quejasFecNotificacion" name="QuejasFecNotificacion" pattern="\d{1,2}/\d{1,2}/\d{4}" required><br>
                   </td>
                    <td class="text-center w-50">
                       <label for="QuejasRespuesta">Sentido de la resolucón:</label>
                            <select name="QuejasRespuesta" id="QuejasRespuesta">
                                <option value="1">Pendiente</option>
                            </select>
                    </td>
                </tr>
                <tr>                    
                    <td class="text-center w-50">
                        <label for="QuejasNumPenal">Número de penalizacion:</label>
                            <input type="number" id="QuejasNumPenal" name="QuejasNumPenal" required>
                </td>
                    <td class="text-center w-50">
                    <label for="PenalizacionId">tipo de penalizacion:</label>
                        <select name="PenalizacionId" id="PenalizacionId">
                            <option value= 1>Contractuales - Cancelación del contrato</option>
                            <option value= 2>Contractuales - Reasignacion de cartera</option>
                            <option value= 3>Económicas - Multa</option>
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
    

    <?php echo $scripts?>
</body>
</html>