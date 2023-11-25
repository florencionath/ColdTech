function cadastrar() { //CADASTRANDO COM FK
    var fkEmpresa = sessionStorage.ID_USUARIO;
    var rua = document.getElementById("rua").value;
    var bairro = document.getElementById("bairro").value;
    var cidade = document.getElementById("cidade").value;
    var estado = document.getElementById("uf").value;
    var cep = document.getElementById("cep").value;
    var numero = document.getElementById("numero").value;
    var complemento = document.getElementById("complemento").value;

    fetch(`/enderecos/cadastrar/${fkEmpresa}`, {
        method: "post",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            ruaServer: rua,
            bairroServer: bairro,
            cidadeServer: cidade,
            estadoServer: estado,
            cepServer: cep,
            numeroServer: numero,
            complementoServer: complemento
            
        })
    })
    .then(function (resposta) { //CARD DE REDIRECIONAMENTO
      console.log("resposta: ", resposta);

      if (resposta.ok) {
        cardErro.style.display = "block";

        mensagem_erro.innerHTML =
          "Cadastro realizado com sucesso! Redirecionando para tela de Pratos...";

        setTimeout(() => {
          window.location = "./pratos.html";
        }, "2000");

  
      } else {
        throw "Houve um erro ao tentar realizar o cadastro!";
      }
    })
    .catch(function (resposta) {
      console.log(`#ERRO: ${resposta}`);
      finalizarAguardar();
    });

  return false;

}