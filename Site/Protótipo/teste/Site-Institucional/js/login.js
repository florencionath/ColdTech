function acessar() {

  var email = ipt_email.value;
  var senha = ipt_senha.value;

  if (email.indexOf('@') >= 0 && (email.indexOf('.com') >= 0 ||  email.indexOf('.br') >= 0)) {
    
    
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
