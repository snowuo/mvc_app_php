<?php
    session_start();
    $message = '';
    $redeco_message = '';
    require 'controller.php';
    require_once 'views/partials/menu.php';
    $controller = new controller();   
    $productos = $controller->get_productos();
    //revisamos la sesión vigente
    if(!isset($_SESSION['username'])){
        if(isset($_POST['username']) && isset($_POST['password']) ){
            $controller->login();
            
        }else{
            require('views/login.php');
        }
    }else{
        $action = $_GET['action'] ?? 'index';

        switch ($action) {
            case 'index':
                include 'views/main.php'; 
                break;
            
            case 'alta_queja':
                include 'views/form_quejas.php';            
                break;
            case 'save-form':
                echo 'La queja se guardó correctamente';
                $json = file_get_contents('php://input');                
                $controller->set_queja($json);
                break;       
            case 'curl':
                $id=$_GET['id'];                
                $controller->set_queja_api_curl($id);
            break;     
            case 'redeco':
              
                $quejas = $controller->get_listado_quejas();
                include 'views/redeco.php';   
                if (isset($_GET['mensaje'])) {
                    $mensaje = $_GET['mensaje'];
                    echo "<script type='text/javascript'>alert('$mensaje');</script>";
                } 
            break;
            case 'salir':
                $controller->logout();
            break;
            case 'reune_consultas':
                include 'views/reune_consultas.php';
            break;
            case 'reune_consultas_form':
                include 'views/reune_consultas_form.php';
            break;
            case 'reune_reclamaciones':
                include 'views/reune_reclamaciones.php';
            break;
            case 'reune_reclamaciones_form':
                include 'views/reune_reclamaciones_form.php';
            break;
            case 'reune':
                include 'views/reune.php';
            break;
            case 'reune_aclaraciones':
                include 'views/reune_aclaraciones.php';
            break;
            case 'reune_aclaraciones_form':
                include 'views/reune_aclaraciones_form.php';
            break;
            default:
             include 'views/error404.php';
            break;
        }

    }  
?>