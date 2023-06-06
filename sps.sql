CREATE PROCEDURE GetProgramSoundtracks
    @programId INT
AS
BEGIN
    SELECT
        TM.*
    FROM
        TIMELESS_MUSICA TM
    INNER JOIN
        TIMELESS_SOUNDTRACKTEM TST ON TM.idMusica = TST.idMusica
    INNER JOIN
        TIMELESS_SOUNDTRACK TS ON TST.codigoSoundTrack = TS.codigoSoundTrack
    WHERE
        TS.idPrograma = @programId;
END

-- Para usar a SP:
EXEC GetProgramSoundtracks @programId = 1;