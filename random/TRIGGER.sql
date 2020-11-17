CREATE TABLE log_edicao_cliente(
    id_cliente INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(100) NOT NULL,
	data_cadastro DATE,
    PRIMARY KEY(id_cliente)
);

CREATE FUNCTION log_edicao_cliente()
RETURNS TRIGGER AS $$
	BEGIN
	INSERT INTO log_edicao_cliente() VALUES
		(OLD.id_cliente, OLD.nome, OLD.telefone, OLD.data_cadastro);
	RETURN OLD;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER executa_log_edicao_cliente
AFTER UPDATE ON cliente
FOR EACH ROW EXECUTE PROCEDURE log_edicao_cliente();

SELECT * FROM log_edicao_cliente;
UPDATE cliente SET telefone = '26-657411371'
WHERE id_cliente = 1;

SELECT * FROM log_edicao_cliente;

CREATE FUNCTION insere_produto_padrao()
RETURNS TRIGGER AS $$
	BEGIN
	INSERT INTO produto VALUES
		(11, 'Produto padrao', 0.00, NEW.id_marca);
	RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER executa_produto_padrao
AFTER INSERT ON marca
FOR EACH ROW EXECUTE PROCEDURE insere_produto_padrao();

INSERT INTO marca VALUES(
	11, 'Logitech'
);

SELECT * FROM produto;

CREATE TABLE log_remocao_pedido_acima_100(
    id_pedido INT NOT NULL,
    id_cliente INT NOT NULL,
    total NUMERIC(10,2) NOT NULL,
    data_pedido DATE,
    PRIMARY KEY(id_pedido),
	FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente)
);

CREATE FUNCTION log_remocao_pedido()
RETURNS TRIGGER AS $$
	BEGIN
	IF OLD.total > 100.00 THEN
		INSERT INTO log_remocao_pedido_acima_100 VALUES
			(OLD.id_pedido, OLD.id_cliente, OLD.total, OLD.data_pedido);
	END IF;
	RETURN OLD;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER executa_log_remocao_pedido_acima_100
AFTER DELETE ON pedido
FOR EACH ROW EXECUTE PROCEDURE log_remocao_pedido();

SELECT * FROM pedido
WHERE total > 100.00;

-- total pedido maior que 100
DELETE FROM item_pedido 
WHERE id_pedido = 1;
DELETE FROM pedido 
WHERE id_pedido = 1;

-- total pedido menor que 100
DELETE FROM item_pedido 
WHERE id_pedido = 3;
DELETE FROM pedido 
WHERE id_pedido = 3;

SELECT * FROM log_remocao_pedido_acima_100;

CREATE FUNCTION valida_cliente()
RETURNS TRIGGER AS $$
	BEGIN
	IF NEW.data_cadastro != CURRENT_DATE THEN
		RAISE EXCEPTION 'Data de cadastro invalida';
	END IF;
	IF NEW.nome IS NULL THEN
		RAISE EXCEPTION 'Nome nao pode ser nulo';
	END IF;
	IF LENGTH(NEW.telefone) < 10 THEN
		RAISE EXCEPTION 'Telefone deve possuir mais de 10 digitos';
	END IF;
	RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER validacao_insercao_cliente
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW EXECUTE PROCEDURE valida_cliente(); 

-- nome invalido
INSERT INTO cliente VALUES (12, NULL, '26-657411372', '2020-11-10');
-- data invalida
INSERT INTO cliente VALUES (12, 'Abel Braga', '26-657411372', '2020-01-10');
-- telefone invalido
INSERT INTO cliente VALUES (12, 'Abel Braga', '12345', '2020-11-10');
-- valido
INSERT INTO cliente VALUES (12, 'Abel Braga', '26-657411373', '2020-11-10');

SELECT * FROM cliente;

CREATE FUNCTION valida_pedido()
RETURNS TRIGGER AS $$
	BEGIN
	IF NEW.id_cliente IS NULL THEN
		RAISE EXCEPTION 'Cliente nao pode ser nulo';
	END IF;
	IF NEW.data_pedido != CURRENT_DATE THEN
		RAISE EXCEPTION 'Data de pedido invalida';
	END IF;
	IF NEW.total <= 0.0 THEN
		RAISE EXCEPTION 'Total deve ser maior que 0';
	END IF;
	RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER validacao_insercao_pedido
BEFORE INSERT OR UPDATE ON pedido
FOR EACH ROW EXECUTE PROCEDURE valida_pedido();

-- cliente invalido
INSERT INTO pedido VALUES (1, NULL, 55.88, '2020-11-10');
-- total invalido
INSERT INTO pedido VALUES (1, 1, 0, '2020-11-10');
-- data invalida
INSERT INTO pedido VALUES (1, 1, 55.88, '2020-01-10');
-- valido
INSERT INTO pedido VALUES (21, 1, 55.88, '2020-11-10');

SELECT * FROM pedido;
