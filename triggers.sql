--Trigger para calcular a média de avaliações de um programa:
--Ao receber uma nova avaliação para um programa, esse trigger pode ser acionado para calcular automaticamente
--a média das avaliações atribuídas ao programa, atualizando assim o valor da classificação média.

--Precisamos de criar uma coluna ClassificacaoMedia na tabela TIMELESS_PROGRAMA

-- Adicionar a coluna classificacaoMedia à tabela TIMELESS_PROGRAMA
--ALTER TABLE TIMELESS_PROGRAMA
--ADD classificacaoMedia FLOAT;

-- Trigger para calcular a média das avaliações de um programa
--CREATE TRIGGER calcularMediaAvaliacoes
--ON TIMELESS_CONTA_AVALIACAO
--AFTER INSERT, UPDATE, DELETE
--AS
--BEGIN
--    -- Variável para armazenar a média das avaliações
--    DECLARE @media FLOAT;

--    -- Atualizar a tabela TIMELESS_PROGRAMA com a média das avaliações
--    UPDATE p
--    SET p.classificacaoMedia = a.media
--    FROM TIMELESS_PROGRAMA p
--    INNER JOIN (
--        -- Subconsulta para calcular a média das avaliações
--        SELECT idprograma, AVG(av.classificacao) AS media
--        FROM TIMELESS_CONTA_AVALIACAO ca
--        INNER JOIN TIMELESS_AVALIACAO av ON ca.idAvaliacao = av.idavaliacao
--        GROUP BY idprograma
--    ) a ON p.idprograma = a.idprograma;

--END;


--Verificacao do funcionamento do trigger
--INSERT INTO TIMELESS_CONTA_AVALIACAO ([idConta], [idAvaliacao])
--VALUES (2,6);

--SELECT * FROM TIMELESS_PROGRAMA;
--SELECT * FROM TIMELESS_AVALIACAO;
--SELECT * FROM TIMELESS_CONTA_AVALIACAO;





--Após a criação do trigger, sempre que uma nova avaliação for inserida na tabela TIMELESS_AVALIACAO, 
--o trigger calculará a média das classificações para o programa correspondente e atualizará a coluna classificacaoMedia
--na tabela TIMELESS_PROGRAMA com o valor calculado.


--Trigger para atualizar a quantidade de programas num país:
--Quando um programa é associado a um novo país de exibição, esse trigger pode ser acionado para atualizar automaticamente a contagem de programas disponíveis nesse país.

--Preciso de uma nova coluna na tabela TIMELESS_ALLOWEDIN chamada quantidadeProgramas para armazenar a quantidade de programas exibida em um determinado país
--ALTER TABLE TIMELESS_ALLOWEDIN ADD quantidadeProgramas INT;

------Criação do Trigger
--CREATE TRIGGER atualizarQuantidadeProgramas
--ON TIMELESS_ALLOWEDIN
----posso colocar também depois de fazer o update ou depois de fazer o delete 
--AFTER INSERT 
--AS
--BEGIN
--    -- Obtém o código do país inserido
--    DECLARE @codigo_pais INT;
    
--    SELECT @codigo_pais = codigoPaisID FROM inserted;
    
--    -- Atualiza a quantidade de programas para o país inserido
--    UPDATE TIMELESS_ALLOWEDIN
--    SET quantidadeProgramas = (
--        SELECT COUNT(*)
--        FROM TIMELESS_ALLOWEDIN
--        WHERE codigoPaisID = @codigo_pais
--    )
--    WHERE codigoPaisID = @codigo_pais;
--END;

--Verificação do funcionamento do trigger 
--SELECT * FROM TIMELESS_ALLOWEDIN;
--INSERT INTO TIMELESS_ALLOWEDIN(codigoPaisID,idPrograma)
--VALUES (1,2);
----Outro teste
--INSERT INTO TIMELESS_ALLOWEDIN(codigoPaisID,idPrograma)
--VALUES(2,4);


--SELECT * FROM TIMELESS_ALLOWEDIN;
--SELECT * FROM TIMELESS_PROGRAMA;

--Ou seja
--Quando há uma nova inserção na tabela TIMELESS_ALLOWEDIN, o trigger é acionado e obtém o código do país e o id do programa inserido e 
--atualiza a coluna quantidadeProgramas na tabela TIMELESS_ALLOWEDIN com o número de programas 
--disponíveis nesse país

--Trigger para enviar lembretes de pagamento:
---- Fazer uma simulação do envio de um email para o campo [email] na entidade TIMELESS_CONTA quando o campo [dataPagamento] na entidade TIMELESS_PAGAMENTO
---- estiver a 7 dias ou menos de distância da data atual.

--Duas formas de implementar isto seria enviar um email à pessoa lembrando-a da data de pagamento, no entanto os emails que tenho na base de dados 
--não são reais, então a alternativa que me parece mais correta é criar uma tabela chamada TIMELESS_LEMBRETES. Não é possível criar a entidade TIMELESS_LEMBRETES
--porque ela ia estar relacionada com a entidade TIMELESS_PAGAMENTO que é uma entidade fraca. Então vamos fazer uma simulação de envio de um email.

----Criar trigger
--CREATE TRIGGER enviarLembrete 
--ON TIMELESS_PAGAMENTO
--AFTER INSERT, UPDATE
--AS
--BEGIN
--    -- Verificar se houve alterações na data de pagamento ou se é uma inserção
--    IF EXISTS (SELECT 1 FROM inserted) 
--    BEGIN
--        -- Verificar as contas que têm data de pagamento em 7 dias ou menos
--        DECLARE @DataAtual date;
--        SET @DataAtual = GETDATE();
--        DECLARE @DataLembrete date;
--        SET @DataLembrete = DATEADD(DAY, -7, @DataAtual);

--        -- Obter os registos que atendem à condição
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

--            -- Exibir o conteúdo do email no resultado da consulta
--            PRINT 'Assunto: ' + @Assunto;
--            PRINT 'Destinatário: ' + @EmailCliente;
--            PRINT @CorpoEmail;

--            -- Remover o registro processado da tabela temporária
--            DELETE FROM #TempRegistos WHERE email = @EmailCliente AND dataPagamento = @DataPagamento;
--        END;

--        -- Limpar a tabela temporária
--        DROP TABLE #TempRegistos;
--    END
--END;

--Testar o trigger
--SELECT * FROM TIMELESS_PAGAMENTO;
--SELECT * FROM TIMELESS_CONTA;
--INSERT INTO TIMELESS_PAGAMENTO (idCliente, valorPago, dataPagamento, metodoId)
--VALUES (5, 100, '2023-05-31', 1);

--SELECT * FROM TIMELESS_CONTA_PROGRAMA;    ---teste dos inserts através do windowsForms