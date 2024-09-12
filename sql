CREATE DATABASE loja;
USE loja;
CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);
CREATE TABLE produtos (
    produto_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);
CREATE TABLE pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
INSERT INTO clientes (nome, email, telefone) VALUES
('Ana Souza', 'ana.souza@example.com', '1234-5678'),
('Pedro Lima', 'pedro.lima@example.com', '8765-4321');
INSERT INTO produtos (nome, preco) VALUES
('Cadeira', 150.00),
('Mesa', 300.00);
SELECT 
    p.pedido_id,
    c.nome AS cliente_nome,
    pr.nome AS produto_nome,
    p.quantidade,
    p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN produtos pr ON p.produto_id = pr.produto_id;
SELECT 
    c.nome AS cliente_nome,
    SUM(pr.preco * p.quantidade) AS total_gasto
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN produtos pr ON p.produto_id = pr.produto_id
GROUP BY c.cliente_id;
SELECT 
    c.nome AS cliente_nome,
    pr.nome AS produto_nome,
    p.quantidade,
    p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN produtos pr ON p.produto_id = pr.produto_id
WHERE p.data_pedido = '2024-09-03';
