# TechMart - Análise de vendas
Uma solução baseada em **BigQuery** e **DBT-core** para analisar dados de vendas. Este projeto consiste em transformar dados brutos de vendas em tabelas estruturadas, aplicar testes de qualidade, gerar documentação com a linhagem dos dados e gerar informação úteis para a tomada de decisões comerciais.

## Problema de Negócio Fictício:
A TechMart, uma grande rede de varejo especializada em produtos eletrônicos, enfrenta desafios significativos na tomada de decisões estratégicas devido à falta de um processo eficaz para analisar seus dados de vendas e o desempenho de suas lojas. Apesar da migração de seu banco de dados para o BigQuery como parte da adoção de uma Modern Data Stack, a empresa ainda não possui uma metodologia clara para transformar e enriquecer os dados brutos com lógicas de negócio relevantes. Isso impede que os analistas de dados tenham acesso a informações consolidadas e acionáveis.

Atualmente, existe um processo de ingestão de dados para uma camada raw, mas não há um pipeline estruturado para aplicar as regras e métricas estabelecidas pela área de negócios. Além disso, faltam controles de qualidade e governança de dados, como testes automatizados, documentação e versionamento adequado.

## Objetivo:
A TechMart deseja implementar uma solução baseada em dbt-core para otimizar seus processos de transformação de dados, garantindo a confiabilidade das informações com testes a nível de linha, documentação robusta e versionamento através do GitHub. A proposta é construir uma camada de dados tratada que incorpore as métricas e regras de negócio, permitindo que as equipes de análise possam tomar decisões estratégicas com base em dados atualizados e precisos. Essa solução proporcionará:

**-> Transformação de Dados:** Enriquecimento dos dados brutos com lógicas de negócio.

**-> Qualidade e Governança:** Implementação de testes automatizados para garantir a integridade e precisão dos dados.

**-> Documentação:** Criação de uma documentação detalhada que facilite o entendimento e a manutenção das transformações.

**-> Versionamento:** Uso do GitHub para versionar todas as transformações e regras, permitindo rastreabilidade e controle de mudanças.

Com essa abordagem, a TechMart busca adotar uma cultura de dados mais moderna e ágil, que permita às equipes tomar decisões baseadas em informações confiáveis e gerar insights de forma contínua.

### Solução:
Para resolver o problema apresentado, desenvolvemos essa arquitetura separando os modelos entre **staging** e **marts**, onde na parte de staging pegamos os dados brutos da tabela **raw_techmart** e salvamos como tabelas fato ou dimensão no banco **dw_techmart** do BigQuery. Na parte de marts nós criamos as views contendo todas as agregações e regras de negócio para que os analistas possam consumir esses dados já tratados. Para cada view ou tabela criada já catalogamos todas as colunas e configuramos os testes a nível de linha para garantir a qualidade dos dados.

![image](https://github.com/user-attachments/assets/9b117abe-4516-4d78-ab50-86747bcfa474)


### Testes automatizados:
Uma grande vantagem do dbt é a possibilidade de rodar os **testes a nível de linha**, dessa forma para cada uma das colunas das tabelas ou views, podemos configurar quais testes queremos rodar e garantir uma maior confiabilidade nos dados que serão disponibilizados, assim temos uma proatividade em relação as correções de possíveis erros ao invés de apenas atuar nos problemas após as áreas de negócio reportarem.

![image](https://github.com/user-attachments/assets/abe01557-f67d-49cc-8ef9-de758de33b63)


### dbt docs:
Após o desenvolvimento dos modelos, o dbt cria para nós essa página web hospeada localmente que nos disponibiliza uma **documentação completa do projeto** onde conseguimos ver todas bases de dados, colunas e testes configurados.

![image](https://github.com/user-attachments/assets/bb621c7f-9eb7-4d9c-84fb-7845234fd830)


### Linhagem de dados:
Outra vantagem do dbt é a criação da **linhagem de dados** que nos permite navegar de forma interativa vendo quais são as fontes por trás de cada tabela ou visualização, assim conseguimos ter total restreio sobre a origem e destino dos nossos dados.

![image](https://github.com/user-attachments/assets/f8534e5f-cb8f-4a1f-a22c-21337a2daf60)


### BigQuery
Podemos visualizar essa arquitetura também através do BigQuery onde o novo banco já ganha forma tendo as tabelas fato e dimensão devidamente identificadas, além das views criadas para auxiliar as análises.

![image](https://github.com/user-attachments/assets/52fa6e92-c2ea-42c4-acf9-9a4890e7bbbe)


### Looker:
A partir do momento que temos as Views prontas no BigQuery, podemos utilizar a integração com o Looker para em poucos minutos criar **visualizações que auxiliam na tomada de decisão**.

![image](https://github.com/user-attachments/assets/eb7536f6-0ac9-48d8-a311-604780ff78db)


### Conclusão:
A implementação da solução de análise de vendas na TechMart, utilizando BigQuery e dbt, transforma a gestão de dados da empresa por meio de um pipeline estruturado que enriquece dados brutos com lógicas de negócio. A aplicação de testes automatizados a nível de linha assegura a integridade dos dados, enquanto a documentação gerada e a linhagem de dados proporcionam rastreabilidade e clareza nas transformações realizadas. O versionamento no GitHub permite controle e colaboração eficaz, e a integração com ferramentas de visualização como o Looker facilita a criação de dashboards que impulsionam decisões estratégicas. Com essa abordagem técnica, a TechMart garante a simplicidade, velocidade e escalabilidade da sua arquitetura de dados com as ferramentas de Modern Data Stack.

