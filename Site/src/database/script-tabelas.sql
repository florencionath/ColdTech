-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

/*BANCO DE DADOS ColdTech*/
CREATE DATABASE ColdTech;

USE ColdTech;

CREATE TABLE empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(40) NOT NULL,
cnpj CHAR(14) NOT NULL,
email VARCHAR(40) NOT NULL UNIQUE,
CONSTRAINT chkemail CHECK (email LIKE ('%@%.%')),
senha VARCHAR(15) NOT NULL, -- Validação com 8 caracteres sendo: no mínimo 1 especial, 1 em maiúscula e 1 numeral
telefone CHAR(11) NOT NULL
);

 CREATE TABLE endereco (
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
fkEmp INT,
CONSTRAINT fkEmp FOREIGN KEY (fkEmp)
	REFERENCES empresa(idEmpresa),
rua VARCHAR(50) NOT NULL,
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL
);

ALTER TABLE endereco ADD COLUMN numero INT;
ALTER TABLE endereco ADD COLUMN complemento VARCHAR(40);
DESCRIBE endereco;
SELECT * FROM endereco;

CREATE TABLE armazenamento (
idArmazenamento INT PRIMARY KEY AUTO_INCREMENT,
tipoArmazenamento VARCHAR(30) NOT NULL,
fkEmpresa INT,
CONSTRAINT consfkEmp FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
CONSTRAINT chkTipoArmazenmanto CHECK (tipoArmazenamento IN ('Caminhão', 'Geladeira'))
);

ALTER TABLE armazenamento ADD COLUMN nomeArmazenamento VARCHAR(20);
ALTER TABLE armazenamento ADD COLUMN renavam CHAR(9);
SELECT nomeArmazenamento, renavam FROM armazenamento;

CREATE TABLE sensor (
idSensor INT AUTO_INCREMENT,
statusSensor VARCHAR(7) NOT NULL,
CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('ativo', 'inativo')),
posicaoSensor VARCHAR(8) NOT NULL,
CONSTRAINT chkPosicaoSens CHECK (posicaoSensor IN ('esquerda', 'direita', 'armazenamento')),
fkArmazenamento INT,
CONSTRAINT consfkArmazen FOREIGN KEY (fkArmazenamento) REFERENCES Armazenamento (idArmazenamento),
PRIMARY KEY (idSensor, fkArmazenamento)
); 

CREATE TABLE registros (
idRegistro INT PRIMARY KEY AUTO_INCREMENT,
fkSensor INT NOT NULL,
CONSTRAINT fkSens FOREIGN KEY (fkSensor)
	REFERENCES sensor(idSensor),
fkArmazenamento INT,
CONSTRAINT consfkArm FOREIGN KEY (fkArmazenamento)
	REFERENCES armazenamento (idArmazenamento),
metricas VARCHAR(10) NOT NULL DEFAULT 'Erro',
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP);
   
ALTER TABLE registros DROP CONSTRAINT consfkArm; -- Deletando primeiro a constraint
ALTER TABLE registros DROP COLUMN fkArmazenamento; -- Excluindo campo fkArmazenamento
ALTER TABLE registros DROP COLUMN metricas; -- Excluindo campo fkArmazenamento

ALTER TABLE registros ADD COLUMN dht11_umidade FLOAT; -- ADD campo de acordo com nova modelagem
ALTER TABLE registros ADD COLUMN dht11_temperatura FLOAT;

SELECT * FROM registros;
SELECT * FROM empresa;
SELECT * FROM sensor;
SELECT * FROM armazenamento;

-- CRIANDO UM USUÁRIO PARA O ARDUÍNO
	CREATE USER 'userColdTech'@'ipdamaquina' IDENTIFIED BY 'informeasenha';
		GRANT ALL PRIVILEGES ON ColdTech.* TO 'userColdTech'@'ipdamaquina';
			FLUSH PRIVILEGES;

/*FIM BANCO DE DADOS ColdTech*/



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
