<?php

require_once 'BancoDeDados.php';

class Equipamento {
    // Atributos
    public string $id;
    public string $descricao;
    public string $quantidade_estoque;
    public ?string $foto = null;
    public ?string $codigo_barras = null;
    private BancoDeDados $banco;

    // Construtor
    public function __construct()
    {
        $this->banco = new BancoDeDados;
    }

    // Método Inserir
    public function inserir()
    {
        try {
            $sql = 'INSERT INTO equipamentos (
                descricao,
                quantidade_estoque,
                foto,
                codigo_barras
            ) VALUES (?,?,?,?)';
            $parametros = [
                $this->descricao,
                $this->quantidade_estoque,
                $this->foto,
                $this->codigo_barras
            ];
            $this->banco->executarComando($sql, $parametros);
            
            return $this->banco->obterUltimoIdInserido();
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Inserir com Imagem e Código de Barras (método completo que gerencia upload e geração automática)
    public function inserirComImagemECodigo($arquivo_imagem = null, $caminho_upload = '../../upload/')
    {
        try {
            // Processar upload de imagem se fornecida
            if ($arquivo_imagem && isset($arquivo_imagem['size']) && $arquivo_imagem['size'] > 0) {
                $nome_imagem = uniqid() . '.jpg';
                $destino = $caminho_upload . $nome_imagem;
                $origem = $arquivo_imagem['tmp_name'];
                
                if (!move_uploaded_file($origem, $destino)) {
                    throw new Exception('Houve um problema para enviar a imagem do equipamento. Tente novamente.');
                }
                $this->foto = $nome_imagem;
            }

            // Inserir equipamento sem código de barras inicialmente
            $this->codigo_barras = null;
            $id_equipamento = $this->inserir();

            // Gerar código de barras baseado no ID do equipamento
            $codigo_barras_url = 'https://barcodeapi.org/api/code128/' . $id_equipamento;

            // Atualizar o equipamento com o código de barras gerado
            $this->id = $id_equipamento;
            $this->codigo_barras = $codigo_barras_url;
            $this->alterar();
            
            return $id_equipamento;
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Alterar
    public function alterar()
    {
        try {
            // Verificar se o equipamento existe
            $sql = 'SELECT id_equipamento, foto, codigo_barras FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            $equipamento_existente = $this->banco->consultar($sql, $parametros);
            
            if (!$equipamento_existente) {
                throw new Exception('Equipamento não encontrado!');
            }

            // Preserve existing values if not set
            if ($this->foto === null) {
                $this->foto = $equipamento_existente['foto'];
            }
            
            if ($this->codigo_barras === null) {
                $this->codigo_barras = $equipamento_existente['codigo_barras'];
            }

            $sql = 'UPDATE equipamentos SET 
                descricao = ?,
                quantidade_estoque = ?,
                foto = ?,
                codigo_barras = ?
                WHERE id_equipamento = ?';
            $parametros = [
                $this->descricao,
                $this->quantidade_estoque,
                $this->foto,
                $this->codigo_barras,
                $this->id
            ];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Alterar com Imagem (método completo que gerencia upload de imagem)
    public function alterarComImagem($arquivo_imagem = null, $caminho_upload = '../../upload/')
    {
        try {
            // Verificar se o equipamento existe
            $sql = 'SELECT id_equipamento, foto, codigo_barras FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            $equipamento_existente = $this->banco->consultar($sql, $parametros);
            
            if (!$equipamento_existente) {
                throw new Exception('Equipamento não encontrado!');
            }

            $nome_imagem_antiga = $equipamento_existente['foto'];
            $nome_imagem_nova = $nome_imagem_antiga; // Manter a imagem existente por padrão

            // Processar upload de nova imagem se fornecida
            if ($arquivo_imagem && isset($arquivo_imagem['size']) && $arquivo_imagem['size'] > 0) {
                $nome_imagem_nova = uniqid() . '.jpg';
                $destino = $caminho_upload . $nome_imagem_nova;
                $origem = $arquivo_imagem['tmp_name'];
                
                if (!move_uploaded_file($origem, $destino)) {
                    throw new Exception('Houve um problema para enviar a imagem do equipamento. Tente novamente.');
                }

                // Excluir imagem antiga se existir e for diferente da nova
                if ($nome_imagem_antiga && $nome_imagem_antiga !== $nome_imagem_nova) {
                    $caminho_imagem_antiga = $caminho_upload . $nome_imagem_antiga;
                    if (file_exists($caminho_imagem_antiga)) {
                        unlink($caminho_imagem_antiga);
                    }
                }
            }

            // Atualizar o equipamento com a imagem correta
            $this->foto = $nome_imagem_nova;
            // Preserve the existing barcode
            $this->codigo_barras = $equipamento_existente['codigo_barras'];
            $this->alterar();
            
            return true;
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Excluir
    public function excluir()
    {
        try {
            // Verificar se há empréstimos vinculados
            $sql = 'SELECT COUNT(*) as total FROM emprestimos WHERE id_equipamento = ? AND status = "emprestado"';
            $parametros = [$this->id];
            $emprestimos_vinculados = $this->banco->consultar($sql, $parametros);
            
            if ($emprestimos_vinculados['total'] > 0) {
                throw new Exception('Não é possível excluir equipamento com empréstimos em aberto!');
            }

            // Obter informações do equipamento antes de excluí-lo (para deletar imagem)
            $sql = 'SELECT foto FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            $equipamento = $this->banco->consultar($sql, $parametros);
            
            if (!$equipamento) {
                throw new Exception('Equipamento não encontrado!');
            }

            // Excluir equipamento do banco
            $sql = 'DELETE FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            $this->banco->executarComando($sql, $parametros);

            // Retornar informações para exclusão da imagem (se necessário)
            return $equipamento;
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Excluir com Imagem (método completo que também deleta o arquivo)
    public function excluirComImagem($caminho_upload = '../../upload/')
    {
        try {
            // Obter informações antes de excluir
            $equipamento_info = $this->selecionarPorId();
            
            if (!$equipamento_info) {
                throw new Exception('Equipamento não encontrado!');
            }

            // Excluir do banco de dados
            $this->excluir();
            
            // Excluir arquivo de imagem, se existir
            if ($equipamento_info['foto']) {
                $caminho_imagem = $caminho_upload . $equipamento_info['foto'];
                if (file_exists($caminho_imagem)) {
                    unlink($caminho_imagem);
                }
            }
            
            return true;
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar
    public function selecionar()
    {
        try {
            $sql = 'SELECT * FROM equipamentos ORDER BY descricao';
            return $this->banco->consultar($sql, [], true);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Selecionar por ID
    public function selecionarPorId()
    {
        try {
            $sql = 'SELECT * FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            return $this->banco->consultar($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Atualizar Estoque
    public function atualizarEstoque($quantidade)
    {
        try {
            $sql = 'UPDATE equipamentos SET quantidade_estoque = quantidade_estoque + ? WHERE id_equipamento = ?';
            $parametros = [$quantidade, $this->id];
            $this->banco->executarComando($sql, $parametros);
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }

    // Método Verificar Disponibilidade
    public function verificarDisponibilidade($quantidade_necessaria)
    {
        try {
            $sql = 'SELECT quantidade_estoque FROM equipamentos WHERE id_equipamento = ?';
            $parametros = [$this->id];
            $resultado = $this->banco->consultar($sql, $parametros);
            
            return $resultado['quantidade_estoque'] >= $quantidade_necessaria;
        } catch (PDOException $erro) {
            throw new PDOException;
        }
    }
}
