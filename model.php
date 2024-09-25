<?php
    class model {
        private $db;

        public function __construct() {
            // Agregar charset=utf8mb4 al DSN
            $dsn = 'mysql:host=localhost;dbname=php_app;charset=utf8mb4';
            
            // Crear la conexión con la base de datos utilizando utf8mb4
            $this->db = new PDO($dsn, 'php_app', 'php_app');
            
            // Configurar PDO para lanzar excepciones en caso de error
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            // Asegurarse de que las consultas usen el conjunto de caracteres correcto
            $this->db->exec("SET NAMES utf8mb4");
            //$this->db->exec("SET time_zone = 'America/Monterrey'");
        }

        public function log_in($username,$password){
            try {
                $stmt = $this->db->prepare('SELECT id, username, password from user WHERE username = :username');
                $stmt->execute(['username' => $username]);
                $user = $stmt->fetch(PDO::FETCH_ASSOC);
                

                if ($user && $user['password'] == $password) {
                    $_SESSION['id'] = $user['id'];
                    $_SESSION['username'] = $user['username'];
                    return true;
                } else {
                    return false;
                }             
            } catch (PDOException $e) {
                echo 'Error: ' . $e->getMessage();
                return false;
            }
        }
        public function get_productos(){
            $stmt = $this->db->query('SELECT productId, product FROM productos');
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        public function get_quejas(){
            $stmt = $this->db->query('SELECT * FROM quejas');
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        public function get_reune_cmr(){
            $stmt = $this->db->query('SELECT * FROM catalogo_medios_rec');
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }
        public function set_queja($queja,$descripcion_queja){
            try{
                $stmt = $this->db->prepare("INSERT INTO quejas_data (data_queja, descripcion_queja) VALUES (:queja, :descripcion_queja)");        
                $stmt->execute([':queja' => $queja,
                                   ':descripcion_queja' =>  $descripcion_queja]);
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló set_queja: " . $e->getMessage();
                die();
            }
        }
        public function set_aclaracion($aclaracion,$descripcion){
            try{
                $stmt = $this->db->prepare("INSERT INTO aclaracion_data (data_json,descripcion_queja) VALUES (:aclaracion,:descripcion_queja)");        
                $stmt->execute([':aclaracion' => $aclaracion,
                                ':descripcion_queja'=>$descripcion]);
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló set_aclaracion: " . $e->getMessage();
                die();
            }
        }
        public function set_consultas($consultas,$descripcion){
            try{
                $stmt = $this->db->prepare("INSERT INTO consultas_data (data_json,descripcion_queja) VALUES (:consultas,:descripcion_queja)");        
                $stmt->execute([':consultas' => $consultas,
                                ':descripcion_queja'=>$descripcion]);
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló set_consultas: " . $e->getMessage();
                die();
            }
        }

        public function set_reclamacion($reclamacion,$descripcion){
            try{
                $stmt = $this->db->prepare("INSERT INTO reclamacion_data (data_json,descripcion_queja) VALUES (:reclamacion,:descripcion_queja)");        
                $stmt->execute([':reclamacion' => $reclamacion,':descripcion_queja'=>$descripcion]);
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló set_reclamacion: " . $e->getMessage();
                die();
            }
        }

        public function get_listado_quejas(){
            try {    
                $stmt = $this->db->query('SELECT * FROM quejas_data order by id_quejas desc');
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_listado_aclaraciones(){
            try {    
                $stmt = $this->db->query('SELECT * FROM aclaracion_data order by id desc');
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_listado_consultas(){
            try {    
                $stmt = $this->db->query('SELECT * FROM consultas_data order by id desc');
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        public function get_listado_reclamaciones(){
            try {    
                $stmt = $this->db->query('SELECT * FROM reclamacion_data order by id desc');
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }


        public function get_listado_entidades_federativas(){
            try {    
                $stmt = $this->db->query('SELECT * FROM entidades_federativas');
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_queja_data($id){
            try {    
                $stmt = $this->db->prepare('SELECT data_queja FROM quejas_data WHERE id_quejas = :id');
                $stmt->execute([':id' => $id]);
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_aclaracion_data($id){
            try {    
                $stmt = $this->db->prepare('SELECT data_json FROM aclaracion_data WHERE id = :id');
                $stmt->execute([':id' => $id]);
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_consultas_data($id){
            try {    
                $stmt = $this->db->prepare('SELECT data_json FROM consultas_data WHERE id = :id');
                $stmt->execute([':id' => $id]);
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_reclamacion_data($id){
            try {    
                $stmt = $this->db->prepare('SELECT data_json FROM reclamacion_data WHERE id = :id');
                $stmt->execute([':id' => $id]);
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_reune_catalogo_producto_consulta(){            
            try {    
                $stmt = $this->db->query("SELECT DISTINCT tipo_credito, codigo_producto FROM `catalogo_productos_causas` where aplica_consulta = 'si'");
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                error_log('Error en la funcion del modelo get_reune_catalogo_producto_consulta'.$e->getMessage());
                die();
            }
        }

        public function get_reune_catalogo_producto_reclamacion(){            
            try {    
                $stmt = $this->db->query("SELECT DISTINCT tipo_credito, codigo_producto FROM `catalogo_productos_causas` where aplica_reclamacion = 'si'");
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                error_log('Error en la funcion del modelo get_reune_catalogo_producto_consulta'.$e->getMessage());
                die();
            }
        }

        public function get_reune_catalogo_producto_aclaracion(){            
            try {    
                $stmt = $this->db->query("SELECT DISTINCT tipo_credito, codigo_producto FROM `catalogo_productos_causas` where aplica_aclaracion = 'si'");
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                error_log('Error en la funcion del modelo get_reune_catalogo_producto_consulta'.$e->getMessage());
                die();
            }
        }

        public function get_causas($prod){
            try {    
                $stmt = $this->db->prepare('SELECT causa, codigo_causa from catalogo_productos_causas where codigo_producto = :prod');
                $stmt->execute([':prod' => $prod]);
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        
        public function get_info_sofom(){
            try{
                $stmt = $this->db->prepare('select denominacion, sector from info_sofom where id=1');
                $stmt->execute();
                return $stmt->fetchAll(PDO::FETCH_ASSOC);


            }catch(PDOException $e){
                echo "La conexión falló: " . $e->getMessage();
                die();
            }

        }

        public function update_enviada($id){
            try {    
                $stmt = $this->db->prepare('UPDATE quejas_data SET enviada = true WHERE id_quejas = :id');
                $stmt->execute([':id' => $id]);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        public function update_enviada_aclaracion($id){
            try {    
                $stmt = $this->db->prepare('UPDATE aclaracion_data SET enviada = true WHERE id = :id');
                $stmt->execute([':id' => $id]);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        public function update_enviada_consultas($id){
            try {    
                $stmt = $this->db->prepare('UPDATE consultas_data SET enviada = true WHERE id = :id');
                $stmt->execute([':id' => $id]);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        public function update_enviada_reclamacion($id){
            try {    
                $stmt = $this->db->prepare('UPDATE reclamacion_data SET enviada = true WHERE id = :id');
                $stmt->execute([':id' => $id]);
            } catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function set_denominacion($valor){   
            try{
                $stmt = $this->db->prepare('UPDATE info_sofom set denominacion = :valor where id = 1');
                $stmt->execute([':valor' => $valor]);
                return true;
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        public function set_sector($valor){   
            try{
                $stmt = $this->db->prepare('UPDATE info_sofom set sector = :valor where id = 1');
                $stmt->execute([':valor' => $valor]);
                return true;
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_su_token_redeco(){
            try{
                $stmt = $this->db->prepare("SELECT token FROM tokens_redeco_reune_superuser WHERE institucion = 'REDECO'");
                $stmt->execute();
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($result) {
                    return $result['token'];
                } else {
                    return null; // o lanzar una excepción o un mensaje de error
                }
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }
        public function get_su_token_reune(){
            try{
                $stmt = $this->db->prepare("SELECT token FROM tokens_redeco_reune_superuser WHERE institucion = 'REUNE'");
                $stmt->execute();
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($result) {
                    return $result['token'];
                } else {
                    return null; // o lanzar una excepción o un mensaje de error
                }
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function set_log($origen, $response) {
            try {
                $stmt = $this->db->prepare('insert into redeco_logs(origen,response)VALUES(:origen,:response)');
                $stmt->execute([
                    ':origen' => $origen,
                    ':response' => $response
                ]);
            } catch (\Throwable $th) {
                // Manejar el error de alguna manera, por ejemplo, registrar el error
                error_log($th->getMessage());
            }
        }

        public function reune_set_log($origen, $response){
            try {
                $stmt = $this->db->prepare('insert into reune_logs(origen,response)VALUES(:origen,:response)');
                $stmt->execute([
                    ':origen' => $origen,
                    ':response' => $response
                ]);
            } catch (\Throwable $th) {
                // Manejar el error de alguna manera, por ejemplo, registrar el error
                error_log($th->getMessage());
            }
        }

        public function add_user($username,$password,$token,$tipo_usuario,$json_usuario,$origen){
            try {
                $stmt = $this->db->prepare('insert into user (username,password,token,tipo_usuario,json_usuario,origen) values (:username,:password,:token,:tipo_usuario,:json_usuario,:origen)');
                $stmt->execute([
                    ':username' => $username,
                    ':password' => $password,
                    ':token' => $token,
                    ':tipo_usuario' => $tipo_usuario,
                    ':json_usuario' => $json_usuario,
                    ':origen'=> $origen

                ]);
            } catch (\Throwable $th) {
                // Manejar el error de alguna manera, por ejemplo, registrar el error
                error_log($th->getMessage());
            }

        }

        public function get_user_list(){
            try {
                $stmt = $this->db->prepare("SELECT id,tipo_usuario,username,password, last_update FROM `user` WHERE last_update <= DATE_SUB(NOW(), INTERVAL 30 DAY) 
AND tipo_usuario IN (1, 2);");
                $stmt->execute();
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        public function update_redeco_token_su($token, $id){//actualizael token mensual para redeco
            try {
                $stmt = $this->db->prepare('UPDATE user SET token = :token where id = :id');
                $stmt->execute([
                    ':token' => $token,
                    ':id' => $id
                ]);
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        public function get_token($tipo_usuario){
            try{
                $stmt = $this->db->prepare("SELECT token FROM user WHERE tipo_usuario = :tipo_usuario");
                $stmt->execute([':tipo_usuario'=> $tipo_usuario]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($result) {
                    return $result['token'];
                } else {
                    return null; // o lanzar una excepción o un mensaje de error
                }
            } catch (\Throwable $th) {
                error_log($th->getMessage());                
            }
        }

        public function update_redeco_queja_respuestadelaapi($id_quejas,$response){
            try {
                $stmt = $this->db->prepare("update quejas_data set respuesta_api = :response where id_quejas = :id_quejas");
                $stmt->execute([':response'=> $response,
                                ':id_quejas'=>$id_quejas]);
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        
        public function update_reune_aclaracion_respuestadelaapi($id,$response){
            try {
                $stmt = $this->db->prepare("update aclaracion_data set respuesta_api = :response where id = :id");
                $stmt->execute([':response'=> $response,
                                ':id'=>$id]);
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        
        public function update_reune_consultas_respuestadelaapi($id,$response){
            try {
                $stmt = $this->db->prepare("update consultas_data set respuesta_api = :response where id = :id");
                $stmt->execute([':response'=> $response,
                                ':id'=>$id]);
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        
        public function update_reune_reclamacion_respuestadelaapi($id,$response){
            try {
                $stmt = $this->db->prepare("update reclamacion_data set respuesta_api = :response where id = :id");
                $stmt->execute([':response'=> $response,
                                ':id'=>$id]);
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        public function get_id_redeco_queja_consulta($folio){
            try {
                $stmt= $this->db->prepare("SELECT id_quejas FROM quejas_data WHERE JSON_UNQUOTE(JSON_EXTRACT(data_queja, '$[0].QuejasFolio')) = :folio");
                $stmt->execute([':folio'=> $folio]);
                $result = $stmt->fetch(PDO::FETCH_ASSOC);        
               // return $result;/*        
                if($result){
                    return $result['id_quejas'];
                }else{
                    return 0;
                }
            } catch (\Throwable $th) {
                error_log($th->getMessage());
            }
        }

        
    }
    
?>