-- AULA 1
Olá mundo

-- CRIAR BANCO
CREATE DATABASE IFSP;

-- CRIAR TABELAS
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

-- INSTERI DADOS NA TABELA CIDADE
INSERT INTO cidade (nome, estado) VALUES ("Birigui", "SP");

-- MOSTRAR REGISTROS DA TABELA CIDADE
SELECT * FROM cidade;

INSERT INTO cliente (nome, email, id_cidade, endereco, numero, bairro, data_nasc)
VALUES ("Murilo Silva", "murilo@email.com", 1, "Rua Pedro Cavalo", 750, "Portal da Perola", "1999/01/15");

-- MOSTRA REGISTROS DA TABELA CLIENTE
SELECT * FROM cliente;

-- DELETAR O BANCO 
DROP DATABASE IF EXISTS IFSP;

CREATE DATABASE IFSP
DEFAULT CHARSET = utf8
DEFAULT COLLATE = utf8_general_ci;

-- ATUALIZA TABELA CIDADE
UPDATE cidade SET
    nome = "Belo Horizonte",
    estado = "MG"
WHERE id = 1;

-- UPADATE TABELA CLIENTE
UPDATE cliente SET
    nome = "Cocao",
    email = "cocao@mail.com",
    id_cidade = 101
WHERE id = 2;

-- DELETE REGISTRO CIDADE
DELETE FROM cidade WHERE id = 1;

ALTER TABLE Fornecedor ADD email VARCHAR(30); 