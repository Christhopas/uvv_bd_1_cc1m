<div align="center">
  
# **Design e Desenvolvimento de Bancos de Dados**
## *PSet1*
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
from departamento d inner join funcionario f, 
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


