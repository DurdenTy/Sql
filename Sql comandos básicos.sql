

CREATE TABLE IF NOT EXISTS banco(
    
    numero INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (numero)

);

CREATE TABLE IF NOT EXISTS agencia(
    banco_numero INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    nome VARCHAR(80) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(banco_numero, numero),
    FOREIGN KEY(numero) REFERENCES banco(numero)

);

CREATE TABLE IF NOT EXISTS cliente(
    numero BIGSERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(250) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE IF NOT EXISTS conta_corrente(
    banco_numero INTEGER NOT NULL,
    agencia_numero INTEGER NOT NULL,
    numero BIGINT NOT NULL,
    digito SMALLINT NOT NULL,
    cliente_numero BIGINT NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(banco_numero, agencia_numero, numero, digito, cliente_numero),
    FOREIGN KEY(banco_numero, agencia_numero) REFERENCES agencia(banco_numero, numero),
    FOREIGN KEY(cliente_numero) REFERENCES cliente(numero)
);

CREATE TABLE IF NOT EXISTS transacao(
    id SMALLINT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS cliente_transacoes (

    id BIGSERIAL PRIMARY KEY,
    banco_numero INTEGER NOT NULL,
    agencia_numero INTEGER NOT NULL,
    conta_corrente_numero BIGINT NOT NULL,
    conta_corrente_digito SMALLINT NOT NULL,
    cliente_numero BIGINT NOT NULL,
    tipo_transacao_id SMALLINT NOT NULL,
    valor NUMERIC(15, 2) NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(banco_numero,agencia_numero,conta_corrente_numero,conta_corrente_digito ,cliente_numero) REFERENCES conta_corrente(banco_numero,agencia_numero,numero,digito,cliente_numero)
);

CREATE TABLE IF NOT EXISTS teste(
    cpf VARCHAR(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(cpf)
    
);



INSERT INTO teste(cpf, nome, data) VALUES ('321.323.533-76', 'Cascada', '14/04/2020');
INSERT INTO teste(cpf, nome, data) VALUES ('428.321.577-78', 'Casada', '19/23/2090');
INSERT INTO teste(cpf, nome, data) VALUES ('893.421.363-32', 'Cagada', '20/23/5612');

SELECT cpf, nome, data FROM teste;
SELECT banco_numero, numero FROM agencia;

SELECT AVG(cpf) FROM teste;

SELECT COUNT(cpf) FROM teste;

SELECT MAX(cpf) FROM teste GROUP BY cpf HAVING COUNT(cpf) > 200;

SELECT MIN(cpf) FROM teste;



