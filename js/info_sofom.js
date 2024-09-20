const baseURLlocal = window.location.origin;
function openModal_denominacion() {
    var modal_denominacion = new bootstrap.Modal(document.getElementById('modal_denominacion'));
    modal_denominacion.show();
  }

  function closeModal_denominacion() {
    var modal_denominacion = new bootstrap.Modal(document.getElementById('modal_denominacion'));
    modal_denominacion.hide();
  }

  function submitForm_denominacion() {
    const formData = new FormData(document.getElementById('updateForm'));
    const formObj = Object.fromEntries(formData.entries());
    const formBody = new URLSearchParams(formObj).toString();

    fetch(`${baseURLlocal}/index.php?action=actualiza_denominacion`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: formBody
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      // Maneja la respuesta exitosa del servidor
      alert(data.message);
      closeModal_denominacion();
    })
    .catch(error => {
      // Maneja errores
      alert('Error al actualizar el valor');
      console.error('Error:', error);
    });
  }

  /*scripts para modal sector */

  function openModal_sector() {
    var modal_sector = new bootstrap.Modal(document.getElementById('modal_sector'));
    modal_sector.show();
  }

  function closeModal_sector() {
    var modal_sector = new bootstrap.Modal(document.getElementById('modal_sector'));
    modal_sector.hide();
  }

  function submitForm_sector() {
    const formData = new FormData(document.getElementById('update_sector_Form'));
    const formObj = Object.fromEntries(formData.entries());
    const formBody = new URLSearchParams(formObj).toString();

    fetch(`${baseURLlocal}/index.php?action=actualiza_sector`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: formBody
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      // Maneja la respuesta exitosa del servidor
      alert(data.message);
      closeModal_sector();
    })
    .catch(error => {
      // Maneja errores
      alert('Error al actualizar el valor');
      console.error('Error:', error);
    });
  }