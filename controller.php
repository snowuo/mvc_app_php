<?php
require_once ('model.php');

class controller{
    private $model;
    private $base_url = 'https://api.condusef.gob.mx/';
    
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

    public function get_productos(){
        return $this->model->get_productos();
    }

    public function get_listado_entidades_federativas(){
        return $this->model->get_listado_entidades_federativas();
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

    public function update_enviada($id){
        $this->model->update_enviada($id);
    }

    public function get_reune_cmr(){
        return $this->model->get_reune_cmr();
    }

    public function get_reune_catalogo_producto_consulta(){
        try {
            return $this->model->get_reune_catalogo_producto_consulta();
        } catch (\Throwable $th) {
            error_log("Error en la funcion controlador get_reune_catalogo_producto_consulta");
            die("Error en la funcion controlador get_reune_catalogo_producto_consulta");
        }
    }

    public function get_reune_catalogo_producto_reclamacion(){
        try {
            return $this->model->get_reune_catalogo_producto_reclamacion();
        } catch (\Throwable $th) {
            error_log("Error en la funcion controlador get_reune_catalogo_producto_consulta");
            die("Error en la funcion controlador get_reune_catalogo_producto_consulta");
        }
    }

    public function get_causas($prod){
        return $this->model->get_causas($prod);
    }

    public function get_reune_catalogo_producto_aclaracion(){
        try {
            return $this->model->get_reune_catalogo_producto_aclaracion(); 
       } catch (\Throwable $th) {
            error_log("Error en la funcion controlador get_reune_catalogo_producto_consulta");
            die("Error en la funcion controlador get_reune_catalogo_producto_consulta");
        }
    }

    public function get_info_sofom(){
        return $this->model->get_info_sofom();
    }
    public function set_queja_api_curl($id){
                $endpoint = 'redeco/quejas';
                $url_queja = $this->base_url.$endpoint;
                $token = $_SESSION['token'];         
                $json = $this->model->get_queja_data($id);
                if(isset($json[0]['data_queja'])){
                    $data_queja=$json[0]['data_queja'];
                }
                $curl = curl_init();
                curl_setopt($curl,CURLOPT_URL,$url_queja);
                curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
                curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
                curl_setopt($curl,CURLOPT_HTTPHEADER,[
                    "Authorization: $token",
                    "Content-Type: application/json"
                ]);
                curl_setopt($curl,CURLOPT_POST,true);
                curl_setopt($curl,CURLOPT_POSTFIELDS,$data_queja);
                $response=curl_exec($curl);
                $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
                if ($response === false) {
                    $error = curl_error($curl);
                    curl_close($curl);
                    // Registrar los datos enviados y el error
                    error_log("Error en la solicitud cURL: $error");
                    error_log("Datos enviados: $data_queja");
                    die("Error en la solicitud cURL: $error");
                }
                
                curl_close($curl);
                if ($httpCode >= 400) {
                    // Registrar la respuesta y los datos enviados en caso de error
                    echo "Error http: $httpCode \n";
                    echo "Causa del error:  $response \n";
                    header('location: index.php?action=redeco&mensaje='.$httpCode.'+'.$response);  
                    error_log("Buscas este: Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
                    
                }else{
                    $this->model->update_enviada($id);
                    header('location: index.php?action=redeco&mensaje=Se+registró+correctamente');  
                    
                    
                }       
                      
                // Decodificar la respuesta JSON
                //$responseData = json_decode($response, true);
                
    }

    public function set_denominacion($valor){
        return $this->model->set_denominacion($valor);
    }
    public function set_sector($valor){
        return $this->model->set_sector($valor);
    }

    public function get_su_token_redeco(){
        return $this->model->get_su_token_redeco();
    }
    public function set_log($origen, $response){
        $this->model->set_log($origen, $response);
    }
    public function set_api_superuser($nombre,$password){
        $endpoint = 'auth/users/create-super-user/';
        $origen = 'redeco_set_api_superuser';
        //$url = $this->base_url.$endpoint;
        $url = 'http://localhost/mvc_app_php/index.php?action=prueba_su';
        echo $url;
        $token =  $this->get_su_token_redeco();
        $data = array(
                    "key"=>$token,
                    "username"=>$nombre,
                    "password"=>$password,
                    "confirm_password"=>$password,
                );
        $json = json_encode($data);
        echo "<br>".$json."<br>";
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$json);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($json))
        );
        $response = curl_exec($curl);
        $this->set_log($origen, $response);

        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($response === false) {
            $error = curl_error($curl);
            curl_close($curl);
            // Registrar los datos enviados y el error
            error_log("Error en la solicitud cURL: $error");
            error_log("Datos enviados: $json");
            die("Error en la solicitud cURL: $error");
        }
        curl_close($curl);
        if ($httpCode >= 400) {
            // Registrar la respuesta y los datos enviados en caso de error
            echo "Error http: $httpCode \n";
            echo "Causa del error:  $response \n";
            header('location: index.php?action=redeco&mensaje='.$httpCode.'+'.$response);  
            error_log("Super Usuario error al generar: Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
            
        }else{
            //$this->model->update_enviada($id);
            echo "<br>todo salio bien<br><br><br><br>";

            echo $response;
            //header('location: index.php?action=redeco&mensaje=Super+usuario+se+registró+correctamente');  
            
            
        }  


    }

    public function update_redeco_token($usuario, $password){
        $endpoint = 'auth/users/token/';
        $origen = 'redeco_set_api_superuser';
        $url = $this->base_url.$endpoint;
        $data = array(
            "username"=>$usuario,
            "password"=>$password
        );
        $json = json_encode($data);
        
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$json);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Content-Length: ' . strlen($json))
        );
        $response = curl_exec($curl);
        $this->set_log($origen, $response);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);


    }



}
?>