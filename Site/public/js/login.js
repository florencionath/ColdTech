function acessar() {

  var email = ipt_email.value;
  var senha = ipt_senha.value;

  if (email.indexOf('@') >= 0 && (email.indexOf('.com') >= 0 || email.indexOf('.br') >= 0) && senha.length >= 8 ) {
 //PARA LOGAR NO SISTEMA
 fetch("/usuarios/autenticar", {
  method: "POST",
  headers: {
      "Content-Type": "application/json"
  },
  body: JSON.stringify({
      emailServer: email,
      senhaServer: senha
  })
}).then(function (resposta) {
  console.log("ESTOU NO THEN DO entrar()!")

  if (resposta.status == 200) {

      resposta.json().then(json => {
          // console.log(json[0].nomeFantasia); //vetor, pegando o nomeFantasia do primeiro item
          console.log(JSON.stringify(json));
          sessionStorage.EMAIL_USUARIO = json[0].email;
          sessionStorage.NOME_USUARIO = json[0].nomeEmpresa;
          sessionStorage.ID_USUARIO = json[0].idEmpresa; 
          window.location.href = "../dashbord.html";
          // apenas para exibir o loading
      });

  } else {

      console.log("Houve um erro ao tentar realizar o login!");
      resposta.text().then(texto => {
          console.error(texto);
      });
  }

}).catch(function (erro) {
  console.log(erro);
})


  }
  else {
    div_mensagem.innerHTML = '<p class="erro">E-mail ou Senha inválidos<br></p>'
  }


  
 
}

function novaSenha() {
  var email = ipt_email.value;
  var container = container_login;

  if (email.indexOf('@') >= 0 && (email.indexOf('.com') >= 0 || email.indexOf('.br') >= 0)) {
    container.innerHTML = `
    <h1 class="titulo_recuperar_senha">Recuperar senha</h1>
    
            <div class="container_input">
            
            <div class="container_email">
                <p class="p_nova_senha"> Digite o código enviado ao e-mail <span id="ipt_email_recupera"> </span> </p>
                    <input class="ipt_codigo" id="ipt_codigo" type="number" placeholder="0000"><br>
                    <p class="p_nova_senha"> Digite a nova senha</p>
                    <input class="ipt_nova_senha"id="ipt_nova_senha" type="password" placeholder="xxxxxxxx">
                    <p class="p_nova_senha"> Confirme nova senha</p>
                    <input class="ipt_nova_senha"id="ipt_nova_senha_confirma" type="password" placeholder="xxxxxxxx">
                </div>

                <button class="botao" onclick="recuperar()">Recuperar</button><br>
                <div id="div_mensagem"></div>
            </div>
    `
    ipt_email_recupera.innerHTML = email;
  } else {
    div_mensagem.innerHTML = `Insira o e-mail cadastrado`
    div_mensagem.style = "color: red"
  }
}

function recuperar() {
  var codigo = ipt_codigo.value;
  var novaSenha = ipt_nova_senha.value;
  var novaSenhaConfirma = ipt_nova_senha_confirma.value;

  validaSenha = false;
  validaCombinacao = false;

 

  if(codigo != 1234){
    console.log(codigo)
    div_mensagem.innerHTML = `Codigo incorreto`;
    div_mensagem.style = "color: red"
  }
  if (novaSenha.length >= 8 &&
    (novaSenha.indexOf('#') >= 0
      || novaSenha.indexOf('!') >= 0
      || novaSenha.indexOf('@') >= 0
      || novaSenha.indexOf('$') >= 0
      || novaSenha.indexOf('%') >= 0
      || novaSenha.indexOf('&') >= 0
      || novaSenha.indexOf('*') >= 0)
  ) {
    validaSenha = true;
  } else {
    div_mensagem.innerHTML = `Sua senha deve possuir ao menos 8 caracteres <br> e pelo menos um caracter especial! <br>`;
    div_mensagem.style = "color: red"

  }


  if (novaSenhaConfirma == novaSenha && novaSenhaConfirma.length >= 8) {
    validaCombinacao = true;
  } else { div_mensagem.innerHTML = `A confirmação deve ser identica a senha! <br>`;div_mensagem.style = "color: red"}

  if (codigo == 1234 && validaSenha && validaCombinacao) {
    console.log('entrou')
    window.location.href = `./login.html`;
  }
}
