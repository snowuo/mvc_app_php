$mensaje = `Consideraciones:

Al seleccionar el trimestre a reportar, el campo "Fecha de consulta" se actualizará al valor del primer dia de ese trimestre, Hay que seleccionar la fecha en que se recibió la consulta.

Cuando el estado de la queja es concluido, se deberá llenar el campo "Fecha de atención" y el campo "Nivel de atención"

El campo "codigo postal" solo se habilitará cuando el "Medio de recepción" sea Sucursal, Oficina de atención ó UNE, de lo contrario no es necesario.`;

document.addEventListener('DOMContentLoaded', function() {    
    Crear_Folio();
    menu_causas();
    actualiza_estado();
    actualzia_ConsultasCP();
    actualiza_fechaRecepcion();    
});

document.getElementById('ayuda').addEventListener('click',()=>{alert($mensaje)})
document.getElementById('Producto').addEventListener('change',function(){
    menu_causas()
})
document.getElementById('ConsultasEstatusCon').addEventListener('change',actualiza_estado)
document.getElementById('MediosId').addEventListener('change',actualzia_ConsultasCP);
document.getElementById('ConsultasTrim ').addEventListener('change',()=>{
    actualiza_fechaRecepcion()
    actualiza_fecha_atencion()

});
document.getElementById('ConsultasFecRecepcion').addEventListener('change',()=>{
    //console.log('se actualiza la fecha de atencion')
    actualiza_fecha_atencion()
    ;})

function actualiza_fechaRecepcion() {
    $trimestre = document.getElementById('ConsultasTrim ').value;
    inputDate = document.getElementById('ConsultasFecRecepcion')
    const currentYear = new Date().getFullYear();

    switch ($trimestre){ 
            case '1':
                    // Definir las fechas mínima y máxima usando el año en curso
                        minDate = `${currentYear}-01-01`;
                        maxDate = `${currentYear}-03-31`;
                        //console.log(`El valor de trimestre es ${$trimestre}`)
                        // Establecer los atributos min y max
                        inputDate.min = minDate
                        inputDate.max = maxDate
                        inputDate.value = minDate
                break;
            case '2':
                        // Definir las fechas mínima y máxima
                        minDate = `${currentYear}-04-01`;
                        maxDate = `${currentYear}-06-30`;
                        //console.log(`El valor de trimestre es ${$trimestre}`)
                        // Establecer los atributos min y max
                        inputDate.setAttribute('min', minDate);
                        inputDate.setAttribute('max', maxDate);
                        inputDate.value = minDate
                break;
            case '3':
                        // Definir las fechas mínima y máxima
                        minDate = `${currentYear}-07-01`;
                        maxDate = `${currentYear}-09-30`;
                        //console.log(`El valor de trimestre es ${$trimestre}`)
                        // Establecer los atributos min y max
                        inputDate.setAttribute('min', minDate);
                        inputDate.setAttribute('max', maxDate);
                        inputDate.value = minDate
                break;
            case '4':
                        // Definir las fechas mínima y máxima
                        minDate = `${currentYear}-10-01`;
                        maxDate = `${currentYear}-12-31`;
                        //console.log(`El valor de trimestre es ${$trimestre}`)
                        // Establecer los atributos min y max
                        inputDate.setAttribute('min', minDate);
                        inputDate.setAttribute('max', maxDate);
                        inputDate.value = minDate
                break;

            default:
                break;
        }  
}

function actualiza_estado() {
    $ConsultascatnivelatenId = document.getElementById('ConsultascatnivelatenId');
    $estado = document.getElementById('ConsultasEstatusCon').value;
    $fecha_atencion = document.getElementById('ConsultasFecAten');
    if ($estado === "2") {
        //console.log('Estado Concluido');
        $fecha_atencion.type = 'date';
        $fecha_atencion.readOnly = false;
        $ConsultascatnivelatenId.disabled = false;
        $ConsultascatnivelatenId.disabled = false;
        actualiza_fecha_atencion();
    } else {
        //console.log('Estado pendiente');
        $fecha_atencion.type = 'text';
        $fecha_atencion.placeholder = 'No se utiliza.';
        $fecha_atencion.value = "";
        $fecha_atencion.readOnly = true;
        $ConsultascatnivelatenId.disabled = true;
        $ConsultascatnivelatenId.disabled = true;
    }    
}
function actualiza_fecha_atencion() {
    $fecha = document.getElementById('ConsultasFecAten');
    $fecha_rec = document.getElementById('ConsultasFecRecepcion');
    $estado = document.getElementById('ConsultasEstatusCon').value;
    minDate = $fecha_rec.value;
    $fecha.min = minDate;
    if($estado === "2"){
        //console.log('se actualiza la fecha de atención')
        $fecha.value = minDate;
    }      
}


function actualzia_ConsultasCP() {
    $ConsultasCP = document.getElementById('ConsultasCP');
    $MediosId = document.getElementById('MediosId');
    $ConsultasLocId = document.getElementById('ConsultasLocId');
    $ConsultasColId =  document.getElementById('ConsultasColId');
    $dspConsultasLocId = document.getElementById('dspConsultasLocId');
    $dspConsultasMpioId = document.getElementById('dspConsultasMpioId');
    $valores = $MediosId.value;
    const valoresPermitidos = ['5', '3', '17'];
    if (valoresPermitidos.includes($valores)) {
        //console.log('requiere CP');
        $ConsultasCP.readOnly=false; 
        $ConsultasCP.placeholder = 'Introduce el CP.';
        $dspConsultasMpioId.placeholder = 'Introduce el CP.';
        $dspConsultasLocId.placeholder = 'Introduce el CP.';
        $ConsultasLocId.readOnly=false;     
        $ConsultasColId.disabled=false;   
    } else {
        //console.log('no requiere CP');
        $ConsultasCP.readOnly=true;
        $ConsultasCP.placeholder = 'No se utiliza.';
        $dspConsultasMpioId.placeholder = 'No se utiliza.';
        $dspConsultasLocId.placeholder = 'No se utiliza.';
        $ConsultasCP.value = '';
        $ConsultasLocId.readOnly=true;
        $ConsultasLocId.value = '';
        $ConsultasColId.disabled=true;
        $ConsultasColId.value = '';
        $dspConsultasLocId.value = "";
        $dspConsultasMpioId.value = "";
    }    
}

function menu_causas() {
    $producto = document.getElementById('Producto').value;
    $url = `http://localhost/mvc_app_php/index.php?action=causas&producto=${$producto}`;
    prueba = document.getElementById('prueba');
        
    fetch($url)
    .then(response=>{
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        } else {            
            return response.json();            
        }
    })
    .then(data =>{
        const select = document.getElementById('CausaId');
        select.length = 0;       
        if(data.causas && data.causas.length > 0){
            data.causas.forEach(causa => {
                let option = new Option(causa.causa,causa.codigo_causa);
                select.add(option);
            })
        }else{
            console.error('Incorrecta la respuesta del servidor');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function generateShortUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0,
            v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    }).slice(0, 8); // Solo los primeros 8 caracteres para un UUID corto
}

function Crear_Folio() {
    folio = document.getElementById('ConsultasFolio');
    fecha = new Date();
    folio.value = `Sefi_consulta/${fecha.getMonth()}-${fecha.getFullYear()}/${generateShortUUID()}`;        
}

document.getElementById('ConsultasCP').addEventListener('change', function() {
    const cp = this.value;
    //console.log(cp);
    if (cp && cp.length === 5) {
        const url = `https://api.condusef.gob.mx/sepomex/colonias/?cp=${cp}`;

        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                } else {
                    return response.json();
                }
            })
            .then(data => {
                const select = document.getElementById('ConsultasColId');
                select.length = 0;  // Limpiar opciones existentes excepto la primera

                if (data.colonias && data.colonias.length > 0) {
                    data.colonias.forEach(colonia => {
                        let option = new Option(colonia.colonia, colonia.coloniaId);
                        option.dataset.tipoLocalidadId = colonia.tipoLocalidadId;
                        option.dataset.tipoLocalidad = colonia.tipoLocalidad;
                        option.dataset.municipioId = colonia.municipioId;
                        option.dataset.municipio = colonia.municipio;
                        option.dataset.estadoId = colonia.estadoId;
                        option.dataset.estado = colonia.estado;
                        select.add(option);
                    });

                    // Rellenar campos con la primera colonia por defecto
                    const firstColonia = data.colonias[0];
                    document.getElementById('ConsultasLocId').value = firstColonia.tipoLocalidadId;
                    document.getElementById('dspConsultasLocId').value = firstColonia.tipoLocalidad;
                    document.getElementById('ConsultasMpioId').value = firstColonia.municipioId;
                    document.getElementById('dspConsultasMpioId').value = firstColonia.municipio;
                    //document.getElementById('EstadosId').value = firstColonia.estadoId;
                    
                } else {
                    console.error('No se encontraron colonias para el CP proporcionado.');
                }
            })
            .catch(error => {
                console.error('Error al cargar las colonias:', error);
            });
    }
});

document.getElementById('ConsultasLocId').addEventListener('change', function() {
    const selectedOption = this.options[this.selectedIndex];
    if (selectedOption) {
        document.getElementById('ConsultasLocId').value = selectedOption.dataset.tipoLocalidadId;
        document.getElementById('dspConsultasLocId').value = selectedOption.dataset.tipoLocalidad;
        document.getElementById('ConsultasMpioId').value = selectedOption.dataset.municipioId;
        document.getElementById('dspConsultasMpioId').value = selectedOption.dataset.municipio;
        //document.getElementById('EstadosId').value = selectedOption.dataset.estadoId;
       
    }
});

document.getElementById('form_consultas').addEventListener('submit',function(event) {
    event.preventDefault();
    let form = event.target;
    //console.log('form: ',form)
    let formData = new FormData(form);
    //console.log('formData: ',formData);
    let formObjet = {};
    let numericFields = ['ConsultasTrim','NumConsultas','ConsultasEstatusCon','EstadosId','MediosId','ConsultasCP','ConsultasMpioId','ConsultasLocId','ConsultasColId','ConsultascatnivelatenId',]
    let dateFields = ['ConsultasFecAten','ConsultasFecRecepcion',]


    formData.forEach((value, key) => {
        if (dateFields.includes(key)) {
            if (value === "") {
                formObjet[key] = null
            } else {
                formObject[key] = convertDateFormat(value)
            }
            
        } else {
            
        }
       console.log(formObject) 
    })


})