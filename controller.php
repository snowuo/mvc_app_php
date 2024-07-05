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

    public function get_productos(){
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

    public function update_enviada($id){
        $this->model->update_enviada($id);
    }

    public function set_queja_api_curl($id){

                $url_queja = 'https://api.condusef.gob.mx/redeco/quejas';
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
}
?>