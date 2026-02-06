-- 1. Listar todos os beneficiários ativos
SELECT
  b.id_beneficiario,
  b.nome,
  b.status,
  b.id_plano
FROM beneficiarios b
WHERE b.status = 'ATIVO'
ORDER BY b.nome;


-- 2. Beneficiários que não possuem cobertura para o procedimento 'EXAME_HEMOGRAMA'
SELECT
  b.id_beneficiario,
  b.nome,
  b.id_plano
FROM beneficiarios b
WHERE b.status = 'ATIVO'
  AND NOT EXISTS (
    SELECT 1
    FROM cobertura c
    JOIN procedimentos p
    ON p.id_procedimento = c.id_procedimento
    WHERE c.id_plano = b.id_plano
    AND p.nome_procedimento = 'EXAME_HEMOGRAMA'
  )
  ORDER BY b.nome;


-- 3. Total de autorizações por tipo de exame em um período
SELECT
  p.nome_procedimentos AS tipo_exame,
  COUNT(a.id_autorizacao) AS total_autorizacoes]
FROM autorizacoes a
JOIN procedimentos p
  ON p.id_procedimentos = a.id_procedimento
WHERE a.data_autorizacao BETWEEN DATE '2025-02-05'
                             AND DATE '2026-02-05'
GROUP BY p.nome_procedimento
ORDER BY total_autorizacoes DESC;
