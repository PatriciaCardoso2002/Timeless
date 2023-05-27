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

### "Drop tables"

O ficheiro *drops.sql* contém o código SQL que permite a *eliminação* das tabelas do projeto, por ordem adequada, de acordo com o esquema relacional.

### Inserções

O ficheiro *timeless_insertValues.sql* contém o código SQL que permite a inserção de dados nas tabelas criadas anteriormente.

### Queries

O ficheiro *queries.sql* contém o código SQL de algumas *queries* efetuadas sobre a base de dados:

 - Promotores com mais do que um evento;
 - Eventos cujo número de bilhetes seja maior que a média de todos os bilhetes vendidos;
 - Promotores dos eventos a acontecer a partir de 2022;
 - Empresas de catering e o número de eventos aos quais fornecem serviços;
 - Número de Musicos de cada comitiva;
 - Número de Instrumentos que cada banda traz;
 - Eventos, número de dias e de concertos.


### Views

O ficheiro *views.sql* contém o código SQL de algumas *views* criadas sobre a base de dados:

 - *V_Bandas* que permite visualizar atributos da entidade banda;
 - *V_Geral* que permite ter uma noção geral de um evento, sendo para isso necessário juntar atributos de várias entidades.

### Indexes/Índices

O ficheiro *indexes.sql* contém o código SQL de alguns *triggers* criados sobre a base de dados:

 - *idx_eventId* sobre a tabela *Evento* e atributo *id*;
 - *idx_concertoId* sobre a tabela *Concerto* e atributo *id*;
 - *idx_BandaId* sobre a tabela *Banda* e atributo *id*;
 - *idx_Musico* sobre a tabela *Musico* e atributo *cc*.

Como são feitas pesquisas pelas chaves primárias de várias tabelas, criámos *indexes* em cada uma delas. Desta forma, é mais fácil a pesquisa de informação com base nas chaves primárias.

### Triggers

O ficheiro *triggers.sql* contém o código SQL de alguns *triggers* criados sobre a base de dados:

 - Apagar um concerto apaga também o seu soundcheck;
 - Apagar um evento apaga também os seus concertos e soundchecks;
 - Soundcheck não pode durar mais de 1 hora (se durar a sua duração é ajustada para 1 hora);
 - não podem existir dois soundchecks ao mesmo tempo.

### Stored Procedures

O ficheiro *sps.sql* contém o código SQL de alguns *stored procedures* criados sobre a base de dados:

 - Criar um evento;
 - Criar um concerto e um soundcheck para uma determinada banda;
 - Apagar um evento dado o id do mesmo;
 - Apagar um concerto dado o id do mesmo;
 - Editar um evento.

Estes *stored procedures* foram criados por forma a que as alterações da base de dados não fossem executadas diretamente sobre a mesma. Cria-se assim uma camada de abstração entre a base de dados e as operações que podem pôr em risco a integridade da base de dados (operações que interagem diretamente com o conteúdo da base de dados).


### User Defined Functions

O ficheiro *udfs_FP.sql* contém o código SQL de algumas *UDFs* criadas sobre a base de dados:

 - Dado um id devolve um evento;
 - Dado um nome devolve um evento;
 - Dado um ccPromotor devolve um evento;
 - Dado um ccManager devolve um evento;
 - Dado o id de um Evento devolver os seus concertos;
 - Dado o id de um Evento devolver os seus concertos e respectivos soundchecks;
 - Dado o id de um Evento devolver as bandas que vão tocar;
 - Dado o id de uma Banda devolver os seus concertos;
 - Dado o nome de uma Banda devolver os seus concertos;
 - Pesquisar músico por CC do músico;
 - Pesquisar músico por Nome Artístico;
 - Dado um id devolver a banda;
 - Dado um nome devolver a banda;
 - Dado um género devolver bandas;
 - Dado o id de uma Banda devolver os músicos constituintes que vão tocar;
 - Dado uma data de inicio e de fim dar os eventos aí dentro;
 - Dada uma duração minima e uma duração máxima devolver todos os concertos cuja duração se encontra entre esses valores;
 - Dado um nome do evento, devolver informação sobre o mesmo;
 - Dado um número de dias do evento, devolver informação sobre o mesmo;
 - Dado um nome da banda, devolver informação sobre o evento em que a banda participa.

Estas funções de consulta são utilizadas nos formulários de pesquisa de informação da Base de Dados.



### Interface

Interface construida em Windows Form Application, em C#.

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