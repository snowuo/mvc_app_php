<?php
require_once ('model.php');

class controller{
    private $model;
    public function __construct() {
        $this->model = new model();
    }

    public function login(){
        if(isset($_POST['username']) && isset($_POST['password']) ){
            if($this->model->log_in($_POST['username'],$_POST['password'])){
                header('location: index.php');
            }else{
                $message = 'Usuario o contraseña incorrectos';
                require('views/login.php');
            }
        }        
    }

    public function menu_productos(){
        return $this->model->get_productos();

    }

    public function logout(){
        $_SESSION = array();
        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
            );
        }
        session_destroy();
        header("location: index.php");
        exit();
    }

    public function set_queja($queja){
        $this->model->set_queja($queja);
    }

    public function get_listado_quejas(){
        return $this->model->get_listado_quejas();
    }
}
?>