CREATE DATABASE martecnica_demo;
USE martecnica_demo;

CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY,
    nome_fornecedor VARCHAR(100)
);

CREATE TABLE projetos (
    id_projeto INT PRIMARY KEY,
    nome_projeto VARCHAR(100),
    status VARCHAR(50),
    data_prevista DATE,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

INSERT INTO fornecedores (id_fornecedor, nome_fornecedor) VALUES
(1, 'Metalurgica Alpha'),
(2, 'Ferramentaria Beta'),
(3, 'Industria Gamma'),
(4, 'Usinagem Delta'),
(5, 'Moldes Epsilon');

INSERT INTO projetos (id_projeto, nome_projeto, status, data_prevista, id_fornecedor) VALUES
(101, 'Molde Parachoque X1', 'No Prazo', '2026-09-20', 1),
(102, 'Molde Painel Y2', 'no prazo', '2026-09-18', 1),
(103, 'Ferramenta Corte Z3', 'Atrasado', '2026-09-10', 2),
(104, 'Molde Retrovisor A4', 'ATRASADO', '2026-09-05', 2),
(105, 'Ferramenta Estampa B5', 'No Prazo', '2026-10-01', 3),
(106, 'Molde Farol C6', 'Em Andamento', '2026-09-25', 3),
(107, 'Ferramenta Solda D7', 'em andamento', '2026-09-30', 4),
(108, 'Molde Grade E8', 'No Prazo', NULL, 4),
(109, 'Ferramenta Corte F9', 'Atrasado', '2026-08-15', 5),
(110, 'Molde Painel G10', 'No Prazo', '2026-09-22', 5),
(111, 'Molde Painel G10', 'No Prazo', '2026-09-22', 5),
(112, 'Ferramenta Ajuste H11', 'Concluido', '2026-08-30', 1);

SELECT 
    p.id_projeto,
    p.nome_projeto,
    p.status,
    p.data_prevista,
    f.nome_fornecedor
FROM projetos p
INNER JOIN fornecedores f ON p.id_fornecedor = f.id_fornecedor
WHERE p.status IS NOT NULL;