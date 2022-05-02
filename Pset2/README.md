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

#


