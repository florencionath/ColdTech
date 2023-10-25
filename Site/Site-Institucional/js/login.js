function acessar() {

  var email = ipt_email.value;
  var senha = ipt_senha.value;

  if (email.indexOf('@') >= 0 && (email.indexOf('.com') >= 0 || email.indexOf('.br') >= 0)) {


    if (senha.length >= 8) {

      window.location.href = `./dashbord.html`;//Com ele o link que você fornecer abre em outra aba
    }

  }
  else {
    div_mensagem.innerHTML = '<p class="erro">E-mail ou Senha inválidos<br></p>'
  }


  //   if (senha.length >= 8) {
  //     div_mensagem.innerHTML += `<p class="sucesso">Sua senha está correta <br> </p>`;
  //     window.location.href = `./dashbord.html`;
  //   } else {
  //     div_mensagem.innerHTML += `<p class="erro">Sua senha deve possuir ao menos 8 caracteres <br> </p>`;
  //   }
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
                    <input class="ipt_nova_senha" type="password" placeholder="xxxxxxxx">
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
  const codigo = ipt_codigo;
  if(codigo.value === 1818){
    console.log('foi')
  }

}