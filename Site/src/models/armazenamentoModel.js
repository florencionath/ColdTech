var database = require("../database/config");

function cadastrar(fkEmpresa, armazenamento) { //Ta recebendo alguma coisa
    var instrucao = `
        INSERT INTO Armazenamento (fkEmpresa, armazenamento) VALUES (${fkEmpresa}, '${armazenamento}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrar
}