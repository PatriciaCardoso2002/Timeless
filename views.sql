-- Visualização dos programas mais populares ou melhor avaliados:

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

-- Depois de criar a view, você pode consultar a view e aplicar a cláusula ORDER BY na consulta:

-- SELECT *
-- FROM ProgramasPopulares
-- ORDER BY media_avaliacao DESC;





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



