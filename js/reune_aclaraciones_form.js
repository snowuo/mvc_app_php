

document.addEventListener('DOMContentLoaded', function() {
    menu_causas();
    Crear_Folio();
    actualiza_estado();
    actualiza_fechaRecepcion();
    actualzia_ConsultasCP()
    Estado_monetario();
});
document.getElementById('AclaracionProductoServicio').addEventListener('change',function(){
    menu_causas();
})

document.getElementById('AclaracionTrimestre ').addEventListener('change',()=>{
    actualiza_fechaRecepcion();
    actualiza_fecha_atencion();

})

document.getElementById('AclaracionEdad').addEventListener('change',()=>{
    $AclaracionEdad = document.getElementById('AclaracionEdad').value;
    if ($AclaracionEdad < 18) {
        $AclaracionEdad = 18;
        alert('No puede ser menor de edad');
        
    } else {
        
    }
})

console.log('Aclaraciones');
document.getElementById('AclaracionEstadoConPend').addEventListener('change',actualiza_estado)
function actualiza_estado() {
    $ConsultascatnivelatenId = document.getElementById('AclaracionNivelAtencion');
    $estado = document.getElementById('AclaracionEstadoConPend').value;
    $fecha_atencion = document.getElementById('AclaracionFechaAtencion');
    $AclaracionFechaResolucion = document.getElementById('AclaracionFechaResolucion');
    $AclaracionFechaNotifiUsuario = document.getElementById('AclaracionFechaNotifiUsuario');
    $AclaracionNivelAtencion = document.getElementById('AclaracionNivelAtencion');
    if ($estado === "2") {
        //console.log('Estado Concluido');
        $fecha_atencion.type = 'date';
        $fecha_atencion.readOnly = false;

        $AclaracionFechaResolucion.readOnly = false;
        $AclaracionFechaResolucion.type = 'date';

        $AclaracionFechaNotifiUsuario.readOnly = false;
        $AclaracionFechaNotifiUsuario.type = 'date';
        
        $ConsultascatnivelatenId.disabled = false;
        $AclaracionNivelAtencion.disabled = false;
        actualiza_fecha_atencion();
    } else {
        //console.log('Estado pendiente');
        $fecha_atencion.type = 'text';
        $fecha_atencion.placeholder = 'No se utiliza.';
        $fecha_atencion.value = "";
        $fecha_atencion.readOnly = true;

        $AclaracionFechaResolucion.type = 'text';
        $AclaracionFechaResolucion.placeholder = 'No se utiliza.';
        $AclaracionFechaResolucion.value = "";
        $AclaracionFechaResolucion.readOnly = true;

        $AclaracionFechaNotifiUsuario.type = 'text';
        $AclaracionFechaNotifiUsuario.placeholder = 'No se utiliza.';
        $AclaracionFechaNotifiUsuario.value = "";
        $AclaracionFechaNotifiUsuario.readOnly = true;

        $ConsultascatnivelatenId.disabled = true;
        $AclaracionNivelAtencion.disabled = true;
    }    
}

function menu_causas() {
    $producto = document.getElementById('AclaracionProductoServicio').value;
    $url = `http://localhost/mvc_app_php/index.php?action=causas&producto=${$producto}`;        
 
    fetch($url)
    .then(response=>{
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        } else {            
            return response.json();            
        }
    })
    .then(data =>{
        const select = document.getElementById('AclaracionCausaMotivo');
        select.length = 0;       
        if(data.causas && data.causas.length > 0){
            data.causas.forEach(causa => {
                let option = new Option(causa.causa,causa.codigo_causa);
                select.add(option);
            })
        }else{
            console.error(`Incorrecta la respuesta del servidor la consulta es:${$url}`);
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
    folio = document.getElementById('AclaracionFolioAtencion');
    fecha = new Date();
    folio.value = `Sefi_aclaracion/${fecha.getMonth()}-${fecha.getFullYear()}/${generateShortUUID()}`;        
}

function actualiza_fechaRecepcion() {
    $trimestre = document.getElementById('AclaracionTrimestre ').value;
    inputDate = document.getElementById('AclaracionFechaReclamacion')
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

document.getElementById('AclaracionMedioRecepcionCanal').addEventListener('change',actualzia_ConsultasCP);

function actualzia_ConsultasCP() {
    $ConsultasCP = document.getElementById('AclaracionCodigoPostal');
    $MediosId = document.getElementById('AclaracionMedioRecepcionCanal');
    $ConsultasLocId = document.getElementById('AclaracionLocalidad');
    $ConsultasColId =  document.getElementById('AclaracionColonia');
    $dspConsultasLocId = document.getElementById('dspAclaracionLocalidad');
    $dspConsultasMpioId = document.getElementById('dspAclaracionMunicipioAlcaldia');
    $AclaracionFolioCondusef = document.getElementById('AclaracionFolioCondusef');
    $AclaracionReversa = document.getElementById('AclaracionReversa');
    $valores = $MediosId.value;
    const valoresPermitidos = ['5', '3', '17'];
    const valores_sige = ['6','7']
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
    if (valores_sige.includes($valores)) {
        $AclaracionFolioCondusef.readonly = false;
        $AclaracionFolioCondusef.placeholder = 'Introduce folio Condusef'
        if($valores != '7'){
            debugger
            $AclaracionReversa.disabled = false;
        }else{
            $AclaracionReversa.disabled = true;
        }
    } else {
        $AclaracionFolioCondusef.readonly = true;
        $AclaracionFolioCondusef.placeholder = 'No se utiliza.'
        $AclaracionFolioCondusef.value = ''
        $AclaracionReversa.disabled = true;
    }
}

document.getElementById('AclaracionCodigoPostal').addEventListener('change', function() {
    const cp = this.value;
    console.log(cp);
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
                const select = document.getElementById('AclaracionColonia');
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
                    document.getElementById('AclaracionLocalidad').value = firstColonia.tipoLocalidadId;
                    document.getElementById('dspAclaracionLocalidad').value = firstColonia.tipoLocalidad;
                    document.getElementById('AclaracionMunicipioAlcaldia').value = firstColonia.municipioId;
                    document.getElementById('dspAclaracionMunicipioAlcaldia').value = firstColonia.municipio;
                    document.getElementById('AclaracionEntidadFederativa').value = firstColonia.estadoId;
                    document.getElementById('dspAclaracionEntidadFederativa').value = firstColonia.estado;
                } else {
                    console.log('No se encontraron colonias para el CP proporcionado.');
                }
            })
            .catch(error => {
                console.error('Error al cargar las colonias:', error);
            });
    }
});

document.getElementById('AclaracionLocalidad').addEventListener('change', function() {
    const selectedOption = this.options[this.selectedIndex];
    if (selectedOption) {
        document.getElementById('AclaracionLocalidad').value = selectedOption.dataset.tipoLocalidadId;
        document.getElementById('dspAclaracionLocalidad').value = selectedOption.dataset.tipoLocalidad;
        document.getElementById('AclaracionMunicipioAlcaldia').value = selectedOption.dataset.municipioId;
        document.getElementById('dspAclaracionMunicipioAlcaldia').value = selectedOption.dataset.municipio;
        document.getElementById('AclaracionEntidadFederativa').value = selectedOption.dataset.estadoId;
        document.getElementById('dspAclaracionEntidadFederativa').value = selectedOption.dataset.estado;
    }
});

document.getElementById('form_aclaraciones').addEventListener('submit',function(event) {
    event.preventDefault();
    let form = event.target;
    console.log('form: ',form)
    let formData = new FormData(form);
    console.log('formData: ',formData);
    let formObjet = {};
    let numericFields = ['ConsultasTrim','NumConsultas','ConsultasEstatusCon','EstadosId','MediosId','ConsultasCP','ConsultasMpioId','ConsultasLocId','ConsultasColId','ConsultascatnivelatenId',]
    let dateFields = ['ConsultasFecAten','ConsultasFecRecepcion',]
})

document.getElementById('AclaracionFechaReclamacion').addEventListener('change',()=>{
    //console.log('se actualiza la fecha de atencion')
    actualiza_fecha_atencion()
    ;})

function actualiza_fecha_atencion() {
    $fecha = document.getElementById('AclaracionFechaAtencion');
    $fecha_rec = document.getElementById('AclaracionFechaReclamacion');
    $estado = document.getElementById('AclaracionEstadoConPend').value;
    $AclaracionFechaResolucion = document.getElementById('AclaracionFechaResolucion');
    $AclaracionFechaNotifiUsuario = document.getElementById('AclaracionFechaNotifiUsuario');
    minDate = $fecha_rec.value;
    $fecha.min = minDate;
    $AclaracionFechaResolucion.min = minDate;
    $AclaracionFechaNotifiUsuario.min = minDate;
    if($estado === "2"){
        //console.log('se actualiza la fecha de atención')
        $fecha.value = minDate;  
        $AclaracionFechaResolucion.value = minDate;
        $AclaracionFechaNotifiUsuario.value = minDate;
    }      
}

document.getElementById('AclaracionMonetario').addEventListener('change',Estado_monetario)
function Estado_monetario() {
    $AclaracionMonetario = document.getElementById('AclaracionMonetario').value;
    $AclaracionMontoReclamado = document.getElementById('AclaracionMontoReclamado');
    if ($AclaracionMonetario === "NO") {
        $AclaracionMontoReclamado.type = 'text';
        $AclaracionMontoReclamado.value= "";
        $AclaracionMontoReclamado.readOnly = true;
        $AclaracionMontoReclamado.placeholder = 'No se utiliza';
    } else {
        $AclaracionMontoReclamado.type = 'number';
        $AclaracionMontoReclamado.readOnly = false;
        $AclaracionMontoReclamado.placeholder = 'Introduce el monto reclamado';
    }    
}

document.getElementById('AclaracionTipoPersona').addEventListener('change',function() {
     actualiza_tipo_persona()

});
function actualiza_tipo_persona() {
    $tipopersona = document.getElementById('AclaracionTipoPersona').value;
    $AclaracionEdad = document.getElementById('AclaracionEdad');
    if ($tipopersona === '2') {
        $AclaracionEdad.readOnly = true;
        $AclaracionEdad.type = 'text';
        $AclaracionEdad.placeholder = 'No se utiliza.'
        $AclaracionEdad.value = '';
    } else {
        $AclaracionEdad.readOnly = false;
        $AclaracionEdad.type = 'number';
        $AclaracionEdad.placeholder = 'Introduce la edad'
    }
}