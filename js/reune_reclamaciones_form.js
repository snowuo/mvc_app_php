document.addEventListener('DOMContentLoaded', function() {
    menu_causas();
    Crear_Folio();

});
document.getElementById('RecProductoServicio').addEventListener('change',function(){
    menu_causas();
})
console.log('Reclamaciones');
function menu_causas() {
    $producto = document.getElementById('RecProductoServicio').value;
    $url = `http://localhost/app_php/index.php?action=causas&producto=${$producto}`;        
 
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
    let numericFields = ['ConsultasTrim','NumConsultas','ConsultasEstatusCon','EstadosId','MediosId','ConsultasCP','ConsultasMpioId','ConsultasLocId','ConsultasColId','ConsultascatnivelatenId',]
    let dateFields = ['ConsultasFecAten','ConsultasFecRecepcion',]

})