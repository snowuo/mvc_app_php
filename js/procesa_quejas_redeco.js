/*document.getElementById()

function actualiza_contenido_queja(){
    $contenido_queja = document.getElementById('contenido_queja')
    $contenido_queja.innerHTML = "Prueba exitosa"
}*/
// Obtener todos los botones que abren el modal
console.log('funcionó')

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
    const url = 'http://localhost/mvc_app_php/index.php?action=consulta_queja';
// URL de la consulta

// El folio que deseas enviar
const folio = {
  folio: id // El valor de tu folio
};
console.log(folio)

// Realizar la solicitud POST usando fetch
fetch(url, {
  method: 'POST', // Método de la petición
  headers: {
    'Content-Type': 'application/json', // Indicamos que los datos se enviarán en formato JSON
  },
  body: JSON.stringify({ folio: folio }) // Convertimos el objeto a JSON y lo enviamos en el cuerpo de la solicitud
})
.then(response => {
  if (!response.ok) {
    throw new Error('Error en la consulta'); // Lanza un error si la respuesta no es OK (200)
  }
  return response.json(); // Si se espera una respuesta JSON
})
.then(data => {
  console.log('Respuesta:', data); // Maneja la respuesta
})
.catch(error => {
  console.error('Error:', error); // Maneja cualquier error
});

    // Actualizar el contenido del modal
    modalTitle.textContent = 'Queja con folio: ' + id;
    modalBody.textContent = 'Este es el cuerpo del Modal con ID: ' + id;

    // Abrir el modal (en Bootstrap 5)
    const myModal = new bootstrap.Modal(document.getElementById('myModal'));
    myModal.show();
  });
});
