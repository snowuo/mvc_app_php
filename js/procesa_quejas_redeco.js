const baseURLlocal = window.location.origin;
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
    const url = `${baseURLlocal}/mvc_app_php/index.php?action=consulta_queja&folio=${id}`;
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
  modalBody.textContent = 'Este ' + JSON.stringify(data, null, 2)
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
