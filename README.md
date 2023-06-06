# Timeless

Depois da apresentação, registar aqui as alterções feitas ao projeto até à entrega final (dia 6 junho 2023).

## Alterações pós-apresentação:

Usámos a estratégia de *middleware* (Criação de uma camada de abstração entre a base de dados e as operações que podem pôr em risco a integridade da mesma (operações que interagem diretamente com o conteúdo da base de dados)) para implementar a UDF de Obter Subscrição associada à conta, em vez de essa funcionalidade ser feita com uma Query.

Na página de um Funcionário, ele pode ver as Parcerias geridas por ele (através de uma UDF).

Assim sendo, as UDFs foram criadas de maneira a que as alterações à base de dados não fossem executadas diretamente sobre a mesma.

Houve alterações na maneira que o utilizador interage com o Forms: 
- na página de gestão de contas do funcionário, o utilizador introduz o seu nome em vez do seu id.
- na página em que se verifica se o utilizador tem ou não conta na plataforma, o utilizador introduz o seu nome em vez do seu id.
- depois do utilizador ter criado a sua conta, na página que permite verificar o seu tipo de subscrição, ele introduz o nome em vez do id.

Mas apesar de se introduzir os nomes ao invés dos IDs, a lógica interna de interação com a Base de Dados interliga/associa esse nome ao id correspondente do funcionário ou da conta (utilizador).