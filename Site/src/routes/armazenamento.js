var express = require("express");
var router = express.Router();

var armazenamentoController = require("../controllers/armazenamentoController");

router.post("/cadastrar/:fkEmpresa", function (req, res) { //CADASTRANDO COM FK
   enderecoController.cadastrar(req, res);
});

module.exports = router;