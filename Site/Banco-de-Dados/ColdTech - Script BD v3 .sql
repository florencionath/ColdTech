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
    
 SELECT * FROM empresa;  
 
 SELECT * FROM armazenamento;
 
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

select * from armazenamento;

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

SELECT * FROM sensor;

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
   
SELECT * FROM registros;
