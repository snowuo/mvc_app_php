document.getElementById('envia_consulta').addEventListener('click',(event)=>{
    event.preventDefault();
    
    $año = document.getElementById('queja_año').value
    $mes = document.getElementById('queja_mes').value
    $url = `https://api.condusef.gob.mx/redeco/quejas/?year=${$año}&month=${$mes}`
    console.log(token);
    fetch($url,{
        method: 'GET',  // o 'POST' dependiendo de la solicitud que necesites hacer
        headers: {
            'Authorization': token,
            'Content-Type': 'application/json'  // Dependiendo del tipo de contenido que la API espera
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new console.error(`HTTP error! status: ${response.status}`);
        } else {
            return response.json();
        }
    })
    .then(data=>{
        console.log(data)
    })
    .catch(error => console.log('error :',error))
})