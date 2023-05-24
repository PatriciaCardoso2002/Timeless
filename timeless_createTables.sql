--CREATE DATABASE timeless 
--COLLATE SQL_Latin1_GENERAL_CP1_CI_AI
--GO

--USE P10G3 
--GO

--CREATE TABLE TIMELESS_PROGRAMA(
--	[idprograma][int] NOT NULL PRIMARY KEY,
--	[titulo][varchar](256) NOT NULL, 
--	[anolancamento][date] NOT NULL,
--	[diretor][varchar](256) NOT NULL, 
--	[elenco][varchar](1024) NOT NULL, 
--	[sinopse][varchar](1024) NOT NULL,
--	[duracao][int] NOT NULL, 
--	[idempresa][int] NOT NULL,
--)
--GO

--ALTER TABLE TIMELESS_PROGRAMA ADD FOREIGN KEY ([idempresa]) REFERENCES TIMELESS_PARCERIA([idEmpresa]);

--CREATE TABLE TIMELESS_EPISODIO(
--	[sinopse][varchar](1024),
--	[idprograma][int] NOT NULL, 
--	[titulo][varchar](128) NOT NULL,
--	[numero][int] NOT NULL,
--	[temporada][int] NOT NULL, 
--	[duracao][int] NOT NULL, 
--	[datadelancamento][date] NOT NULL, 
--	PRIMARY KEY ([sinopse],[idprograma]),
--)
--GO 

--ALTER TABLE TIMELESS_EPISODIO ADD FOREIGN KEY ([idprograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);


--CREATE TABLE TIMELESS_AVALIACAO(
--	[idavaliacao][int] NOT NULL PRIMARY KEY,
--	[userContaQueAvaliou][varchar](1024) NOT NULL,
--	[data][date] NOT NULL, 
--	[classificacao][int] NOT NULL,
--	[idConta][int] NOT NULL,
--	[idprograma][int] NOT NULL,
--)
--GO

--ALTER TABLE TIMELESS_AVALIACAO ADD FOREIGN KEY ([idConta]) REFERENCES TIMELESS_CONTA([idconta]);
--ALTER TABLE TIMELESS_AVALIACAO ADD FOREIGN KEY ([idprograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);X


--CREATE TABLE TIMELESS_CONTA(
--	[idconta][int] NOT NULL PRIMARY KEY, 
--	[nome][varchar](256) NOT NULL,
--	[apelido][varchar](256) NOT NULL,
--	[datadeNascimento][date] NOT NULL,
--	[email][varchar](64) NOT NULL,
--	[password][varchar](64) NOT NULL,
--	[progsFavoritos][varchar](1024),
--	[tipoSubscricao][varchar](128) NOT NULL, 
--	[idFuncionario][int] NOT NULL,
--)
--GO
--ALTER TABLE TIMELESS_SUBSCRICAO ADD UNIQUE ([tiposubscricao]);
--ALTER TABLE TIMELESS_CONTA ADD FOREIGN KEY ([tipoSubscricao]) REFERENCES TIMELESS_SUBSCRICAO([tiposubscricao]); 
--ALTER TABLE TIMELESS_CONTA ADD FOREIGN KEY ([idFuncionario]) REFERENCES TIMELESS_FUNCIONARIO([idFuncionario]);


--CREATE TABLE TIMELESS_SUBSCRICAO(
--	[tiposubscricao][varchar](128) NOT NULL,
--	[valorMensalidade][int] NOT NULL,
--	[idConta][int] NOT NULL,
--	PRIMARY KEY ([tiposubscricao],[idConta]),
--)
--GO
--ALTER TABLE TIMELESS_SUBSCRICAO ADD FOREIGN KEY ([idConta]) REFERENCES TIMELESS_CONTA([idconta]);


--CREATE TABLE TIMELESS_PAGAMENTO(
--	[clienteId][int] NOT NULL PRIMARY KEY,
--	[valorPago][int] NOT NULL,
--	[dataPagamento][date] NOT NULL,
--)
--GO	

--ALTER TABLE TIMELESS_PAGAMENTO ADD FOREIGN KEY ([clienteId]) REFERENCES TIMELESS_CONTA([idconta]);

--CREATE TABLE TIMELESS_METODOPAGAMENTO(
--	[metodoPagamento][varchar](256) NOT NULL PRIMARY KEY,
--)
--GO

--CREATE TABLE TIMELESS_PAISES(
--	[codigoPaisID][int] NOT NULL PRIMARY KEY,
--	[nome][varchar](128) NOT NULL,
--	[lingua][varchar](128) NOT NULL,
--	[moeda][varchar](64) NOT NULL,
--)
--GO

--CREATE TABLE TIMELESS_SOUNDTRACK(
--	[codigoSoundTrack][int] NOT NULL,
--	[idMusica][int] NOT NULL,
--	[idPrograma][int] NOT NULL,
--	PRIMARY KEY ([codigoSoundTrack],[idMusica]),
--)
--GO

--ALTER TABLE TIMELESS_SOUNDTRACK ADD FOREIGN KEY ([idPrograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);
--ALTER TABLE TIMELESS_SOUNDTRACK ADD FOREIGN KEY ([idMusica]) REFERENCES TIMELESS_MUSICA([idMusica]);



--CREATE TABLE TIMELESS_MUSICA(
--	[idMusica][int] NOT NULL PRIMARY KEY,
--	[titulo][varchar](128) NOT NULL,
--	[artista][varchar](64) NOT NULL,
--	[compositor][varchar](128) NOT NULL,
--	[gravadora][varchar](128) NOT NULL,
--)
--GO


--CREATE TABLE TIMELESS_IDIOMAS(
--	[ingles][varchar](16) NOT NULL,
--	[portugues][varchar](64) NOT NULL,
--	[espanhol][varchar](64) NOT NULL,
--	[italiano][varchar](64) NOT NULL,
--	[mandarim][varchar](64) NOT NULL,
--	[frances][varchar](64) NOT NULL,
--	[alemao][varchar](64) NOT NULL,
--	[idprograma][int] NOT NULL,
--	PRIMARY KEY ([ingles],[idprograma]),

--)
--GO

--ALTER TABLE TIMELESS_IDIOMAS ADD FOREIGN KEY ([idprograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);

--CREATE TABLE TIMELESS_FUNCIONARIO(
--	[idFuncionario][int] NOT NULL PRIMARY KEY,
--	[nome][varchar](128) NOT NULL,
--	[apelido][varchar](128) NOT NULL,
--	[contacto][varchar](64) NOT NULL,
--	[email][varchar](128) NOT NULL,
--	[sexo][varchar](16) NOT NULL,
--	[dataNascimento][date] NOT NULL,

--)
--GO

--CREATE TABLE TIMELESS_PARCERIA(
--	[idEmpresa][int] NOT NULL PRIMARY KEY,
--	[nome][varchar](128) NOT NULL, 
--	[tipoNegocio][varchar](64) NOT NULL,
--	[contactoEmpresa][int] NOT NULL,
--	[localizacao][varchar](128) NOT NULL,
--	[idFuncionario][int] NOT NULL,
--)
--GO

--ALTER TABLE TIMELESS_PARCERIA ADD FOREIGN KEY ([idFuncionario]) REFERENCES TIMELESS_FUNCIONARIO([idFuncionario]);

--CREATE TABLE TIMELESS_EXIBIDOEM(
--	[ingles][varchar](16) NOT NULL,
--	[idPrograma][int] NOT NULL,
--	PRIMARY KEY ([ingles],[idPrograma]),
--)
--GO
--ALTER TABLE TIMELESS_IDIOMAS ADD UNIQUE ([ingles]);
--ALTER TABLE TIMELESS_EXIBIDOEM ADD UNIQUE ([ingles]);
--ALTER TABLE TIMELESS_EXIBIDOEM ADD FOREIGN KEY ([ingles]) REFERENCES TIMELESS_IDIOMAS([ingles]); 
--ALTER TABLE TIMELESS_EXIBIDOEM ADD FOREIGN KEY ([idPrograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);

--CREATE TABLE TIMELESS_ALLOWEDIN(
--	[codigoPaisID][int] NOT NULL,
--	[idPrograma][int] NOT NULL,
--	PRIMARY KEY ([codigoPaisID],[idPrograma]),
--)
--GO

--ALTER TABLE TIMELESS_ALLOWEDIN ADD FOREIGN KEY ([idPrograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);

--CREATE TABLE TIMELESS_SOUNDTRACKTEM(
--	[idMusica][int] NOT NULL,
--	[codigoSoundTrack][int] NOT NULL,
--	PRIMARY KEY ([idMusica],[codigoSoundTrack]),
--)
--GO
--ALTER TABLE TIMELESS_SOUNDTRACK ADD UNIQUE ([codigoSoundTrack]);
--ALTER TABLE TIMELESS_SOUNDTRACKTEM ADD FOREIGN KEY ([idMusica]) REFERENCES TIMELESS_MUSICA([idMusica]);
--ALTER TABLE TIMELESS_SOUNDTRACKTEM ADD FOREIGN KEY ([codigoSoundTrack]) REFERENCES TIMELESS_SOUNDTRACK([codigoSoundTrack]);



