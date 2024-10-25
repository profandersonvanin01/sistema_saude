<?php
    session_start();
    require 'conecta.php';

    $email = strtolower($_POST['email']);
    $senha = md5($_POST['senha']);
    $tipo = strtoupper($_POST['tipo_usuario']);

    // echo "Email => $email <br>";
    // echo "Senha => $senha <br>";
    // echo "Tipo => $tipo <br>";

    if (($email != null) && ($senha != null) & ($tipo != null)){
        $consulta = "SELECT * FROM usuarios WHERE
            email = '$email'AND
            senha = '$senha' AND
            tipo_usuario = '$tipo'
        ";
        $resultado = $conexao->query($consulta);
        $registros = $resultado->num_rows;
        $resultado_usuario = mysqli_fetch_assoc($resultado);

        // 
        
        if ($registros<>0){
            $_SESSION['id_usuario'] = $resultado_usuario['id_usuario'];
            $_SESSION['nome_usuario'] = $resultado_usuario['nome'];
            $_SESSION['email_usuario'] = $resultado_usuario['email'];
            $_SESSION['tipo_usuario'] = $resultado_usuario['tipo_usuario'];

            header('Location: index.php');

        }
        else{
            header('Location: ../index.html');
        }
    }
    else{
        header('Location: ../index.html');
    }

    




?>