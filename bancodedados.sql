DROP SCHEMA IF EXISTS DESAFIO;
CREATE SCHEMA DESAFIO;
USE DESAFIO;

CREATE TABLE medico (
    id INT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sexo CHAR(1) NOT NULL,
    salario INT NOT NULL
);

CREATE TABLE farmaceutico (
    id INT NOT NULL PRIMARY KEY,
    ala INT NOT NULL,
    id_medico_resp INT NOT NULL,
    turno VARCHAR(20) NOT NULL,
    CONSTRAINT fk_medico_resp FOREIGN KEY (id_medico_resp) REFERENCES medico(id)
);

INSERT INTO medico (id, nome, sexo, salario) VALUES 
(1, 'Ana Souza', 'F', 4500),
(2, 'Carlos Pereira', 'M', 5000),
(3, 'Mariana Lima', 'F', 4800),
(4, 'Joao Santos', 'M', 4950),
(5, 'Fernanda Alves', 'F', 4700),
(6, 'Ricardo Gomes', 'M', 5000),
(7, 'Patricia Rocha', 'F', 4300),
(8, 'Lucas Martins', 'M', 4900),
(9, 'Juliana Costa', 'F', 4100),
(10, 'Eduardo Oliveira', 'M', 5000);

INSERT INTO farmaceutico (id, ala, id_medico_resp, turno) VALUES
(1, 101, 1, 'Manha'),
(2, 102, 2, 'Tarde'),
(3, 103, 3, 'Noite'),
(4, 104, 4, 'Manha'),
(5, 105, 5, 'Tarde'),
(6, 101, 6, 'Noite'),
(7, 102, 7, 'Manha'),
(8, 103, 8, 'Tarde'),
(9, 104, 9, 'Noite'),
(10, 105, 10, 'Manha');

UPDATE farmaceutico SET turno = 'Plantao' WHERE ala = 103;

SELECT nome, salario FROM medico WHERE salario >= 4800;

SELECT COUNT(*) AS total, SUM(salario) AS soma, AVG(salario) AS media FROM medico;

SELECT sexo, AVG(salario) AS media_sexo 
FROM medico 
GROUP BY sexo 
HAVING media_sexo > 4000;

SELECT m.nome, m.salario, f.ala, f.turno
FROM medico m
INNER JOIN farmaceutico f ON m.id = f.id_medico_resp;