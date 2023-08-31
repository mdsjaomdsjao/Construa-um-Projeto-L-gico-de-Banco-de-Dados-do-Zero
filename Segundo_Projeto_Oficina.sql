CREATE DATABASE Oficina;
USE Oficina;

-- Tabela para armazenar informações de clientes
CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nomeCompleto VARCHAR(255) NOT NULL,
    telefone CHAR(11),
    email VARCHAR(100),
    endereco VARCHAR(255)
);

-- Tabela para armazenar informações de veículos
CREATE TABLE Veiculos (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT,
    placa CHAR(7) UNIQUE,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Tabela para armazenar informações de serviçoss
CREATE TABLE Servicos (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    nomeServico VARCHAR(100) NOT NULL,
    descricaoServico VARCHAR(255),
    precoServico DECIMAL(10, 2) NOT NULL
);

-- Tabela para armazenar informações de ordens de serviço
CREATE TABLE OrdensServico (
    idOrdem INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idVeiculo INT,
    dataOrdem DATE,
    valorTotal DECIMAL(10, 2),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idVeiculo) REFERENCES Veiculos(idVeiculo)
);

-- Tabela para relacionar serviços e ordens de serviço
CREATE TABLE ServicosOrdem (
    idOrdem INT,
    idServico INT,
    PRIMARY KEY (idOrdem, idServico),
    FOREIGN KEY (idOrdem) REFERENCES OrdensServico(idOrdem),
    FOREIGN KEY (idServico) REFERENCES Servicos(idServico)
);
