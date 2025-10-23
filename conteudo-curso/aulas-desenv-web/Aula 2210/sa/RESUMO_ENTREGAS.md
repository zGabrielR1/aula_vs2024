# Resumo das Entregas

## 1. Banco de Dados

### Diagrama Lógico
- Arquivo: `banco/Diagrama_EPI.md`

### Script de Criação do Banco de Dados
- Arquivo: `banco/DDL_EPI.sql`

### Script de Dados Iniciais
- Arquivo: `banco/DML_EPI.sql`

## 2. Tela de Login
- Arquivo: `index.php` (já existente, mantido com melhorias)

## 3. Tela do Menu Principal
- Arquivo: `sistema.php` (atualizado com novo menu)

## 4. CRUD de Usuários
- Tela: `telas/usuarios.php`
- Controladores:
  - `src/usuario/inserir.php`
  - `src/usuario/atualizar.php`
  - `src/usuario/excluir.php`
  - `src/usuario/selecionarTodos.php`
  - `src/usuario/selecionarPorId.php`
- JavaScript: `assets/js/usuario.js`

## 5. CRUD de Colaboradores
- Tela: `telas/colaboradores.php`
- Controladores:
  - `src/colaborador/inserir.php`
  - `src/colaborador/atualizar.php`
  - `src/colaborador/excluir.php`
  - `src/colaborador/selecionarTodos.php`
  - `src/colaborador/selecionarPorId.php`
- JavaScript: `assets/js/colaborador.js`

## 6. CRUD de Equipamentos
- Tela: `telas/equipamentos.php`
- Controladores:
  - `src/equipamento/inserir.php`
  - `src/equipamento/atualizar.php`
  - `src/equipamento/excluir.php`
  - `src/equipamento/selecionarTodos.php`
  - `src/equipamento/selecionarPorId.php`
- JavaScript: `assets/js/equipamento.js`

## 7. Controle de Empréstimos
- Tela: `telas/emprestimos.php`
- Controladores:
  - `src/emprestimo/inserir.php`
  - `src/emprestimo/devolver.php`
  - `src/emprestimo/cancelar.php`
  - `src/emprestimo/selecionar.php`
- JavaScript: `assets/js/emprestimo.js`

## 8. Classe de Banco de Dados
- Arquivo: `src/class/BancoDeDados.php` (atualizado para usar o novo banco)

## 9. Organização MVC
- Estrutura de pastas seguindo o padrão MVC
- Separação clara entre Model (classes PHP), View (arquivos HTML/PHP) e Controller (arquivos PHP de controle)

## 10. Documentação
- Arquivo: `README.md`