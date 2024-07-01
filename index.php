<?php
    session_start();
    $message = '';
    require 'controller.php';
    require_once 'views/partials/menu.php';
    $controller = new controller();
    $productos = $controller->menu_productos();
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
                echo $_SESSION['token'];
                break;
            
            case 'alta_queja':
                include 'views/form_quejas.php';            
                break;
            case 'save-form':
                echo 'Esto se envió a save-form: ';
                $json = file_get_contents('php://input');
                echo $json;
                $controller->set_queja($json);
                break;            
            case 'salir':
                $controller->logout();
            break;
            default:
            echo 'Sesión iniciada en index:default';
                break;
        }

    }  
?>