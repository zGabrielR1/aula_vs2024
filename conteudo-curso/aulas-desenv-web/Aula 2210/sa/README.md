# Sistema de Controle de EPI

Sistema web para controle de empréstimo de Equipamentos de Proteção Individual (EPI).

## Funcionalidades

- **Controle de Usuários**: Cadastro e gerenciamento de usuários do sistema
- **Controle de Colaboradores**: Cadastro e gerenciamento dos colaboradores que utilizam os EPIs
- **Controle de Equipamentos**: Cadastro e gerenciamento dos EPIs com controle de estoque
- **Controle de Empréstimos**: Registro de empréstimos e devoluções de EPIs com controle automático de estoque

## Tecnologias Utilizadas

- PHP (backend)
- HTML5, CSS3, JavaScript (frontend)
- Bootstrap 5 (framework CSS)
- jQuery (biblioteca JavaScript)
- MySQL (banco de dados)
- AJAX (requisições assíncronas)

## Estrutura do Banco de Dados

O sistema utiliza quatro tabelas principais:

1. **usuarios**: Armazena os usuários que podem acessar o sistema
2. **colaboradores**: Armazena os colaboradores que utilizam os EPIs
3. **equipamentos**: Armazena os EPIs com controle de estoque
4. **emprestimos**: Armazena os registros de empréstimos e devoluções

## Arquitetura MVC

O sistema segue o padrão de arquitetura Model-View-Controller (MVC):

- **Model**: Representado pelas classes PHP que interagem com o banco de dados
- **View**: Representado pelos arquivos HTML/PHP nas pastas `telas/` e `assets/`
- **Controller**: Representado pelos arquivos PHP nas pastas `src/`

## Instalação

1. Criar o banco de dados MySQL com o script `banco/DDL_EPI.sql`
2. Executar o script de dados iniciais `banco/DML_EPI.sql`
3. Configurar os dados de conexão no arquivo `src/class/BancoDeDados.php`
4. Acessar o sistema através do arquivo `index.php`

## Usuário Padrão

O sistema vem com um usuário administrador padrão:

- **Usuário**: admin
- **Senha**: admin123

## Controle de Estoque

O sistema controla automaticamente o estoque de equipamentos:

- Ao registrar um empréstimo, a quantidade é reduzida do estoque
- Ao registrar uma devolução, a quantidade é devolvida ao estoque
- Não é possível realizar empréstimos se não houver estoque suficiente

## Código de Barras

Os equipamentos podem ter códigos de barras gerados automaticamente com base no ID do equipamento.