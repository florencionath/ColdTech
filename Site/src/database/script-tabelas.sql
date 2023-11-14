-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/
CREATE DATABASE ColdTech;

USE ColdTech;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(40) NOT NULL,
cnpj CHAR(14) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
CONSTRAINT chkemail CHECK (email LIKE ('%@%.%')),
senha VARCHAR(15) NOT NULL, -- Validação com 8 caracteres sendo: no mínimo 1 especial, 1 em maiúscula e 1 numeral
telefonePrincipal CHAR(11) NOT NULL,
telefoneSecundario CHAR(11));
    
 SELECT * FROM empresa;  
 
 CREATE TABLE endereco (
idEndereco INT AUTO_INCREMENT,
fkEmp INT,
CONSTRAINT fkEmp FOREIGN KEY (fkEmp)
	REFERENCES empresa(idEmpresa),
rua VARCHAR(50) NOT NULL,
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL,
tipoEnd VARCHAR(15) NOT NULL,
CONSTRAINT chkEnd CHECK (tipoEnd IN ('Principal', 'Distribuidora')),
PRIMARY KEY (idEndereco, fkEmp));

SELECT * FROM endereco;

CREATE TABLE medicamento (
idMedicamento INT PRIMARY KEY AUTO_INCREMENT,
nomeMedicamento VARCHAR(45) NOT NULL,
qtdMedicamento INT NOT NULL,
tempMax INT NOT NULL,
tempMin INT NOT NULL,
tipoMedicamento VARCHAR(14) NOT NULL,
CONSTRAINT chkTipoMedicamento CHECK (tipoMedicamento IN ('líquido', 'cápsula', 'comprimido')));
    
SELECT * FROM medicamento;
    
CREATE TABLE transporte (
idTransporte INT PRIMARY KEY AUTO_INCREMENT,
fkEnd INT NOT NULL,
CONSTRAINT fkEnd FOREIGN KEY (fkEnd)
	REFERENCES endereco(idEndereco));
    
SELECT * FROM transporte;

CREATE TABLE ambiente (
idAmbiente INT PRIMARY KEY AUTO_INCREMENT,
tipoAmb VARCHAR(30) NOT NULL,
CONSTRAINT chkTipoAmb CHECK (tipoAmb IN ('caixa térmica de EPS', 'bolsa térmica', 'refrigerador', 'camâra fria')),
fkTransp INT,
CONSTRAINT fkTransp FOREIGN KEY (fkTransp)
	REFERENCES transporte(idTransporte));

SELECT * FROM ambiente;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
tipoSensor VARCHAR(20) NOT NULL, 
CONSTRAINT chkTipoSensor CHECK (tipoSensor IN ('temperatura', 'temperatura e umidade', 'luminosidade', 'proximidade')),
statusSensor VARCHAR(7) NOT NULL,
CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('ativo', 'inativo')),
posicaoSensor VARCHAR(8) NOT NULL,
CONSTRAINT chkPosicaoSens CHECK (posicaoSensor IN ('esquerda', 'direita', 'ambiente'))); 

SELECT * FROM sensor;

CREATE TABLE registros (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
fkSensor INT NOT NULL,
CONSTRAINT fkSens FOREIGN KEY (fkSensor)
	REFERENCES sensor(idSensor),
fkAmb INT,
CONSTRAINT fkAmb FOREIGN KEY (fkAmb)
	REFERENCES ambiente(idAmbiente),
fkTrsp INT,
CONSTRAINT fkTrsp FOREIGN KEY (fkTrsp)
	REFERENCES transporte(idTransporte),
fkMedicamento INT NOT NULL,
CONSTRAINT fkMed FOREIGN KEY (fkMedicamento)
	REFERENCES medicamento(idMedicamento),
metricas VARCHAR(10) NOT NULL DEFAULT 'Erro',
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP);

/*
comando para sql server - banco remoto - ambiente de produção
*/

CREATE TABLE empresa (
	id INT PRIMARY KEY IDENTITY (1,1),
	razao_social VARCHAR(50),
	cnpj CHAR(14)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT FOREIGN KEY REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300),
	fk_empresa INT FOREIGN KEY REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);

insert into empresa (razao_social, cnpj) values ('Empresa 1', '00000000000000');

/*
comandos para criar usuário em banco de dados azure, sqlserver,
com permissão de insert + update + delete + select
*/

CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
DEFAULT_SCHEMA = dbo;

EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';

EXEC sys.sp_addrolemember @rolename = N'db_datareader',
@membername = N'usuarioParaAPIWebDataViz_datawriter_datareader';
