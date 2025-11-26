<?php
    // Destruir sessão
    session_start();
    session_destroy();

    // Redirecionar
    header('location: ../index.php');
