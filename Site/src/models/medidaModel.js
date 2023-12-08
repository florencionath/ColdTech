var database = require("../database/config");

function buscarUltimasMedidas(limite_linhas) {

    instrucaoSql = ''
    if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `
        SELECT dht11_temperatura as Temperatura, dht11_umidade as Umidade, dht11_umidade2 as Umidade2,
         dht11_temperatura2 as Temperatura2, DATE_FORMAT(dataHora,'%H:%i:%s') as Dia FROM registros order by idRegistro desc limit 7;`;

    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    instrucaoSql = ''
    if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `SELECT dht11_temperatura as Temperatura, dht11_umidade as Umidade, dht11_umidade2 as Umidade2,
        dht11_temperatura2 as Temperatura2, DATE_FORMAT(dataHora,'%H:%i:%s') as Dia FROM registros
        order by idRegistro desc limit 1;`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
