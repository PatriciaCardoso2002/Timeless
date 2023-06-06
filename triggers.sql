--Trigger para calcular a m�dia de avalia��es de um programa:
--Ao receber uma nova avalia��o para um programa, esse trigger pode ser acionado para calcular automaticamente
--a m�dia das avalia��es atribu�das ao programa, atualizando assim o valor da classifica��o m�dia.

--Precisamos de criar uma coluna ClassificacaoMedia na tabela TIMELESS_PROGRAMA

---- Adicionar a coluna classificacaoMedia � tabela TIMELESS_PROGRAMA
--ALTER TABLE TIMELESS_PROGRAMA
--ADD classificacaoMedia FLOAT;

-- --Trigger para calcular a m�dia das avalia��es de um programa
--CREATE TRIGGER calcularMediaAvaliacoes
--ON TIMELESS_CONTA_AVALIACAO
--AFTER INSERT, UPDATE, DELETE
--AS
--BEGIN
--    -- Vari�vel para armazenar a m�dia das avalia��es
--    DECLARE @media FLOAT;

--    -- Atualizar a tabela TIMELESS_PROGRAMA com a m�dia das avalia��es
--    UPDATE p
--    SET p.classificacaoMedia = a.media
--    FROM TIMELESS_PROGRAMA p
--    INNER JOIN (
--        -- Subconsulta para calcular a m�dia das avalia��es
--        SELECT idprograma, AVG(av.classificacao) AS media
--        FROM TIMELESS_CONTA_AVALIACAO ca
--        INNER JOIN TIMELESS_AVALIACAO av ON ca.idAvaliacao = av.idavaliacao
--        GROUP BY idprograma
--    ) a ON p.idprograma = a.idprograma;

--END;


----Verificacao do funcionamento do trigger
--INSERT INTO TIMELESS_CONTA_AVALIACAO ([idConta], [idAvaliacao])
--VALUES (4,8);

--SELECT * FROM TIMELESS_PROGRAMA;

--Ap�s a cria��o do trigger, sempre que uma nova avalia��o for inserida na tabela TIMELESS_AVALIACAO, 
--o trigger calcular� a m�dia das classifica��es para o programa correspondente e atualizar� a coluna classificacaoMedia
--na tabela TIMELESS_PROGRAMA com o valor calculado.


--Trigger para atualizar a quantidade de programas num pa�s:
--Quando um programa � associado a um novo pa�s de exibi��o, esse trigger pode ser acionado para atualizar automaticamente a contagem de programas dispon�veis nesse pa�s.

--Preciso de uma nova coluna na tabela TIMELESS_ALLOWEDIN chamada quantidadeProgramas para armazenar a quantidade de programas exibida em um determinado pa�s
--ALTER TABLE TIMELESS_ALLOWEDIN ADD quantidadeProgramas INT;

------Cria��o do Trigger
--CREATE TRIGGER atualizarQuantidadeProgramas
--ON TIMELESS_ALLOWEDIN
----posso colocar tamb�m depois de fazer o update ou depois de fazer o delete 
--AFTER INSERT 
--AS
--BEGIN
--    -- Obt�m o c�digo do pa�s inserido
--    DECLARE @codigo_pais INT;
    
--    SELECT @codigo_pais = codigoPaisID FROM inserted;
    
--    -- Atualiza a quantidade de programas para o pa�s inserido
--    UPDATE TIMELESS_ALLOWEDIN
--    SET quantidadeProgramas = (
--        SELECT COUNT(*)
--        FROM TIMELESS_ALLOWEDIN
--        WHERE codigoPaisID = @codigo_pais
--    )
--    WHERE codigoPaisID = @codigo_pais;
--END;

--Verifica��o do funcionamento do trigger 
--SELECT * FROM TIMELESS_ALLOWEDIN;
--INSERT INTO TIMELESS_ALLOWEDIN(codigoPaisID,idPrograma)
--VALUES (1,2);
----Outro teste
--INSERT INTO TIMELESS_ALLOWEDIN(codigoPaisID,idPrograma)
--VALUES(2,4);


--INSERT INTO TIMELESS_ALLOWEDIN(codigoPaisID,idPrograma)
--VALUES(6,4);

--SELECT * FROM TIMELESS_ALLOWEDIN;
---SELECT * FROM TIMELESS_PROGRAMA;

--Ou seja
--Quando h� uma nova inser��o na tabela TIMELESS_ALLOWEDIN, o trigger � acionado e obt�m o c�digo do pa�s e o id do programa inserido e 
--atualiza a coluna quantidadeProgramas na tabela TIMELESS_ALLOWEDIN com o n�mero de programas 
--dispon�veis nesse pa�s

--Trigger para enviar lembretes de pagamento:
---- Fazer uma simula��o do envio de um email para o campo [email] na entidade TIMELESS_CONTA quando o campo [dataPagamento] na entidade TIMELESS_PAGAMENTO
---- estiver a 7 dias ou menos de dist�ncia da data atual.

--Duas formas de implementar isto seria enviar um email � pessoa lembrando-a da data de pagamento, no entanto os emails que tenho na base de dados 
--n�o s�o reais, ent�o a alternativa que me parece mais correta � criar uma tabela chamada TIMELESS_LEMBRETES. N�o � poss�vel criar a entidade TIMELESS_LEMBRETES
--porque ela ia estar relacionada com a entidade TIMELESS_PAGAMENTO que � uma entidade fraca. Ent�o vamos fazer uma simula��o de envio de um email.

----Criar trigger
--CREATE TRIGGER enviarLembrete 
--ON TIMELESS_PAGAMENTO
--AFTER INSERT, UPDATE
--AS
--BEGIN
--    -- Verificar se houve altera��es na data de pagamento ou se � uma inser��o
--    IF EXISTS (SELECT 1 FROM inserted) 
--    BEGIN
--        -- Verificar as contas que t�m data de pagamento em 7 dias ou menos
--        DECLARE @DataAtual date;
--        SET @DataAtual = GETDATE();
--        DECLARE @DataLembrete date;
--        SET @DataLembrete = DATEADD(DAY, -7, @DataAtual);

--        -- Obter os registos que atendem � condi��o
--        SELECT c.email, p.dataPagamento
--        INTO #TempRegistos
--        FROM TIMELESS_CONTA c
--        INNER JOIN TIMELESS_PAGAMENTO p ON c.idConta = p.idCliente
--        INNER JOIN inserted i ON p.idCliente = i.idCliente
--        WHERE p.dataPagamento <= @DataLembrete;

--        -- Enviar emails para os registos encontrados
--        DECLARE @EmailCliente varchar(64);
--        DECLARE @DataPagamento date;

--        WHILE EXISTS (SELECT 1 FROM #TempRegistos)
--        BEGIN
--            SELECT TOP 1 @EmailCliente = email, @DataPagamento = dataPagamento FROM #TempRegistos;

--            --Email
--            DECLARE @Assunto varchar(100) = 'Lembrete de pagamento';
--            DECLARE @CorpoEmail varchar(max) = 'Caro(a) cliente,' + CHAR(13) + CHAR(10) +
--                'Por favor, certifique-se de efetuar o pagamento.' + CHAR(13) + CHAR(10) +
--                'Atenciosamente,' + CHAR(13) + CHAR(10) +
--                'Timeless';

--            -- Exibir o conte�do do email no resultado da consulta
--            PRINT 'Assunto: ' + @Assunto;
--            PRINT 'Destinat�rio: ' + @EmailCliente;
--            PRINT @CorpoEmail;

--            -- Remover o registro processado da tabela tempor�ria
--            DELETE FROM #TempRegistos WHERE email = @EmailCliente AND dataPagamento = @DataPagamento;
--        END;

--        -- Limpar a tabela tempor�ria
--        DROP TABLE #TempRegistos;
--    END
--END;

--Testar o trigger
--SELECT * FROM TIMELESS_PAGAMENTO;
--SELECT * FROM TIMELESS_CONTA;
--INSERT INTO TIMELESS_PAGAMENTO (idCliente, valorPago, dataPagamento, metodoId)
--VALUES (5, 100, '2023-05-31', 1);

SELECT * FROM TIMELESS_FUNCIONARIO;
SELECT * FROM TIMELESS_CONTA;