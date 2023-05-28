-- UDF: ObterTodasParceriasNegociadasFuncionario

-- CREATE FUNCTION ObterTodasParceriasNegociadasFuncionario (@idFuncionario INT)
-- RETURNS TABLE
-- AS
-- RETURN
-- (
--     SELECT P.*
--     FROM TIMELESS_PARCERIA P
--     WHERE P.idFuncionario = @idFuncionario
-- );

--Para usar a udf numa consulta:
 --DECLARE @idFuncionario INT;
 --SET @idFuncionario = 2; -- Substitua 123 pelo ID do funcionário desejado

 --SELECT *
 --FROM dbo.ObterTodasParceriasNegociadasFuncionario(@idFuncionario);




-- UDF: ObterSubscricaoAssociadaConta

--CREATE FUNCTION ObterSubscricaoAssociadaConta (@idConta INT)
--RETURNS VARCHAR(128)
--AS
--BEGIN
--    DECLARE @subscricao VARCHAR(128);
--    SELECT @subscricao = tiposubscricao
--    FROM TIMELESS_SUBSCRICAO
--    WHERE idConta = @idConta;
--    RETURN @subscricao;
--END;


--Aplicar a udf a uma consulta:
 --DECLARE @idConta INT;
 --SET @idConta = 9; -- Substitua 123 pelo ID da conta desejada

 --SELECT dbo.ObterSubscricaoAssociadaConta(@idConta) AS TipoSubscricao;