<?php
    // Validação do parâmetro
    $nome_foto = $_GET['foto'] ?? null;
    
    if (!$nome_foto) {
        // Se não há foto especificada, mostrar imagem padrão
        header('Content-Type: image/png');
        
        // Criar uma imagem padrão simples
        $imagem = imagecreate(300, 200);
        $cor_fundo = imagecolorallocate($imagem, 240, 240, 240);
        $cor_texto = imagecolorallocate($imagem, 100, 100, 100);
        
        imagestring($imagem, 3, 100, 90, 'Sem foto', $cor_texto);
        
        imagepng($imagem);
        imagedestroy($imagem);
        exit;
    }

    // Limpar nome do arquivo para evitar problemas de segurança
    $nome_foto = basename($nome_foto);
    $caminho_foto = '../../upload/fotos/' . $nome_foto;

    // Verificar se o arquivo existe
    if (!file_exists($caminho_foto)) {
        // Se a foto não existe, mostrar imagem de erro
        header('Content-Type: image/png');
        
        $imagem = imagecreate(300, 200);
        $cor_fundo = imagecolorallocate($imagem, 255, 200, 200);
        $cor_texto = imagecolorallocate($imagem, 150, 0, 0);
        
        imagestring($imagem, 3, 90, 90, 'Foto nao encontrada', $cor_texto);
        
        imagepng($imagem);
        imagedestroy($imagem);
        exit;
    }

    // Verificar se é realmente um arquivo de imagem
    $info_imagem = getimagesize($caminho_foto);
    if (!$info_imagem) {
        // Se não é uma imagem válida, mostrar erro
        header('Content-Type: image/png');
        
        $imagem = imagecreate(300, 200);
        $cor_fundo = imagecolorallocate($imagem, 255, 200, 200);
        $cor_texto = imagecolorallocate($imagem, 150, 0, 0);
        
        imagestring($imagem, 3, 95, 90, 'Arquivo invalido', $cor_texto);
        
        imagepng($imagem);
        imagedestroy($imagem);
        exit;
    }

    // Definir o Content-Type correto baseado no tipo da imagem
    $tipos_mime = [
        IMAGETYPE_JPEG => 'image/jpeg',
        IMAGETYPE_PNG => 'image/png',
        IMAGETYPE_GIF => 'image/gif'
    ];

    $tipo_imagem = $info_imagem[2];
    if (isset($tipos_mime[$tipo_imagem])) {
        header('Content-Type: ' . $tipos_mime[$tipo_imagem]);
    } else {
        // Tipo não suportado, mostrar erro
        header('Content-Type: image/png');
        
        $imagem = imagecreate(300, 200);
        $cor_fundo = imagecolorallocate($imagem, 255, 200, 200);
        $cor_texto = imagecolorallocate($imagem, 150, 0, 0);
        
        imagestring($imagem, 3, 80, 90, 'Formato nao suportado', $cor_texto);
        
        imagepng($imagem);
        imagedestroy($imagem);
        exit;
    }

    // Definir headers para cache e nome do arquivo
    header('Content-Disposition: inline; filename="' . $nome_foto . '"');
    header('Content-Length: ' . filesize($caminho_foto));
    header('Cache-Control: public, max-age=3600'); // Cache por 1 hora
    header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 3600) . ' GMT');

    // Enviar o arquivo
    readfile($caminho_foto);
?>