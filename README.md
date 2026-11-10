# 🎵 Spotymusic - Database Model & SQL Scripts

> Projeto de modelagem e implementação de banco de dados relacional inspirado na plataforma Spotify, contendo scripts DDL (definição) e DML (manipulação) em SQL ANSI compatível com os principais SGBDs.

---

## 📌 Sobre o Projeto

O **Spotymusic** é uma modelagem de banco de dados relacional projetada para gerenciar as operações fundamentais de um serviço de streaming de áudio. O projeto resolve o desafio de estruturar dados de forma normalizada para conectar artistas, álbuns, faixas, usuários, planos de assinatura, playlists e histórico de escuta.

### 🎯 Principais Objetivos
* Modelar relacionamentos 1:N (ex: Artista -> Álbuns) e N:M (ex: Playlists <-> Músicas).
* Garantir integridade referencial com uso correto de Chaves Primárias (PK) e Chaves Estrangeiras (FK).
* Disponibilizar queries otimizadas para relatórios e consultas do sistema.

---

## 🛠️ Tecnologias e Ferramentas

* **Linguagem:** SQL (ANSI SQL-92)
* **SGBDs Compatíveis:** MySQL, PostgreSQL, SQL Server, Oracle, SQLite
* **Ferramentas Recomendadas:** DBeaver, MySQL Workbench, VS Code

---
## 📂 Estrutura do Repositório

O projeto foi organizado de forma modular para facilitar a navegação e a execução dos scripts:

```text
Spotymusic/
├── README.md                           # Documentação principal do projeto
├── docs/
│   └── queries.md                      # Documentação detalhada das 30 consultas SQL e Views
└── sql/
    ├── schema.sql                      # Script DDL (Criação de Tabelas e Banco de Dados)
    ├── data.sql                        # Script DML (Povoamento e inserção dos dados de teste)
    ├── triggers_procedures.sql         # Script com Triggers e Procedures
    └── usuarios_permissoes.sql         # Script de gestão de usuários e privilégios
```
---

## 📊 Estrutura do Banco de Dados

O esquema relacional é composto pelas seguintes tabelas:

* **`artista` / `artista_log`**: Cadastro e auditoria de músicos e bandas.
* **`album`**: Registro de discos e EPs associados a um artista.
* **`genero`**: Categorização musical.
* **`musica` / `musica_log`**: Catálogo de faixas, duração e logs.
* **`compositor` / `compositor_musica` / `compositor_log`**: Autoria e auditoria das faixas.
* **`playlist` / `playlist_musica` / `playlist_log`**: Gestão de listas de reprodução e auditoria.

---

## ⚙️ Como Executar o Projeto

Siga os passos abaixo para instanciar e popular o banco de dados na sua ferramenta de preferência:

### Pré-requisitos
* Um SGBD instalado (ex: MySQL ou PostgreSQL) ou um cliente gráfico (ex: DBeaver).
* Git instalado na máquina.

### Passo a Passo

1. **Clonar o repositório:**
   ```bash
    git clone https://github.com/Teres17/Spotymusic.git
    cd Spotymusic
   ```
2. **Criar a base de dados no seu SGBD(DDL):**
    Execute o script de criação do banco e das tabelas localizado em:
    👉 **[`sql/schema.sql`](./sql/schema.sql)**

3. **Criar as Triggers e Procedures:**
    Execute as rotinas automatizadas e controle de acessos em:
    👉 **[`sql/triggers_procedures.sql`](./sql/triggers_procedures.sql)**

4. **Popular a base de dados (DML):**
    Insira os dados iniciais de artistas, álbuns, faixas e playlists em:
    👉 **[`sql/data.sql`](./sql/data.sql)**

5. **Configurar Utilizadores e Permissões:**
   Execute o script de gestão de acessos localizado em:
   👉 **[`sql/usuarios_permissoes.sql`](./sql/usuarios_permissoes.sql)**

✒️ Autor
Desenvolvido por Lucas Teles (Teres17).