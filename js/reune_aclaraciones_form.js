document.addEventListener('DOMContentLoaded', function() {

    Crear_Folio();

});
console.log('Aclaraciones');

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