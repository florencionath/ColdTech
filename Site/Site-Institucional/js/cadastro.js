// Div's fora da "funtion" para a mensagem já aparecer quando a tela carregar 
div_nomeErrado.innerHTML = `O nome deve conter mais de 7 caracteres`;
div_emailErrado.innerHTML = `Informe um e-mail válido`;
div_senhaErrada.innerHTML = `A senha deve conter mais de 8 caracteres <br> e pelo menos um caracter especial`;
div_confirmacaoErrada.innerHTML = `Digite a senha novamente`;
div_cnpjErrado.innerHTML = `Informe um CNPJ válido`;
div_telefone_errado.innerHTML = 'Informe um telefone válido'


function Exibir(){
    var nome = input_nome.value;
    var email = input_email.value;
    var cnpj = input_cnpj.value;
    var senha = input_senha.value;
    var confirmacao = input_confirmacao.value;
    var telefone = Number(input_telefone.value);

// DIV's sem texto para limpar após executar a function

    div_nome.innerHTML = ``;
    div_email.innerHTML = ``;
    div_senha.innerHTML = ``;
    div_confirmacao.innerHTML = ``;
    div_cnpj.innerHTML = ``;
    div_telefone.innerHTML = '';
    
    

    div_nomeErrado.innerHTML = ``;
    div_emailErrado.innerHTML = ``;
    div_senhaErrada.innerHTML = ``;
    div_confirmacaoErrada.innerHTML = ``;
    div_cnpjErrado.innerHTML = ``;
    div_telefone_errado.innerHTML = '';
    


    // O "Length" serve para saber o tamanho da palavra especificada antes do " . ", nesse caso o texto da variavel "nome"
        if (nome.length > 7){ 
            div_nome.innerHTML = `O nome é valido! <br>`
        } else {div_nomeErrado.innerHTML = `Informe um nome válido <br>`}


        
        
    // indexOf verifica se tem um dos caracteres especificados dentro do (), se a condição for verdadeira ela responde algo >= 0;
    // Nesse caso tambem usei o conector lógico && pois o email precisa ter o "@" e mais um sufixo (.com ou .br)
        if (email.indexOf('@') >= 0 &&
        (email.indexOf('.com') >= 0 ||
        email.indexOf('.br') >= 0)) {div_email.innerHTML = 'Email válido! <br>'}
        else {div_emailErrado.innerHTML = 'Informe um email válido! <br>'}
        
     
        if (cnpj.length == 18 &&
        (cnpj.indexOf('.') >= 0 &&
        cnpj.indexOf('-') >= 0)) {
        div_cnpj.innerHTML = `CNPJ Válido <br>`    
        } else {
        div_cnpjErrado.innerHTML = `Informe um CNPJ válido`    
        }

        if (telefone.length == 11){
            div_telefone.innerHTML = 'Telefone válido'
        } else {
            div_telefone_errado.innerHTML = 'Informe um telefone válido'
        }
    
            
            if (senha.length >= 8 && 
                (senha.indexOf('#') >= 0
                || senha.indexOf('!') >= 0
                || senha.indexOf('@') >= 0
                || senha.indexOf('$') >= 0
                || senha.indexOf('%') >= 0
                || senha.indexOf('&') >= 0
                || senha.indexOf('*') >= 0)
                ) {
                    div_senha.innerHTML = ` Sua senha é válida! <br>`
                }else {
                    div_senhaErrada.innerHTML = `Sua senha deve possuir ao menos 8 caracteres <br> e pelo menos um caracter especial! <br>`
                }             
                    
                        
                        if(confirmacao == senha && confirmacao.length >= 8){
                            div_confirmacao.innerHTML = `Confirmacao válida! <br>`
                        } else {div_confirmacaoErrada.innerHTML = `A confirmação deve ser identica a senha! <br>`}   
                        
    }           
