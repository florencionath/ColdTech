var database = require("../database/config");

function cadastrar(fkEmpresa, rua, bairro, cidade, estado, cep, numero, complemento) {
  var query = `INSERT INTO endereco (idEndereco, fkEmp, rua, bairro, cidade, estado, cep, numero, complemento) VALUES (${fkEmpresa}, ${fkEmpresa}, '${rua}','${bairro}', '${cidade}', '${estado}', '${cep}', ${numero}, '${complemento}')`;

  return database.executar(query);
}

module.exports = { 
    cadastrar
 };
