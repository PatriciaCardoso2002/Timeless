# <t style="color:#0080ff">Gestão de uma plataforma de streaming</t>

# Projeto Base de Dados - **P10G3**
#  Timeless
## Gestão de uma empresa de streaming de desenhos animados/programas televisivos antigos

- Inês Nunes Santos - 103477
- Patrícia Rafela da Rocha Cardoso - 103243

## Análise de Requisitos

Esta base de dados tem como objetivo gerir uma empresa responsável por um serviço streaming de desenhos animados e programas televisivos a partir dos anos 80 que já não se encontram disponíveis atualmente para poderem ser visualizados nos guias de canais de televisão. 

Para além disto, é possível aceder a informações, como por exemplo: utilizadores, planos de subscrição, pagamentos e outros dados relevantes à plataforma. Também é possível realizar análises e consultas sobre o comportamento do utilizador e a popularidade de um determinado programa. Os programas televisivos/desenhos animados são de natureza nostálgica para muitas pessoas e podem ser difíceis de encontrar noutros serviços de streaming. Deste modo, uma das vantagens que esta base de dados traz consigo consistirá na preservação destes para o bem da cultura e da memória coletiva. 

Algumas das funcionalidades proporcionadas aos seus clientes por esta base de dados serão: 

- Pesquisar programas 

- Consultar episódios disponíveis, relativos a um programa 

- Fazer avaliações (pessoais) a programas 

- Gerir a conta e o plano de subscrição 

- Efetuar o pagamento da sua subscrição
 

<div style="page-break-after: always;"></div>

## Diagrama Entidade-Relacionamento (DER)

Inicialmente, modelámos o projeto tal como está representado no DER seguinte. 

[DER](DiagramaEntidadeRelacionamento_DER_TIMELESS.pdf)

<div style="page-break-after: always;"></div>

Após uma análise mais cuidada do problema, fizemos algumas alterações ao DER anterior:

- Foi criada uma nova entidade MétodoPagamento, conectada à Entidade Pagamento.
- Foi retirada a Entidade Idiomas.

![DER_atualizado](DER.png)

## Equema Relacional da BD

O esquema relacional está representado na figura seguinte:

![Relacional](EsquemaRelacional.drawio.png)


# Ficheiros SQL
## SQL DDL - definição da estrutura da BD

### Criação das tabelas

O ficheiro *timeless_createTables.sql* contém o código SQL que permite a criação das tabelas, de acordo com o esquema relacional.

### Drop tables

O ficheiro *drops.sql* contém o código SQL que permite a *eliminação* das tabelas do projeto, por ordem adequada, de acordo com o esquema relacional.

### Inserções

O ficheiro *timeless_insertValues.sql* contém o código SQL que permite a inserção de dados nas tabelas criadas anteriormente.

### Views

O ficheiro *views.sql* contém o código SQL de algumas *views* criadas sobre a base de dados:

 - *ProgramasPopulares*, que permite visualizar os programas melhor avaliados, ou com melhores classificações. É possível calcular a média dessas clasificações (com base nas avaliações dadas pelos utilizadores) para cada programa e classificar os programas com base nessa média.
 - *EpisodiosDoPrograma*, que permite visualizar os episódios de um programa, de determinada temporada.

### Queries

O ficheiro *queries.sql* contém o código SQL de algumas *queries* efetuadas sobre a base de dados:

 - Após a criação da view «ProgramasPopulares», pode-se usar a 1ª query do ficheiro para a consultar, e aplicando-lhe a cláusula ORDER BY para obter os programas ordenados por classificação (do mais para o menos popular).
 - Para consultar a segunda view que foi criada («EpisodiosDoPrograma»), usa-se a segunda e a terceira queries criadas para pesquisar mais rapidamente pelos episódios de um programa. E para especificar/filtrar por determinado programa, ajusta-se a consulta, ao acrescentar na cláusula WHERE o id do programa que pretendemos pesquisar.
- Usar a UDF "ObterTodasParceriasNegociadasFuncionario" numa consulta
- Usar a UDF "ObterSubscricaoAssociadaConta" numa consulta.

### Indexes/Índices

O ficheiro *indexes.sql* contém o código dos *índices* criados sobre a base de dados:

 - *idx_IDCLIENTE_DATAPAGAMENTO* sobre a tabela *TIMELESS_PAGAMENTO* e os atributos *idCliente e dataPagamento*
 - *idx_IDPROGRAMA_TEMPORADA* sobre a tabela *TIMELESS_EPISODIO* e atributos *idprograma e temporada*
 - *idx_conta_programa* sobre a tabela *TIMELESS_CONTA_PROGRAMA* e atributo *idConta*.

### Nota:
Estes índices foram criados, no entanto, não compensa usá-los de facto, visto que não conferem quaisquer melhorias na eficiência das consultas, devido à pouca quantidade de dados inseridos na base de dados. Só iria compensar se, eventualmente, existissem centenas ou milhares de tuplos inseridos na base de dados.

### Triggers

O ficheiro *triggers.sql* contém o código SQL dos *triggers* criados sobre a base de dados:

 - Trigger para calcular a média de avaliações de um programa:
 ao receber uma nova avaliação para um programa, esse trigger pode ser acionado para calcular automaticamente a média das avaliações atribuídas ao programa, atualizando assim o valor da classificação média. Precisamos de criar uma coluna ClassificacaoMedia na tabela TIMELESS_PROGRAMA. Adicionar a coluna classificacaoMedia à tabela TIMELESS_PROGRAMA. Após a criado do trigger, sempre que uma nova avaliação for inserida na tabela TIMELESS_AVALIACAO, o trigger calculará a média das classificações para o programa correspondente e atualizará a coluna classificacaoMedia na tabela TIMELESS_PROGRAMA com o valor calculado.
 - Trigger para atualizar a quantidade de programas num país: Quando um programa é associado a um novo país de exibição, esse trigger pode ser acionado para atualizar automaticamente a contagem de programas disponíveis nesse país (ALTER TABLE TIMELESS_ALLOWEDIN ADD quantidadeProgramas INT;). Quando há uma nova inserção na tabela TIMELESS_ALLOWEDIN, o trigger é acionado e obtém o código do país e o id do programa inserido e atualiza a coluna quantidadeProgramas na tabela TIMELESS_ALLOWEDIN com o número de programas disponíveis nesse país. Preciso de uma nova coluna na tabela TIMELESS_ALLOWEDIN chamada quantidadeProgramas para armazenar a quantidade de programas exibida em um determinado país.
 - Trigger para enviar lembretes de pagamento: Fazer uma simulação do envio de um email para o campo [email] na entidade TIMELESS_CONTA quando o campo [dataPagamento] na entidade TIMELESS_PAGAMENTO estiver a 7 dias ou menos de distância da data atual.
 Duas formas de implementar isto seria enviar um email à pessoa, lembrando-a da data de pagamento, no entanto, os emails que temos na base de dados não são reais. Então, a alternativa que nos pareceu mais correta foi criar uma tabela chamada TIMELESS_LEMBRETES. Afinal de contas, não foi possível criar a entidade TIMELESS_LEMBRETES, porque ela ia estar relacionada com a entidade TIMELESS_PAGAMENTO que é uma entidade fraca. Então, optámos por fazer uma simulação de envio de um email.

### Stored Procedures

O ficheiro *sps.sql* contém o código SQL de alguns *stored procedures* criados sobre a base de dados:

 - Criar um evento;
 - Criar um concerto e um soundcheck para uma determinada banda;
 - Apagar um evento dado o id do mesmo;
 - Apagar um concerto dado o id do mesmo;
 - Editar um evento.



### User Defined Functions

O ficheiro *udfs.sql* contém o código SQL de algumas *UDFs* criadas sobre a base de dados:

- Dado um id de um funcionário, devolve todas as parcerias por ele geridas.
- Dado o id de uma Conta, devolve o tipo da Subscrição do utilizador.

### Interface

Interface e formulários de interação construidos em Windows Forms Application, em C#.

Foi dado maior foco à implementação das principais tarefas como gestão dos dados de um Evento e dos dados de um Concerto por serem as tabelas mais complexas em termos de dependências e para as quais também fora dado maior destaque na criação de views, triggers, used defined functions e stored procedures; de forma a assim maximizarmos a utilização deste trabalho em SQL.

A ser implementado no GUI ficam interações semelhantes às já implementadas mas paras as restantes, e que não apresentam grande variadade de interação comparativamente as anteriores descritas.

Com base nos scripts SQL de criação de *queries*, é possível simular alguns dos cenários de interação com a base de dados, por exemplo:
  
 - Obter eventos cujo número de bilhetes seja maior que a média de todos os bilhetes vendidos;
 - Obter o número de Musicos de cada comitiva e ordenar pelo número de músicos;
 - Obter todas as empresas de catering e o número de eventos aos quais estas fornecem serviços;
 - etc.

Com base nos scripts SQL de criação de *triggers*, é possível simular cenários de interação com a base de dados, por exemplo:

 - garantir que não podem existir dois soundchecks ao mesmo tempo;
 - Soundcheck não pode durar mais de 1 hora (se durar a sua duração é ajustada para 1 hora);
 - etc.
  

Com base nos scripts SQL de criação de *UDFs*, é possível simular cenários de interação com a base de dados, por exemplo:

 - Editar dados de um evento;
 - Apagar eventos;
 - Pesquisar músico por Nome Artístico;
 - Dada uma data de inicio e de fim dar os eventos aí dentro;
 - Dado um nome da banda, devolver informação sobre o evento em que a banda participa;
 - Dado o id de um Evento devolver os seus concertos e respectivos soundchecks
 - Dado um género devolver bandas;
 - etc.

Com base nos scripts SQL de criação de *Stored Procedures*, é possível simular cenários de interação com a base de dados, por exemplo:

 - Apagar um concerto dado o id do mesmo;
 - Criar um concerto e um soundcheck para uma determinada banda;
 - Editar um evento;
 - etc.