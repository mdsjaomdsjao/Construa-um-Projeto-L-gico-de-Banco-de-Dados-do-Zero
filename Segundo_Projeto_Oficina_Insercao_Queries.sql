-- Inserção de dados
INSERT INTO Clientes (nomeCompleto, telefone, email, endereco)
VALUES
    ('João da Silva', '11999999999', 'joao@email.com', 'Rua A, 123'),
    ('Maria Souza', '11888888888', 'maria@email.com', 'Avenida B, 456'),
    ('Carlos Oliveira', '11777777777', 'carlos@email.com', 'Rua C, 789');

INSERT INTO Veiculos (idCliente, marca, modelo, ano, placa)
VALUES
    (1, 'Ford', 'Fiesta', 2020, 'ABC1234'),
    (1, 'Chevrolet', 'Onix', 2019, 'DEF5678'),
    (2, 'Volkswagen', 'Gol', 2021, 'GHI9012');

INSERT INTO Servicos (nomeServico, descricaoServico, precoServico)
VALUES
    ('Troca de óleo', 'Substituição do óleo do motor', 50.00),
    ('Alinhamento', 'Ajuste da geometria das rodas', 80.50),
    ('Revisão Completa', 'Verificação geral do veículo', 150.75);

INSERT INTO OrdensServico (idCliente, idVeiculo, dataOrdem, valorTotal)
VALUES
    (1, 1, '2023-08-25', 130.50),
    (2, 2, '2023-08-26', 150.75),
    (3, 3, '2023-08-27', 80.50);

INSERT INTO ServicosOrdem (idOrdem, idServico)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 1),
    (3, 2);

-- Recuperações simples com SELECT Statement
SELECT * FROM Clientes;
SELECT * FROM Veiculos;
SELECT * FROM Servicos;

-- Filtros com WHERE Statement
SELECT * FROM Veiculos WHERE marca = 'Ford';
SELECT * FROM OrdensServico WHERE valorTotal > 100.00;

-- Expressões para gerar atributos derivados
SELECT idOrdem, valorTotal, valorTotal * 0.9 AS valorComDesconto FROM OrdensServico;

-- Defina ordenações dos dados com ORDER BY
SELECT * FROM Veiculos ORDER BY ano DESC;
SELECT * FROM Servicos ORDER BY nomeServico;

-- Condições de filtros aos grupos com HAVING
SELECT idCliente, COUNT(*) AS totalVeiculos FROM Veiculos GROUP BY idCliente HAVING totalVeiculos > 1;

-- Criando junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT 
    os.idOrdem, 
    c.nomeCompleto AS nomeCliente, 
    v.marca, 
    v.modelo, 
    s.nomeServico
FROM OrdensServico os
JOIN Clientes c ON os.idCliente = c.idCliente
JOIN Veiculos v ON os.idVeiculo = v.idVeiculo
JOIN ServicosOrdem so ON os.idOrdem = so.idOrdem
JOIN Servicos s ON so.idServico = s.idServico;