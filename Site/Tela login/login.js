function acessar() {

  var email = ipt_email.value;
  var senha = ipt_senha.value;

  if (email.indexOf('@') >= 0 && (email.indexOf('.com') >= 0 ||  email.indexOf('.br') >= 0)) {
    div_mensagem.innerHTML = ' <p class="sucesso"> Email correto <br> </p>';
  }
  else {
    div_mensagem.innerHTML = ' <p class="erro"> Coloque um email valido <br></p>'
  }


  if (senha.length >= 8) {
    div_mensagem.innerHTML += `<p class="sucesso">Sua senha está correta <br> </p>`;
  } else {
    div_mensagem.innerHTML += `<p class="erro">Sua senha deve possuir ao menos 8 caracteres <br> </p>`;
  }
}
