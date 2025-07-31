<div>
    <h1>Bem-vindo, <?php include 'src/config.php'; echo isset($_SESSION['logado']) ? (isset($_SESSION['usuario']) ? $_SESSION['usuario'] : (isset($_COOKIE['usuario']) ? openssl_decrypt($_COOKIE['usuario'], CIFRA_CRYPT, KEY_CRYPT, 0, VI_CRYPT) : '')) : ''; ?></h1>
</div>