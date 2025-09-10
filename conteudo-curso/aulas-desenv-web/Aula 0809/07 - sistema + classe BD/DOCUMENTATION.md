# Sistema de Gerenciamento de Pessoas - Documentação

## Descrição do Sistema

Este sistema implementa um CRUD completo para gerenciamento de pessoas utilizando PHP, MySQL e Bootstrap. O sistema permite inserir, visualizar, editar e excluir registros de pessoas, com upload e gerenciamento de fotos.

## Estrutura dos Arquivos Criados/Modificados

### 1. Banco de Dados
- **db/db_pessoas.sql**: Script de criação do banco de dados `db_pessoas` com:
  - Tabela `usuarios` (para login do sistema)
  - Tabela `pessoas` (id, nome, cpf, data_nascimento, foto)
  - CPF com constraint UNIQUE para evitar duplicados

### 2. Classe de Banco de Dados
- **src/class/BancoDeDados.php**: Modificado para usar `db_pessoas` ao invés de `db_exemplo`

### 3. Interface de Usuário
- **telas/pessoas.php**: Tela principal contendo:
  - Formulário de cadastro/edição com validação
  - Lista de pessoas cadastradas
  - Modal para visualização de fotos
  - Máscaras e validações JavaScript

### 4. Processamento Backend
- **src/pessoa/inserir.php**: Processa inserção e atualização com:
  - Validação completa de dados
  - Verificação de CPF duplicado
  - Upload de fotos com validação
  - Tratamento de erros e exceções
  
- **src/pessoa/excluir.php**: Processa exclusão com:
  - Remoção do registro do banco
  - Exclusão do arquivo de foto
  - Tratamento de erros

### 5. Sistema Principal
- **sistema.php**: Modificado para incluir menu "Pessoas" e roteamento

### 6. Estrutura de Pastas
- **uploads/**: Diretório para armazenamento das fotos
- **src/pessoa/**: Diretório para scripts de processamento

## Funcionalidades Implementadas

### ✅ CRUD Completo
- **Create**: Inserção de novas pessoas com foto obrigatória
- **Read**: Listagem de todas as pessoas cadastradas
- **Update**: Edição de dados existentes (foto opcional na edição)
- **Delete**: Exclusão de registros com remoção da foto

### ✅ Validações Implementadas

#### Frontend (JavaScript):
- Máscara automática para CPF (XXX.XXX.XXX-XX)
- Validação de campos obrigatórios
- Validação de tipos de arquivo aceitos

#### Backend (PHP):
- Validação de campos obrigatórios
- Validação de formato e tamanho do CPF
- Verificação de CPF duplicado
- Validação de tipo de arquivo (JPEG, PNG, GIF)
- Validação de tamanho máximo (2MB)

### ✅ Upload de Fotos
- Geração de nome único para evitar conflitos
- Armazenamento seguro na pasta `uploads/`
- Remoção automática de fotos antigas na edição
- Visualização em modal responsivo

### ✅ Tratamento de Erros
- Try-catch em todas as operações de banco
- Mensagens específicas para diferentes tipos de erro
- Rollback automático em caso de falha
- Validação de integridade referencial

## Como Usar o Sistema

### 1. Configuração Inicial
1. Execute o script `db/db_pessoas.sql` no MySQL
2. Verifique as configurações de conexão em `src/class/BancoDeDados.php`:
   - Host: localhost
   - Porta: 3307
   - Usuário: root
   - Senha: masterkey

### 2. Acesso ao Sistema
1. Acesse `index.php`
2. Use as credenciais padrão:
   - Usuário: admin
   - Senha: 123456

### 3. Gerenciamento de Pessoas
1. No menu lateral, clique em "Pessoas"
2. Para cadastrar: preencha o formulário e clique em "Salvar"
3. Para editar: clique no ícone de lápis na tabela
4. Para excluir: clique no ícone de lixeira e confirme
5. Para ver foto: clique em "Ver Foto" na coluna correspondente

### 4. Validações do Sistema
- CPF não pode ser duplicado
- Todos os campos são obrigatórios
- Foto obrigatória no cadastro, opcional na edição
- Apenas imagens JPEG, PNG, GIF são aceitas
- Tamanho máximo de 2MB por foto

## Características Técnicas

### Segurança
- Validação dupla (frontend + backend)
- Proteção contra SQL Injection (prepared statements)
- Validação de tipos de arquivo
- Geração de nomes únicos para arquivos

### Performance
- Consultas otimizadas com índices
- Carregamento eficiente de imagens
- Paginação implícita na interface

### Usabilidade
- Interface responsiva (Bootstrap)
- Máscaras automáticas
- Mensagens de feedback claras
- Modal para visualização de fotos

## Mensagens de Erro Tratadas

- "Existem dados obrigatórios faltando. Verifique!"
- "CPF deve conter 11 dígitos!"
- "CPF já cadastrado no sistema!"
- "Tipo de arquivo não permitido. Use apenas JPEG, PNG ou GIF."
- "Arquivo muito grande. Máximo 2MB."
- "Erro ao fazer upload da foto."
- "A foto é obrigatória!"
- "Pessoa não encontrada!"
- "Não é possível excluir esta pessoa pois existem registros relacionados a ela."

## Considerações Finais

O sistema foi desenvolvido seguindo as melhores práticas de desenvolvimento PHP, mantendo consistência com o código base fornecido e implementando todas as funcionalidades solicitadas. O código é robusto, seguro e preparado para futura expansão.