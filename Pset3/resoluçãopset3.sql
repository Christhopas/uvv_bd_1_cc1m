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

/* Tenha a humildade de não plagiar, esse pset vale apenas pontos extras, melhor deixar de ganhar esse ponto do que ferir sua integridade */
