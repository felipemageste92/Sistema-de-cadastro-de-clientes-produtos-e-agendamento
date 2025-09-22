CREATE database IF NOT EXISTS barbearia;

 CREATE TABLE clientes(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(30),
 nascimento DATE,
 email VARCHAR(100)
 
 
 ) DEFAULT CHARSET = utf8;


 CREATE TABLE IF NOT EXISTS marcas(
 id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome_marca VARCHAR(30) NOT NULL UNIQUE,
 descricao TEXT
 
 ) DEFAULT CHARSET = utf8;
 

 
 
 CREATE TABLE IF NOT EXISTS produtos(
 id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 id_marca INT,
 nome_produto VARCHAR(50),
 preco DECIMAL(10,2) NOT NULL,
 estoque INT DEFAULT 0,
 FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
 
 ) DEFAULT CHARSET = utf8;
 
 
 CREATE TABLE IF NOT EXISTS serviços(
 id_serviço INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 nome_serviço VARCHAR(30),
 descricao TEXT,
 preco DECIMAL(10,2),
 duracao_media INT COMMENT 'Duração em minutos',
 ativo BOOLEAN DEFAULT TRUE
 ) DEFAULT CHARSET = utf8;
 
 
 CREATE TABLE IF NOT EXISTS agendamentos(
 id_agendamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 id_cliente INT NOT NULL,
 data_agendamento DATETIME NOT NULL,
 status ENUM('agendado', 'realizado', 'cancelado', 'nao_compareceu') DEFAULT 'agendado',
 valor_total DECIMAL(10,2),
 observacoes TEXT,
 FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
 ) DEFAULT CHARSET = utf8;


CREATE TABLE IF NOT EXISTS agendamento_servicos(
id_agendamento_serviço INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_agendamento INT NOT NULL,
id_servico INT NOT NULL,
preco_servico DECIMAL(10,2) NOT NULL,
FOREIGN KEY (id_agendamento) REFERENCES agendamentos(id_agendamento),
FOREIGN KEY  (id_servico) REFERENCES servicos(id_servico)

) default charset = utf8;

 
INSERT INTO produtos (nome_produto, id_marca, preco, estoque)
values 
('Pomada Matte Premium', 33, 50.00, 20),
('Pomada Brilho intenso', 34, 50.00, 20),
('Pomada Efeito Teia', 35, 50.00, 20),
('Minoxidil 15%', 35, 60.00, 50);
