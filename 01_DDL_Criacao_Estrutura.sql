-- ==========================================================
-- PROJETO: MUSCLE POWER (SISTEMA DE GESTÃO DE ACADEMIA)
-- ARQUIVO: 01_ddl_criacao.sql
-- DESCRIÇÃO: Criação do Banco de Dados e das Tabelas (DDL)
-- AUTOR: Vagner Bueno
-- ==========================================================

-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS db_muscle_power;
USE db_muscle_power;

-- 2. Criação das Tabelas Independentes (Sem Chaves Estrangeiras)

-- Tabela: PLANO
CREATE TABLE PLANO (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    duracao_dias INT NOT NULL
);

-- Tabela: INSTRUTOR
CREATE TABLE INSTRUTOR (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cref VARCHAR(20) UNIQUE NOT NULL,
    especialidade VARCHAR(50)
);

-- Tabela: EXERCICIO
CREATE TABLE EXERCICIO (
    id_exercicio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(50),
    maquina VARCHAR(50)
);

-- 3. Criação das Tabelas Dependentes (Com Chaves Estrangeiras)

-- Tabela: ALUNO
CREATE TABLE ALUNO (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    id_plano INT,
    CONSTRAINT fk_aluno_plano FOREIGN KEY (id_plano) REFERENCES PLANO(id_plano)
);

-- Tabela: PAGAMENTO
CREATE TABLE PAGAMENTO (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    valor_pago DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'Pendente', -- Pendente, Pago, Atrasado
    id_aluno INT NOT NULL,
    CONSTRAINT fk_pagamento_aluno FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno)
);

-- Tabela: TREINO
CREATE TABLE TREINO (
    id_treino INT AUTO_INCREMENT PRIMARY KEY,
    nome_descricao VARCHAR(100),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    objetivo VARCHAR(100),
    id_aluno INT NOT NULL,
    id_instrutor INT NOT NULL,
    CONSTRAINT fk_treino_aluno FOREIGN KEY (id_aluno) REFERENCES ALUNO(id_aluno),
    CONSTRAINT fk_treino_instrutor FOREIGN KEY (id_instrutor) REFERENCES INSTRUTOR(id_instrutor)
);

-- Tabela: ITEM_TREINO (Associativa)
CREATE TABLE ITEM_TREINO (
    id_item_treino INT AUTO_INCREMENT PRIMARY KEY,
    series INT,
    repeticoes INT,
    carga VARCHAR(20), -- Ex: "20kg", "5 placas"
    id_treino INT NOT NULL,
    id_exercicio INT NOT NULL,
    CONSTRAINT fk_item_treino FOREIGN KEY (id_treino) REFERENCES TREINO(id_treino),
    CONSTRAINT fk_item_exercicio FOREIGN KEY (id_exercicio) REFERENCES EXERCICIO(id_exercicio)
);