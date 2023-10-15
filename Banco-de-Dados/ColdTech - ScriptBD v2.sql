CREATE DATABASE sprint02;
USE sprint02;

-- Criar uma tabela de sensor, com duas restrições nos campos 'tipoSensor' e 'statusSensor'
CREATE TABLE sensor (
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipoSensor VARCHAR(15) NOT NULL, 
    CONSTRAINT chkTipoSensor CHECK (tipoSensor IN ('temperatura', 'umidade')),
    statusSensor VARCHAR(7) NOT NULL,
    CONSTRAINT chkStatusSensor CHECK (statusSensor IN ('ativo', 'inativo'))
);

SELECT * FROM sensor;

-- Criar a tabela empresa, com uma restrição no campo 'email' dizendo que precisa ter um '@' e '.' não importa a posição
-- Relacionando a tabela sensor com a tabela empresa.
CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(40) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE,
    CONSTRAINT chkemail 
    CHECK (email LIKE ('%@%.%')),
    senha VARCHAR(15) NOT NULL,
    telefonePrincipal CHAR(11) NOT NULL,
    telefoneSecundario CHAR(11),
    fkSensorEmp INT,
    CONSTRAINT fkSensorEmp FOREIGN KEY (fkSensorEmp)
		REFERENCES sensor(idSensor)
);

SELECT * FROM empresa;

-- Criar a tabela medicamento, com uma restrição no campo 'tipoMedicamento'
CREATE TABLE medicamento (
    idMedicamento INT PRIMARY KEY AUTO_INCREMENT,
    nomeMedicamento VARCHAR(60) NOT NULL,
    qtdMedicamento INT NOT NULL,
    tempMax INT NOT NULL,
    tempMin INT NOT NULL,
    tipoMedicamento VARCHAR(14) NOT NULL,
    CONSTRAINT chkTipoMedicamento CHECK (tipoMedicamento IN ('líquido', 'cápsula', 'comprimido'))
);

SELECT * FROM medicamento;

-- Criar uma tabela registros, relacionando a tabela registro com a tabela sensor e a tabela medicamento
CREATE TABLE registros (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    metrica FLOAT,
    dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
    fkSensor INT,
    CONSTRAINT fkSensorReg FOREIGN KEY (fkSensor)
		REFERENCES sensor(idSensor),
    fkMedicamento INT,
    CONSTRAINT fkMed FOREIGN KEY (fkMedicamento)
		REFERENCES medicamento(idMedicamento)
);

SELECT * FROM registros;

-- Inserir dados nas tabelas:
INSERT INTO sensor (tipoSensor, statusSensor) VALUES
    ('temperatura', 'ativo'),
    ('umidade', 'ativo');

INSERT INTO empresa (nomeEmpresa, cnpj, email, senha, telefonePrincipal, telefoneSecundario, fkSensorEmp) VALUES
    ('Pfizer', '46070868001998', 'pfizer@gmail.com', '123', 1112345678, 1190123456, 2),
    ('Jansen', '51780468000187', 'jansen@gmail.com', '123', 1112345678, 1190123456, 1);

INSERT INTO medicamento VALUES
(null, 'Insulina', '4', '8', '2', 'Líquido'),
(null, 'Coronavac', '5', '6', '1', 'Líquido');

INSERT INTO registros (metrica, fkSensor, fkMedicamento) VALUES 
    (35, 2,1),
    (20, 1,2);

-- Exibir tabelas com apelidos:
-- Tabela sensor:
SELECT sensor.idSensor AS 'Identificação do Sensor', 
	sensor.tipoSensor AS 'Tipo do Sensor', 
	sensor.statusSensor AS 'Status' 
	FROM sensor;

-- Tabela medicamento:
SELECT medicamento.nomeMedicamento AS 'Medicamento',
	   medicamento.tipoMedicamento AS 'Tipo',
       medicamento.qtdMedicamento AS 'Quantidade',
       medicamento.tempMax AS 'Temperatura Máxima',
       medicamento.tempMin AS 'Temperatura Mínima'
FROM medicamento;
       
-- Tabela empresa + sensor:
SELECT empresa.nomeEmpresa AS 'Empresa',
	empresa.cnpj AS 'CNPJ', 
	empresa.email AS 'Email',
	empresa.fkSensorEmp AS 'Sensor',
	sensor.tipoSensor AS 'Tipo do Sensor',
    sensor.statusSensor AS 'Status' 
	FROM empresa JOIN sensor
	ON idSensor = fkSensorEmp;

-- Tabela empresa + medicamento + sensor + registros
SELECT empresa.nomeEmpresa AS 'Nome da Empresa', 
	empresa.cnpj AS 'CNPJ', 
    empresa.email AS 'Email',
    medicamento.nomeMedicamento AS 'Medicamento', 
    medicamento.qtdMedicamento AS 'Quantidade', 
    medicamento.tempMin AS 'Temperatura Mínima', 
    medicamento.tempMax AS 'Temperatura Máxima',
    sensor.idSensor AS 'Identificação do Sensor', 
    sensor.tipoSensor AS 'Tipo de Sensor', 
    sensor.statusSensor AS 'Status', 
    registros.metrica AS 'Umidade - Temperatura', 
    registros.dataHora AS 'Data e Horário' 
	FROM empresa JOIN sensor
	ON fkSensorEmp = idSensor
	JOIN registros 
	ON fkSensor = idSensor
	JOIN medicamento
	ON fkMedicamento = idMedicamento;