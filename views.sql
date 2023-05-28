-- Visualização dos programas mais populares ou melhor avaliados:
-- Esta view pode ser criada com base nas avaliações dos utilizadores. 
-- Pode-se calcular a média das classificações para cada programa e classificar os programas com base nessa média.

--CREATE VIEW ProgramasPopulares AS
--SELECT
--    p.idprograma,
--    p.titulo,
--    p.anolancamento,
--    p.diretor,
--    p.elenco,
--    p.sinopse,
--    p.duracao,
--    AVG(a.classificacao) AS media_avaliacao
--FROM
--    TIMELESS_PROGRAMA p
--    LEFT JOIN TIMELESS_AVALIACAO a ON p.idprograma = a.idprograma
--GROUP BY
--    p.idprograma,
--    p.titulo,
--    p.anolancamento,
--    p.diretor,
--    p.elenco,
--    p.sinopse,
--    p.duracao;

-- Esta view retorna os programas ordenados pela média de classificação em ordem decrescente, mostrando os programas mais populares ou melhor avaliados.


-- Depois de criar a view, você pode consultar a view e aplicar a cláusula ORDER BY na consulta:

-- SELECT *
-- FROM ProgramasPopulares
-- ORDER BY media_avaliacao DESC;
-- Dessa forma, você poderá obter os programas ordenados pela média de classificação em ordem decrescente ao consultar a view ProgramasPopulares.





-- Visualização dos episódios de um programa:
-- Esta view pode ser criada com base na tabela TIMELESS_EPISODIO.

CREATE VIEW EpisodiosDoPrograma AS
SELECT
    e.sinopse,
    e.idprograma,
    e.titulo,
    e.numero,
    e.temporada,
    e.duracao,
    e.datadelancamento
FROM
    TIMELESS_EPISODIO e


--Para consltar:

--SELECT *
--FROM EpisodiosDoPrograma;


--SELECT *
--FROM EpisodiosDoPrograma
--WHERE idprograma = <id_do_programa>;

