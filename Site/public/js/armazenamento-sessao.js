function cadastrar() { //CADASTRANDO COM FK
    var fkRestaurante = sessionStorage.ID_USUARIO;
    var armazenamento = caminhaoUso.value;

    // console.log(armazenamento);

    fetch(`/enderecos/cadastrar/${fkRestaurante}`, {
        method: "post",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            armazenamentoServer: armazenamento
        })
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

}
