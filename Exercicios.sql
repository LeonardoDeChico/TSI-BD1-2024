  1) Apresentar todos os cursos
  2) Apresentar todos os alunos
  3) Apresentar o nome e o ano dos cursos 
  4) Apresentar a carga horária, o nome e a descrição dos cursos no qual a carga horária é maior que 100
  5) Apresentar o id, o nome e a carga horária onde o ano é igual a 2021 e a carga horária é menor ou igual a que 100
  6) Buscar os cursos no qual não existe descrição cadastrada
  7) Buscar os cursos no qual a carga_horária esteja entre 50 e 150
  8) Trazer o nome e a matricula dos alunos com as matriculas 2, 5 e 8 
  9) Trazer os cursos no qual o nome tem a palavra dados
  10) Trazer os alunos que possuem a letra 'a' na segunda posição do seu nome
  11) Apresentar o nome e a matricula dos alunos em ordem de nome
  12) Apresentar os curso em ordem decrescente de nome
  13) Apresentar o nome e o ano dos cursos dos anos de 2022 e 2023 ordenados por ano decrescente e por nome ascendente
  14) Buscar o nome e a cidade dos alunos que não possuem ainda o curso 
  15) Apresentar os alunos que possuem o nome finalizado com a letra 'o' e o id_curso tenha um desses valores: 1, 3, 6 ou 8 
-
--------------------ASSOCIAÇÃO DE TABELAS---------------------
  16) Apresentar o nome do aluno e o nome do curso que está fazendo
  17) Apresentar o nome e a carga horária do curso, nome e a cidade do aluno
  no qual a carga horária é menor que 100
  18) Buscar nome e a descrição do curso, nome e a dt de nascimento do aluno no qual o nome do aluno tem a letra r no nome, ordenado por matricula decrescente
  19) Buscar a quantidade de cursos cadastrados
  20) Listar as cidades dos alunos sem repetições dos nomes da cidade
  21) Listar todas as cargas horárias cadastradas sem repetições
  22) Buscar a maior e a menor carga horária cadastrada
  23) Buscar a média das cargas horárias
  --

1) Apresentar todos os cursos

SELECT nome
FROM curso;
--

2) Apresentar todos os alunos

SELECT nome
FROM alunos;

--
3) Apresentar o nome e o ano dos cursos 

SELECT nome, ano
FROM curso;

--
4) Apresentar a carga horária, o nome e a descrição dos cursos no qual a carga horária é maior que 100

SELECT carga_horaria, nome, descricao
FROM curso
WHERE carga_horaria > 100;	

--
5) Apresentar o id, o nome e a carga horária onde o ano é igual a 2021 e a carga horária é menor ou igual a que 100

SELECT id, nome, carga_horaria
FROM curso
WHERE ano = 2021
AND carga_horaria <= 100;	

--
6) Buscar os cursos no qual não existe descrição cadastrada

SELECT id, nome, ano, carga_horaria
FROM curso
WHERE descricao IS NULL;

--
7) Buscar os cursos no qual a carga_horária esteja entre 50 e 150

SELECT id, nome, ano, carga_horaria
FROM curso
WHERE carga_horaria BETWEEN 50 AND 150;

--
8) Trazer o nome e a matricula dos alunos com as matriculas 2, 5 e 8 

SELECT nome, matricula
FROM aluno
WHERE matricula IN (2,5,8);

--
9) Trazer os cursos no qual o nome tem a palavra dados

SELECT nome
FROM curso
WHERE nome LIKE '%dados%';

---
10) Trazer os alunos que possuem a letra 'a' na segunda posição do seu nome

SELECT nome
FROM aluno
WHERE nome LIKE '_a%';

--
11) Apresentar o nome e a matricula dos alunos em ordem de nome

SELECT nome, matricula
FROM aluno
ORDER BY nome ASC;

--
12) Apresentar os curso em ordem decrescente de nome

SELECT nome
FROM curso
ORDER BY nome DESC;

--
13) Apresentar o nome e o ano dos cursos dos anos de 2022 e 2023 ordenados por ano decrescente e por nome ascendente

SELECT nome, ano
FROM curso
WHERE ano IN(2022,2023)
ORDER BY ano DESC, nome ASC;

--
14) Buscar o nome e a cidade dos alunos que não possuem ainda o curso 

SELECT nome, cidade
FROM aluno
WHERE id_curso IS NULL;

--
15) Apresentar os alunos que possuem o nome finalizado com a letra 'o' e o id_curso tenha um desses valores: 1, 3, 6 ou 8 

SELECT nome
FROM aluno
WHERE nome LIKE '%o'
AND id_curso IN(1,3,6,8);

--
16) Apresentar o nome do aluno e o nome do curso que está fazendo

SELECT aluno.nome, curso.nome
FROM aluno
INNER JOIN curso ON aluno.id_curso = curso.id;

--
17) Apresentar o nome e a carga horária do curso, nome e a cidade do aluno

SELECT curso.nome, curso.carga_horaria, aluno.nome, aluno.cidade
FROM aluno
INNER JOIN curso ON aluno.id_curso = curso.id;

--
18) Buscar nome e a descrição do curso, nome e a dt de nascimento do aluno no qual o nome do aluno tem a letra r no nome, ordenado por matricula decrescente

SELECT curso.nome, curso.descricao, aluno.nome, aluno.dt_nascimento
FROM aluno
INNER JOIN curso ON aluno.id_curso = curso.id;

--
19) Buscar a quantidade de cursos cadastrados

SELECT count(id)
FROM curso;

--
20) Listar as cidades dos alunos sem repetições dos nomes da cidade

SELECT DISTINCT aluno.cidade
FROM aluno;

--
21) Listar todas as cargas horárias cadastradas sem repetições

SELECT DISTINCT curso.carga_horaria
FROM curso;

--
22) Buscar a maior e a menor carga horária cadastrada
SELECT 
	MAX(carga_horaria),
  MIN(carga_horaria)
FROM curso;

--
23) Buscar a média das cargas horárias
SELECT 
	AVG(carga_horaria)
FROM curso;

--
--