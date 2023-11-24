var database = require("../database/config");

function cadastrarCaminhao(fkEmpresa, nomeArmazenamento, renavam) { //Ta recebendo alguma coisa
    var instrucao = `
        INSERT INTO armazenamento (idArmazenamento, tipoArmazenamento, fkEmpresa, nomeArmazenamento, renavam) VALUES (NULL, 'Caminhão', ${fkEmpresa}, '${nomeArmazenamento}', '${renavam}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function recuperarCaminhoes() {
    var instrucao = `
     SELECT nomeArmazenamento, renavam FROM armazenamento;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    cadastrarCaminhao, 
    recuperarCaminhoes
}