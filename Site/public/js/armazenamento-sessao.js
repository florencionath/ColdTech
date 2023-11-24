
var listaCaminhoes = []

function cadastrarCaminhao() { //CADASTRANDO COM FK
    var fkEmpresa = sessionStorage.ID_USUARIO;
    var nomeArmazenamento = input_nomeCaminhao.value;
    var renavam = input_renavam.value

    // console.log(armazenamento);

    fetch(`/armazenamentos/cadastrarCaminhao/${fkEmpresa}`, {
        method: "post",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            nomeArmazenamentoServer: nomeArmazenamento,
            renavamServer: renavam
            
        })
    
    })
    .then((response) => {
        if (response && response.ok) {
            console.log(response)

            listaCaminhoes.push(response.renavam);

            console.log(listaCaminhoes);
        }
    }).catch((error) => {
        console.log(error)
    })

    // .then(function (resposta) { //CARD DE REDIRECIONAMENTO
    //     console.log("resposta: ", resposta);

    //     if (resposta.ok) {
    //       cardErro.style.display = "block";

    //       mensagem_erro.innerHTML =
    //         "Cadastro realizado com sucesso! Redirecionando para tela de Cardápio...";

    //       setTimeout(() => {
    //         window.location = "./cardapio.html";
    //       }, "2000");

    
    //     } else {
    //       throw "Houve um erro ao tentar realizar o cadastro!";
    //     }
    //   })
    //   .catch(function (resposta) {
    //     console.log(`#ERRO: ${resposta}`);
    //     finalizarAguardar();
    //   });

    // return false;

    console.log(fkEmpresa);
    console.log(nomeArmazenamento);
    console.log(renavam);

}
