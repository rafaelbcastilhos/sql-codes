INSERT INTO address VALUES (1, 'Brasil', 'RS', 'Nova Prata', 'Rua Michael Jackson', 6654, 'Centro', null, 95320000);
INSERT INTO address VALUES (2, 'Brasil', 'SP', 'Jundiai', 'Rua Loro Jose', 1164, 'Morumbi', 'Fundos', 54987000);
INSERT INTO address VALUES (3, 'Brasil', 'SP', 'Cajamar', 'Av Joao Doria', 3422, 'Centro', 'Buraco Negro', 22987060);
INSERT INTO address VALUES (4, 'Brasil', 'RJ', 'Rio de Janeiro', 'Rua Zeca Pagodinho', 24, 'Favela do Zeca', 'Quintal', 99000000);
INSERT INTO address VALUES (5, 'Brasil', 'AC', 'Acre', 'Rua Dino', null, 'Pangeia', null, 00000001);
INSERT INTO address VALUES (6, 'Brasil', 'SC', 'Florianopolis', 'Av Silvio Santos', 666, 'Centro', null, 12388000);
INSERT INTO address VALUES (7, 'Brasil', 'PR', 'Curitiba', 'Av Luciono Hulk', 951, 'Zona Sul', null, 77388123);
INSERT INTO address VALUES (8, 'Alemanha', 'WT', 'Berlin', 'Rua dos 7a1', 701, 'Maracana', null, 71717171);
INSERT INTO address VALUES (9, 'Franca', 'JG', 'Paris', 'Rua Baguete', 8762, 'Centro', 'Torre Eiffel', 95132100);
INSERT INTO address VALUES (10, 'EUA', 'CA', 'California', 'Av Bidden', 404, 'Centro', null, 33322100);

INSERT INTO client VALUES(1, 'Freddie Mercury', '98712398755', '05554999887722', 1);
INSERT INTO client VALUES(2, 'Ana Maria Braga', '12312312300', '05511999992200', 2);
INSERT INTO client VALUES(3, 'Bob Esponja', '55549944333', '052299992222', 3);
INSERT INTO client VALUES(4, 'Dilma', '55549944399', '057794492212', 4);
INSERT INTO client VALUES(5, 'Fausto Silva', '55889964391', '1572366492213', 5);
INSERT INTO client VALUES(6, 'Lula Molusco', '55009964003', '0002346490000', 6);
INSERT INTO client VALUES(7, 'Chimbinha', '55213464873', '1231236490123', 7);
INSERT INTO client VALUES(8, 'David Luiz', '55449864811', '0559511590000', 8);
INSERT INTO client VALUES(9, 'Neymar Junior', '55985587997', '0009500099966', 9);
INSERT INTO client VALUES(10, 'Pato Donald', '55933859807', '0559505599969', 10);

INSERT INTO package VALUES(1, 'ASD', 'Perigoso', 'AAA123', 'Caixa', 1);
INSERT INTO package VALUES(2, 'QWE', 'Medio', 'BBB123', 'Caixa', 2);
INSERT INTO package VALUES(3, 'RTY', 'Inflamavel', 'CCC123', 'Galao', 3);
INSERT INTO package VALUES(4, 'ZXC', 'Baixo', 'DDD123', 'Pallet', 4);
INSERT INTO package VALUES(5, 'GHJ', 'Baixo', 'EEE123', 'Envelope', 5);
INSERT INTO package VALUES(6, 'HJK', 'Medio', 'FFF123', 'Caixa', 6);
INSERT INTO package VALUES(7, 'FGH', 'Inflamavel', 'GGG123', 'Pallet', 7);
INSERT INTO package VALUES(8, 'CVB', 'Medio', 'HHH123', 'Galao', 8);
INSERT INTO package VALUES(9, 'SDF', 'Perigoso', 'III123', 'Caixa', 9);
INSERT INTO package VALUES(10, 'BNM', 'Baixo', 'JJJ123', 'Cilindro', 10);

INSERT INTO transporter VALUES(1, 'Transportadora Logitech', '00023402340000', 'logitech@mail.com', '5505401200120');
INSERT INTO transporter VALUES(2, 'Transportadora Sandisk', '98700098700987', 'sand@mail.com', '5505400230012');
INSERT INTO transporter VALUES(3, 'Transportadora Acer', '98765498755987', 'acer@mail.com', '5505400540055');
INSERT INTO transporter VALUES(4, 'Transportadora Samsung', '98700022200333', 'samsung@mail.com', '5505422238712');
INSERT INTO transporter VALUES(5, 'Transportadora Motorola', '98700065477000', 'moto@mail.com', '5502367238000');
INSERT INTO transporter VALUES(6, 'Transportadora Corsair', '98700022266678', 'corsair@mail.com', '5505422200012');
INSERT INTO transporter VALUES(7, 'Transportadora Kingston', '66600321200321', 'king@mail.com', '9995598738712');
INSERT INTO transporter VALUES(8, 'Transportadora Intel', '98766620000311', 'intel@mail.com', '5505498758700');
INSERT INTO transporter VALUES(9, 'Transportadora CoolerMaster', '55599922255654', 'cm@mail.com', '5505428638000');
INSERT INTO transporter VALUES(10, 'Transportadora LG', '98764722222001', 'lg@mail.com', '5544422028002');

INSERT INTO vehicle VALUES(1, 'AAA1234', 'Volvo', 'Caminhao', 'Branco', 'Bitrem');
INSERT INTO vehicle VALUES(2, 'BBB1234', 'Scania', 'Caminhao', 'Azul', 'Normal');
INSERT INTO vehicle VALUES(3, 'CCC1234', 'Renault', 'Caminhao', 'Preto', 'Cavalo');
INSERT INTO vehicle VALUES(4, 'DDD1234', 'Mercedes', 'Van', 'Branco', 'Sprinter');
INSERT INTO vehicle VALUES(5, 'EEE1234', 'Fiat', 'Van', 'Branco', 'Ducato');
INSERT INTO vehicle VALUES(6, 'FFF1234', 'Yamaha', 'Moto', 'Vermelha', 'CB1000');
INSERT INTO vehicle VALUES(7, 'GGG1234', 'Caloi', 'Bicicleta', 'Cinza', '7 marchas');
INSERT INTO vehicle VALUES(8, 'XXX123', 'Boeing', 'Aviao', 'Branco', '747');
INSERT INTO vehicle VALUES(9, 'YYY1234', 'Boeing', 'Aviao', 'Azul', '767');
INSERT INTO vehicle VALUES(10, 'ZZZ1234', 'Xpto', 'Navio', 'Verde', 'Cargueiro');

INSERT INTO driver VALUES(1, '111111111', '2021-05-05', 1, 1);
INSERT INTO driver VALUES(2, '222222222', '2025-08-22', 2, 2);
INSERT INTO driver VALUES(3, '333333333', '2023-03-03', 3, 3);
INSERT INTO driver VALUES(4, '444444444', '2020-12-12', 4, 4);
INSERT INTO driver VALUES(5, '555555555', '2025-12-31', 5, 5);
INSERT INTO driver VALUES(6, '666666666', '2024-03-01', 6, 6);
INSERT INTO driver VALUES(7, '777777777', '2023-04-30', 7, 7);
INSERT INTO driver VALUES(8, '888888888', '2024-01-23', 8, 8);
INSERT INTO driver VALUES(9, '999999999', '2023-12-12', 9, 9);
INSERT INTO driver VALUES(10, '101010101', '2020-12-01', 10, 10);

-- A = IDLE, B = PREPARING, C = IN TRANSPORT, D = DELIVERED
INSERT INTO shipment VALUES(1, null, null, 'A', 1, 6, 1);
INSERT INTO shipment VALUES(2, null, null, 'A', 2, 7, 2);
INSERT INTO shipment VALUES(3, null, null, 'A', 3, 8, 3);
INSERT INTO shipment VALUES(4, CURRENT_DATE, null, 'B', 4, 9, 4);
INSERT INTO shipment VALUES(5, CURRENT_DATE, null, 'B', 5, 10, 5);
INSERT INTO shipment VALUES(6, CURRENT_DATE, null, 'B', 6, 1, 6);
INSERT INTO shipment VALUES(7, '2020-01-01', null, 'C', 7, 2, 7);
INSERT INTO shipment VALUES(8, '2020-03-25', null, 'C', 8, 3, 8);
INSERT INTO shipment VALUES(9, '2020-08-08', null, 'C', 9, 4, 9);
INSERT INTO shipment VALUES(10, '2020-01-10', '2020-11-19', 'D', 10, 5, 10);

INSERT INTO shipment_package VALUES(1, 15.33, 1, 1);
INSERT INTO shipment_package VALUES(2, 21.38, 2, 2);
INSERT INTO shipment_package VALUES(3, 10.00, 3, 3);
INSERT INTO shipment_package VALUES(4, 8.99, 4, 4);
INSERT INTO shipment_package VALUES(5, 20.00, 5, 5);
INSERT INTO shipment_package VALUES(6, 11.10, 6, 6);
INSERT INTO shipment_package VALUES(7, 30.99, 7, 7);
INSERT INTO shipment_package VALUES(8, 80.66, 8, 8);
INSERT INTO shipment_package VALUES(9, 101.00, 9, 9);
INSERT INTO shipment_package VALUES(10, 532.50, 10, 10);

INSERT INTO shipment_vehicle VALUES(1, 1, 10);
INSERT INTO shipment_vehicle VALUES(2, 2, 9);
INSERT INTO shipment_vehicle VALUES(3, 3, 8);
INSERT INTO shipment_vehicle VALUES(4, 4, 7);
INSERT INTO shipment_vehicle VALUES(5, 5, 6);
INSERT INTO shipment_vehicle VALUES(6, 5, 5);
INSERT INTO shipment_vehicle VALUES(7, 6, 4);
INSERT INTO shipment_vehicle VALUES(8, 7, 3);
INSERT INTO shipment_vehicle VALUES(9, 8, 2);
INSERT INTO shipment_vehicle VALUES(10, 9, 1);