var armazenamentoModel = require("../models/armazenamentoModel");

function cadastrarCaminhao(req, res) { // PARA CADASTRAR MEU CARDAPIO COM FK (idRestaurante)
    var fkEmpresa = req.params.fkEmpresa;
    var nomeArmazenamento = req.body.nomeArmazenamentoServer;
    var renavam = req.body.renavamServer;
 

    if (fkEmpresa == undefined) {
        res.status(400).send("O fkEmpresa está indefinido!");
    } else if (nomeArmazenamento == undefined) {
        res.status(403).send("O nome do armazenamento está indefinido!");
    } else if (renavam == undefined) {
        res.status(403).send("O renavam está indefinido!");
    } else {
        armazenamentoModel.cadastrarCaminhao( nomeArmazenamento, renavam, fkEmpresa)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            )
            .catch(
                function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao realizar o post: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}


function listarCaminhoes(req, res) { 
        armazenamentoModel.listarCaminhoes().then((resultado) => {
          res.status(200).json(resultado);
        });
}

module.exports = {
    cadastrarCaminhao, 
    listarCaminhoes
}