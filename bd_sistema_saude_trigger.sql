-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/10/2024 às 20:05
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistemasaude`
--
CREATE DATABASE IF NOT EXISTS `sistemasaude` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistemasaude`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_recepcionista` int(11) DEFAULT NULL,
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `data_hora`, `id_paciente`, `id_medico`, `id_recepcionista`, `observacoes`) VALUES
(1, '2024-10-30 09:00:00', 1, 1, 1, 'Consulta de rotina.'),
(2, '2024-10-31 14:00:00', 2, 2, 2, 'Consulta pediátrica.'),
(3, '2024-11-01 11:30:00', 3, 3, 3, 'Avaliação dermatológica.'),
(4, '2024-11-02 10:00:00', 4, 4, 4, 'Exame de vista.'),
(5, '2024-11-03 15:00:00', 5, 5, 5, 'Consulta ortopédica.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(50) DEFAULT NULL,
  `crm` varchar(20) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id_medico`, `nome`, `especialidade`, `crm`, `telefone`) VALUES
(1, 'Dr. Ricardo Almeida', 'Cardiologista', 'CRM12345', '1134567890'),
(2, 'Dra. Fernanda Costa', 'Pediatra', 'CRM67890', '1145678901'),
(3, 'Dr. Bruno Mendes', 'Dermatologista', 'CRM54321', '1156789012'),
(4, 'Dra. Juliana Lima', 'Oftalmologista', 'CRM98765', '1167890123'),
(5, 'Dr. Gustavo Rocha', 'Ortopedista', 'CRM13579', '1178901234');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `endereco` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `id_plano` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `sobrenome`, `nome`, `data_nascimento`, `idade`, `sexo`, `cpf`, `telefone`, `endereco`, `cidade`, `estado`, `cep`, `email`, `senha`, `status`, `id_plano`) VALUES
(1, 'Silva', 'João', '1985-05-20', 39, 'MASCULINO', '12345678901', '11987654321', 'Rua das Palmeiras, 123', 'Florianópolis', 'SC', '88000-001', 'joao@email.com', '81dc9bdb52d04dc20036dbd8313ed055', b'1', 1),
(2, 'Oliveira', 'Maria', '1990-11-15', 33, 'FEMININO', '10987654321', '11912345678', 'Avenida das Flores, 456', 'São Paulo', 'SP', '01000-100', 'maria@email.com', '81dc9bdb52d04dc20036dbd8313ed055', b'0', 2),
(3, 'Santos', 'Carlos', '1978-03-10', 46, 'MASCULINO', '10293847561', '11876543210', 'Praça dos Ipês, 789', 'Belo Horizonte', 'MG', '30100-300', 'carlos@email.com', '81dc9bdb52d04dc20036dbd8313ed055', b'1', 3),
(4, 'Costa', 'Ana', '2000-07-25', 24, 'FEMININO', '98765432100', '11765432109', 'Rua do Sol, 101', 'Salvador', 'BA', '40000-500', 'ana@email.com', '81dc9bdb52d04dc20036dbd8313ed055', b'1', 4),
(5, 'Lima', 'Pedro', '1995-12-05', 28, 'MASCULINO', '32165498700', '11654321098', 'Alameda das Acácias, 202', 'Curitiba', 'PR', '80000-600', 'pedro@email.com', '81dc9bdb52d04dc20036dbd8313ed055', b'1', 5),
(6, 'Silva', 'Zezinho', '1974-10-28', 49, 'MASCULINO', '111.222.333', '(11)99999-8888', 'Rua das Flores, 123', 'Ribeirão Pires', 'SP', '094000-00', 'zezinho@email.com', '81dc9bdb52d04dc20036dbd8313ed055', b'1', 4);

--
-- Acionadores `paciente`
--
DELIMITER $$
CREATE TRIGGER `Atualiza_Idade_Paciente` BEFORE INSERT ON `paciente` FOR EACH ROW SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `atualizar_idade_ao_atualizar` BEFORE UPDATE ON `paciente` FOR EACH ROW SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `planosaude`
--

CREATE TABLE `planosaude` (
  `id_plano` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `cobertura` varchar(255) DEFAULT NULL,
  `mensalidade` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `planosaude`
--

INSERT INTO `planosaude` (`id_plano`, `nome`, `tipo`, `cobertura`, `mensalidade`) VALUES
(1, 'Saúde Total', 'Familiar', 'Ambulatorial e Hospitalar', 500.00),
(2, 'Vida e Saúde', 'Individual', 'Ambulatorial', 300.00),
(3, 'Saúde Premium', 'Familiar', 'Ambulatorial, Hospitalar e Odontológico', 800.00),
(4, 'Saúde Básica', 'Individual', 'Ambulatorial', 250.00),
(5, 'Saúde Avançada', 'Familiar', 'Hospitalar', 600.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `recepcionista`
--

CREATE TABLE `recepcionista` (
  `id_recepcionista` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `recepcionista`
--

INSERT INTO `recepcionista` (`id_recepcionista`, `nome`, `telefone`) VALUES
(1, 'Lucas Pereira', '11876543210'),
(2, 'Sofia Martins', '11987654321'),
(3, 'Mariana Ferreira', '11765432109'),
(4, 'Ricardo Oliveira', '11654321098'),
(5, 'Fernanda Sousa', '11543210987');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` set('administrador','funcionario','cliente','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`, `tipo_usuario`) VALUES
(1, 'ADMINISTRADOR', 'adm@email.com', '81dc9bdb52d04dc20036dbd8313ed055', 'administrador'),
(2, 'PACIENTE', 'paciente@email.com', '81dc9bdb52d04dc20036dbd8313ed055', 'cliente'),
(3, 'RECEPCIONISTA', 'recepcao@email.com', '81dc9bdb52d04dc20036dbd8313ed055', 'funcionario');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_recepcionista` (`id_recepcionista`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`),
  ADD UNIQUE KEY `crm` (`crm`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `id_plano` (`id_plano`);

--
-- Índices de tabela `planosaude`
--
ALTER TABLE `planosaude`
  ADD PRIMARY KEY (`id_plano`);

--
-- Índices de tabela `recepcionista`
--
ALTER TABLE `recepcionista`
  ADD PRIMARY KEY (`id_recepcionista`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `planosaude`
--
ALTER TABLE `planosaude`
  MODIFY `id_plano` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `recepcionista`
--
ALTER TABLE `recepcionista`
  MODIFY `id_recepcionista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`id_recepcionista`) REFERENCES `recepcionista` (`id_recepcionista`);

--
-- Restrições para tabelas `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_plano`) REFERENCES `planosaude` (`id_plano`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
