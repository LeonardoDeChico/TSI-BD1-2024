-- Criando a DATABASE com o nome Mercado_SeuNome
CREATE DATABASE Mercado_SeuNome;

USE Mercado_SeuNome;

CREATE TABLE Fornecedor (
    Codigo_fornec INT NOT NULL,
    Nome VARCHAR(40) NOT NULL,
    Fone VARCHAR(20),
    Endereco VARCHAR(40),
    Cidade VARCHAR(40) DEFAULT 'Birigui',
    Estado VARCHAR(2) DEFAULT 'SP',
    PRIMARY KEY (Codigo_fornec)
);

CREATE TABLE Produto (
    Cod_produto INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(40) NOT NULL,
    Codigo_fornec INT NOT NULL,
    preco_unitario DECIMAL(10,2),
    qtde INT,
    PRIMARY KEY (Cod_produto),
    CONSTRAINT FK_Produto_Fornecedor FOREIGN KEY (Codigo_fornec) REFERENCES Fornecedor (Codigo_fornec)
);

-- Inserindo Informações na tabela Fornecedor
INSERT INTO Fornecedor(Codigo_fornec,Nome,Fone,Endereco,Cidade,Estado) VALUES (344,'Alimentos do Bem', '3345666', 'Rua Fundadores', 'Sao Paulo', 'SP');

INSERT INTO Fornecedor(Codigo_fornec,Nome,Fone,Endereco,Cidade,Estado) VALUES (78,"Comidas", '8664545', 'Av dos Estados', "Araçatuba", 'SP');

INSERT INTO Fornecedor(Codigo_fornec,Nome,Fone,Endereco,Cidade,Estado) VALUES (952,'Rango Quente', '1327790', 'Rua Aclimação', 'Birigui', 'SP');

INSERT INTO Fornecedor(Codigo_fornec,Nome,Fone,Endereco,Cidade,Estado) VALUES (111,'Quentinhas', '5644234', 'Rua Teste', 'Belo Horizonte', 'MG');
-- 

-- Inserindo informações na table Produto
INSERT INTO Produto(Nome,cod_fornec,preco_unitario,qtde) VALUES ("A"); 

INSERT INTO Produto(Nome,cod_fornec,preco_unitario,qtde) VALUES (); 

INSERT INTO Produto(Nome,cod_fornec,preco_unitario,qtde) VALUES (); 

INSERT INTO Produto(Nome,cod_fornec,preco_unitario,qtde) VALUES (); 

INSERT INTO Produto(Nome,cod_fornec,preco_unitario,qtde) VALUES (); 


