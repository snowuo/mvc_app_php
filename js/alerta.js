async function fetchData(url) {
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error("Error al obtener los datos de la API");
      }
      return await response.json();
    } catch (error) {
      console.error("Error al obtener los datos:", error);
      // Aquí podrías mostrar una alerta o mensaje indicando el problema con la aplicación
      alert("En este momento parece haber problemas con la aplicación, no responden los servidores de Condusef");
      
    }
  }
  
  // Llamadas a las APIs
  const apiUrl1 = "https://api.condusef.gob.mx/catalogos/medio-recepcion";
  const apiUrl2 = "https://api.condusef.gob.mx/catalogos/niveles-atencion";
  
  // Hacer las llamadas a la API
  fetchData(apiUrl1);
  fetchData(apiUrl2);
  