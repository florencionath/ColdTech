var nome = input_nome.value;
var email = input_email.value;
var cnpj = input_cnpj.value;
var senha = input_senha.value;
var confirmacao = input_confirmacao.value;
var telefone = input_telefone.value;



function cadastrar() {
  permiteCadastro = true;
  
  nome = input_nome.value;
  email = input_email.value;
  cnpj = input_cnpj.value;
  senha = input_senha.value;
  confirmacao = input_confirmacao.value;
  telefone = input_telefone.value;
  
  var validacaoNome = nome.length >= 3;
  var validacaoEmail = email.indexOf('@') >= 0 && (email.indexOf('.com') >= 0 || email.indexOf('.br') >= 0);
  var validacaoCNPJ = cnpj.length == 14;
  var validacaoTelefone = telefone.length == 11;
  var validacaoSenha = senha.length >= 8 && (senha.indexOf('#') >= 0 || senha.indexOf('!') >= 0 || senha.indexOf('@') >= 0 || senha.indexOf('$') >= 0 || senha.indexOf('%') >= 0 || senha.indexOf('&') >= 0 || senha.indexOf('*') >= 0);
  var validacaoConfirmacao = (confirmacao == senha) && (confirmacao.length >= 8);     

    if(validacaoNome == true && validacaoEmail == true && validacaoCNPJ == true && validacaoTelefone == true && validacaoSenha == true && validacaoConfirmacao == true){
      fetch("/usuarios/cadastrar", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            // crie um atributo que recebe o valor recuperado aqui
            // Agora vá para o arquivo routes/usuario.js
            nomeServer: nome,
            emailServer: email,
            cnpjServer: cnpj,
            senhaServer: senha,
            telefoneServer: telefone
          }),
        })
      if(permiteCadastro){
          window.location.href = `./login.html`
      }
    }
    else{
      alert("Algum dos campos cadastrados foi preenchido errado")
      div_nomeErrado.innerHTML = `O nome deve ter mais de dois digitos`;
      div_emailErrado.innerHTML = `O email deve conter "@.com" ou "@.br"`;
      div_senhaErrada.innerHTML = `A senha deve ter ao menos 7 digitos <br> e um caracter especial`;
      div_confirmacaoErrada.innerHTML = `A confirmação deve estar igual <br> a senha cadastrada`;
      div_cnpjErrado.innerHTML = `O CNPJ deve ter exatamente 14 digitos`;
      div_telefone_errado.innerHTML = 'O telefone deve ter exatamente 11 digitos';
    }
}
