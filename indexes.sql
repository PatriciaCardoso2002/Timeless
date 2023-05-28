-- Índices criados para melhorar a performance de certas consultas

 CREATE INDEX idx_IDCLIENTE_DATAPAGAMENTO ON TIMELESS_PAGAMENTO (idCliente, dataPagamento);

 CREATE INDEX idx_IDPROGRAMA_TEMPORADA ON TIMELESS_EPISODIO (idprograma, temporada);

CREATE INDEX idx_conta_programa ON TIMELESS_CONTA_PROGRAMA (idConta);
