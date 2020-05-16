// Precisamos dessa linha para que o "plugin" Rails esteja
// disponível
import Rails from '@rails/ujs';

const getAndSetLocation = () => {
  if (navigator.geolocation) {
    // Seguinte Caio, quando chamamos a função
    // navigator.geolocation.getCurrentPosition()
    // ela espera receber uma função como parâmetro para ser o callback.

    // https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/getCurrentPosition


    // Callback -> função que vai ser executada quando a getCurrentPosition
    // terminar sua execução, sem travar o restante do código.
    // Se quiser ler mais, procura por callback asyn

    // Então a callback function vai ser executada apenas quando
    // o browser responder dando permissão, enviando o objeto que nos
    // tutoriais eles geralmente chamam de "position", mas pode ser
    // qualquer coisa

    // Podemos fazer assim:
    // navigator.geolocation.getCurrentPosition(function() {
    //    qualquer código
    // });

    // Ou como os tutoriais sugerem, que é mais organizado:

    navigator.geolocation.getCurrentPosition(sendCoordsToServer);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

const sendCoordsToServer = (position) => {
  const lat = position.coords.latitude;
  const lng = position.coords.longitude;

  // Com o Rails.ajax, um dos argumentos, o data, é onde enviamos o
  // que chega no servidor como params. Eu li que tem que enviar sempre
  // como string nessa biblioteca, mas não testei sem ;) Caso fique curioso.

  // MATANDO A CHARADA: especifiquei o formato do request pelo .js
  // no final da URL

  Rails.ajax({
    url: "/shops.js",
    type: "get",
    data: new URLSearchParams({
      lat: lat,
      lng: lng
    }).toString(),
    success: function(data) {
      console.log("Here's the answer of the server, sir:");
      console.log(data);
      console.log("You should do something with it");

      // Dica do quê fazer:
      // Vê como importar o initMapbox aqui,
      // muda os markers do DOM a partir do 'data' que o servidor
      // respondeu, e aí executa o initMapbox.

      // De início, re-executa mesmo. Depois pensa em como alterar o
      // curso do código para executar initMapbox apenas uma vez:
      // - com todos markers caso o cara não dê permissão de geolocation
      // - só com os markers do 'data' caso dê a permissão
    },
    error: function(data) {
      console.log("Bad news, sir:");
      console.log(data);
      console.log("You should do something with it");
    }
  })
}

export { getAndSetLocation };

// OBS: Existe uma biblioteca JS para poder usar código ruby nestes
// arquivos JS, para por exemplo usar um <%= shops_path %>. Não importei
// ela no projeto, então por isso martelei a URL no Ajax!
