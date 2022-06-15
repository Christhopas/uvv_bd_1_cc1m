<div align="center">
  
 # **Design e Desenvolvimento de Bancos de Dados**
 ## *PSet3*
</div>

### Aluno: Christopher Passos Thompson
### Prof. Abrantes Araújo Silva Filho
### Monitora: Suellen Miranda Amorim
### Turma: CC1M

<div align="right">

["Success is not final, failure is not fatal: it is the courage to continue that counts."](https://winstonchurchill.org/)
  <br>
Winston Churchill
</div>

<br>

# **1. Introdução**
O seguinte trabalho foi baseado na descoberta do funcionamento de Queries SQL hierárquicas (recursivas), através de tutoriais que o Prof. Abrantes passou:
> - [SQL Server: Introduction to Hierarchical Query Using a Recursive CTE3](https://blog.sqlauthority.com/2012/04/24/sql-server-introduction-to-hierarchical-query-using-a-recursive-cte-a-primer)
> - [SQL Server: Recursive CTE4](https://www.sqlservertutorial.net/sql-server-basics/sql-server-recursive-cte)

A resolução deste PSet consiste em obter todas as classificações de produtos, indicando claramente que classificação é filha e que classificação é pai.

# **2. Como realizar este PSET?**
Para iniciar a resolução do PSet3 foi necessário utilizar o arquivo [criaçãopset3.sql](https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset3/cria%C3%A7%C3%A3opset3.sql), para criar a tabela
classificacao e inserir todos os dados no banco de dados “uvv” que criamos no PostgreSQL no [PSet1](https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/scriptpostgres.sql). <br>
<br>
Após toda a criação da tabela e os dados, foi o famoso "se vira nos 30", usando os tutoriais e aplicando no Pset cheguei em varias conclusões. Até que após 2 dias cheguei aonde seria realmente a  > *solução final:* <
<br>
~~~SQL
WITH RECURSIVE classificacao_P AS (
SELECT codigo, CONCAT(nome) AS nome, codigo_pai
FROM classificacao
WHERE codigo_pai is null
UNION all
SELECT c.codigo, CONCAT(pf.nome || ' ~> ' || c.nome), c.codigo_pai
FROM classificacao AS c
INNER JOIN classificacao_P AS pf ON pf.codigo = c.codigo_pai
WHERE c.codigo_Pai is NOT NULL)
SELECT codigo AS "Código",
nome AS "Itens",
codigo_pai AS "Código Pai"
FROM classificacao_P 
ORDER BY classificacao_P.nome;
~~~~
