-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Ago-2020 às 05:38
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rbarcos_hotel`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `hoteis`
--

CREATE TABLE `hoteis` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `localizacao` varchar(255) NOT NULL,
  `sobre` text NOT NULL,
  `fotos` varchar(255) NOT NULL,
  `comodidades` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hoteis`
--

INSERT INTO `hoteis` (`id`, `name`, `localizacao`, `sobre`, `fotos`, `comodidades`) VALUES
(1, 'novo hotel', 'asdfasdf', 'asdfasdf', 'asdfasdfd', 'asdfdasdfafd'),
(2, 'hotel 2', 'asdfas', 'asdfasdf', 'asdfasdf', 'asdfasdfadsf'),
(3, 'hotel 3', 'asdfasdf', 'asdfasdfasdf', 'sadfasdf', 'asdfasdfasdf'),
(4, 'hotel 4', 'asdfasdf', 'asdfasdf', 'asdfasdf', 'asdfasdf'),
(7, 'hotel 6 ', 'nao sei ', 'nao sei ', 'nao sei ', 'nao sei '),
(8, 'hotel 5', 'nao sei ', 'nao sei ', 'nao sei ', 'nao sei '),
(12, 'asdfasfd', 'asdfasdf', 'asdfasdf', 'C:fakepathannersgp.png', 'asdfasdf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quartos`
--

CREATE TABLE `quartos` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_hotel` int(10) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `preco` decimal(11,2) NOT NULL,
  `capacidade` int(11) NOT NULL,
  `qtd_camas` int(11) NOT NULL,
  `fotos` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `quartos`
--

INSERT INTO `quartos` (`id`, `id_hotel`, `nome`, `descricao`, `preco`, `capacidade`, `qtd_camas`, `fotos`) VALUES
(1, 1, 'quarto1 hotel1', 'asdfasdfadfs', '2500.00', 11, 10, 'asdfasdfadfsf'),
(2, 1, 'hotel1 outro', 'hotel 1 dafdsf', '54564646.00', 20, 20, 'asdfasdfasdf'),
(6, 1, 'quarto 3 hotel1', 'asdfas', '111.00', 10, 10, 'dfsfdsd'),
(7, 2, 'quaarto 4 hotel 2', 'asdfa', '88888.00', 10, 10, 'sdasdas'),
(8, 3, 'quarto 1 hotel 3', 'asdf', '45.00', 0, 0, NULL),
(9, 3, 'quarto 1 hotel 3', 'asdf', '1651.00', 10, 10, 'dasdasd'),
(10, 1, 'quarto 4', 'sdfsdfdf', '1200.00', 10, 10, 'sdfasdf'),
(23, 1, 'quarto 5', 'asdfafsd', '45454.00', 10, 20, 'erert'),
(24, 1, 'quarto 6', 'asdfasdf', '545454.00', 1222, 55, 'sdfsdfds');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `hoteis`
--
ALTER TABLE `hoteis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `quartos`
--
ALTER TABLE `quartos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotelquarto` (`id_hotel`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `hoteis`
--
ALTER TABLE `hoteis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `quartos`
--
ALTER TABLE `quartos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `quartos`
--
ALTER TABLE `quartos`
  ADD CONSTRAINT `hotelquarto` FOREIGN KEY (`id_hotel`) REFERENCES `hoteis` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
