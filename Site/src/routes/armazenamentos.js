var express = require("express");
var router = express.Router();

var armazenamentoController = require("../controllers/armazenamentoController");

router.post("/cadastrarCaminhao/:fkEmpresa", function (req, res) { //CADASTRANDO COM FK
   armazenamentoController.cadastrarCaminhao(req, res);
});

router.get("/listarCaminhoes", function(req, res) {
   armazenamentoController.listarCaminhoes(req, res)
})


module.exports = router;