var database = require("../database/config")

//LOGIN
function autenticar(email, senha) {
    var instrucao = `
        SELECT idEmpresa, nomeEmpresa, cnpj, email, senha, telefone FROM Empresa WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// CADASTRO!

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, cnpj, senha, telefone) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO empresa (nomeEmpresa, cnpj, email, senha, telefone) VALUES ('${nome}', '${cnpj}', '${email}', '${senha}', '${telefone}' );
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    autenticar,
    cadastrar
};