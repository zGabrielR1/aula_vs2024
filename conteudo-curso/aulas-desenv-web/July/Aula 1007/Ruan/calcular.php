<?php

    $custo_base = $_POST["custo_base"];
    $margem = $_POST["margem"];
    $comissao = $_POST["comissao"];


    $total = $custo_base + ($custo_base * ($margem / 100 )) + ( $custo_base * ($comissao / 100));

    echo ("O valor total do seu produto final é de R$ " . $total);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <br>
    <a href="index.html">Voltar</a>   

</body>
</html>