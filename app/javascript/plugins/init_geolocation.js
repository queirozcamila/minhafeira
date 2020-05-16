// Precisamos dessa linha para que a biblioteca Rails esteja
// disponível
import Rails from '@rails/ujs';

const getAndSetLocation = () => {
  if (navigator.geolocation) {
    // Seguinte Caio, a função getCurrentPosition precisa
    // receber uma função como parâmetro, que vai ser o callback.

    // Como assim? A função que vai ser executada quando e apenas quando
    // o browser responder dando permissão, enviando o objeto que nos
    // tutoriais eles geralmente chamam de "position", mas pode ser
    // qualquer coisa \,,/_

    // Podemos fazer assim:
    // navigator.geolocation.getCurrentPosition(function() {
    //    qualquer código
    // });

    // Ou como os tutoriais sugerem:

    navigator.geolocation.getCurrentPosition(sendCoordsToServer);
  } else {
    console.log("Geolocation is not supported by this browser.");
  }
}

const sendCoordsToServer = (position) => {
  const lat = position.coords.latitude;
  const lng = position.coords.longitude;

  // Existe uma biblioteca JS para poder usar código ruby nestes
  // arquivos JS, para por exemplo usar um shops_path. Mas por
  // enquanto vamos martelar a URL mesmo!

  // Com o Rails.ajax, os parâmetros enviados como valor da chave
  // data precisam ser uma string, por isso fiz a transformação.

  // Estou especificando o formato do request pelo .js no final da URL

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
