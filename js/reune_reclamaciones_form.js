document.addEventListener('DOMContentLoaded', function() {
    menu_causas();
    Crear_Folio();
    actualiza_fechaRecepcion();
    actualiza_estado();
    actualzia_ConsultasCP();
    Estado_monetario()
});

document.getElementById('RecTrimestre').addEventListener('change',()=>{
    actualiza_fechaRecepcion();
    actualiza_fecha_atencion();
})
document.getElementById('RecProductoServicio').addEventListener('change',function(){
    menu_causas();
})
document.getElementById('RecEstadoConPend').addEventListener('change',()=>{   
    actualiza_estado()
})

document.getElementById('RecFechaReclamacion').addEventListener('change',()=>{
    //console.log('se actualiza la fecha de atencion')
    actualiza_fecha_atencion()
    ;})

document.getElementById('RecMedioRecepcionCanal').addEventListener('change',actualzia_ConsultasCP);

document.getElementById('RecMonetario').addEventListener('change',()=>{
    Estado_monetario();
})

document.getElementById('RecImporteAbonado').addEventListener('change', () => {
    $RecImporteAbonado = document.getElementById('RecImporteAbonado').value;
    $RecFechaAbonoImporte = document.getElementById('RecFechaAbonoImporte');
    $RecFechaReclamacion = document.getElementById('RecFechaReclamacion');
    $mindate=$RecFechaReclamacion.value;
    if($RecImporteAbonado > 0){        
        $RecFechaAbonoImporte.type = 'date';
        $RecFechaAbonoImporte.readOnly = false;
        $RecFechaAbonoImporte.minDate = $mindate;
        $RecFechaAbonoImporte.value = $mindate;
    }else{
        $RecFechaAbonoImporte.type = 'text';
        $RecFechaAbonoImporte.value= "";
        $RecFechaAbonoImporte.readOnly = true;
        $RecFechaAbonoImporte.placeholder = 'No se utiliza';        
    }


})

document.getElementById('RecTipoPersona').addEventListener('change',function() {
    actualiza_tipo_persona()

});
function actualiza_tipo_persona() {
   $tipopersona = document.getElementById('RecTipoPersona').value;
   $AclaracionEdad = document.getElementById('RecEdad');
   $RecSexo = document.getElementById('RecSexo');
   if ($tipopersona === '2') {
       $AclaracionEdad.readOnly = true;
       $AclaracionEdad.type = 'text';
       $AclaracionEdad.placeholder = 'No se utiliza.'
       $AclaracionEdad.value = '';
       
       $RecSexo.disabled = true;
   } else {
       $AclaracionEdad.readOnly = false;
       $AclaracionEdad.type = 'number';
       $AclaracionEdad.placeholder = 'Introduce la edad'
       $RecSexo.disabled = false;
   }
}

function Estado_monetario() {
    $AclaracionMonetario = document.getElementById('RecMonetario').value;
    $AclaracionMontoReclamado = document.getElementById('RecMontoReclamado');
    $RecImporteAbonado = document.getElementById('RecImporteAbonado');
    $RecFechaAbonoImporte = document.getElementById('RecFechaAbonoImporte');
    if ($AclaracionMonetario === "NO") {
        $AclaracionMontoReclamado.type = 'text';
        $AclaracionMontoReclamado.value= "";
        $AclaracionMontoReclamado.readOnly = true;
        $AclaracionMontoReclamado.placeholder = 'No se utiliza';

        $RecImporteAbonado.type = 'text';
        $RecImporteAbonado.value= "";
        $RecImporteAbonado.readOnly = true;
        $RecImporteAbonado.placeholder = 'No se utiliza';

        $RecFechaAbonoImporte.type = 'text';
        $RecFechaAbonoImporte.value= "";
        $RecFechaAbonoImporte.readOnly = true;
        $RecFechaAbonoImporte.placeholder = 'Introduzca el importe abonado';  


    } else {
        $AclaracionMontoReclamado.type = 'number';
        $AclaracionMontoReclamado.readOnly = false;
        $AclaracionMontoReclamado.placeholder = 'Introduce el monto reclamado';

        $RecImporteAbonado.type = 'number';        
        $RecImporteAbonado.readOnly = false;
        $RecImporteAbonado.placeholder = 'Introduce el monto abonado';
    }    
}

function actualiza_fecha_atencion() {
    $fecha = document.getElementById('RecFechaAtencion');
    $fecha_resolucion = document.getElementById('RecFechaResolucion');
    $RecFechaNotifiUsuario = document.getElementById('RecFechaNotifiUsuario');
    $RecFechaAbonoImporte = document.getElementById('RecFechaAbonoImporte');
    $RecMonetario = document.getElementById('RecMonetario').value;
    $RecImporteAbonado = document.getElementById('RecImporteAbonado').value;
    
    $fecha_rec = document.getElementById('RecFechaReclamacion');
    $estado = document.getElementById('RecEstadoConPend').value;
    
    minDate = $fecha_rec.value;
    $fecha.min = minDate;
    $RecFechaNotifiUsuario.min = minDate;
    $fecha_resolucion.min = minDate;
    if($estado === "2"){
        //console.log('se actualiza la fecha de atención')
        $fecha.value = minDate;
        $RecFechaNotifiUsuario.value = minDate;
        $fecha_resolucion.value = minDate;
        if($RecMonetario === 'SI' && $RecImporteAbonado > 0 ){$RecFechaAbonoImporte.value = minDate;}
        
    }      
}

function actualiza_estado() {    
    $estado = document.getElementById('RecEstadoConPend').value;
    $fecha_atencion = document.getElementById('RecFechaAtencion');
    $AclaracionFechaResolucion = document.getElementById('RecFechaResolucion');
    $AclaracionFechaNotifiUsuario = document.getElementById('RecFechaNotifiUsuario');
    $AclaracionNivelAtencion = document.getElementById('RecNivelAtencion');
    $RecMonetario = document.getElementById('RecMonetario');
    $RecSentidoResolucion = document.getElementById('RecSentidoResolucion')
    if ($estado === "2") {
        //console.log('Estado Concluido');
        $fecha_atencion.type = 'date';
        $fecha_atencion.readOnly = false;

        $AclaracionFechaResolucion.readOnly = false;
        $AclaracionFechaResolucion.type = 'date';

        $AclaracionFechaNotifiUsuario.readOnly = false;
        $AclaracionFechaNotifiUsuario.type = 'date';
        
        $AclaracionNivelAtencion.disabled = false;

        $RecMonetario.disabled = false;
        $RecSentidoResolucion.disabled = false;
        RecNivelAtencion.disabled = false;

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

        $AclaracionNivelAtencion.disabled = true;

        $RecMonetario.disabled = true
        $RecSentidoResolucion.disabled = true;
        RecNivelAtencion.disabled = true;
    }    
}
console.log('Reclamaciones');
function menu_causas() {
    $producto = document.getElementById('RecProductoServicio').value;
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
        const select = document.getElementById('RecCausaMotivo');
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
    folio = document.getElementById('RecFolioAtencion');
    fecha = new Date();
    folio.value = `Sefi_reclamacion/${fecha.getMonth()}-${fecha.getFullYear()}/${generateShortUUID()}`;        
}

document.getElementById('RecCodigoPostal').addEventListener('change', function() {
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
                const select = document.getElementById('RecColonia');
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
                    document.getElementById('RecLocalidad').value = firstColonia.tipoLocalidadId;
                    document.getElementById('dspRecLocalidad').value = firstColonia.tipoLocalidad;
                    document.getElementById('RecMunicipioAlcaldia').value = firstColonia.municipioId;
                    document.getElementById('dspRecMunicipioAlcaldia').value = firstColonia.municipio;
                    document.getElementById('RecEntidadFederativa').value = firstColonia.estadoId;
                    document.getElementById('dspRecEntidadFederativa').value = firstColonia.estado;
                } else {
                    console.log('No se encontraron colonias para el CP proporcionado.');
                }
            })
            .catch(error => {
                console.error('Error al cargar las colonias:', error);
            });
    }
});

document.getElementById('RecLocalidad').addEventListener('change', function() {
    const selectedOption = this.options[this.selectedIndex];
    if (selectedOption) {
        document.getElementById('RecLocalidad').value = selectedOption.dataset.tipoLocalidadId;
        document.getElementById('dspRecLocalidad').value = selectedOption.dataset.tipoLocalidad;
        document.getElementById('RecMunicipioAlcaldia').value = selectedOption.dataset.municipioId;
        document.getElementById('dspRecMunicipioAlcaldia').value = selectedOption.dataset.municipio;
        document.getElementById('RecEntidadFederativa').value = selectedOption.dataset.estadoId;
        document.getElementById('dspRecEntidadFederativa').value = selectedOption.dataset.estado;
    }
});

document.getElementById('form_rec').addEventListener('submit',function(event) {
    event.preventDefault();
    let form = event.target;
    console.log('form: ',form)
    let formData = new FormData(form);
    console.log('formData: ',formData);
    let formObjet = {};
    const alfanumerico = [
        "RecDenominacion",
        "RecSector",
        "RecFolioAtencion",
        "RecProductoServicio",
        "RecCausaMotivo",
        "RecMonetario",
        "RecPori",
        "RecSexo",
        "RecFolioCondusef"
    ];
    
    const numerico = [
        "RecTrimestre",
        "RecNumero",
        "RecEstadoConPend",
        "RecMedioRecepcionCanal",
        "RecEntidadFederativa",
        "RecCodigoPostal",
        "RecMunicipioAlcaldia",
        "RecLocalidad",
        "RecColonia",
        "RecMontoReclamado",
        "RecImporteAbonado",
        "RecTipoPersona",
        "RecEdad",
        "RecSentidoResolucion",
        "RecNivelAtencion",
        "RecReversa"
    ];
    
    const fecha = [
        "RecFechaReclamacion",
        "RecFechaAtencion",
        "RecFechaResolucion",
        "RecFechaNotifiUsuario",
        "RecFechaAbonoImporte"
    ];
    

})

function actualiza_fechaRecepcion() {
    $trimestre = document.getElementById('RecTrimestre').value;
    inputDate = document.getElementById('RecFechaReclamacion')
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


function actualzia_ConsultasCP() {
    $ConsultasCP = document.getElementById('RecCodigoPostal');
    $MediosId = document.getElementById('RecMedioRecepcionCanal');
    $ConsultasLocId = document.getElementById('RecLocalidad');
    $ConsultasColId =  document.getElementById('RecColonia');
    $dspConsultasLocId = document.getElementById('dspRecLocalidad');
    $dspConsultasMpioId = document.getElementById('dspRecMunicipioAlcaldia');
    $AclaracionFolioCondusef = document.getElementById('RecFolioCondusef');
    $AclaracionReversa = document.getElementById('RecReversa');
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
        $AclaracionFolioCondusef.readOnly = false;
        $AclaracionFolioCondusef.placeholder = 'Introduce folio Condusef'
        if($valores != '7'){
            debugger
            $AclaracionReversa.disabled = false;
        }else{
            $AclaracionReversa.disabled = true;
        }
    } else {
        $AclaracionFolioCondusef.readOnly = true
        $AclaracionFolioCondusef.placeholder = 'No se utiliza.'
        $AclaracionFolioCondusef.value = ''
        $AclaracionReversa.disabled = true;
    }
}