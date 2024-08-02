<?php
    $menu = '<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Api Condusef</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="index.php">Inicio</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Redeco
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="index.php?action=redeco">Quejas</a>
                    <a class="dropdown-item" href="index.php?action=consulta_quejas_redeco">Consultar quejas api</a>
                    <a class="dropdown-item" href="index.php?action=config_redeco">Configuración</a>
                </div>
            </li>
             <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Reune
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="index.php?action=reune_consultas">Consultas</a>
                    <a class="dropdown-item" href="index.php?action=reune_reclamaciones">Reclamaciones</a>
                    <a class="dropdown-item" href="index.php?action=reune_aclaraciones">Aclaraciones</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Configuración
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Usuarios</a>
                    <a class="dropdown-item" href="index.php?action=sepomex">Catalogo SEPOMEX</a>
                    <a class="dropdown-item" href="index.php?action=info_sofom">Informacion de la sofom</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="index.php?action=salir">Salir</a>
            </li>
        </ul>
    </div>
</nav>';

$scripts = '    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="js/alerta.js"></script>';

?>
