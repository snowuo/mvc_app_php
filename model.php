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