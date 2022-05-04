<div align="center">
  
# **Design e Desenvolvimento de Bancos de Dados**
## *PSet2*
#### Aluno: Christopher Passos Thompson
#### Prof. Abrantes Araújo Silva Filho
#### Monitora: Suellen Miranda Amorim
#### Turma: CC1M
</div>

# **Questão 1**
```
select avg(f.salario) as media_salario, d.nome_departamento 
from funcionario f 
inner join departamento d 
on d.numero_departamento = f.numero_departamento 
group by d.nome_departamento; 
```

| media_salario | nome_departamento |
|----------------|-------------------|
| 33250          | Pesquisa          |
| 55000          | Matriz            |
| 31000          | Administração     |

<br>

# **Questão 2**
```
select avg(f.salario) as media_salario, f.sexo
from funcionario f
group by f.sexo;
```

| media_salario | sexo |
|---------------|------|
| 37600         | M    |
| 31000         | F    |

<br>

# **Questão 3**
```
select nome_departamento as departamento, concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, data_nascimento as data_de_nascimento,
floor(DATEDIFF(CURDATE(),data_nascimento)/365.25) as idade, 
salario as salario 
from funcionario f inner join departamento d
where f.numero_departamento = d.numero_departamento order by nome_departamento;
```

| Departamento  | Nome             | Data_de_Nascimento | Idade | Salário |
|---------------|------------------|--------------------|-------|---------|
| Administração | Jennifer S Souza | 1941-06-20         | 80    | 43000   |
| Administração | André V Pereira  | 1969-03-29         | 53    | 25000   |
| Administração | Alice J Zelaya   | 1968-01-19         | 54    | 25000   |
| Matriz        | Jorge E Brito    | 1937-11-10         | 84    | 55000   |
| Pesquisa      | João B Silva     | 1965-01-09         | 57    | 30000   |
| Pesquisa      | Fernando T Wong  | 1955-12-08         | 66    | 40000   |
| Pesquisa      | Joice A Leite    | 1972-07-31         | 49    | 25000   |
| Pesquisa      | Ronaldo K Lima   | 1962-09-15         | 59    | 38000   |

<br>

# **Questão 4**
```
select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, floor(datediff(curdate(), data_nascimento)/365.25) as idade, 
salario as salario, cast((salario*1.2) as decimal(10,2)) as salario_reajuste from funcionario f
where salario < '35000'
union
select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, floor(datediff(curdate(), data_nascimento)/365.25) as idade, 
salario as salario, cast((salario*1.15) as decimal(10,2)) as salario_reajuste from funcionario f
where salario >= '35000';
```

| nome             | idade | salario  | salario_reajuste |
|------------------|-------|----------|------------------|
| João B Silva     |    57 | 30000.00 |         36000.00 |
| Joice A Leite    |    49 | 25000.00 |         30000.00 |
| André V Pereira  |    53 | 25000.00 |         30000.00 |
| Alice J Zelaya   |    54 | 25000.00 |         30000.00 |
| Fernando T Wong  |    66 | 40000.00 |         46000.00 |
| Ronaldo K Lima   |    59 | 38000.00 |         43700.00 |
| Jorge E Brito    |    84 | 55000.00 |         63250.00 |
| Jennifer S Souza |    80 | 43000.00 |         49450.00 |

<br>

# **Questão 5**
```
select nome_departamento as departamento, g.primeiro_nome as gerente, f.primeiro_nome as funcionario, salario as salarios
from departamento d 
inner join funcionario f, 
(select primeiro_nome, cpf from funcionario f inner join departamento d where f.cpf = d.cpf_gerente) as g
where d.numero_departamento = f.numero_departamento and g.cpf = d.cpf_gerente order by d.nome_departamento asc, f.salario desc;
```

| departamento  | gerente  | funcionario | salarios |
|---------------|----------|-------------|----------|
| Administração | Jennifer | Jennifer    | 43000.00 |
| Administração | Jennifer | André       | 25000.00 |
| Administração | Jennifer | Alice       | 25000.00 |
| Matriz        | Jorge    | Jorge       | 55000.00 |
| Pesquisa      | Fernando | Fernando    | 40000.00 |
| Pesquisa      | Fernando | Ronaldo     | 38000.00 |
| Pesquisa      | Fernando | João        | 30000.00 |
| Pesquisa      | Fernando | Joice       | 25000.00 |

<br>

# **Questão 6**
```
select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, dto.nome_departamento as departamento,
dpd.nome_dependente as dependente, floor(datediff(curdate(), dpd.data_nascimento)/365.25) as idade_dependente,
case when dpd.sexo = 'M' then 'masculino' when dpd.sexo = 'm' then 'masculino'
when dpd.sexo = 'F' then 'Feminino' when dpd.sexo = 'f' then 'feminino' end as sexo_dependente
from funcionario f 
inner join departamento dto on f.numero_departamento = dto.numero_departamento inner join dependente dpd ON dpd.cpf_funcionario = f.cpf;
```

| nome             | departamento  | dependente | idade_dependente | sexo_dependente |
|------------------|---------------|------------|------------------|-----------------|
| João B Silva     | Pesquisa      | Alícia     |               33 | Feminino        |
| João B Silva     | Pesquisa      | Elizabeth  |               54 | Feminino        |
| João B Silva     | Pesquisa      | Michael    |               34 | masculino       |
| Fernando T Wong  | Pesquisa      | Alícia     |               36 | Feminino        |
| Fernando T Wong  | Pesquisa      | Janaína    |               64 | Feminino        |
| Fernando T Wong  | Pesquisa      | Tiago      |               38 | masculino       |
| Jennifer S Souza | Administração | Antonio    |               80 | masculino       |

<br>

# **Questão 7**
```
select distinct concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, dp.nome_departamento as departamento,
cast((f.salario) as decimal(10,2)) as salario from funcionario f
inner join departamento dp inner join dependente dnp
where dp.numero_departamento = f.numero_departamento and
f.cpf not in (select dnp.cpf_funcionario from dependente dnp);
```

| nome            | departamento  | salario  |
|-----------------|---------------|----------|
| Alice J Zelaya  | Administração | 25000.00 |
| André V Pereira | Administração | 25000.00 |
| Jorge E Brito   | Matriz        | 55000.00 |
| Ronaldo K Lima  | Pesquisa      | 38000.00 |
| Joice A Leite   | Pesquisa      | 25000.00 |

<br>

# **Questão 8**
```
select d.nome_departamento as departamento, p.nome_projeto as projeto,
concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, t.horas as horas
from funcionario f inner join departamento d inner join projeto p inner join trabalha_em t
where d.numero_departamento = f.numero_departamento and
p.numero_projeto = t.numero_projeto and f.cpf = t.cpf_funcionario order by p.numero_projeto;
```

| departamento  | projeto         | nome             | horas |
|---------------|-----------------|------------------|-------|
| Pesquisa      | ProdutoX        | João B Silva     |  32.5 |
| Pesquisa      | ProdutoX        | Joice A Leite    |  20.0 |
| Pesquisa      | ProdutoY        | João B Silva     |   7.5 |
| Pesquisa      | ProdutoY        | Fernando T Wong  |  10.0 |
| Pesquisa      | ProdutoY        | Joice A Leite    |  20.0 |
| Pesquisa      | ProdutoZ        | Fernando T Wong  |  10.0 |
| Pesquisa      | ProdutoZ        | Ronaldo K Lima   |  40.0 |
| Pesquisa      | Informatização  | Fernando T Wong  |  10.0 |
| Administração | Informatização  | André V Pereira  |  35.0 |
| Administração | Informatização  | Alice J Zelaya   |  10.0 |
| Pesquisa      | Reorganização   | Fernando T Wong  |  10.0 |
| Matriz        | Reorganização   | Jorge E Brito    |   0.0 |
| Administração | Reorganização   | Jennifer S Souza |  15.0 |
| Administração | Novosbenefícios | Jennifer S Souza |  20.0 |
| Administração | Novosbenefícios | André V Pereira  |   5.0 |
| Administração | Novosbenefícios | Alice J Zelaya   |  30.0 |

<br>

# **Questão 9**
```
select d.nome_departamento as departamento, p.nome_projeto as projeto, sum(t.horas) as total_horas
from departamento d inner join projeto p inner join trabalha_em t
where d.numero_departamento = p.numero_departamento AND p.numero_projeto = t.numero_projeto group by p.nome_projeto;
```

| departamento  | projeto         | total_horas |
|---------------|-----------------|-------------|
| Pesquisa      | ProdutoX        |        52.5 |
| Pesquisa      | ProdutoY        |        37.5 |
| Pesquisa      | ProdutoZ        |        50.0 |
| Administração | Informatização  |        55.0 |
| Matriz        | Reorganização   |        25.0 |
| Administração | Novosbenefícios |        55.0 |

<br>

# **Questão 10**
```
select d.nome_departamento as departamento, cast(avg(f.salario) as decimal(10,2)) as media_salarial
from departamento d inner join funcionario f
where d.numero_departamento = f.numero_departamento group by d.nome_departamento;
``` 
| departamento  | media_salarial |
|---------------|----------------|
| Pesquisa      |       33250.00 |
| Matriz        |       55000.00 |
| Administração |       31000.00 |

<br>

# **Questão 11**
```
select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, p.nome_projeto as projeto,
cast((f.salario) as decimal(10,2)) as recebimento
from funcionario f inner join projeto p inner join trabalha_em t
where f.cpf = t.cpf_funcionario and p.numero_projeto = t.numero_projeto group by f.primeiro_nome;
```

| nome             | projeto         | recebimento |
|------------------|-----------------|-------------|
| Fernando T Wong  | Informatização  |    40000.00 |
| André V Pereira  | Informatização  |    25000.00 |
| Alice J Zelaya   | Informatização  |    25000.00 |
| Jennifer S Souza | Novosbenefícios |    43000.00 |
| João B Silva     | ProdutoX        |    30000.00 |
| Joice A Leite    | ProdutoX        |    25000.00 |
| Ronaldo K Lima   | ProdutoZ        |    38000.00 |
| Jorge E Brito    | Reorganização   |    55000.00 |

<br>

# **Questão 12**
```
select d.nome_departamento as departamento, p.nome_projeto as projeto,
concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome, t.horas as horas
from funcionario f inner join departamento d inner join projeto p inner join trabalha_em t
where f.cpf = t.cpf_funcionario and p.numero_projeto = t.numero_projeto and (t.horas = 0 or t.horas = null) group by f.primeiro_nome;
```

| departamento | projeto       | nome          | horas |
|--------------|---------------|---------------|-------|
| Pesquisa     | Reorganização | Jorge E Brito |   0.0 |

<br>

# **Questão 13**
```
select concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome,
case when sexo = 'M' then 'masculino' when sexo = 'm' then 'masculino'
when sexo = 'f' then 'feminino' when sexo = 'f' then 'feminino' end as sexo,
floor(datediff(curdate(), f.data_nascimento)/365.25) as idade
from funcionario f
union
select d.nome_dependente as nome,
case when sexo = 'M' then 'masculino' when sexo = 'm' then 'masculino'
when sexo = 'F' then 'Feminino' when sexo = 'f' then 'Feminino' end as sexo,
floor(datediff(curdate(), d.data_nascimento)/365.25) as idade
from dependente d order by idade;
```

| nome             | sexo      | idade |
|------------------|-----------|-------|
| Alícia           | Feminino  |    33 |
| Michael          | masculino |    34 |
| Alícia           | Feminino  |    36 |
| Tiago            | masculino |    38 |
| Joice A Leite    | feminino  |    49 |
| André V Pereira  | masculino |    53 |
| Alice J Zelaya   | feminino  |    54 |
| Elizabeth        | Feminino  |    54 |
| João B Silva     | masculino |    57 |
| Ronaldo K Lima   | masculino |    59 |
| Janaína          | Feminino  |    64 |
| Fernando T Wong  | masculino |    66 |
| Jennifer S Souza | feminino  |    80 |
| Antonio          | masculino |    80 |
| Jorge E Brito    | masculino |    84 |

<br>

# **Questão 14**
```
select d.nome_departamento as departamento, count(f.numero_departamento) as numero_funcionario
from funcionario f inner join departamento d
where f.numero_departamento = d.numero_departamento group by d.nome_departamento;
```

| departamento  | numero_funcionario |
|---------------|--------------------|
| Pesquisa      |                  4 |
| Matriz        |                  1 |
| Administração |                  3 |

<br>

# **Questão 15**
```
select distinct concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as nome,
d.nome_departamento as departamento, 
p.nome_projeto as projeto
from departamento d inner join projeto p inner join trabalha_em t inner join funcionario f 
where d.numero_departamento = f.numero_departamento and p.numero_projeto = t.numero_projeto and
t.cpf_funcionario = f.cpf
union
select distinct concat(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) as Nome,
d.nome_departamento as departamento, 
'sem projeto' as projeto
from departamento d inner join projeto p inner join trabalha_em t inner join funcionario f 
where d.numero_departamento = f.numero_departamento and p.numero_projeto = t.numero_projeto and
(f.cpf not in (select t.cpf_funcionario from trabalha_em t));
```

| nome             | departamento  | projeto         |
|------------------|---------------|-----------------|
| João B Silva     | Pesquisa      | ProdutoX        |
| João B Silva     | Pesquisa      | ProdutoY        |
| Fernando T Wong  | Pesquisa      | ProdutoY        |
| Fernando T Wong  | Pesquisa      | ProdutoZ        |
| Fernando T Wong  | Pesquisa      | Informatização  |
| Fernando T Wong  | Pesquisa      | Reorganização   |
| Joice A Leite    | Pesquisa      | ProdutoX        |
| Joice A Leite    | Pesquisa      | ProdutoY        |
| Ronaldo K Lima   | Pesquisa      | ProdutoZ        |
| Jorge E Brito    | Matriz        | Reorganização   |
| Jennifer S Souza | Administração | Reorganização   |
| Jennifer S Souza | Administração | Novosbenefícios |
| André V Pereira  | Administração | Informatização  |
| André V Pereira  | Administração | Novosbenefícios |
| Alice J Zelaya   | Administração | Informatização  |
| Alice J Zelaya   | Administração | Novosbenefícios |

