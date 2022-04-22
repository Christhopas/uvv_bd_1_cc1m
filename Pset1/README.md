<div align="center">
  
# **Design e Desenvolvimento de Bancos de Dados**
## *PSet1*
#### Aluno: Christopher Passos Thompson
#### Prof. Abrantes Araújo Silva Filho
#### Monitora: Suellen Miranda Amorim
#### Turma: CC1M
</div>


# **1. Introdução**
O presente trabalho tem como foco principal a implementação de um banco de dados de modelo empresarial, apresentado no livro Sistemas de Banco de Dados, 7ª edição, dos autores Elmasri & Navathe nos capituos 5 e 6. Os seguintes passos foram seguidos para que a execução total do Pset fosse um sucesso:
> - Projeto Lógico 
> - Implementação no PostgreSQL
> - Implementação no MariaBD/MySQL

Ferramentas usadas no PSet1:
> - SQL Power Architect (Projeto Lógico)
> - DBeaver (Plataforma de desenvolvimento de multiplas databases)
> - Oracle VM VirtualBox ([Com implementação de uma maquina virtual criada pelo Prof. Abrantes](https://www.computacaoraiz.com.br/2022/03/17/maquina-virtual-para-o-estudo-de-sistemas-de-gerenciamento-de-bancos-de-dados-db-server/))


# **2. Projeto Lógico** 
<img src="https://ucarecdn.com/c51f4b2a-d92c-4e2a-a775-8b7c06fcf3f1/-/format/auto/-/progressive/yes/-/preview/2048x2048/" width="50"> Usando a ferramenta SQL Power Architect iniciamos a construção do projeto lógico da tabela do Elmarsi.

<img src="https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/imgs/projetoelmarsi.png?raw=true">

Após a construção das tabelas, colunas e as referências, usamos uma tool do software, capaz de transformar todo o projeto em scripts.

## 2.1 Transformar em script compatível com o postgres

<img src="https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/imgs/sqlpostgresprojeto.png?raw=true">

## 2.2 Transformar em script compatível com o MySQL/MARIADB

<img src="https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/imgs/mysqlprojeto.png?raw=true">


# **3. Implementação no PostgresSQL**
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-plain-wordmark.svg"  width="100"/>
          

Com os scripts gerados e corrigidos, você terá de implementar os dados dentro das tabelas e adicionar esses scripts de insert junto aos outros.
Agora so abrir o terminal, inserir os comandos para se conectar ao postgres, e colar os [scripts](https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/scriptpostgres.sql)

![image](https://user-images.githubusercontent.com/101826879/164750678-49debcda-ff09-4936-8eb8-f1916dfc092f.png)


# **4. Implementação no MYsql/mariaDB**
<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original.svg" width="100"/>


Com os scripts gerados e corrigidos, você terá de implementar os dados dentro das tabelas e adicionar esses scripts de insert junto aos outros.
Agora so abrir o terminal, inserir os comandos para se conectar ao MYsql, e colar os [scripts](https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/ScriptMysql.sql)

![image](https://github.com/Christhopas/uvv_bd_1_cc1m/blob/main/Pset1/imgs/terminalmysql.png?raw=true)



# **5. Conclusão**
Foi extremamente satisfatório trabalhar com esse projeto, realmente traz à superficie como trabalhar com banco de dados. Eu sou adepto do método de ensino do "se vira", pois é assim que teremos de agir agora em diante na faculdade, pesquisar, pesquisar e pesquisar mais um pouco.
## ⚠️ É DE EXTREMA IMPORTÂNCIA QUE VOCÊ RODE OS SCRIPTS TODOS NO TERMINAL
          




