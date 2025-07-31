<div>
    <!-- inclui os dados de configuração dos cookie -->
    <?php include 'src/config.php';
    ?>
    <h1>Bem-vindo, 
        <!-- desencripta os dados do cookie como ensinado na aula -->
        <?php echo isset($_SESSION['logado']) ? (isset($_SESSION['usuario']) ? $_SESSION['usuario'] : (isset($_COOKIE['usuario']) ? openssl_decrypt($_COOKIE['usuario'], CIFRA_CRYPT, KEY_CRYPT, 0, VI_CRYPT) : '')) : ''; 
    ?>
    </h1>
</div>