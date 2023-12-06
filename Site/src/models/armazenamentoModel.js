var database = require("../database/config");

function cadastrarCaminhao(nomeArmazenamento, renavam, fkEmpresa) { //Ta recebendo alguma coisa
    var instrucao = `
        INSERT INTO armazenamento (idArmazenamento, tipoArmazenamento, nomeArmazenamento, renavam, fkEmpresa) VALUES (NULL, 'Caminhão', '${nomeArmazenamento}', '${renavam}', '${fkEmpresa}' );
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