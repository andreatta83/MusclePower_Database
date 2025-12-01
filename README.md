Sistema de Gestão de Academia - Muscle Power

Repositório contendo os scripts SQL para a criação, população e manipulação do banco de dados relacional da academia "Muscle Power". Este projeto foi desenvolvido como parte da disciplina de Modelagem de Banco de Dados.


Descrição do Projeto (Minimundo)

O Muscle Power é um sistema para gerenciar uma academia de ginástica. Ele permite o controle de:

Alunos: Cadastro pessoal e planos contratados.

Treinos: Criação de fichas de exercícios personalizadas pelos instrutores.

Financeiro: Controle de pagamentos de mensalidades.

Estrutura: Cadastro de instrutores e exercícios disponíveis.


Estrutura dos Arquivos

Este repositório contém 4 scripts SQL principais que devem ser executados na seguinte ordem:

01_ddl_criacao.sql: Data Definition Language. Cria o banco de dados db_muscle_power e todas as tabelas com suas chaves primárias e estrangeiras.

02_dml_insercao.sql: Data Manipulation Language (INSERT). Povoa as tabelas com dados fictícios para testes (Planos, Instrutores, Alunos, Treinos, etc.).

03_dml_consultas.sql: Data Manipulation Language (SELECT). Contém exemplos de relatórios utilizando JOIN, WHERE, ORDER BY e agragadores.

04_dml_atualizacao_exclusao.sql: Data Manipulation Language (UPDATE/DELETE). Exemplos práticos de como atualizar registros e excluir dados mantendo a integridade.


Como Executar

Você pode utilizar ferramentas como MySQL Workbench, DBeaver ou HeidiSQL.

Abra sua ferramenta de banco de dados.

Abra e execute o script 01_ddl_criacao.sql para criar a estrutura.

Em seguida, execute o script 02_dml_insercao.sql para inserir os dados.

Agora você pode rodar os scripts 03 e 04 livremente para testar as consultas e modificações.


Tecnologias Utilizadas

Linguagem SQL (Padrão ANSI/MySQL)

Conceitos de Modelagem Relacional (3FN)

Autor: Vagner Bueno
