<?php
    session_start();
    $message = '';
    require 'controller.php';
    require_once 'views/partials/menu.php';
    $controller = new controller();   
    $productos = $controller->get_productos();
    $catalogo_reune_cmr=$controller->get_reune_cmr();
    $entidades_federativas=$controller->get_listado_entidades_federativas();
    $info_sofom=$controller->get_info_sofom();
    $denominacion = $info_sofom[0]['denominacion'];
    $sector = $info_sofom[0]['sector'];
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
                break;
            
            case 'alta_queja':
                include 'views/form_quejas.php';            
                break;
            case 'save-form':
                echo 'La queja se guardó correctamente';
                $json = file_get_contents('php://input');                
                $controller->set_queja($json);
                break;       
            case 'curl':
                $id=$_GET['id'];                
                $controller->set_queja_api_curl($id);
            break;     
            case 'redeco':              
                $quejas = $controller->get_listado_quejas();
                include 'views/redeco.php';   
                if (isset($_GET['mensaje'])) {
                    $mensaje = $_GET['mensaje'];
                    echo "<script type='text/javascript'>alert('$mensaje');</script>";
                } 
            break;
            case 'salir':
                $controller->logout();
            break;
            case 'reune_consultas':
                include 'views/reune_consultas.php';
            break;
            case 'reune_consultas_form':
                $catalogo = $controller->get_reune_catalogo_producto_consulta();
                include 'views/reune_consultas_form.php';
            break;
            case 'reune_reclamaciones':
                include 'views/reune_reclamaciones.php';
            break;
            case 'reune_reclamaciones_form':
                $catalogo = $controller->get_reune_catalogo_producto_aclaracion();
                include 'views/reune_reclamaciones_form.php';
            break;
            case 'reune':
                include 'views/reune.php';
            break;
            case 'reune_aclaraciones':
                include 'views/reune_aclaraciones.php';
            break;
            case 'reune_aclaraciones_form':
                $catalogo = $controller->get_reune_catalogo_producto_reclamacion();
                include 'views/reune_aclaraciones_form.php';
            break;
            
            case 'info_sofom':                     
                include 'views/info_sofom.php';
            break;
            case 'causas':
                if (isset($_GET['producto']) && !empty($_GET['producto'])) {
                    $causas = $controller->get_causas($_GET['producto']);
                    $obj = new stdClass();
                    if (empty($causas)) {
                        http_response_code(404);
                        echo json_encode(['message' => 'Causas no encontradas']);
                    } else {
                        $obj->causas=$causas;
                        http_response_code(200);
                        echo json_encode($obj,JSON_UNESCAPED_UNICODE);
                    }
                    
                } else {
                    http_response_code(500);
                    echo json_encode(['message' => 'Causas no encontradas']);
                }                              
            break;
            case 'sepomex':
                include 'views/upload_sepomex.php';
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    // Directorio donde se almacenarán los archivos subidos
                    $uploadDir = __DIR__ . '/sepomex/';
                    
                    // Verifica si el directorio existe, si no, lo crea
                    if (!is_dir($uploadDir)) {
                        mkdir($uploadDir, 0777, true);
                    }
                    
                    // Verifica si se ha subido un archivo
                    if (isset($_FILES['file'])) {
                        $file = $_FILES['file'];
                        
                        // Verifica si no hay errores en la carga del archivo
                        if ($file['error'] === UPLOAD_ERR_OK) {
                            $uploadFilePath = $uploadDir . basename($file['name']);
                            
                            // Mueve el archivo subido al directorio deseado
                            if (move_uploaded_file($file['tmp_name'], $uploadFilePath)) {
                                echo "El archivo " . htmlspecialchars(basename($file['name'])) . " ha sido subido exitosamente.";
                            } else {
                                echo "Error al mover el archivo subido.";
                            }
                        } else {
                            echo "Error en la carga del archivo: " . $file['error'];
                        }
                    } else {
                        echo "No se ha seleccionado ningún archivo.";
                    }
                }
            break;
            case 'actualiza_denominacion':
                if (isset($_POST['nueva_denominacion'])) {
                    $nueva_denominacion = trim($_POST['nueva_denominacion']);
        
                    // Validación simple, podrías añadir más reglas según tu caso
                    if (!empty($nueva_denominacion)) {
                        if ($controller->set_denominacion($nueva_denominacion)) {
                            $response = array("status" => "success", "message" => "Denominación actualizada correctamente");
                        } else {
                            $response = array("status" => "error", "message" => "Error al actualizar la denominación");
                        }
                    } else {
                        $response = array("status" => "error", "message" => "La nueva denominación no puede estar vacía");
                    }
                } else {
                    $response = array("status" => "error", "message" => "No se ha recibido la nueva denominación");
                }
            
                echo json_encode($response);                                    
            break;
            case 'actualiza_sector':
                if (isset($_POST['nuevo_sector'])) {
                    $nuevo_sector = trim($_POST['nuevo_sector']);
        
                    // Validación simple, podrías añadir más reglas según tu caso
                    if (!empty($nuevo_sector)) {
                        if ($controller->set_sector($nuevo_sector)) {
                            $response = array("status" => "success", "message" => "Sectór actualizado correctamente");
                        } else {
                            $response = array("status" => "error", "message" => "Error al actualizar el sectór");
                        }
                    } else {
                        $response = array("status" => "error", "message" => "El campo sectór no puede estar vacía");
                    }
                } else {
                    $response = array("status" => "error", "message" => "No se ha recibido el nuevo sectór");
                }
                echo json_encode($response);                                    
            break;
            case 'consulta_quejas_redeco':
                include 'views/consulta_quejas_redeco.php';
            break;
            case 'config_redeco':
                include 'views/config_redeco.php';
            break;
            
            case 'superuser_redeco':
               echo $controller->get_su_token_redeco();
               if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                // La solicitud fue enviada mediante el método POST
                if (!empty($_POST)) {
                    // El arreglo $_POST no está vacío, lo que significa que se envió información
                    echo "Se recibió información por el método POST.";
                    // Puedes acceder a los datos enviados, por ejemplo:
                    $nombre = $_POST['nombre'];
                    $password = $_POST['password'];
                    echo "Nombre: " . htmlspecialchars($nombre);
                    echo "Password: " . htmlspecialchars($password);
                    $controller->set_api_superuser($nombre,$password);                   

                } else {
                    echo "No se envió información.";
                }
            } else {
                echo "La solicitud no fue enviada mediante el método POST.";
            }

            break;
            case 'prueba_su':
                $data = array(
                            "userid"=>"userid",
                            "username"=>"superusertest",
                            "password"=>"asdf234aweqw2453",
                            "institucionid"=>"asdfewrsb",
                            "is_active"=>true,
                            "profileid"=>"2",
                            "token_access"=>"token_access"
                );
                $resp = array("message"=>"El usuario ha sido creado exitosamente!",
                                "data"=>$data
            );
                
                http_response_code(200);
                echo json_encode($resp);
               
            break;
            default:
             include 'views/error404.php';
            break;
        }
    }  
?>