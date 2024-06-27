
document.addEventListener('DOMContentLoaded', function() {
    actualiza_catalogo_nivat();
    actualiza_catalogo_Medio_rec();
    Crear_Folio();
});


   function updateDateInput() {
        var select = document.getElementById('QuejasNoTrim');
        var selectedMonth = parseInt(select.value, 10);
        var currentDate = new Date();

        // Set the minimum date to the first day of the selected month of the current year
        var minDate = new Date(currentDate.getFullYear(), selectedMonth - 1, 1);
        document.getElementById('quejasFecRecepcion').min = minDate.toISOString().split('T')[0];

        // Set the maximum date to the last day of the selected month of the current year
        var maxDate = new Date(currentDate.getFullYear(), selectedMonth, 0);
        document.getElementById('quejasFecRecepcion').max = maxDate.toISOString().split('T')[0];
        
        // Set the value of the date input to the first day of the selected month
        document.getElementById('quejasFecRecepcion').value = minDate.toISOString().split('T')[0];
    }

    // Run the function initially to set the initial state
    document.getElementById('QuejasNoTrim').addEventListener('change', () => {
            updateDateInput();
            console.log('cambió la fecha');
        })
   
   // Función para actualizar las opciones de QuejasRespuesta
   function actualizarOpcionesRespuesta(valorEstatus) {
        const selectRespuesta = document.getElementById('QuejasRespuesta');
        // Limpiar las opciones existentes
        selectRespuesta.innerHTML = '';

        // Definir las nuevas opciones basadas en el valor de QuejasEstatus
        if (valorEstatus === '2') {
            const opciones = [
                { valor: '1', texto: 'Totalmente favorable al usuario' },
                { valor: '2', texto: 'Desfavorable al usuario' },
                { valor: '3', texto: 'Parcialmente favorable al usuario' }
            ];

            // Agregar las nuevas opciones al select
            opciones.forEach(opcion => {
                const elementoOpcion = new Option(opcion.texto, opcion.valor);
                selectRespuesta.add(elementoOpcion);
            });
        } else if (valorEstatus === '1') {
            // Solo se agrega una opción si el valor es '2'
            const elementoOpcion = new Option('Pendiente', '1');
            selectRespuesta.add(elementoOpcion);

        }
    }

    // Añadir el event listener al select de QuejasEstatus
    document.getElementById('QuejasEstatus').addEventListener('change', function() {
        actualizarOpcionesRespuesta(this.value);
    });
/* Aqui está el anterior script de CP
    document.getElementById('QuejasCP').addEventListener('change', function() {
    const cp = this.value;
    console.log('QuejasCP');
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
                const select = document.getElementById('QuejasColId');
                select.length = 0;  // Limpiar opciones existentes excepto la primera

                if (data.colonias && data.colonias.length > 0) {
                    data.colonias.forEach(colonia => {
                        let option = new Option(colonia.colonia, colonia.coloniaId);
                        select.add(option);
                    });
                } else {
                    console.log('No se encontraron colonias para el CP proporcionado.');
                }
            })
            .catch(error => {
                console.error('Error al cargar las colonias:', error);
            });
    }
});*/

document.getElementById('QuejasCP').addEventListener('change', function() {
    const cp = this.value;
    console.log('QuejasCP');
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
                const select = document.getElementById('QuejasColId');
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
                    document.getElementById('QuejasLocId').value = firstColonia.tipoLocalidadId;
                    document.getElementById('QuejasLocalidad').value = firstColonia.tipoLocalidad;
                    document.getElementById('QuejasMunId').value = firstColonia.municipioId;
                    document.getElementById('Quejasmunicipio').value = firstColonia.municipio;
                    document.getElementById('EstadosId').value = firstColonia.estadoId;
                    document.getElementById('Quejasestado').value = firstColonia.estado;
                } else {
                    console.log('No se encontraron colonias para el CP proporcionado.');
                }
            })
            .catch(error => {
                console.error('Error al cargar las colonias:', error);
            });
    }
});

// Agregar evento para actualizar localidad y otros campos al seleccionar una colonia
document.getElementById('QuejasColId').addEventListener('change', function() {
    const selectedOption = this.options[this.selectedIndex];
    if (selectedOption) {
        document.getElementById('QuejasLocId').value = selectedOption.dataset.tipoLocalidadId;
        document.getElementById('QuejasLocalidad').value = selectedOption.dataset.tipoLocalidad;
        document.getElementById('QuejasMunId').value = selectedOption.dataset.municipioId;
        document.getElementById('Quejasmunicipio').value = selectedOption.dataset.municipio;
        document.getElementById('EstadosId').value = selectedOption.dataset.estadoId;
        document.getElementById('Quejasestado').value = selectedOption.dataset.estado;
    }
});





function actualiza_catalogo_nivat() {
    // Hacer una solicitud a la API
    fetch('https://api.condusef.gob.mx/catalogos/niveles-atencion')
    .then(response => response.json())
    .then(data => {
        // Si hay un error en la respuesta de la API, mostrar un mensaje en el select
        if (data && data.error ) {
            const select = document.getElementById('nivelATSelect');
            select.innerHTML = ''; // Limpiar el select
            const option = document.createElement('option');
            option.text = 'Hubo un error, intenta más tarde';
            select.appendChild(option);
        } else {
            // Obtener la lista de niveles de atención del JSON
            const nivelesDeAtencion = data.nivelesDeAtencion;
            
            // Obtener el select
            const select = document.getElementById('nivelATSelect');

            // Limpiar el select antes de llenarlo
            select.innerHTML = '';

            // Rellenar el select con las opciones del JSON
            nivelesDeAtencion.forEach(nivel => {
                const option = document.createElement('option');
                option.value = nivel.nivelDeAtencionId;
                option.text = nivel.nivelDeAtencionDsc;
                select.appendChild(option);
            });
        }
    })
    .catch(error => console.error('Error al obtener los datos de niveles de atención:', error));
}


function actualiza_catalogo_Medio_rec() {
    fetch('https://api.condusef.gob.mx/catalogos/medio-recepcion')
    .then(response => response.json())
    .then(data => {
        // Si hay un error en la respuesta de la API, mostrar un mensaje en el select
        if (data && data.error && data.error === "Parece que ha ocurrido un error al intentar consultar los medios de Recepción") {
            const select = document.getElementById('MedioId');
            select.innerHTML = ''; // Limpiar el select
            const option = document.createElement('option');
            option.text = 'Hubo un error, intenta más tarde';
            select.appendChild(option);
        } else {
            // Obtener la lista de medios de recepción del JSON
            const medioRecepcion = data.medio;
            
            // Obtener el select
            const select = document.getElementById('MedioId');

            // Limpiar el select antes de llenarlo
            select.innerHTML = '';

            // Rellenar el select con las opciones del JSON
            medioRecepcion.forEach(medio => {
                const option = document.createElement('option');
                option.value = medio.medioId;
                option.text = medio.medioDsc;
                select.appendChild(option);
            });
        }
    })
    .catch(error => console.error('Error al obtener los datos de medio de recepción:', error));
}


// Función para llenar el select con los productos obtenidos de la API
function llenarSelect(data) {
    const select = document.getElementById('productSelect');
    data.products.forEach(producto => {
        const option = document.createElement('option');
        option.value = producto.productId;
        option.textContent = `${producto.product} - ${producto.institucion}`;
        select.appendChild(option);
    });
}

document.getElementById('QuejasTipoPersona').addEventListener('change', function() {
    var tipoPersona = this.value;
    var edadInput = document.getElementById('QuejasEdad');
    var sexoSelect = document.getElementById('QuejasSexo');

    if (tipoPersona === '2') { // Si es Persona Moral


        // Desactivar los campos de edad y sexo


        /*edadInput.readOnly = true;
        sexoSelect.readOnly = true;*/
        edadInput.disabled = true;
        sexoSelect.disabled = true;

                // Reiniciar el valor de la edad y sexo a null
                edadInput.value = null;
                sexoSelect.value = null;

    } else {
        // Habilitar los campos de edad y sexo
        edadInput.disabled = false;
        sexoSelect.disabled = false;
    }
});
// a partir de aqui se actualiza la fecha conforme al periodo de envío
 
    updateDateInput();




    function generateShortUUID() {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random() * 16 | 0,
                v = c === 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        }).slice(0, 8); // Solo los primeros 8 caracteres para un UUID corto
    }

    function Crear_Folio() {
        folio = document.getElementById('QuejasFolio');
        fecha = new Date();
        folio.value = `Sefi/${fecha.getMonth()}-${fecha.getFullYear()}/${generateShortUUID()}`;        
    }

    function hola() {
        console.log("hola");
        console.log(token); // Puedes usar la variable en JavaScript
    }

    hola();