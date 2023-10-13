function acessar(){

    var email = ipt_email.value;
    var senha = ipt_senha.value;
    
    if (email.indexOf('@') >= 0 &&
         (email.indexOf('.com') >= 0 ||
         email.indexOf('.br') >= 0)) {div_mensagem.innerHTML = 'Email autorizado <br>'}
         else {div_mensagem.innerHTML = 'Coloque um email valido <br>'}
    
    
    if (senha.length == 8) {
          div_mensagem.innerHTML += `Sua senha está correta <br>`;
        } else {
          div_mensagem.innerHTML += `Sua senha deve possuir 8 digitos! <br>`;
        }
}
