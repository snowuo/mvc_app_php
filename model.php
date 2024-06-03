<?php
    class model {
        private $db;
        public function __construct() {
            $this->db = new PDO('mysql:host=localhost;dbname=php_app','php_app','php_app');
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
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




    }
    
?>