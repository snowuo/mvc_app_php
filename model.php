<?php
    class model {
        private $db;
        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;dbname=php_app','php_app','php_app');
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }

        public function log_in($username,$password){
            try {
                $stmt = $this->db->prepare('SELECT id, username, password, token from user WHERE username = :username');
                $stmt->execute(['username' => $username]);
                $user = $stmt->fetch(PDO::FETCH_ASSOC);
                

                if ($user && $user['password'] == $password) {
                    $_SESSION['id'] = $user['id'];
                    $_SESSION['username'] = $user['username'];
                    $_SESSION['token'] = $user['token'];
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
        public function set_queja($queja){
            try{
                $stmt = $this->db->prepare("INSERT INTO quejas_data (data_queja) VALUES (:queja)");        
                $stmt->execute([':queja' => $queja]);
            }catch(PDOException $e) {
                // En caso de error en la conexión o consulta, mostrar el mensaje de error
                echo "La conexión falló: " . $e->getMessage();
                die();
            }
        }

        public function get_listado_quejas(){
            try {    
                $stmt = $this->db->query('SELECT * FROM quejas_data');
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


    }
    
?>