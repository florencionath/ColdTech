CREATE DATABASE metricas;
USE metricas;

CREATE TABLE sensores (
dht11_umidade float,
dht11_temperatura float,
luminosidade float, 
lm35_temperatua float,
horario timestamp DEFAULT CURRENT_TIMESTAMP() NOT NULL, 
chave int);


DROP TABLE sensores;
select * from sensores; 

