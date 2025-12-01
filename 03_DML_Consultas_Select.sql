-- ==========================================================
-- ARQUIVO: 03_dml_consultas.sql
-- DESCRIÇÃO: Consultas (SELECT) para relatórios gerenciais
-- ==========================================================

USE db_muscle_power;

-- 1. CONSULTA COM JOIN: Listar todos os alunos e seus respectivos planos
SELECT 
    a.nome AS Nome_Aluno,
    a.email,
    p.nome AS Plano_Contratado,
    p.valor AS Valor_Mensalidade
FROM ALUNO a
INNER JOIN PLANO p ON a.id_plano = p.id_plano;

-- 2. CONSULTA COM WHERE E JOIN: Ver a ficha de treino completa de um aluno específico (Vagner Bueno)
SELECT 
    t.nome_descricao AS Nome_Treino,
    t.objetivo,
    e.nome AS Exercicio,
    it.series,
    it.repeticoes,
    it.carga
FROM TREINO t
INNER JOIN ITEM_TREINO it ON t.id_treino = it.id_treino
INNER JOIN EXERCICIO e ON it.id_exercicio = e.id_exercicio
INNER JOIN ALUNO a ON t.id_aluno = a.id_aluno
WHERE a.nome LIKE '%Vagner%';

-- 3. CONSULTA DE STATUS FINANCEIRO: Listar pagamentos pendentes ou atrasados
SELECT 
    a.nome AS Aluno,
    pg.data_vencimento,
    pg.status,
    pg.valor_pago
FROM PAGAMENTO pg
JOIN ALUNO a ON pg.id_aluno = a.id_aluno
WHERE pg.status IN ('Pendente', 'Atrasado')
ORDER BY pg.data_vencimento ASC;

-- 4. CONSULTA COM AGREGAÇÃO (Bônus): Contar quantos alunos existem em cada plano
SELECT 
    p.nome AS Plano,
    COUNT(a.id_aluno) AS Total_Alunos
FROM PLANO p
LEFT JOIN ALUNO a ON p.id_plano = a.id_plano
GROUP BY p.nome;