WITH RECURSIVE classificacao_P AS (
SELECT codigo, CONCAT(nome) AS nome, codigo_pai
FROM classificacao
WHERE codigo_pai is null
UNION all
SELECT cls.codigo, CONCAT(pr.nome || ' ~> ' || cls.nome), cls.codigo_pai
FROM classificacao AS cls
INNER JOIN classificacao_P AS pr ON pr.codigo = cls.codigo_pai
WHERE cls.codigo_Pai IS NOT NULL)
SELECT codigo AS "Código",
nome AS "Itens",
codigo_pai AS "Código Pai"
FROM classificacao_P 
ORDER BY classificacao_P.nome;


/* Tenha a humildade de não plagiar, esse pset vale apenas pontos extras, melhor deixar de ganhar esse ponto do que ferir sua integridade */
