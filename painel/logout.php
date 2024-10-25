<?php
    session_start();
    unset(
        $_SESSION['id_usuario'],
        $_SESSION['nome_usuario'],
        $_SESSION['email_usuario'],
        $_SESSION['tipo_usuario']
    );

    header('Location: ../index.html');

?>