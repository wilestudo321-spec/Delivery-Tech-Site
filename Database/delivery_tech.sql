-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/

-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `delivery_tech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cardapio`
--

CREATE TABLE `cardapio` (
  `id_car` int(11) NOT NULL,
  `produto` varchar(100) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  `disponivel` tinyint(1) DEFAULT 1,
  `tempo_estimado` varchar(10) DEFAULT NULL,
  `id_res` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cardapio`
--

INSERT INTO `cardapio` (`id_car`, `produto`, `preco`, `disponivel`, `tempo_estimado`, `id_res`) VALUES
(3, 'Batata Frita', 10.99, 1, '1 hora', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cli` int(11) NOT NULL,
  `cpf_cli` char(11) NOT NULL,
  `nome_cli` varchar(100) NOT NULL,
  `email_cli` varchar(100) NOT NULL,
  `senha_cli` varchar(255) NOT NULL,
  `cidade_cli` varchar(100) NOT NULL,
  `bairro_cli` varchar(100) NOT NULL,
  `rua_cli` varchar(100) NOT NULL,
  `num_cli` varchar(5) NOT NULL,
  `cep_cli` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregador`
--

CREATE TABLE `entregador` (
  `id_ent` int(11) NOT NULL,
  `cpf_ent` char(11) NOT NULL,
  `nome_ent` varchar(100) NOT NULL,
  `email_ent` varchar(100) NOT NULL,
  `senha_ent` varchar(255) NOT NULL,
  `ano_moto` year(4) NOT NULL,
  `modelo_moto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_item` int(11) NOT NULL,
  `quant_item` int(11) NOT NULL,
  `id_car` int(11) NOT NULL,
  `id_ped` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_ped` int(11) NOT NULL,
  `valor_total_ped` decimal(10,2) NOT NULL,
  `data_ped` datetime DEFAULT current_timestamp(),
  `data_entrega` datetime DEFAULT NULL,
  `avaliacao_ped` decimal(2,1) DEFAULT NULL,
  `id_cli` int(11) NOT NULL,
  `id_res` int(11) NOT NULL,
  `id_ent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `restaurante`
--

CREATE TABLE `restaurante` (
  `id_res` int(11) NOT NULL,
  `cnpj_res` char(14) NOT NULL,
  `senha_res` varchar(255) NOT NULL,
  `nome_res` varchar(100) NOT NULL,
  `email_res` varchar(100) NOT NULL,
  `cidade_res` varchar(100) NOT NULL,
  `bairro_res` varchar(100) NOT NULL,
  `rua_res` varchar(100) NOT NULL,
  `num_res` varchar(5) NOT NULL,
  `cep_res` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `restaurante`
--

INSERT INTO `restaurante` (`id_res`, `cnpj_res`, `senha_res`, `nome_res`, `email_res`, `cidade_res`, `bairro_res`, `rua_res`, `num_res`, `cep_res`) VALUES
(1, '12345678911234', '1234', 'Restaurante da Maria', 'restaurante@maria.com', 'Taubate', 'Terra Nova', 'Alan Kardec', '52', '125874968');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cardapio`
--
ALTER TABLE `cardapio`
  ADD PRIMARY KEY (`id_car`),
  ADD KEY `fk_restaurante_cardapio` (`id_res`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cli`),
  ADD UNIQUE KEY `cpf_cli` (`cpf_cli`),
  ADD UNIQUE KEY `email_cli` (`email_cli`);

--
-- Índices de tabela `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`id_ent`),
  ADD UNIQUE KEY `cpf_ent` (`cpf_ent`),
  ADD UNIQUE KEY `email_ent` (`email_ent`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `fks_necessarias_item_pedido` (`id_car`),
  ADD KEY `id_ped` (`id_ped`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_ped`),
  ADD KEY `fks_necessario_pedido` (`id_cli`),
  ADD KEY `id_res` (`id_res`),
  ADD KEY `id_ent` (`id_ent`);

--
-- Índices de tabela `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`id_res`),
  ADD UNIQUE KEY `cnpj_res` (`cnpj_res`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cardapio`
--
ALTER TABLE `cardapio`
  MODIFY `id_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cli` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `entregador`
--
ALTER TABLE `entregador`
  MODIFY `id_ent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_ped` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cardapio`
--
ALTER TABLE `cardapio`
  ADD CONSTRAINT `fk_restaurante_cardapio` FOREIGN KEY (`id_res`) REFERENCES `restaurante` (`id_res`);

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `fks_necessarias_item_pedido` FOREIGN KEY (`id_car`) REFERENCES `cardapio` (`id_car`),
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_ped`) REFERENCES `pedido` (`id_ped`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fks_necessario_pedido` FOREIGN KEY (`id_cli`) REFERENCES `cliente` (`id_cli`),
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_res`) REFERENCES `restaurante` (`id_res`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_ent`) REFERENCES `entregador` (`id_ent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
