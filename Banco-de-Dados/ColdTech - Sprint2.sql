CREATE DATABASE apresenta_sprint2;
USE apresenta_sprint2;

CREATE TABLE empresa(
id_empresa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(45) NOT NULL,
cnpj CHAR(14) NOT NULL,
email VARCHAR (45) NOT NULL,
senha VARCHAR(45) NOT NULL,
telefone_principal CHAR(11) NOT NULL,
telefone_secundario CHAR(11) NULL
);

CREATE TABLE endereco(
id_endereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
rua VARCHAR(50) NOT NULL,
bairro VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
cep CHAR(8) NOT NULL,
tipo_end VARCHAR(15) NOT NULL,
fk_empresa INT,
CONSTRAINT fk_empresa FOREIGN KEY(fk_empresa)
	REFERENCES empresa(id_empresa)
);

CREATE TABLE armazenamento(
id_armazenamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
tipo VARCHAR(30) NOT NULL,
CONSTRAINT chk_tipo CHECK(tipo IN ("transporte", "geladeira")),
renavam CHAR(11) NULL,
fk_emp INT,
CONSTRAINT fk_emp FOREIGN KEY (fk_emp)
	REFERENCES empresa (id_empresa)
);

CREATE TABLE sensor(
id_sensor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
status_sensor VARCHAR(10),
posicao VARCHAR(10),
fk_armazenamento INT,
CONSTRAINT fk_armazenamento FOREIGN KEY(fk_armazenamento)
	REFERENCES armazenamento (id_armazenamento)
);

CREATE TABLE registros(
id_registro INT AUTO_INCREMENT,
temperatura DECIMAL(10,2),
umidade DECIMAL(10,2),
data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
fk_sensor INT,
FOREIGN KEY (fk_sensor)
	REFERENCES sensor(id_sensor),
PRIMARY KEY(id_registro, fk_sensor)
);

INSERT INTO empresa (nome, cnpj, email, senha, telefone_principal, telefone_secundario) VALUES
('Empresa Alpha', '12345678901234', 'alpha@alpha.com', 'senhaalpha', '12345678901', '98765432101'),
('Empresa Beta', '98765432109876', 'beta@beta.com', 'senhabeta', '98765432102', '12345678902'),
('Empresa Gamma', '56789012345678', 'gamma@gamma.com', 'senhagamma', '12345678903', '98765432103'),
('Empresa Delta', '45678901234567', 'delta@delta.com', 'senhadelta', '98765432104', '12345678904'),
('Empresa Epsilon', '23456789012345', 'epsilon@epsilon.com', 'senhaepsilon', '12345678905', '98765432105'),
('Empresa Zeta', '67890123456789', 'zeta@zeta.com', 'senhazeta', '12345678906', '98765432106');

SELECT * FROM empresa;

INSERT INTO endereco (rua, bairro, cidade, estado, cep, tipo_end, fk_empresa) VALUES
('Rua das Acácias', 'Centro', 'São Paulo', 'SP', '01234567', 'Comercial', 1),
('Avenida dos Ipês', 'Jardins', 'Rio de Janeiro', 'RJ', '12345678', 'Residencial', 2),
('Rua das Oliveiras', 'Centro', 'Belo Horizonte', 'MG', '23456789', 'Comercial', 3),
('Avenida das Palmeiras', 'Liberdade', 'Salvador', 'BA', '34567890', 'Residencial', 4),
('Rua das Rosas', 'Boa Vista', 'Recife', 'PE', '45678901', 'Comercial', 5),
('Avenida das Tulipas', 'Centro', 'Curitiba', 'PR', '56789012', 'Residencial', 6),
('Rua das Violetas', 'Vila Nova', 'Porto Alegre', 'RS', '67890123', 'Residencial', 1),
('Avenida dos Girassóis', 'Jardim das Flores', 'Brasília', 'DF', '78901234', 'Comercial', 4);

SELECT * FROM endereco;


INSERT INTO armazenamento (tipo, renavam, fk_emp) VALUES
('transporte', '12345678901', 1),
('transporte', '34567890123', 3),
('transporte', '56789012345', 5),
('transporte', '78901234567', 2),
('transporte', '12345678901', 1),
('geladeira', '23456789012', 2),
('transporte', '34567890123', 2),
('geladeira', NULL, 1),
('geladeira', NULL, 6),
('geladeira', NULL, 2),
('geladeira', NULL, 4);

SELECT * FROM armazenamento;

INSERT INTO sensor (status_sensor, posicao, fk_armazenamento) VALUES
('Ativo', 'Esquerda', 1),
('Inativo', 'Direita', 2),
('Ativo', 'Esquerda', 3),
('Inativo', 'Direita', 4),
('Ativo', 'Esquerda', 5),
('Inativo', 'Direita', 6),
('Ativo', 'Esquerda', 7),
('Ativo', 'Direita', 8),
('Inativo', 'Esquerda', 5),
('Ativo', 'Direita', 6),
('Ativo', 'Esquerda', 7),
('Ativo', 'Direita', 8);

SELECT * FROM sensor;

INSERT INTO registros (temperatura, umidade, fk_sensor) VALUES
(2.3, 35.2, 1),
(3.1, 36.5, 2),
(5.7, 34.8, 3),
(4.0, 35.9, 4),
(3.5, 36.0, 5),
(2.2, 34.7, 6),
(5.0, 36.2, 7),
(6.5, 35.1, 8);

SELECT * FROM registros;

-- ENDEREÇO DA EMPRESA
SELECT emp.nome as Empresa, emp.cnpj as CNPJ, emp.email as Email, emp.telefone_principal as "Telefone Principal",
	   en.cep as Cep, en.rua as Rua, en.bairro as Bairro, en.cidade as Cidade, en.estado as Estado
			FROM empresa as emp JOIN endereco as en
				ON emp.id_empresa = en.fk_empresa;
                
-- EMPRESA COM SEUS ARMAZENAMENTOS E SENSORES COM OS DETERMINADOS SENSORES
SELECT emp.nome as Empresa, emp.email as Email, emp.telefone_principal as "Telefone Principal",
		amz.tipo as Tipo,
        sensor.status_sensor as "Status",
        reg.temperatura as Temperatura, reg.umidade as Umidade
			FROM empresa as emp JOIN armazenamento as amz
            ON emp.id_empresa = amz.fk_emp
            JOIN sensor 
            ON amz.id_armazenamento = sensor.fk_armazenamento
            JOIN registros as reg
            ON sensor.id_sensor = reg.fk_sensor
            WHERE sensor.status_sensor = "Ativo";