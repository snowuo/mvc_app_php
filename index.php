<?php
    session_start();
    $message = '';
    require 'controller.php';
    require_once 'views/partials/menu.php';
    $controller = new controller();
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
                echo 'Sesión iniciada en index';
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