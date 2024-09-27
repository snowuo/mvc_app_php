const baseURL = window.location.origin;
const projectFolder = window.location.pathname.split('/')[1]; // Detecta la carpeta del proyecto
const isLocalEnv = window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1';

let baseURLlocal;
if (isLocalEnv) {
    baseURLlocal = `${baseURL}/${projectFolder}`;
} else {
    baseURLlocal = baseURL; // Producción no necesita el nombre de la carpeta
}
/*document.getElementById()

function actualiza_contenido_queja(){
    $contenido_queja = document.getElementById('contenido_queja')
    $contenido_queja.innerHTML = "Prueba exitosa"
}*/
// Obtener todos los botones que abren el modal
const modalButtons = document.querySelectorAll('.open-modal-btn');

// Recorrer los botones y añadir un evento de clic
modalButtons.forEach(button => {
  button.addEventListener('click', function() {
    // Obtener el valor del atributo data-id del botón presionado
    const id = this.getAttribute('data-id');
    
    // Ahora, puedes usar 'id' para obtener los datos dinámicamente y llenar el modal

    // Ejemplo de actualización de contenido del modal
    const modalTitle = document.getElementById('modalTitle');
    const modalBody = document.getElementById('modalBody');
    const url = `${baseURLlocal}/index.php?action=consulta_queja&folio=${id}`;
// URL de la consulta

// El folio que deseas enviar
const folio = {
  folio: id // El valor de tu folio
};


// Realizar la solicitud POST usando fetch
fetch(url, {
  method: 'GET', // Método de la petición
  headers: {
    'Content-Type': 'application/json', // Indicamos que los datos se enviarán en formato JSON
  },
  
})
.then(response => {
  if (!response.ok) {
    throw new Error('Error en la consulta'); // Lanza un error si la respuesta no es OK (200)
  }
  return response.json(); // Si se espera una respuesta JSON
})
.then(data => {
  console.log('Respuesta:', data[0]); // Maneja la respuesta
  //modalBody.textContent = JSON.stringify(data, null, 2)-->se comenta para probar llenando la tabla
  const tableBody = document.getElementById('table-body');
  const dataTable = document.getElementById('data-table');
  const messageDiv = document.getElementById('message');

  tableBody.innerHTML = "";
  messageDiv.textContent = "";
  dataTable.style.display = 'none';
  messageDiv.style.display = 'none';

  // Verificar si es un mensaje o un array de datos
  if (Array.isArray(data)) {
    // Si es un array, mostrar la tabla
    dataTable.style.display = 'table';

    // Obtener las claves dinámicamente
    const keys = Object.keys(data[0]);

    // Crear filas de la tabla para cada clave
    keys.forEach(key => {
      const tr = document.createElement('tr');

      // Columna con la clave
      const th = document.createElement('th');
      th.textContent = key;
      tr.appendChild(th);

      // Columna con el valor
      const td = document.createElement('td');
      td.textContent = data[0][key] || 'No disponible';
      tr.appendChild(td);

      tableBody.appendChild(tr);
    });
  } else if (data.mensaje) {
    // Si es un mensaje de error, mostrar el mensaje
    messageDiv.style.display = 'block';
    messageDiv.textContent = data.mensaje;
  }
  

//se comenta para probar llenando la tabla
})
.catch(error => {
  
  console.error('Error:', error); // Maneja cualquier error
});

    // Actualizar el contenido del modal
    modalTitle.textContent = 'Queja con folio: ' + id;
    

    // Abrir el modal (en Bootstrap 5)
    const myModal = new bootstrap.Modal(document.getElementById('myModal'));
    myModal.show();
  });
});
