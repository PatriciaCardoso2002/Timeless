--Inserir valores na tabela TIMELESS_MUSICA
INSERT INTO TIMELESS_MUSICA (idMusica, titulo, artista, compositor, gravadora)
VALUES
	(1, 'Bohemian Rhapsody', 'Queen', 'Freddie Mercury', 'EMI'),
	(2, 'Stairway to Heaven', 'Led Zeppelin', 'Jimmy Page and Robert Plant', 'Atlantic Records'),
	(3, 'Imagine', 'John Lennon', 'John Lennon', 'Apple Records'),
	(4, 'Hotel California', 'Eagles', 'Don Felder, Glenn Frey and Don Henley', 'Asylum Records'),
	(5, 'Smells Like Teen Spirit', 'Nirvana', 'Kurt Cobain', 'Sub Pop'),
	(6, 'Sweet Child O'' Mine', 'Guns N'' Roses', 'Axl Rose, Slash, Izzy Stradlin, Duff McKagan and Steven Adler', 'Geffen Records'),
	(7, 'Like a Rolling Stone', 'Bob Dylan', 'Bob Dylan', 'Columbia Records'),
	(8, 'Hey Jude', 'The Beatles', 'John Lennon and Paul McCartney', 'Apple Records'),
	(9, 'Billie Jean', 'Michael Jackson', 'Michael Jackson', 'Epic Records'),
	(10, 'My Generation', 'The Who', 'Pete Townshend', 'Brunswick Records');



-- Inserir valores na tabela TIMELESS_FUNCIONARIO
INSERT INTO TIMELESS_FUNCIONARIO (idFuncionario, nome, apelido, contacto, email, sexo, dataNascimento)
VALUES
    (1, 'John', 'Doe', '123456789', 'john.doe@example.com', 'M', '1990-01-01'),
    (2, 'Jane', 'Smith', '987654321', 'jane.smith@example.com', 'F', '1990-02-02'),
    (3, 'Michael', 'Johnson', '555555555', 'michael.johnson@example.com', 'M', '1990-03-03'),
    (4, 'Emily', 'Brown', '999999999', 'emily.brown@example.com', 'F', '1990-04-04'),
    (5, 'Robert', 'Miller', '111111111', 'robert.miller@example.com', 'M', '1990-05-05'),
    (6, 'Olivia', 'Davis', '444444444', 'olivia.davis@example.com', 'F', '1990-06-06'),
    (7, 'William', 'Wilson', '777777777', 'william.wilson@example.com', 'M', '1990-07-07'),
    (8, 'Sophia', 'Moore', '222222222', 'sophia.moore@example.com', 'F', '1990-08-08'),
    (9, 'David', 'Taylor', '888888888', 'david.taylor@example.com', 'M', '1990-09-09'),
    (10, 'Isabella', 'Anderson', '333333333', 'isabella.anderson@example.com', 'F', '1990-10-10');



-- Inserir valores na tabela TIMELESS_PARCERIA
INSERT INTO TIMELESS_PARCERIA (idEmpresa, nome, tipoNegocio, contactoEmpresa, localizacao, idFuncionario)
VALUES
    (1, 'ABC Company', 'Serviços de Consultoria', 123456789, 'Los Angeles', 1),
    (2, 'XYZ Corporation', 'Indústria de Tecnologia', 987654321, 'California', 2),
    (3, 'Acme Corporation', 'Varejo Online', 555555555, 'New York', 3),
    (4, 'Global Enterprises', 'Serviços Financeiros', 999999999, 'Helsinquia', 4),
    (5, 'Innovative Solutions', 'Desenvolvimento de Software', 111111111, 'Praga', 5),
    (6, 'Sunrise Industries', 'Energias Renováveis', 444444444, 'Aveiro', 6),
    (7, 'Dynamic Innovators', 'Marketing Digital', 777777777, 'Paris', 7),
    (8, 'Prime Logistics', 'Logística e Transporte', 222222222, 'Madrid', 8),
    (9, 'Tech Vision', 'Pesquisa e Desenvolvimento', 888888888, 'Amesterdão', 9),
    (10, 'Globe Telecom', 'Telecomunicações', 333333333, 'Dublin', 10);


 --Inserir valores na tabela TIMELESS_PROGRAMA
INSERT INTO TIMELESS_PROGRAMA (idprograma, titulo, anolancamento, diretor, elenco, sinopse, duracao, idempresa)
VALUES
    (1, 'Tom and Jerry', '1940-02-10', 'William Hanna', 'William Hanna, Mel Blanc', 'Tom and Jerry is a classic animated series featuring the comedic rivalry between Tom the cat and Jerry the mouse.', 10, 1),
    (2, 'Looney Tunes', '1930-04-19', 'Various Directors', 'Mel Blanc', 'Looney Tunes is a collection of animated short films featuring beloved characters such as Bugs Bunny, Daffy Duck, and Porky Pig.', 7, 1),
    (3, 'The Flintstones', '1960-09-30', 'Joseph Barbera', 'Alan Reed, Mel Blanc', 'The Flintstones is a popular animated sitcom depicting the lives of the Flintstone family in the Stone Age.', 30, 1),
    (4, 'Scooby-Doo, Where Are You!', '1969-09-13', 'Joseph Barbera, William Hanna', 'Don Messick, Casey Kasem', 'Scooby-Doo, Where Are You! follows the adventures of Scooby-Doo and the Mystery Inc. gang as they solve supernatural mysteries.', 25, 1),
    (5, 'The Jetsons', '1962-09-23', 'Joseph Barbera, William Hanna', 'George OHanlon, Penny Singleton', 'The Jetsons is a futuristic animated sitcom depicting the life of the Jetson family in a high-tech utopia.', 22, 1),
	(6, 'Mickey Mouse', '1928-11-18', 'Walt Disney, Ub Iwerks', 'Walt Disney', 'Mickey Mouse is an iconic animated character created by Walt Disney, known for his mischievous and adventurous nature.', 8, 1),
    (7, 'Popeye the Sailor', '1929-01-17', 'Various Directors', 'Jack Mercer, Mae Questel', 'Popeye the Sailor is a beloved animated series featuring the spinach-loving sailor and his adventures with Olive Oyl and Bluto.', 6, 1),
    (8, 'The Pink Panther Show', '1964-12-18', 'Fritz Freleng, Hawley Pratt', 'Mel Blanc', 'The Pink Panther Show features the iconic Pink Panther character in a series of silent comedy cartoons, known for its catchy theme song.', 5, 1),
    (9, 'The Bugs Bunny Show', '1960-10-11', 'Various Directors', 'Mel Blanc', 'The Bugs Bunny Show showcases the hilarious antics of Bugs Bunny and other Looney Tunes characters in a variety of animated shorts.', 20, 1),
    (10, 'He-Man and the Masters of the Universe', '1983-09-05', 'Various Directors', 'John Erwin, Alan Oppenheimer', 'He-Man and the Masters of the Universe follows the adventures of Prince Adam, who transforms into the mighty He-Man to defend Eternia against the evil Skeletor.', 30, 1);


-- Inserir valores na tabela TIMELESS_EPISODIO
INSERT INTO TIMELESS_EPISODIO (sinopse, idprograma, titulo, numero, temporada, duracao, datadelancamento)
VALUES
    ('Tom e Jerry se envolvem em uma nova e hilariante perseguição', 1, 'A Corrida', 1, 1, 10, '2023-01-15'),
    ('Jerry usa sua astúcia para escapar das garras de Tom mais uma vez', 1, 'O Esconderijo', 2, 1, 12, '2023-01-22'),
    ('Bugs Bunny trapaceia mais uma vez em uma nova aventura', 2, 'Aposta Maluca', 1, 1, 7, '2023-02-05'),
    ('Pernalonga e Patolino enfrentam um desafio inesperado', 2, 'A Grande Competição', 2, 1, 8, '2023-02-12'),
    ('Pedrita e Bambam vivem uma nova aventura na Idade da Pedra', 3, 'Uma Tarde no Parque', 1, 1, 25, '2023-03-10'),
    ('Fred Flintstone se mete em confusão novamente', 3, 'A Grande Encrenca', 2, 1, 28, '2023-03-17'),
    ('Scooby-Doo e sua turma desvendam mais um mistério', 4, 'O Fantasma do Farol', 1, 1, 22, '2023-04-05'),
    ('Uma mansão mal-assombrada testa a coragem de Scooby-Doo e seus amigos', 4, 'O Mistério da Mansão', 2, 1, 26, '2023-04-12'),
    ('George Jetson enfrenta uma nova invenção tecnológica', 5, 'O Robô de Limpeza', 1, 1, 18, '2023-05-03'),
    ('Jane Jetson se envolve em uma confusão intergaláctica', 5, 'O Dia do Caos', 2, 1, 20, '2023-05-10');


-- Inserir valores na tabela TIMELESS_PAISES
INSERT INTO TIMELESS_PAISES (codigoPaisID, nome, lingua, moeda)
VALUES
(1, 'United States', 'English', 'USD'),
(2, 'Canada', 'English, French', 'CAD'),
(3, 'Mexico', 'Spanish', 'MXN'),
(4, 'United Kingdom', 'English', 'GBP'),
(5, 'Japan', 'Japanese', 'JPY');
INSERT INTO TIMELESS_PAISES(codigoPaisID,nome,lingua,moeda)
VALUES
	(6,'Portugal','Portuguese','Euro'),
	(7,'Spain','Spanish','Euro');

--Inserir valores na tabela TIMELESS_SOUNDTRACK
INSERT INTO TIMELESS_SOUNDTRACK (codigoSoundTrack, idMusica, idPrograma)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);


---- Inserir valores na tabela TIMELESS_CONTA

INSERT INTO TIMELESS_CONTA (nome, apelido, datadeNascimento, email, palPasse, progsFavoritos, idFuncionario)
VALUES
    ('João Silva', 'Jota', '1990-01-15', 'joao.silva@example.com', 'senha123', '1,2,3', 1),
    ('Maria Santos', 'Mary', '1985-05-20', 'maria.santos@example.com', 'abc456', '4,5', 2),
    ('Pedro Almeida', 'Pepe', '1998-12-02', 'pedro.almeida@example.com', 'qwerty', '2,3', 3),
    ('Ana Costa', 'Aninha', '1992-07-10', 'ana.costa@example.com', 'senha456', '1,4', 4),
    ('Carlos Oliveira', 'Carlinhos', '1995-03-28', 'carlos.oliveira@example.com', 'abc123', '3,5', 5),
    ('Mariana Ferreira', 'Mari', '1994-09-18', 'mariana.ferreira@example.com', 'senha789', '2,4,5', 6),
    ('Rui Santos', 'Ruizinho', '1988-04-05', 'rui.santos@example.com', 'abc789', '1,3', 7),
    ('Sara Costa', 'Sarinha', '2000-01-20', 'sara.costa@example.com', 'senha890', '2,4', 8),
    ('António Pereira', 'Toninho', '1996-11-15', 'antonio.pereira@example.com', 'qwerty123', '2,3,5', 9),
    ('Marta Rodrigues', 'Martinha', '1999-07-22', 'marta.rodrigues@example.com', 'abc456def', '1,4,5', 10);
--Quando tem o IDENTITY(1,1) não é preciso colocar o idConta


--Inserir valores na tabela TIMELESS_METODOPAGAMENTO
INSERT INTO TIMELESS_METODOPAGAMENTO(descricao) VALUES
('MBway'),
('Credit Card'),
('Paypal'),
('Multibanco');


--inserir valores na tabela TIMELESS_PAGAMENTO
INSERT INTO TIMELESS_PAGAMENTO (idCliente, valorPago, dataPagamento,metodoId) VALUES
(1, 500, '2021-09-01',1),
(2, 250, '2021-09-03',2),
(3, 1000, '2021-09-05',3),
(4, 750, '2021-09-07',4);
INSERT INTO TIMELESS_PAGAMENTO(idcliente,valorPago, dataPagamento, metodoId) VALUES 
(5,550,'2021-09-01',1),
(6,630,'2021-07-08',2),
(7,430,'2021-07-06',3),
(8,320,'2021-06-05',4),
(9,235,'2021-08-07',1),
(10,150,'2021-08-09',2);

-- Inserir valores na tabela TIMELESS_SUBSCRICAO

INSERT INTO TIMELESS_SUBSCRICAO (tiposubscricao, valorMensalidade)
VALUES
    ('Premium', 20),
    ('Standard', 10),
    ('Premium', 20),
    ('Standard', 10),
    ('Premium', 20);
INSERT INTO TIMELESS_SUBSCRICAO(tiposubscricao,valorMensalidade)
VALUES
	('Standard',10),
	('Premium',20),
	('Standard',10),
	('Premium',20),
	('Standard',10);

--porque idConta é IDENTITY(1,1)


---- Inserir valores na tabela TIMELESS_AVALIACAO
INSERT INTO TIMELESS_AVALIACAO (idavaliacao, userContaQueAvaliou, data, classificacao, idprograma)
VALUES
    (1, 'João', '2023-05-01', 5, 1),
    (2, 'Maria', '2023-05-02', 4, 1),
    (3, 'Pedro', '2023-05-03', 3, 2),
    (4, 'Ana', '2023-05-04', 2, 2),
    (5, 'Carlos', '2023-05-05', 1,3);
INSERT INTO TIMELESS_AVALIACAO(idavaliacao,userContaQueAvaliou, data, classificacao, idprograma)
VALUES
	(6,'Mariana','2023-05-09',3,3),
	(7,'Rui','2023-05-10',4,4),
	(8,'Sara','2023-05-11',2,4),
	(9,'António','2023-05-12',3,5),
	(10,'Marta','2023-05-13',4,5);

--porque o idConta é IDENTITY(1,1)

--Inserir valores na tabela TIMELESS_ALLOWEDIN
INSERT INTO TIMELESS_ALLOWEDIN (codigoPaisID, idPrograma)
VALUES (1, 1), (2, 2), (2,3);
INSERT INTO TIMELESS_ALLOWEDIN(codigoPaisID,idPrograma)
VALUES
	(3,3),
	(4,5),
	(5,8),
	(6,9),
	(7,6),
	(3,4),
	(4,7),
	(5,9),
	(6,8),
	(7,3);


--- Inserir valores na tabela TIMELESS_SOUNDTRACKTEM
INSERT INTO TIMELESS_SOUNDTRACKTEM (idMusica, codigoSoundTrack)
VALUES (1,2), (2, 4), (3, 6);
INSERT INTO TIMELESS_SOUNDTRACKTEM(idMusica,codigoSoundTrack)
VALUES
	(4,1),
	(5,3),
	(6,5),
	(7,8),
	(8,7),
	(9,10),
	(10,9);

INSERT INTO TIMELESS_CONTA_AVALIACAO ([idConta], [idAvaliacao])
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);



--SELECT * FROM TIMELESS_MUSICA;
--SELECT * FROM TIMELESS_FUNCIONARIO;
--SELECT * FROM TIMELESS_PARCERIA;
--SELECT * FROM TIMELESS_PROGRAMA;
--SELECT * FROM TIMELESS_EPISODIO;
--SELECT * FROM TIMELESS_PAISES;
--SELECT * FROM TIMELESS_SOUNDTRACK;
--SELECT * FROM TIMELESS_CONTA;
--SELECT * FROM TIMELESS_METODOPAGAMENTO;
--SELECT * FROM TIMELESS_PAGAMENTO;
--SELECT * FROM TIMELESS_SUBSCRICAO;
--SELECT * FROM TIMELESS_AVALIACAO;
--SELECT * FROM TIMELESS_ALLOWEDIN;
--SELECT * FROM TIMELESS_SOUNDTRACKTEM;

