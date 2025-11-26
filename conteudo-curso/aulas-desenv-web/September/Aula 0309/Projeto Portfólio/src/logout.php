<?php
    // Destruir sessão
    session_start();
    session_destroy();

    // Redirecionar
    header('location: ../login.php');
