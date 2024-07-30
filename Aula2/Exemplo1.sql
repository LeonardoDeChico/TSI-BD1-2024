CREATE DATABASE mercado_leonardo

USE mercado_leonardo

CREATE TABLE fornecedor(
    codigo_fornec INT AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    fone VARCHAR(20),
    endereco VARCHAR(40),
    cidade VARCHAR(30) DEFAULT 'Birigui',
    estado  VARCHAR(2) DEFAULT 'SP',
    PRIMARY KEY (codigo_fornec)
);

CREATE TABLE produto(
    cod_produto INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(40) NOT NULL,
    codigo_fornec INT NOT NULL,
    preco_unitario DECIMAL(10,2),
    qtde INT,
    PRIMARY KEY (cod_produto),
    CONSTRAINT FK_produto_fornecedor
    FOREIGN KEY (codigo_fornec) 
    REFERENCES fornecedor (codigo_fornec)
);

INSERT INTO fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES (344, 'Alimentos do Bem', '3345666', 'Rua Fundadores', 'Sao Paulo', 'SP');

INSERT INTO fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES (78, 'comidas', '8664545', 'Av dos Estados', 'Aracatuba', 'SP');

INSERT INTO fornecedor (codigo_fornec, nome, fone, endereco)
VALUES (952, 'Rango Quente', '1327790', 'Rua Aclimacao');

INSERT INTO fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES (111, 'Quentinhas', '5644234', 'Rua Teste', 'Belo Horizonte', 'MG');

SELECT * FROM fornecedor;


INSERT INTO produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES (1, 'arroz', 344, 20, 55);

INSERT INTO produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES (2, 'feijao', 78, 16.5, 60);

INSERT INTO produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES (3, 'macarrao', 78, 5, 15);

INSERT INTO produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES (4, 'leite', 344, 3.5, 20);

INSERT INTO produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES (5, 'farinha', 952, 5, 8);

SELECT * FROM produto;


UPDATE fornecedor SET
    nome = 'comidas'
WHERE codigo_fornec = 78;

ALTER TABLE fornecedor ADD email VARCHAR(30);

UPDATE fornecedor SET
    email = 'alimentosdobem@gmail.com'
WHERE codigo_fornec = 344;

UPDATE fornecedor SET
    email = 'quentinhas@hotmail.com'
WHERE codigo_fornec = 111;

ALTER TABLE fornecedor DROP endereco;

UPDATE produto SET
    qtde = 15
WHERE codigo_fornec = 1;


SELECT * FROM fornecedor;

SELECT nome FROM produto WHERE preco_unitario > 15;

SELECT nome, codigo_fornec FROM fornecedor WHERE estado = 'SP';

SELECT nome, (preco_unitario*qtde) AS TOTAL FROM produto;

SELECT cod_produto FROM produto WHERE codigo_fornec = 78;

UPDATE produto SET
    nome = 'leite desnatado'
WHERE cod_produto = 4;

UPDATE produto SET qtde = qtde-1;

ALTER TABLE fornecedor ADD pais VARCHAR(30);

UPDATE fornecedor SET pais = 'Brasil';

INSERT INTO fornecedor (codigo_fornec, nome, fone, cidade, estado, pais)
VALUES (157, 'Foods', '9995556', 'Berlim', 'UK', 'England');

DELETE FROM fornecedor WHERE estado != 'SP' AND pais = 'Brasil';

SELECT * FROM fornecedor;

-----------------------------------------------------------------------------------------------------------

CREATE TABLE gerente(
    cod_gerente INT AUTO_INCREMENT,
    nome VARCHAR(40),
    num_depto INT,
    PRIMARY KEY (cod_gerente)
);

CREATE TABLE empregado(
    cod_empregado INT AUTO_INCREMENT,
    nome VARCHAR(40),
    endereco VARCHAR(40),
    telefone VARCHAR(30),
    data_admissao DATETIME,
    num_depto INT,
    salario DECIMAL(100,2),
    PRIMARY KEY (cod_empregado)
);

CREATE TABLE projeto(
    num_proj INT NOT NULL,
    nome VARCHAR(40),
    descricao VARCHAR(80),
    num_depto INT,
    PRIMARY KEY (num_proj)
);

CREATE TABLE departamento(
    num_depto INT NOT NULL,
    nome VARCHAR(40),
    localizacao VARCHAR(40),
    PRIMARY KEY (num_depto)
);

CREATE TABLE trabalha_em(
    cod_empregado INT AUTO_INCREMENT,
    num_proj INT,
    total_horas_semanais DECIMAL(10,2),
    CONSTRAINT FK_trabalha_empregado
    FOREIGN KEY (cod_empregado)
    REFERENCES empregado (cod_empregado),
    CONSTRAINT FK_trabalha_projeto
    FOREIGN KEY (num_proj)
    REFERENCES projeto (num_proj)
);

INSERT INTO gerente(nome, num_depto)
VALUES ('Felipe', 123);
INSERT INTO gerente(nome, num_depto)
VALUES ('Leonardo', 456);
INSERT INTO gerente(nome, num_depto)
VALUES ('Bruno', 789);

INSERT INTO empregado(nome, endereco, telefone, data_admissao, num_depto, salario)
VALUES ('Evandro', 'Rua das Alfazemas', '(18) 99621-3421', '2005-04-20', 123, 1500.50);
INSERT INTO empregado(nome, endereco, telefone, data_admissao, num_depto, salario)
VALUES ('Robson', 'Rua dos Banzeiros', '(18) 99621-2143', '2002-05-17', 456, 3000.00);
INSERT INTO empregado(nome, endereco, telefone, data_admissao, num_depto, salario)
VALUES ('Excalibur', 'Rua do Terra', '(18) 99612-3321', '1990-01-19', 789, 9999.32);

INSERT INTO projeto(num_proj, nome, descricao, num_depto)
VALUES (96019, 'Bau', 'Abre e fecha', 123);
INSERT INTO projeto(num_proj, nome, descricao, num_depto)
VALUES (43, 'Porta', 'Entra e sai', 456);
INSERT INTO projeto(num_proj, nome, descricao, num_depto)
VALUES (3, 'Lampada', 'Liga e desliga', 789);

INSERT INTO departamento(num_depto, nome, localizacao)
VALUES (123, 'Baus', 'Rua das madeiras');
INSERT INTO departamento(num_depto, nome, localizacao)
VALUES (456, 'Ferro', 'Rua dos ferros');
INSERT INTO departamento(num_depto, nome, localizacao)
VALUES (789, 'Vidro', 'Rua das luzes');

INSERT INTO trabalha_em(num_proj, total_horas_semanais)
VALUES (96019, 24);
INSERT INTO trabalha_em(num_proj, total_horas_semanais)
VALUES (43, 72);
INSERT INTO trabalha_em(num_proj, total_horas_semanais)
VALUES (3, 148);

SELECT nome, localizacao FROM departamento;

SELECT * FROM empregado WHERE salario > 2999;

SELECT nome FROM gerente;

SELECT 
    nome,
    salario,
    salario * 1.1 AS salario_atualizado
FROM 
    empregado;

UPDATE 
    empregado
SET 
    salario = salario + (salario * 1.1);

ALTER TABLE projeto ADD tipo_projeto VARCHAR(15);

UPDATE projeto SET tipo_projeto = 'grande';

