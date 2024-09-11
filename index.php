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
                if (isset($_GET['mensaje'])) {
                    $mensaje = $_GET['mensaje'];
                    echo "<script type='text/javascript'>alert('$mensaje');</script>";
                } 
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
            //procesa_quejas_redeco
            case 'procesa_quejas_redeco':
                if ($_SERVER['REQUEST_METHOD'] === 'POST'){
                    $content = $controller->consulta_quejas_redeco($_POST['queja_año'],$_POST['queja_mes']);
                }else{
                    echo 'Los datos no se enviaron por el metodo post';
                }
                include 'views/procesa_quejas_redeco.php';
                
            break;
            case 'config_redeco':
                include 'views/config_redeco.php';
            break;
            case 'config_reune':
                include 'views/config_reune.php';
            break;
            
            case 'superuser_redeco':
               if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                // La solicitud fue enviada mediante el método POST
                if (!empty($_POST)) {
                    // El arreglo $_POST no está vacío, lo que significa que se envió información
                    echo "Se recibió información por el método POST.";
                    // Puedes acceder a los datos enviados, por ejemplo:
                    $nombre = $_POST['nombre'];
                    $password = $_POST['password'];
                    $controller->set_api_superuser($nombre,$password);                   

                } else {
                    echo "No se envió información.";
                }
            } else {
                echo "La solicitud no fue enviada mediante el método POST.";
            }

            break;

            case 'superuser_reune':
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    // La solicitud fue enviada mediante el método POST
                    if (!empty($_POST)) {
                        $nombre = $_POST['nombre'];
                        $password = $_POST['password'];
                        $controller->set_api_reune_superuser($nombre,$password);                   
    
                    } else {
                        echo "No se envió información.";
                    }
                } else {
                    echo "La solicitud no fue enviada mediante el método POST.";
                }

            break;
            case 'pruebalog':
                try {
                    $controller->set_log('origen','prueba');
                    echo ']Concluido satisfactoriamente';
                } catch (\Throwable $th) {
                    //throw $th;
                }
                $controller->set_log('origen','prueba');
            break;
            case 'update_redeco_token':
               
                $controller->update_redeco_token($_POST['username'],$_POST['password'],$_POST['id']);                
                header('location: index.php?action=usuarios&mensaje=Actualizado+Correctamente');

            break;
            case 'update_reune_token':
                $controller->update_reune_token($_POST['username'],$_POST['password'],$_POST['id']);                
                header('location: index.php?action=usuarios&mensaje=Actualizado+Correctamente');

            break;

            
            case 'usuarios':
                include 'views/usuarios.php';
                if (isset($_GET['mensaje'])) {
                    $mensaje = $_GET['mensaje'];
                    echo "<script type='text/javascript'>alert('$mensaje');</script>";
                } 
            break;

            case 'delete_queja':
                if ($_SERVER['REQUEST_METHOD'] === 'POST'){
                    $controller->delete_redeco_queja($_POST['folio_queja']);
                    header('location: index.php?mensaje=La+queja+se+ah+borrado+con+exito');
                }else{
                    error_log("el intento realizado en delete_queja debe realizarse por el metodo POST");
                    header('location: index.php?mensaje=Error+al+borrar+la+queja');
                }
                
            break;

            case 'modifica_queja_redeco':
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    echo "se envió correctamente por post";
                    echo $_POST['queja'];
                }
                include 'views/modifica_queja_redeco.php';
            break;

            case 'consulta_queja':
                if ($_SERVER['REQUEST_METHOD'] === 'GET') {
                    $folio =$_GET['folio'];
                    error_log("este es el folio recibido por get: ". $folio);
                    $id = $controller->get_id_redeco_queja_consulta($folio);
                    if ($id >0) {
                        $info = $controller->get_queja_data($id);
                        $respuesta = $info[0]['data_queja'];
                        echo $respuesta;
                    } else {
                        $mensaje = array( 'mensaje' => 'El folio buscado no se encuentra en la base de datos');
                        echo (json_encode($mensaje,true));
                    }                    
                } else {
                    $mensaje = array( 'mensaje' => 'El endpoint solo admite el metodo GET');
                        echo (json_encode($mensaje,true));
                }
                



                break;
                       
//Pruebas a partir de aqui --------------- borrar hasta el default

                case 'prueba_redeco':
                    try {
                        $datos = $controller->get_queja_data(1);
                        foreach ($datos as $dato) {
                           echo "<div class='row'>
                                    <div class='col'>".htmlspecialchars($dato['key'])."</div>
                                    <div class='col'>".htmlspecialchars($dato['value'])."</div>
                                 </div>";
                            
                        }
                    } catch (\Throwable $th) {
                        error_log('Error en la prueba: '.$th);
                    }
                   
                break;

                case 'prueba_modal':
                        include 'views/pm.php';
                    break;


//Borrar hasta aquí ----------------------------------------------
            default:
             include 'views/error404.php';
            break;
        }
    }  
?>