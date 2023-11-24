var express = require("express");
var router = express.Router();

var armazenamentoController = require("../controllers/armazenamentoController");

router.post("/cadastrarCaminhao/:fkEmpresa", function (req, res) { //CADASTRANDO COM FK
   armazenamentoController.cadastrarCaminhao(req, res);
});

router.get("/trazerCaminhoes", function(req, res) {
   armazenamentoController.recuperarValor(req, res)
})

module.exports = router;