Olá mundo


CREATE DATABASE IFSP;
CREATE TABLE cidade (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    estado VARCHAR(002) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE cliente (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    id_cidade INT,
    endereco VARCHAR(100),
    numero INT,
    bairro VARCHAR(100),
    data_nasc DATETIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_cliente_cidade FOREIGN KEY (id_cidade) REFERENCES cidade (id)
);
