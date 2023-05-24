---- Inserir valores na tabela TIMELESS_PROGRAMA
--INSERT INTO TIMELESS_PROGRAMA (idprograma, titulo, anolancamento, diretor, elenco, sinopse, duracao, idempresa)
--VALUES
--    (1, 'Tom and Jerry', '1940-02-10', 'William Hanna', 'William Hanna, Mel Blanc', 'Tom and Jerry is a classic animated series featuring the comedic rivalry between Tom the cat and Jerry the mouse.', 10, 1),
--    (2, 'Looney Tunes', '1930-04-19', 'Various Directors', 'Mel Blanc', 'Looney Tunes is a collection of animated short films featuring beloved characters such as Bugs Bunny, Daffy Duck, and Porky Pig.', 7, 1),
--    (3, 'The Flintstones', '1960-09-30', 'Joseph Barbera', 'Alan Reed, Mel Blanc', 'The Flintstones is a popular animated sitcom depicting the lives of the Flintstone family in the Stone Age.', 30, 1),
--    (4, 'Scooby-Doo, Where Are You!', '1969-09-13', 'Joseph Barbera, William Hanna', 'Don Messick, Casey Kasem', 'Scooby-Doo, Where Are You! follows the adventures of Scooby-Doo and the Mystery Inc. gang as they solve supernatural mysteries.', 25, 1),
--    (5, 'The Jetsons', '1962-09-23', 'Joseph Barbera, William Hanna', 'George OHanlon, Penny Singleton', 'The Jetsons is a futuristic animated sitcom depicting the life of the Jetson family in a high-tech utopia.', 22, 1),
--	(6, 'Mickey Mouse', '1928-11-18', 'Walt Disney, Ub Iwerks', 'Walt Disney', 'Mickey Mouse is an iconic animated character created by Walt Disney, known for his mischievous and adventurous nature.', 8, 1),
--    (7, 'Popeye the Sailor', '1929-01-17', 'Various Directors', 'Jack Mercer, Mae Questel', 'Popeye the Sailor is a beloved animated series featuring the spinach-loving sailor and his adventures with Olive Oyl and Bluto.', 6, 1),
--    (8, 'The Pink Panther Show', '1964-12-18', 'Fritz Freleng, Hawley Pratt', 'Mel Blanc', 'The Pink Panther Show features the iconic Pink Panther character in a series of silent comedy cartoons, known for its catchy theme song.', 5, 1),
--    (9, 'The Bugs Bunny Show', '1960-10-11', 'Various Directors', 'Mel Blanc', 'The Bugs Bunny Show showcases the hilarious antics of Bugs Bunny and other Looney Tunes characters in a variety of animated shorts.', 20, 1),
--    (10, 'He-Man and the Masters of the Universe', '1983-09-05', 'Various Directors', 'John Erwin, Alan Oppenheimer', 'He-Man and the Masters of the Universe follows the adventures of Prince Adam, who transforms into the mighty He-Man to defend Eternia against the evil Skeletor.', 30, 1);


---- Inserir valores na tabela TIMELESS_PARCERIA
--INSERT INTO TIMELESS_PARCERIA (idEmpresa, nome, tipoNegocio, contactoEmpresa, localizacao, idFuncionario)
--VALUES
--    (1, 'ABC Company', 'Serviços de Consultoria', 123456789, 'Los Angeles', 1),
--    (2, 'XYZ Corporation', 'Indústria de Tecnologia', 987654321, 'California', 2),
--    (3, 'Acme Corporation', 'Varejo Online', 555555555, 'New York', 3),
--    (4, 'Global Enterprises', 'Serviços Financeiros', 999999999, 'Helsinquia', 4),
--    (5, 'Innovative Solutions', 'Desenvolvimento de Software', 111111111, 'Praga', 5),
--    (6, 'Sunrise Industries', 'Energias Renováveis', 444444444, 'Aveiro', 6),
--    (7, 'Dynamic Innovators', 'Marketing Digital', 777777777, 'Paris', 7),
--    (8, 'Prime Logistics', 'Logística e Transporte', 222222222, 'Madrid', 8),
--    (9, 'Tech Vision', 'Pesquisa e Desenvolvimento', 888888888, 'Amesterdão', 9),
--    (10, 'Globe Telecom', 'Telecomunicações', 333333333, 'Dublin', 10);



-- Inserir valores na tabela TIMELESS_FUNCIONARIO
--INSERT INTO TIMELESS_FUNCIONARIO (idFuncionario, nome, apelido, contacto, email, sexo, dataNascimento)
--VALUES
--    (1, 'John', 'Doe', '123456789', 'john.doe@example.com', 'Masculino', '1990-01-01'),
--    (2, 'Jane', 'Smith', '987654321', 'jane.smith@example.com', 'Feminino', '1990-02-02'),
--    (3, 'Michael', 'Johnson', '555555555', 'michael.johnson@example.com', 'Masculino', '1990-03-03'),
--    (4, 'Emily', 'Brown', '999999999', 'emily.brown@example.com', 'Feminino', '1990-04-04'),
--    (5, 'Robert', 'Miller', '111111111', 'robert.miller@example.com', 'Masculino', '1990-05-05'),
--    (6, 'Olivia', 'Davis', '444444444', 'olivia.davis@example.com', 'Feminino', '1990-06-06'),
--    (7, 'William', 'Wilson', '777777777', 'william.wilson@example.com', 'Masculino', '1990-07-07'),
--    (8, 'Sophia', 'Moore', '222222222', 'sophia.moore@example.com', 'Feminino', '1990-08-08'),
--    (9, 'David', 'Taylor', '888888888', 'david.taylor@example.com', 'Masculino', '1990-09-09'),
--    (10, 'Isabella', 'Anderson', '333333333', 'isabella.anderson@example.com', 'Feminino', '1990-10-10');


---- Inserir valores na tabela TIMELESS_EPISODIO
--INSERT INTO TIMELESS_EPISODIO (sinopse, idprograma, titulo, numero, temporada, duracao, datadelancamento)
--VALUES
--('A team of time travelers fight to save history from being altered', 1, 'The Beginning', 1, 1, 45, '2023-01-01'),
--('The Time Travelers Face a Powerful Enemy That Seeks to Destroy the Past', 1, 'The Unknown Enemy', 2, 1, 40, '2023-01-08'),
--('The team tries to correct a change in WWII that could change the course of history', 1, 'Operation Overlord', 3, 1, 50, '2023-01-15'),
--('Travelers Arrive in Ancient Rome and Become Embroiled in a Deadly Conspiracy', 1, 'Intrigues in Rome', 4, 1, 55, '2023-01-22'),
--('A leap into the future reveals a post-apocalyptic world and a battle for survival', 1, 'The Last Refuge', 5, 1, 60, '2023-01-29');


------ Inserir valores na tabela TIMELESS_EPISODIO
--INSERT INTO TIMELESS_AVALIACAO (idavaliacao, userContaQueAvaliou, data, classificacao, idConta, idprograma)
--VALUES
--    (1, 'João', '2023-05-01', 5, 1, 1),
--    (2, 'Maria', '2023-05-02', 4, 2, 1),
--    (3, 'Pedro', '2023-05-03', 3, 3, 2),
--    (4, 'Ana', '2023-05-04', 2, 1, 2),
--    (5, 'Carlos', '2023-05-05', 1, 2, 3);

------ Inserir valores na tabela TIMELESS_CONTA

INSERT INTO TIMELESS_CONTA (idconta, nome, apelido, datadeNascimento, email, password, progsFavoritos, tipoSubscricao, idFuncionario)
VALUES
    (1, 'João Silva', 'Jota', '1990-01-15', 'joao.silva@example.com', 'senha123', '1,2,3', 'Premium', 1),
    (2, 'Maria Santos', 'Mary', '1985-05-20', 'maria.santos@example.com', 'abc456', '4,5', 'Free', 2),
    (3, 'Pedro Almeida', 'Pepe', '1998-12-02', 'pedro.almeida@example.com', 'qwerty', '2,3', 'Premium', 3),
    (4, 'Ana Costa', 'Aninha', '1992-07-10', 'ana.costa@example.com', 'senha456', '1,4', 'Free', 4),
    (5, 'Carlos Oliveira', 'Carlinhos', '1995-03-28', 'carlos.oliveira@example.com', 'abc123', '3,5', 'Premium', 5);

INSERT INTO TIMELESS_SUBSCRICAO (tiposubscricao, valorMensalidade, idConta)
VALUES
    ('Premium', 20, 1),
    ('Free', 10, 2),
    ('Premium', 20, 3),
    ('Free', 10, 4),
    ('Premium', 20, 5);
