var database = require("../database/config");

function cadastrarCaminhao(fkEmpresa, nomeArmazenamento, renavam) { //Ta recebendo alguma coisa
    var instrucao = `
        INSERT INTO armazenamento (idArmazenamento, tipoArmazenamento, fkEmpresa, nomeArmazenamento, renavam) VALUES (NULL, 'Caminhão', ${fkEmpresa}, '${nomeArmazenamento}', '${renavam}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarCaminhoes() {
        var query = `SELECT * FROM armazenamento`;
        return database.executar(query);
}

module.exports = {
    cadastrarCaminhao, 
    listarCaminhoes
}