var armazenamentoModel = require("../models/armazenamentoModel");

function cadastrar(req, res) { // PARA CADASTRAR MEU CARDAPIO COM FK (idRestaurante)
    var fkRestaurante = req.params.fkRestaurante;
    var armazenamento = req.body.armazenamentoServer;
 

    if (fkRestaurante == undefined) {
        res.status(400).send("O fkEmpresa está indefinido!");
    } else if (armazenamento == undefined) {
        res.status(403).send("O seu armazenamento está indefinido!");
    } else {
        armazenamentoModel.cadastrar(fkEmpresa, armazenamento)
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

module.exports = {
    cadastrar
}