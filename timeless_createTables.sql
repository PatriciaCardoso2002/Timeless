--CREATE DATABASE timeless 
--COLLATE SQL_Latin1_GENERAL_CP1_CI_AI
--GO

--USE p10g3
--GO

CREATE TABLE TIMELESS_MUSICA(
	[idMusica][int] NOT NULL PRIMARY KEY,
	[titulo][varchar](128) NOT NULL,
	[artista][varchar](64) NOT NULL,
	[compositor][varchar](128) NOT NULL,
	[gravadora][varchar](128) NOT NULL,
)
GO

CREATE TABLE TIMELESS_FUNCIONARIO(
	[idFuncionario][int] NOT NULL PRIMARY KEY,
	[nome][varchar](128) NOT NULL,
	[apelido][varchar](128) NOT NULL,
	[contacto][varchar](64) NOT NULL,
	[email][varchar](128) NOT NULL,
	[sexo][varchar](1) check (sexo = 'M' OR sexo = 'F'),
	[dataNascimento][date] NOT NULL,

)
GO
CREATE TABLE TIMELESS_PARCERIA(
	[idEmpresa][int] NOT NULL PRIMARY KEY,
	[nome][varchar](128) NOT NULL, 
	[tipoNegocio][varchar](64) NOT NULL,
	[contactoEmpresa][int] NOT NULL,
	[localizacao][varchar](128) NOT NULL,
	[idFuncionario][int] NOT NULL,
)
GO

CREATE TABLE TIMELESS_PROGRAMA (
    [idprograma] INT NOT NULL PRIMARY KEY,
    [titulo] VARCHAR(256) NOT NULL,
    [anolancamento] DATE NOT NULL,
    [diretor] VARCHAR(256) NOT NULL,
    [elenco] VARCHAR(1024) NOT NULL,
    [sinopse] VARCHAR(1024) NOT NULL,
    [duracao] INT CHECK (duracao > 0),
    [idempresa] INT NOT NULL,
);

CREATE TABLE TIMELESS_EPISODIO(
	[sinopse][varchar](1024),
	[idprograma][int] NOT NULL, 
	[titulo][varchar](128) NOT NULL,
	[numero][int] NOT NULL,
	[temporada][int] NOT NULL, 
	[duracao][int] NOT NULL, 
	[datadelancamento][date] NOT NULL, 
	PRIMARY KEY ([sinopse],[idprograma]),
)
GO 

CREATE TABLE TIMELESS_PAISES(
	[codigoPaisID][int] NOT NULL PRIMARY KEY,
	[nome][varchar](128) NOT NULL,
	[lingua][varchar](128) NOT NULL,
	[moeda][varchar](64) NOT NULL,
)
GO

CREATE TABLE TIMELESS_SOUNDTRACK(
	[codigoSoundTrack][int] NOT NULL,
	[idMusica][int] NOT NULL,
	[idPrograma][int] NOT NULL,
	PRIMARY KEY ([codigoSoundTrack],[idMusica]),
)
GO


CREATE TABLE TIMELESS_CONTA (
    [idConta] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [nome] VARCHAR(256) NOT NULL,
    [apelido] VARCHAR(256) NOT NULL,
    [datadeNascimento] DATE NOT NULL,
    [email] VARCHAR(64) NOT NULL,
    [palPasse] VARCHAR(64) NOT NULL,
    [progsFavoritos] VARCHAR(1024),
    [idFuncionario] INT NOT NULL,
);


CREATE TABLE TIMELESS_METODOPAGAMENTO(
	[id][int] IDENTITY (1,1) PRIMARY KEY,
	[descricao][varchar](256) NOT NULL,
)
GO

CREATE TABLE TIMELESS_PAGAMENTO(
	[idCliente][int] NOT NULL,
	[valorPago][int] NOT NULL,
	[dataPagamento][date] NOT NULL,
	[metodoId][int] NOT NULL,
	PRIMARY KEY ([idCliente],[dataPagamento]),
)
GO	

CREATE TABLE TIMELESS_SUBSCRICAO(
	[tiposubscricao][varchar](128) NOT NULL,
	[valorMensalidade][int] NOT NULL,
	[idConta][int] IDENTITY(1,1) NOT NULL,
	PRIMARY KEY ([tiposubscricao],[idConta]),
)
GO

CREATE TABLE TIMELESS_AVALIACAO (
    [idavaliacao] INT NOT NULL PRIMARY KEY,
    [userContaQueAvaliou] VARCHAR(1024) NOT NULL,
    [data] DATE NOT NULL,
    [classificacao] INT NOT NULL,
    [idprograma] INT NOT NULL,
);


CREATE TABLE TIMELESS_ALLOWEDIN(
	[codigoPaisID][int] NOT NULL,
	[idPrograma][int] NOT NULL,
	PRIMARY KEY ([codigoPaisID],[idPrograma]),
)
GO

CREATE TABLE TIMELESS_SOUNDTRACKTEM(
	[idMusica][int] NOT NULL,
	[codigoSoundTrack][int] NOT NULL,
	PRIMARY KEY ([idMusica],[codigoSoundTrack]),
)
GO


CREATE TABLE TIMELESS_CONTA_AVALIACAO (
    [idConta] INT NOT NULL,
    [idAvaliacao] INT NOT NULL,
    PRIMARY KEY ([idConta], [idAvaliacao]),
);

CREATE TABLE TIMELESS_CONTA_PROGRAMA(
	[idConta][int] NOT NULL,
	[idPrograma][int] NOT NULL,
	PRIMARY KEY ([idConta],[idPrograma]),
);

ALTER TABLE TIMELESS_PARCERIA ADD FOREIGN KEY ([idFuncionario]) REFERENCES TIMELESS_FUNCIONARIO([idFuncionario]);

ALTER TABLE TIMELESS_PROGRAMA ADD FOREIGN KEY ([idempresa]) REFERENCES TIMELESS_PARCERIA([idEmpresa]);

ALTER TABLE TIMELESS_EPISODIO ADD FOREIGN KEY ([idprograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);

ALTER TABLE TIMELESS_SOUNDTRACK ADD FOREIGN KEY ([idPrograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);
ALTER TABLE TIMELESS_SOUNDTRACK ADD FOREIGN KEY ([idMusica]) REFERENCES TIMELESS_MUSICA([idMusica]);


ALTER TABLE TIMELESS_CONTA ADD FOREIGN KEY ([idFuncionario]) REFERENCES TIMELESS_FUNCIONARIO([idFuncionario]);

ALTER TABLE TIMELESS_PAGAMENTO ADD FOREIGN KEY ([idCliente]) REFERENCES TIMELESS_CONTA([idconta]);
ALTER TABLE TIMELESS_PAGAMENTO ADD FOREIGN KEY ([metodoId]) REFERENCES TIMELESS_METODOPAGAMENTO([id]);

ALTER TABLE TIMELESS_SUBSCRICAO ADD FOREIGN KEY ([idConta]) REFERENCES TIMELESS_CONTA([idconta]);

ALTER TABLE TIMELESS_AVALIACAO ADD FOREIGN KEY ([idprograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);

ALTER TABLE TIMELESS_ALLOWEDIN ADD FOREIGN KEY ([idPrograma]) REFERENCES TIMELESS_PROGRAMA([idprograma]);


ALTER TABLE TIMELESS_SOUNDTRACK ADD UNIQUE ([codigoSoundTrack]);
ALTER TABLE TIMELESS_SOUNDTRACKTEM ADD FOREIGN KEY ([idMusica]) REFERENCES TIMELESS_MUSICA([idMusica]);
ALTER TABLE TIMELESS_SOUNDTRACKTEM ADD FOREIGN KEY ([codigoSoundTrack]) REFERENCES TIMELESS_SOUNDTRACK([codigoSoundTrack]);


ALTER TABLE TIMELESS_CONTA_AVALIACAO ADD FOREIGN KEY ([idConta]) REFERENCES TIMELESS_CONTA ([idConta]);
ALTER TABLE TIMELESS_CONTA_AVALIACAO ADD FOREIGN KEY ([idAvaliacao]) REFERENCES TIMELESS_AVALIACAO ([idavaliacao]);


ALTER TABLE TIMELESS_CONTA_PROGRAMA ADD FOREIGN KEY ([idConta]) REFERENCES TIMELESS_CONTA([idConta])
ALTER TABLE TIMELESS_CONTA_PROGRAMA ADD FOREIGN KEY ([idPrograma]) REFERENCES TIMELESS_PROGRAMA([idprograma])