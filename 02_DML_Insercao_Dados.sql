-- ==========================================================
-- ARQUIVO: 02_dml_insercao.sql
-- DESCRIÇÃO: Povoamento das tabelas com dados iniciais (INSERT)
-- ==========================================================

USE db_muscle_power;

-- 1. Inserindo Planos
INSERT INTO PLANO (nome, valor, duracao_dias) VALUES 
('Mensal Básico', 89.90, 30),
('Trimestral Gold', 240.00, 90),
('Anual Platinum', 800.00, 365);

-- 2. Inserindo Instrutores
INSERT INTO INSTRUTOR (nome, cref, especialidade) VALUES 
('Carlos Silva', '123456-G/SP', 'Musculação'),
('Fernanda Costa', '987654-G/SP', 'CrossFit e Funcional'),
('Roberto Souza', '112233-G/SP', 'Reabilitação');

-- 3. Inserindo Exercícios
INSERT INTO EXERCICIO (nome, grupo_muscular, maquina) VALUES 
('Supino Reto', 'Peitoral', 'Banco de Supino'),
('Agachamento Livre', 'Pernas', 'Barra Olímpica'),
('Puxada Frontal', 'Costas', 'Polia Alta'),
('Rosca Direta', 'Bíceps', 'Halteres'),
('Leg Press 45', 'Pernas', 'Leg Press Machine');

-- 4. Inserindo Alunos
INSERT INTO ALUNO (nome, cpf, data_nascimento, email, telefone, id_plano) VALUES 
('Vagner Bueno', '111.222.333-44', '1990-05-20', 'vagner@email.com', '(11) 99999-0000', 2), -- Trimestral
('Ana Pereira', '555.666.777-88', '1995-08-15', 'ana.p@email.com', '(11) 98888-1111', 1),   -- Mensal
('João Santos', '999.888.777-66', '1988-12-10', 'joao.s@email.com', '(11) 97777-2222', 3);  -- Anual

-- 5. Inserindo Pagamentos
INSERT INTO PAGAMENTO (data_vencimento, data_pagamento, valor_pago, status, id_aluno) VALUES 
('2024-02-10', '2024-02-09', 240.00, 'Pago', 1),   -- Vagner pagou em dia
('2024-02-15', NULL, NULL, 'Pendente', 2),         -- Ana ainda não pagou
('2024-01-20', '2024-01-25', 800.00, 'Atrasado', 3); -- João pagou com atraso

-- 6. Inserindo Treinos
INSERT INTO TREINO (nome_descricao, data_inicio, data_fim, objetivo, id_aluno, id_instrutor) VALUES 
('Hipertrofia A', '2024-02-01', '2024-04-01', 'Ganho de Massa', 1, 1), -- Treino do Vagner feito pelo Carlos
('Emagrecimento Iniciante', '2024-02-15', '2024-03-15', 'Perda de Peso', 2, 2); -- Treino da Ana feito pela Fernanda

-- 7. Inserindo Itens do Treino (Os exercícios dentro da ficha)
-- Ficha do Vagner (id_treino = 1)
INSERT INTO ITEM_TREINO (id_treino, id_exercicio, series, repeticoes, carga) VALUES 
(1, 1, 4, 10, '30kg'), -- Supino
(1, 3, 3, 12, '45kg'), -- Puxada
(1, 4, 3, 15, '12kg'); -- Rosca

-- Ficha da Ana (id_treino = 2)
INSERT INTO ITEM_TREINO (id_treino, id_exercicio, series, repeticoes, carga) VALUES 
(2, 2, 3, 15, 'Livre'),      -- Agachamento
(2, 5, 3, 12, '80kg');       -- Leg Press