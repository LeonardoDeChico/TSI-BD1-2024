CREATE DATABASE clube;

USE clube;

CREATE TABLE socio (
    codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    endereco VARCHAR(50),
    cidade VARCHAR(30) DEFAULT "Birigui",
    estado CHAR(2) DEFAULT "SP",
    cep VARCHAR(9),
    fone VARCHAR(13),
    data DATE NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE dependente(
    sequencial INT NOT NULL,
    codigo_socio INT NOT NULL,
    nome VARCHAR(60) NOT NULL,
    parentesco VARCHAR(15),
    data_nasc DATE,
    PRIMARY KEY (codigo_socio),
    CONSTRAINT fk_dependente_socio FOREIGN KEY (codigo_socio) REFERENCES socio (codigo)
);

INSERT INTO socio(nome,endereco,cidade,estado,cep,fone,data) VALUES ("Leonardo", "Rua david hunovit", "BIIIIRIGUI","Sp", "123456789" , "1231231231231", "2024-07-16");

INSERT INTO socio(nome,endereco,cep,fone,data) VALUES ("Evandro", "Rua Tadeu", "987654321" , "3213213213213", "2023-06-15");

INSERT INTO socio(nome,endereco,cidade,estado,cep,fone,data) VALUES ("Pedro", "Rua Xuxu", "Belo Horizonte","BH", "213213213" , "999999999999", "202-06-15");

INSERT INTO dependente(codigo_socio,sequencial,nome,parentesco,data_nasc) VALUES (1, 2, "Akita", "Neymar" ,'2000-01-01'); 

INSERT INTO dependente(codigo_socio,sequencial,nome,parentesco,data_nasc) VALUES (3, 4, "Mano_Dev", "Xorume" ,'2000-02-10');

SELECT * FROM socio;

SELECT * FROM dependente;

UPDATE socio SET
    nome = "Napoleao"
WHERE codigo = 3;
