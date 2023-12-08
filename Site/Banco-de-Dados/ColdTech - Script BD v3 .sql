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
numero INT,
bairro VARCHAR(50) NOT NULL,
complemento VARCHAR(40),
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL
);

DESCRIBE endereco;
SELECT * FROM endereco;

CREATE TABLE armazenamento (
idArmazenamento INT PRIMARY KEY AUTO_INCREMENT,
tipoArmazenamento VARCHAR(30) NOT NULL,
 nomeArmazenamento VARCHAR(20),
 renavam CHAR(9),
fkEmpresa INT,
CONSTRAINT consfkEmp FOREIGN KEY (fkEmpresa) REFERENCES Empresa (idEmpresa),
CONSTRAINT chkTipoArmazenmanto CHECK (tipoArmazenamento IN ('Caminhão', 'Geladeira'))
);

CREATE TABLE sensor (
idSensor INT AUTO_INCREMENT,
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
dht11_umidade FLOAT,
dht11_temperatura FLOAT,
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP());

alter table registros add column dht11_umidade2 float;
alter table registros add column dht11_temperatura2 float;
   

SELECT idRegistro as ID, fkSensor as Sensor, dht11_temperatura as Temperatura, dht11_umidade as Umidade, dht11_umidade2 as Umidade2, dht11_temperatura2 as Temperatura2, dataHora as Dia FROM registros;


SELECT dht11_temperatura as Temperatura, dht11_umidade as Umidade, dht11_umidade2 as Umidade2, dht11_temperatura2 as Temperatura2, DATE_FORMAT(dataHora,'%H:%i:%s') as Dia FROM registros limit 7;


SELECT * FROM empresa;
SELECT * FROM sensor;
SELECT * FROM armazenamento;
select * from registros;
desc registros;

truncate registros;

show databases;


-- CRIANDO UM USUÁRIO PARA O ARDUÍNO
	 CREATE USER 'userColdTech'@'10.18.35.237' IDENTIFIED BY 'verdeverde';
	    GRANT ALL PRIVILEGES ON ColdTech.* TO 'userColdTech'@'10.18.35.237';
		   FLUSH PRIVILEGES;
           
         
          insert into sensor values
           (null, "esquerda", 1);
           
           insert into armazenamento values 
           (null, 'Geladeira', 'Teste', 12, 3);
       
select * from sensor;

insert into sensor values
(null, "direita", 1);
delete from registros where dht11_umidade2 > 100 AND idRegistro > 1;

select * from registros;

select * from armazenamento;

select * from empresa;


 
        select 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
                        fk_aquario 
                        from medida where fk_aquario = ${idAquario} 
                    order by id desc limit 1
                    
			
                    SELECT dht11_temperatura as Temperatura, dht11_umidade as Umidade, dht11_umidade2 as Umidade2,
                    dht11_temperatura2 as Temperatura2, DATE_FORMAT(dataHora,'%H:%i:%s') as Dia FROM registros
                    order by idRegistro desc limit 1;