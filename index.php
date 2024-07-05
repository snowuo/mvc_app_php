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
                if (isset($_GET['mensaje'])) {
                    $mensaje = $_GET['mensaje'];
                    echo "<script type='text/javascript'>alert('$mensaje');</script>";
                } 
                
                $quejas = $controller->get_listado_quejas();
                include 'views/redeco.php';   
            break;
            case 'salir':
                $controller->logout();
            break;
            default:
             include 'views/error404.php';
            break;
        }

    }  
?>