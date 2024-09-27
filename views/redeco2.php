<?php
    $token = isset($_SESSION['token']) ? $_SESSION['token'] : '';
?><!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quejas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<?php require 'partials/menu.php'; echo $menu; ?>     
    <div class="container d-flex justify-content-center align-items-center">
        <form action="" id="form_queja">
            <div class="row">
                <div class="col"><label for="QuejasDenominacion">Denominación:</label></div>
                <div class="col"><input type="text" name="QuejasDenominacion" id="QuejasDenominacion" value = "<?php echo $denominacion?>" readonly></div>
                <div class="col"><label for="QuejasSector">Sector:</label></div>
                <div class="col"> <input type="text" name="QuejasSector" id="QuejasSector" value = "<?php echo $sector?>" readonly></div>
            </div>
            <div class="row">
                <div class="col"><p>Mes a informar</p></div>
                <div class="col">
                <select name="QuejasNoMes" id="QuejasNoTrim" class="form-control" style="width: 50%;">
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
                </div>
                <div class="col"><label for="QuejasNum">Número de quejas:</label></div>
                <div class="col"><input type="number" id="quejasNum" name="QuejasNum" value="1" readonly></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasNum">Folio de queja:</label></div>
                <div class="col"><input type="text" id="QuejasFolio" name="QuejasFolio" readonly></div>
                <div class="col"><label for="quejasFecRecepcion">Fecha de la queja (dd/mm/aaaa):</label></div>
                <div class="col"><input type="date" id="quejasFecRecepcion" name="QuejasFecRecepcion" pattern="\d{1,2}/\d{1,2}/\d{4}" required><br></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasMedio">Medio de recepción o canal</label></div>
                <div class="col"><select name="QuejasMedio" id="MedioId">
                            <option value="1">Al parecer hubo un error, intentalo mas tarde</option>
                        </select></div>
                <div class="col"><label for="QuejasNivelAT">Nivel de atención o contacto</label></div>
                <div class="col"><select name="QuejasNivelAT" id="nivelATSelect">
                            <option value="1">Al parecer hubo un error, intentalo mas tarde</option>
                        </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasProducto">Producto y/o servicio (máx. 12 caracteres):</label></div>
                <div class="col"><select id="QuejasProducto" name="QuejasProducto">
                            <?php foreach ($productos as $producto): ?>
                            <option value="<?= htmlspecialchars($producto['productId']) ?>">
                                <?= htmlspecialchars($producto['product']) ?>
                            </option>
                            <?php endforeach; ?>

                            </select></div>
                <div class="col"><label for="QuejasCausa">Causa de la queja (máx. 4 caracteres):</label></div>
                <div class="col"><select  id="causasId" name="QuejasCausa" style="width: 200px;">
                            <option value="0">Ocurrió un error</option>
                        </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasPORI">PORI</label></div>
                <div class="col"><select name="QuejasPORI" id="QuejasPORI">
                                <option value="NO">No</option>
                                <option value="SI">Si</option>                                
                            </select></div>
                <div class="col"><label for="QuejasEstatus">Estado de la queja</label></div>
                <div class="col"><select name="QuejasEstatus" id="QuejasEstatus">
                                <option value="1">Pendiente</option>
                                <option value="2">Concluido</option>
                            </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasCP">Este es Codigo postal:</label></div>
                <div class="col"><input type="number" id="QuejasCP" name="QuejasCP" required></div>
                <div class="col"><label for="QuejasColId">Colonia:</label></div>
                <div class="col"><select name="QuejasColId" id="QuejasColId">
                                        <option value="1">Selecciona el codigo postal</option>                            
                                    </select></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasLocId">Localidad:</label></div>
                <div class="col"><input type="number" id="QuejasLocId" name="QuejasLocId" value="1" readonly style="display: none">
                                 <input type="text" id="QuejasLocalidad" value = "localidad" readonly></div>
                <div class="col"><label for="QuejasMunId">Municipio o alcaldia:</label></div>
                <div class="col">
                                <input type="number" id="QuejasMunId" name="QuejasMunId" value="1" readonly style="display: none">
                                <input type="text" id="Quejasmunicipio" value = "Municipio" readonly>                         
                </div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasEstados">Entidad federativa:</label></div>
                <div class="col">
                                <input type="number" id="EstadosId" name="QuejasEstados" value="1" readonly  style="display: none">
                                <input type="text" id="Quejasestado" value = "Estado" readonly>
                </div>
                <div class="col"> <label for="QuejasTipoPersona">Tipo de persona:</label></div>
                <div class="col">
                            <select name="QuejasTipoPersona" id="QuejasTipoPersona">
                                <option value="1">Persona Fisica</option>
                                <option value="2">Persona Moral</option>
                            </select>
                </div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasSexo">Sexo:</label></div>
                <div class="col">
                <select name="QuejasSexo" id="QuejasSexo">
                                <option value="H">Hombre</option>
                                <option value="M">Mujer</option>
                            </select>
                </div>
                <div class="col"><label for="QuejasEdad">Edad:</label></div>
                <div class="col"><input type="number" id="QuejasEdad" name="QuejasEdad" required><br></div>
            </div>
            <div class="row">
                <div class="col"><label for="quejasFecResolucion">Fecha de resolución (dd/mm/aaaa):</label></div>
                <div class="col"><input type="date" id="quejasFecResolucion" name="QuejasFecResolucion" pattern="\d{1,2}/\d{1,2}/\d{4}" required><br></div>
                <div class="col"><label for="quejasFecNotificacion">Fecha en la que se notificó al usuario (dd/mm/aaaa):</label></div>
                <div class="col"><input type="date" id="quejasFecNotificacion" name="QuejasFecNotificacion" pattern="\d{1,2}/\d{1,2}/\d{4}" required></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasRespuesta">Sentido de la resolucón:</label></div>
                <div class="col">
                            <select name="QuejasRespuesta" id="QuejasRespuesta" required>
                                <option value="1">Pendiente</option>
                            </select>
                </div>
                <div class="col"><label for="QuejasNumPenal">Número de penalizacion:</label></div>
                <div class="col"><input type="number" id="QuejasNumPenal" name="QuejasNumPenal" required></div>
            </div>
            <div class="row">
                <div class="col"><label for="QuejasPenalizacion">tipo de penalizacion:</label></div>
                <div class="col">
                        <select name="QuejasPenalizacion" id="PenalizacionId">
                            <option value= 1>Contractuales - Cancelación del contrato</option>
                            <option value= 2>Contractuales - Reasignacion de cartera</option>
                            <option value= 3>Económicas - Multa</option>
                        </select>
                </div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
            <button class="btn btn-primary" type="submit">Guardar queja</button>
        </form>
    </div>

    

<script type="text/javascript">
        var token = "<?php echo htmlspecialchars($token, ENT_QUOTES, 'UTF-8'); ?>";
        
    </script>
    <?php echo $scripts?>
    <script src="js/menus.js"></script>

</body>
</html>