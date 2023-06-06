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

 --Queries que realizamos ao implementar o forms: 
--  SELECT c.nome FROM TIMELESS_CONTA c " + "INNER JOIN TIMELESS_FUNCIONARIO f ON c.idFuncionario = f.idFuncionario " + "WHERE f.idFuncionario = @idFuncionario;
 
--  SELECT titulo FROM TIMELESS_EPISODIO;
 
--  INSERT INTO TIMELESS_PAGAMENTO (idCliente, valorPago, dataPagamento, metodoId) " + "VALUES (@idCliente, @valorPago, @dataPagamento, @metodoId);
 
--  SELECT tiposubscricao FROM TIMELESS_SUBSCRICAO;
 
--  SELECT codigoPaisID, nome FROM TIMELESS_PAISES;
 
--  SELECT p.titulo, p.anolancamento, p.diretor, p.elenco, p.sinopse, p.duracao " +"FROM TIMELESS_PROGRAMA p " +"INNER JOIN TIMELESS_ALLOWEDIN a ON p.idprograma = a.idPrograma " + "WHERE a.codigoPaisID = @codigoPaisID;


