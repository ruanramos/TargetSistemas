-- Criação da tabela Estados
CREATE TABLE Estados (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(2) NOT NULL,
    nome VARCHAR(50) NOT NULL
);

-- Criação da tabela Tipo_Telefones
CREATE TABLE Tipo_Telefones (
    id_tipo_telefone INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES Estados(id_estado)
);

-- Criação da tabela Telefones
CREATE TABLE Telefones (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(15) NOT NULL,
    id_cliente INT,
    id_tipo_telefone INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_tipo_telefone) REFERENCES Tipo_Telefones(id_tipo_telefone)
);


-- Consulta SQL: Faça uma busca utilizando comando SQL que traga o código, a razão social e o(s) telefone(s) de todos os clientes do estado de São Paulo (código “SP”);

SELECT 
    c.id_cliente, 
    c.razao_social, 
    t.numero AS telefone
FROM 
    Clientes c
JOIN 
    Telefones t ON c.id_cliente = t.id_cliente
JOIN 
    Estados e ON c.id_estado = e.id_estado
WHERE 
    e.sigla = 'SP';