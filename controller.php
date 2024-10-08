<?php
require_once ('model.php');

class controller{
    private $model;
    private $base_url = 'https://api.condusef.gob.mx/';
    private $reune_base_url = 'https://api-reune-pruebas.condusef.gob.mx/';
    
    public function __construct() {
        $this->model = new model();
    }

    public function login(){
        if(isset($_POST['username']) && isset($_POST['password']) ){
            if($this->model->log_in($_POST['username'],$_POST['password'])){
                $_SESSION['token'] = $this->get_token('1');//este token es para redeco
                $_SESSION['token_reune'] = $this->get_token('2');//este token es para reune
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

    public function set_queja($queja) {
        // Decodificar JSON
        $queja_array = json_decode($queja, true);
        
        // Verificar si hubo un error en la decodificación
        if (json_last_error() !== JSON_ERROR_NONE) {
            // Manejar el error de decodificación
            throw new Exception('Error al decodificar JSON: ' . json_last_error_msg());
        }
    
        // Verificar que las claves existen en el array
        if (isset($queja_array['datosFormulario']) && isset($queja_array['textosSelect'])) {
            // Codificar las partes del array sin escapar caracteres Unicode
            $queja_data_json = json_encode($queja_array['datosFormulario'], JSON_UNESCAPED_UNICODE);
            $descripcion_data_json = json_encode($queja_array['textosSelect'], JSON_UNESCAPED_UNICODE);
            
            // Reemplazar las barras invertidas en las fechas
            $queja_data_json = str_replace('\/', '/', $queja_data_json);
            $descripcion_data_json = str_replace('\/', '/', $descripcion_data_json);
            
            // Verificar si hubo un error en la codificación
            if (json_last_error() !== JSON_ERROR_NONE) {
                // Manejar el error de codificación
                throw new Exception('Error al codificar JSON: ' . json_last_error_msg());
            }
            
            // Llamar al método del modelo
            $this->model->set_queja($queja_data_json, $descripcion_data_json);
        } else {
            // Manejar el caso en que las claves no existen
            throw new Exception('Claves faltantes en el array JSON.');
        }
    }
    
    
    

    public function set_consultas($consulta){
         // Decodificar JSON
         $queja_array = json_decode($consulta, true);
        
         // Verificar si hubo un error en la decodificación
         if (json_last_error() !== JSON_ERROR_NONE) {
             // Manejar el error de decodificación
             throw new Exception('Error al decodificar JSON: ' . json_last_error_msg());
         }
     
         // Verificar que las claves existen en el array
         if (isset($queja_array['datosFormulario']) && isset($queja_array['textosSelect'])) {
             // Codificar las partes del array sin escapar caracteres Unicode
             $queja_data_json = json_encode($queja_array['datosFormulario'], JSON_UNESCAPED_UNICODE);
             $descripcion_data_json = json_encode($queja_array['textosSelect'], JSON_UNESCAPED_UNICODE);
             
             // Reemplazar las barras invertidas en las fechas
             $queja_data_json = str_replace('\/', '/', $queja_data_json);
             $descripcion_data_json = str_replace('\/', '/', $descripcion_data_json);
             
             // Verificar si hubo un error en la codificación
             if (json_last_error() !== JSON_ERROR_NONE) {
                 // Manejar el error de codificación
                 throw new Exception('Error al codificar JSON(consultas): ' . json_last_error_msg());
             }
             
             // Llamar al método del modelo
             $this->model->set_consultas($queja_data_json, $descripcion_data_json);
         } else {
             // Manejar el caso en que las claves no existen
             throw new Exception('Claves faltantes en el array JSON.');
         }        
    }

    public function set_aclaracion($aclaracion){
                 // Decodificar JSON
                 $queja_array = json_decode($aclaracion, true);
        
                 // Verificar si hubo un error en la decodificación
                 if (json_last_error() !== JSON_ERROR_NONE) {
                     // Manejar el error de decodificación
                     throw new Exception('Error al decodificar JSON: ' . json_last_error_msg());
                 }
             
                 // Verificar que las claves existen en el array
                 if (isset($queja_array['datosFormulario']) && isset($queja_array['textosSelect'])) {
                     // Codificar las partes del array sin escapar caracteres Unicode
                     $queja_data_json = json_encode($queja_array['datosFormulario'], JSON_UNESCAPED_UNICODE);
                     $descripcion_data_json = json_encode($queja_array['textosSelect'], JSON_UNESCAPED_UNICODE);
                     
                     // Reemplazar las barras invertidas en las fechas
                     $queja_data_json = str_replace('\/', '/', $queja_data_json);
                     $descripcion_data_json = str_replace('\/', '/', $descripcion_data_json);
                     
                     // Verificar si hubo un error en la codificación
                     if (json_last_error() !== JSON_ERROR_NONE) {
                         // Manejar el error de codificación
                         throw new Exception('Error al codificar JSON(aclaracion): ' . json_last_error_msg());
                     }
                     
                     // Llamar al método del modelo
                     $this->model->set_aclaracion($queja_data_json, $descripcion_data_json);
                 } else {
                     // Manejar el caso en que las claves no existen
                     throw new Exception('Claves faltantes en el array JSON.');
                 } 
        
        //$this->model->set_aclaracion($aclaracion);
    }

    public function set_reclamacion($reclamacion){
                 // Decodificar JSON
                 $queja_array = json_decode($reclamacion, true);
        
                 // Verificar si hubo un error en la decodificación
                 if (json_last_error() !== JSON_ERROR_NONE) {
                     // Manejar el error de decodificación
                     throw new Exception('Error al decodificar JSON: ' . json_last_error_msg());
                 }
             
                 // Verificar que las claves existen en el array
                 if (isset($queja_array['datosFormulario']) && isset($queja_array['textosSelect'])) {
                     // Codificar las partes del array sin escapar caracteres Unicode
                     $queja_data_json = json_encode($queja_array['datosFormulario'], JSON_UNESCAPED_UNICODE);
                     $descripcion_data_json = json_encode($queja_array['textosSelect'], JSON_UNESCAPED_UNICODE);
                     
                     // Reemplazar las barras invertidas en las fechas
                     $queja_data_json = str_replace('\/', '/', $queja_data_json);
                     $descripcion_data_json = str_replace('\/', '/', $descripcion_data_json);
                     
                     // Verificar si hubo un error en la codificación
                     if (json_last_error() !== JSON_ERROR_NONE) {
                         // Manejar el error de codificación
                         throw new Exception('Error al codificar JSON(reclamaciones): ' . json_last_error_msg());
                     }
                     
                     // Llamar al método del modelo
                     $this->model->set_reclamacion($queja_data_json, $descripcion_data_json);
                 } else {
                     // Manejar el caso en que las claves no existen
                     throw new Exception('Claves faltantes en el array JSON.');
                 } 
        
        //$this->model->set_reclamacion($reclamacion);
    }

    public function get_listado_quejas(){
        return $this->model->get_listado_quejas();
    }

    public function get_listado_consultas(){
        return $this->model->get_listado_consultas();
    }

    public function get_listado_aclaraciones(){
        return $this->model->get_listado_aclaraciones();
    }

    public function get_listado_reclamaciones(){
        return $this->model->get_listado_reclamaciones();
    }

    public function get_queja_data($id){
        return $this->model->get_queja_data($id);
    }

    public function get_queja_descripcion($id){
        return $this->model->get_queja_descripcion($id);
    }

    public function get_error_queja($id){
        return $this->model->get_error_queja($id);
    }

    public function get_error_consulta($id){
        return $this->model->get_error_consulta($id);
    }

    public function get_error_reclamacion($id){
        return $this->model->get_error_reclamacion($id);
    }

    public function get_error_aclaracion($id){
        return $this->model->get_error_aclaracion($id);
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
                    error_log("Error en la solicitud cURL (Para mas informacion consultar el error_log): $error");
                    error_log("Datos enviados: $data_queja");
                }
                
                curl_close($curl);
                if ($httpCode >= 500) {
                    // Registrar la respuesta y los datos enviados en caso de error
                    
                    echo "Error http: $httpCode \n";
                    echo "Causa del error:  $response \n";
                    header('location: index.php?action=redeco&mensaje='.$httpCode.'+'.$response);  
                    error_log("Buscas este: Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
                    
                }else if ($httpCode >= 400) {
                    // Registrar la respuesta y los datos enviados en caso de error
                    $this->model->update_redeco_queja_respuestadelaapi($id,$response);
                    echo "Error http: $httpCode \n";
                    echo "Causa del error:  $response \n";
                    header('location: index.php?action=redeco&mensaje='.$httpCode.'+'.$response);  
                    error_log("Buscas este: Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
                    
                }else{
                    $this->model->update_enviada($id);
                    header('location: index.php?action=redeco&mensaje=Se+registró+correctamente'); 
                }                       
    }

    public function set_api_curl_consultas($id){
        $endpoint = 'reune/consultas/general';
        $url_consulta = $this->reune_base_url.$endpoint;
        $origen = "set_api_curl_consultas";
        $token = $_SESSION['token_reune'];         
        $json = $this->model->get_consultas_data($id);
        if(isset($json[0]['data_json'])){
            $data_json=$json[0]['data_json'];
        }
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url_consulta);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_HTTPHEADER,[
            "Authorization: $token",
            "Content-Type: application/json"
        ]);
        curl_setopt($curl,CURLOPT_POST,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$data_json);
        $response=curl_exec($curl);
        $this->model->reune_set_log($origen, $response);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($response === false) {
            $error = curl_error($curl);
            curl_close($curl);
            // Registrar los datos enviados y el error
            error_log("Error en la solicitud cURL (consultas) : $error");
            error_log("Datos enviados: $data_json");
            die("Error en la solicitud cURL (Para mas informacion consultar el error_log): $error ");
        }
        
        curl_close($curl);
        if ($httpCode >= 400) {
            // Registrar la respuesta y los datos enviados en caso de error
            //$this->model->update_reune_consultas_respuestadelaapi($id,$response);
            echo "Error http: $httpCode \n";
            echo "Causa del error:  $response \n";
            //header('location: index.php?action=reune&mensaje='.$httpCode.'+'.$response);  
            error_log("consultas Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
            
        }else{


            $respuesta = json_decode($response, true);
            
            if (array_key_exists('errores', $respuesta)) {
                $this->model->update_reune_consultas_respuestadelaapi($id,$response);                                                              
            } else {
                $this->model->update_enviada_consultas($id);                             
                
            }
            header('location: index.php?action=reune_consultas');                        
        }

    }
             
    public function set_api_curl_reclamaciones($id){
        $endpoint = 'reune/reclamaciones/general';
        $url_consulta = $this->reune_base_url.$endpoint;
        $origen ="set_api_curl_reclamaciones";
        $token = $_SESSION['token_reune'];         
        $json = $this->model->get_reclamacion_data($id);
        if(isset($json[0]['data_json'])){
            $data_json=$json[0]['data_json'];
        }
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url_consulta);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_HTTPHEADER,[
            "Authorization: $token",
            "Content-Type: application/json"
        ]);
        curl_setopt($curl,CURLOPT_POST,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$data_json);
        $response=curl_exec($curl);
        $this->model->reune_set_log($origen, $response);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($response === false) {
            $error = curl_error($curl);
            curl_close($curl);
            // Registrar los datos enviados y el error
            error_log("Error en la solicitud cURL (reclamaciones) : $error");
            error_log("Datos enviados: $data_json");
            die("Error en la solicitud cURL: $error");
        }
        
        curl_close($curl);
        if ($httpCode >= 400) {
            // Registrar la respuesta y los datos enviados en caso de error
           
            
            echo "Error http: $httpCode \n";
            echo "Causa del error: $response \n";
        
            // Escribe el error en el log
            error_log("reclamaciones Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
            
        } else {
            $respuesta = json_decode($response, true);
            
            if (array_key_exists('errores', $respuesta)) {
                $this->model->update_reune_reclamacion_respuestadelaapi($id, $response);                
                                
                
            } else {
                $this->model->update_enviada_reclamacion($id);                                
                
            }
            header('location: index.php?action=reune_reclamaciones');
        }
        
    }
         
    public function set_api_curl_aclaraciones($id){
        $endpoint = 'reune/aclaraciones/general';
        $url_consulta = $this->reune_base_url.$endpoint;
        $token = $_SESSION['token_reune'];  
        $origen = "set_api_curl_aclaraciones";       
        $json = $this->model->get_aclaracion_data($id);
        if(isset($json[0]['data_json'])){
            $data_json=$json[0]['data_json'];
        }
        $curl = curl_init();
        curl_setopt($curl,CURLOPT_URL,$url_consulta);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_HTTPHEADER,[
            "Authorization: $token",
            "Content-Type: application/json"
        ]);
        curl_setopt($curl,CURLOPT_POST,true);
        curl_setopt($curl,CURLOPT_POSTFIELDS,$data_json);
        $response=curl_exec($curl);
        $this->model->reune_set_log($origen, $response);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($response === false) {
            $error = curl_error($curl);
            curl_close($curl);
            // Registrar los datos enviados y el error
            error_log("Error en la solicitud cURL (reclamaciones) : $error");
            error_log("Datos enviados: $data_json");
            die("Error en la solicitud cURL: $error");
        }
        
        curl_close($curl);
        if ($httpCode >= 400) {
            // Registrar la respuesta y los datos enviados en caso de error
            
            echo "Error http: $httpCode \n";
            echo "Causa del error:  $response \n";
            //header('location: index.php?action=reune&mensaje='.$httpCode.'+'.$response);  
            error_log("Aclaraciones Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
            
        }else{
            $respuesta = json_decode($response, true);
            
            if (array_key_exists('errores', $respuesta)) {
                $this->model->update_reune_aclaracion_respuestadelaapi($id,$response);              
                                
                
            } else {
                $this->model->update_enviada_aclaracion($id);                               
                
            }
            header('location: index.php?action=reune_aclaraciones');
            
        }

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

    public function get_su_token_reune(){
        return $this->model->get_su_token_reune();
    }
    public function set_log($origen, $response){
        $this->model->set_log($origen, $response);
    }

    public function set_api_reune_superuser($nombre,$password){ //Crea el super usuario para REUNE
       
        $tipo_usuario = '2';
        $endpoint = 'auth/users/create-super-user/';
        $url = $this->reune_base_url.$endpoint;
        $token = $this->get_su_token_reune();
        $origen = 'config_reune';
        echo '</br> impreso desde controlles '.$url. '</br>El token es: '.$token;
        $this->model->reune_set_log($nombre,$password);
        $data = array(
            "key"=>$token,
            "username"=>$nombre,
            "password"=>$password,
            "confirm_password"=>$password,
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
        $this->model->reune_set_log($origen, $response);
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
            header('location: index.php?mensaje='.$httpCode.'+'.$response);  
            error_log("Super Usuario error al generar (REUNE): Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
            
        }else{
            //$this->model->update_enviada($id);

            $info_user = json_decode($response,true);
            $username = $info_user['data']['username'];
            $token = $info_user['data']['token_access'];
            $tipo_usuario = 2;
            $json_usuario = $response;
            $origen = 'superuser';
            $this->model->add_user($username,$password,$token,$tipo_usuario,$json_usuario,$origen);
            header('location: index.php?mensaje=Super+usuario+se+registró+correctamente'); 

    }
    }


    public function set_api_superuser($nombre,$password){ //Crea el super usuario para REDECO
        $endpoint = 'auth/users/create-super-user/';
        $origen = 'redeco_set_api_superuser';
        $url = $this->base_url.$endpoint;                
        $token =  $this->get_su_token_redeco();
        $data = array(
                    "key"=>$token,
                    "username"=>$nombre,
                    "password"=>$password,
                    "confirm_password"=>$password,
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
            error_log("Super Usuario error al generar: Codigo de respuesta HTTP: $httpCode, Respuesta: $response");
            header('location: index.php?action=redeco&mensaje='.$httpCode.'+'.$response);  
        }else{
            $info_user = json_decode($response,true);
            $username = $info_user['data']['username'];
            $token = $info_user['data']['token_access'];
            $tipo_usuario = 1;
            $json_usuario = $response;
            $origen = 'superuser';
            $this->model->add_user($username,$password,$token,$tipo_usuario,$json_usuario,$origen);
            header('location: index.php?action=redeco&mensaje=Super+usuario+se+registró+correctamente');                         
        }  
    }

    public function update_redeco_token($usuario, $password,$id){
        $endpoint = 'auth/users/token/';
        $origen = 'update_redeco_token';
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
        if ($httpCode >= 400) {
            error_log("Ocurrió un error(Actualiza token redeco): ".$response);
        }else{
            $info_user = json_decode($response,true); 
            $token = $info_user['user']['token_access'];
            $param = "<br> Token: ".$token."<br> Username: ".$usuario."<br> password: ".$password;
           $this->model->set_log('Actualizar token (update_redeco_token)',$param);
           $_SESSION['token']=$token;
           $this->model->update_redeco_token_su($token,$id);
        }
        return $nuevo_token = 0;
    }

    public function update_reune_token($usuario, $password,$id){
        $endpoint = 'auth/users/token/';
        $origen = 'update_reune_token';
        $url = $this->reune_base_url.$endpoint;
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
        $this->model->reune_set_log($origen, $response);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        $respuesta_json = json_decode($response,true);
        if ($httpCode >= 400) {
            error_log("Ocurrió un error(Reune): $response");
        }else{
            $info_user = json_decode($response,true); 
            $token = $info_user['user']['token_access'];
            $param = "<br> Token: ".$token."<br> Username: ".$usuario."<br> password: ".$password;
           $this->model->reune_set_log('Actualizar token (update_reune_token)',$param);
           $_SESSION['token_reune']=$token;
           $this->model->update_redeco_token_su($token,$id);
        }
    }

    public function get_user_list(){
        return $this->model->get_user_list();
    }

    public function get_token($tipo_usuario){
        return $this->model->get_token($tipo_usuario);
    }
    public function consulta_quejas_redeco($año,$mes){        
        $endpoint = "redeco/quejas/?year=$año&month=$mes";
        $origen = 'consulta_quejas_redeco';
        $url = $this->base_url.$endpoint;
        $token = $_SESSION['token'];//es de redeco;
        $curl = curl_init($url);
        curl_setopt($curl,CURLOPT_URL,$url);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            "Authorization: $token",
            'Content-Type: application/json')
        );
        $response = curl_exec($curl);
        $this->set_log($origen, $response);
        $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($httpCode >= 400) {
            error_log("Ocurrió un error(redeco): ".$response);
            return 'Ocurrió un error';
        }else{
            return $response;            
        }
    }

    public function delete_redeco_queja($folio_queja){
        $endpoint = "redeco/quejas/?quejaFolio=$folio_queja";
        $origen = "delete_redeco_queja $folio_queja";
        $url = $this->base_url.$endpoint;
        $curl = curl_init();
        $token = $_SESSION['token'];
        curl_setopt($curl,CURLOPT_URL,$url);
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, "DELETE");
        curl_setopt($curl, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            "Authorization: $token"
            )
        );
        $response = curl_exec($curl);
        $this->set_log($origen, $response);
        curl_close($curl);
        return $response;
    }

    //Pruebas ..... borrar a partir de aquí !!!!!

    public function prueba_redeco_token($usuario, $password){
        $endpoint = 'auth/users/token/';
        $origen = 'prueba_redeco_token';
        $url = 'http://localhost/json/'; //$this->base_url.$endpoint;
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
        if ($httpCode >= 400) {
            error_log("Ocurrió un error(redeco): ".$response);
        }else{
            $info_user = json_decode($response,true);
            $username = $info_user['data']['username'];
            $token = $info_user['data']['token_access'];
            $tipo_usuario = 1;
            $json_usuario = $response;
            $origen = 'superuser';
            $this->model->add_user($username,$password,$token,$tipo_usuario,$json_usuario,$origen);
        }
        return $nuevo_token = 0;
        curl_close($curl);
    }

    public function get_id_redeco_queja_consulta($folio){
        return $this->model->get_id_redeco_queja_consulta($folio);
    }

    public function get_base_url(){
        return $this->base_url;
    }
    
    public function get_reune_base_url(){
        return $this->reune_base_url;
    }

    public function delete_queja($id){
        return $this->model->delete_queja($id);
    }

    public function delete_aclaracion($id){
        return $this->model->delete_aclaracion($id);
    }

    public function delete_consulta($id){
        return $this->model->delete_consulta($id);
    }

    public function delete_reclamacion($id){
        return $this->model->delete_reclamacion($id);
    }

}
?>