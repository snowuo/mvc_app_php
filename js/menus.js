
document.addEventListener('DOMContentLoaded', function() {
    actualiza_catalogo_nivat();
    actualiza_catalogo_Medio_rec();
    Crear_Folio();
    menu_causas();
    actualizarOpcionesRespuesta('1');
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
        const quejasFecResolucion = document.getElementById('quejasFecResolucion');
        const quejasFecNotificacion = document.getElementById('quejasFecNotificacion');
        const QuejasNumPenal = document.getElementById('QuejasNumPenal');

        // Limpiar las opciones existentes
        selectRespuesta.innerHTML = '';

        // Definir las nuevas opciones basadas en el valor de QuejasEstatus
        if (valorEstatus === '2') {

            selectRespuesta.disabled = false; 


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

            quejasFecResolucion.type = 'date';
            quejasFecResolucion.readOnly = false;
            quejasFecNotificacion.type = 'date';
            quejasFecNotificacion.readOnly = false;
            QuejasNumPenal.value = 1;
            QuejasNumPenal.readOnly = false;

        } else if (valorEstatus === '1') {
            // Solo se agrega una opción si el valor es '2'
            
            quejasFecResolucion.type = 'text';
            quejasFecResolucion.value = '';
            quejasFecResolucion.readOnly = true; 

            quejasFecNotificacion.type = 'text';
            quejasFecNotificacion.value = '';
            quejasFecNotificacion.readOnly = true; 

            QuejasNumPenal.value = 0;
            QuejasNumPenal.readOnly = true;

            
            const elementoOpcion = new Option('No aplica', '0');
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
    sexoSelect.innerHTML = " ";

    if (tipoPersona === '2') { // Si es Persona Moral

        const elementoOpcion = new Option('No disponible', '0');
        sexoSelect.add(elementoOpcion);
        edadInput.readOnly = true;
        sexoSelect.readOnly = true;


                edadInput.value = '0';

    } else {

        edadInput.disabled = false;
        sexoSelect.disabled = false;
        const opciones = [
            { valor: 'H', texto: 'Hombre' },
            { valor: 'M', texto: 'Mujer' },
        ];
        // Agregar las nuevas opciones al select
        opciones.forEach(opcion => {
            const elementoOpcion = new Option(opcion.texto, opcion.valor);
            sexoSelect.add(elementoOpcion);
        });
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

document.getElementById('QuejasProducto').addEventListener('change',menu_causas)

function menu_causas() {
    const producto = document.getElementById('QuejasProducto').value;
    const url = `https://api.condusef.gob.mx/catalogos/causas-list/?product=${producto}`;
    document.getElementById('causasId').value = producto;
    
    fetch(url,{
        method: 'GET',  // o 'POST' dependiendo de la solicitud que necesites hacer
        headers: {
            'Authorization': token,
            'Content-Type': 'application/json'  // Dependiendo del tipo de contenido que la API espera
        }
    })

        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);              

            }else{
                return response.json();
            }
        })
        .then(data => {
            const select = document.getElementById('causasId');
            select.length = 0;
            if (data.causas && data.causas.length > 0) {
                data.causas.forEach(causa => {
                    let option = new Option(causa.causa,causa.causaId);
                    select.add(option);
                })
            }
        })
}

// script.js
// script.js



            document.getElementById('form_queja').addEventListener('submit', function(event) {
                event.preventDefault(); // Evita el envío del formulario
            
                let form = event.target;
                let formData = new FormData(form);
                let formObject = {};
            
                // Definir los nombres de los campos que deben ser numéricos
                let numericFields = ['QuejasNoMes','QuejasNum', 'QuejasMedio', 'QuejasNivelAT', 'QuejasEstatus', 'QuejasCP', 'QuejasColId', 'QuejasLocId', 'QuejasMunId', 'QuejasEstados', 'QuejasTipoPersona', 'QuejasPenalizacion'];
            
                // Definir los nombres de los campos que deben ser fechas
                let dateFields = ['QuejasFecRecepcion', 'QuejasFecResolucion', 'QuejasFecNotificacion'];

                let qr = ['QuejasRespuesta', 'QuejasNumPenal','QuejasEdad']
                let qrt = ['QuejasSexo']
            
                formData.forEach((value, key) => {
                    // Verificar si el campo debe ser numérico
                    if (qrt.includes(key)){
                        if (value === "0") {
                            formObject[key] = null                                                    
                        }else{
                            formObject[key] = value;
                        }
                    }else if (qr.includes(key)){
                        if (value === "0") {
                            formObject[key] = null                                                    
                        }else{
                            formObject[key] = Number(value);
                        }
                        
                    }else if (numericFields.includes(key)) {
                        if (value === "") {
                            formObject[key] = null                                                    
                        }else{
                            formObject[key] = Number(value);
                        }
                        
                    } 
                    // Verificar si el campo debe ser una fecha
                    else if (dateFields.includes(key)) {
                        if (value === "") {
                            formObject[key] = null; // Asignar null si el campo está vacío
                        } else {
                            formObject[key] = convertDateFormat(value);
                        }
                    } 
                    else {
                        formObject[key] = value;
                    }
                });
            
                let jsonString = JSON.stringify(formObject, null, 2);

                   //insertar el envío por formulario 

                   fetch('http://localhost/app_php/index.php?action=save-form',{
                    method: 'POST',
                    headers:{
                        'Content-Type':'application/json'
                    },
                    body:jsonString
                   })
                   .then(response => response.text())
                   .then(data => {alert(data);})
                   .catch(error => {console.error('Error',error);

                   });
                   //termina

                   console.log('termina');
                //downloadJSON(jsonString, 'formulario.json');
            });
            
            function convertDateFormat(dateString) {
                // Convertir fecha de yyyy-mm-dd a dd/mm/yyyy
                let regex = /^(\d{4})-(\d{2})-(\d{2})$/;
                let matches = dateString.match(regex);
            
                if (matches) {
                    let year = matches[1];
                    let month = matches[2];
                    let day = matches[3];
                    return `${day}/${month}/${year}`;
                }
                return dateString; // Si no coincide con el formato esperado, retornar la cadena original
            }
            
            function downloadJSON(jsonString, filename) {
                let blob = new Blob([jsonString], { type: 'application/json' });
                let link = document.createElement('a');
            
                link.href = URL.createObjectURL(blob);
                link.download = filename;
                link.click();
            
                URL.revokeObjectURL(link.href);
            }
            