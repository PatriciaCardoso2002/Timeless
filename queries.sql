SELECT *
FROM ProgramasPopulares
ORDER BY media_avaliacao DESC;



-- SELECT *
-- FROM EpisodiosDoPrograma;

-- SELECT *
-- FROM EpisodiosDoPrograma
-- WHERE idprograma = <id_do_programa>;



--Para usar a udf numa consulta:
 --DECLARE @idFuncionario INT;
 --SET @idFuncionario = 2; -- Substitua 123 pelo ID do funcionário desejado

 --SELECT *
 --FROM dbo.ObterTodasParceriasNegociadasFuncionario(@idFuncionario);



--Aplicar a udf a uma consulta:
 --DECLARE @idConta INT;
 --SET @idConta = 9; -- Substitua 123 pelo ID da conta desejada

 --SELECT dbo.ObterSubscricaoAssociadaConta(@idConta) AS TipoSubscricao;