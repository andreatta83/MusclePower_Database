-- ==========================================================
-- ARQUIVO: 04_dml_atualizacao_exclusao.sql
-- DESCRIÇÃO: Comandos de UPDATE e DELETE
-- ==========================================================

USE db_muscle_power;

-- === COMANDOS DE UPDATE (ATUALIZAÇÃO) ===

-- 1. Atualizar o endereço de email de um aluno
UPDATE ALUNO
SET email = 'novo.email.ana@email.com'
WHERE id_aluno = 2;

-- 2. Atualizar o valor de um plano (Aumento de preço)
UPDATE PLANO
SET valor = 99.90
WHERE nome = 'Mensal Básico';

-- 3. Registrar o pagamento da Ana (Mudar status de Pendente para Pago)
UPDATE PAGAMENTO
SET status = 'Pago', data_pagamento = CURDATE(), valor_pago = 99.90
WHERE id_aluno = 2 AND status = 'Pendente';


-- === COMANDOS DE DELETE (EXCLUSÃO) ===

-- 1. Remover um item específico de um treino (Ex: Tirar Rosca Direta do treino do Vagner)
-- Primeiro descobrimos o ID ou usamos subquery. Vamos remover pelo ID direto se soubermos, ou condição.
DELETE FROM ITEM_TREINO
WHERE id_treino = 1 AND id_exercicio = 4;

-- 2. Deletar um pagamento lançado errado (Ex: ID 3)
DELETE FROM PAGAMENTO
WHERE id_pagamento = 3;

-- 3. Excluir um aluno (CUIDADO: Isso pode gerar erro se houver FKs sem CASCADE. 
-- Normalmente deletaríamos primeiro os pagamentos e treinos dele).
-- Exemplo de deleção segura removendo dependências primeiro:
DELETE FROM PAGAMENTO WHERE id_aluno = 3; -- Remove pagamentos do João
DELETE FROM ITEM_TREINO WHERE id_treino IN (SELECT id_treino FROM TREINO WHERE id_aluno = 3); -- Remove itens dos treinos do João
DELETE FROM TREINO WHERE id_aluno = 3; -- Remove treinos do João
DELETE FROM ALUNO WHERE id_aluno = 3; -- Finalmente remove o João