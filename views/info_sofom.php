<!DOCTYPE html>
<html lang="es-LA">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informacion de la sofom</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <?php require 'partials/menu.php';echo $menu;?>    
    <div class="container table-container">
    <table class="table table-bordered">
      <thead class="thead-dark">
        <tr>
          <th scope="col">Descripción</th>
          <th scope="col">Valor</th>
          <th scope="col">Acciones</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Denominación</td>
          <td style = "width : 70%"><?php echo $denominacion ?></td>
          <td><button class="btn btn-primary" onclick="openModal_denominacion()">Cambiar</button></td>
        </tr>
        <tr>
          <td>Sectór</td>
          <td style = "width : 70%"><?php echo $sector?></td>
          <td><button class="btn btn-primary" onclick="openModal_sector()">Cambiar</button></td>
        </tr>
        <!-- Puedes agregar más filas aquí -->
      </tbody>
    </table>

  <!-- Modal -->
  <div class="modal fade" id="modal_denominacion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Actualizar Denominación</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="updateForm">
            <div class="form-group">
              <label for="newValue">Nuevo Valor</label>
              <input type="text" class="form-control" id="newValue" name="nueva_denominacion" required>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal_denominacion()">Cancelar</button>
          <button type="button" class="btn btn-primary" onclick="submitForm_denominacion()">Aceptar</button>
        </div>
      </div>
    </div>
  </div>
<!-- modal para sector-->
  <div class="modal fade" id="modal_sector" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Actualizar Sector</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="update_sector_Form">
            <div class="form-group">
              <label for="newValue">Nuevo Valor</label>
              <input type="text" class="form-control" id="newValue" name="nuevo_sector" required>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeModal_sector()">Cancelar</button>
          <button type="button" class="btn btn-primary" onclick="submitForm_sector()">Aceptar</button>
        </div>
      </div>
    </div>
  </div>


  </div> 
    <?php echo $scripts?>
    <script src="js/info_sofom.js"></script>
</body>
</html>

