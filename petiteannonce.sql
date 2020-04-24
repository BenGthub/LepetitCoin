-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 24 avr. 2020 à 15:23
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `petiteannonce`
--

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `album`
--

INSERT INTO `album` (`id`, `photo1`, `photo2`, `photo3`, `photo4`, `photo5`) VALUES
(9, 'Tulips5e9849378e605.tmp', NULL, NULL, NULL, NULL),
(10, 'Tulips5e984a953a644.tmp', NULL, NULL, NULL, NULL),
(11, 'CapitainSwing5e984e5fcd007.tmp', NULL, NULL, NULL, NULL),
(12, 'CapitainSwing5e984e7adb4bb.tmp', NULL, NULL, NULL, NULL),
(13, 'Tulips5e98525510c21.tmp', NULL, NULL, NULL, NULL),
(14, 'Koala5e9857eb79b19.tmp', NULL, NULL, NULL, NULL),
(15, 'CapitainSwing5e986cd053591.tmp', NULL, NULL, NULL, NULL),
(16, 'CapitainSwing5e986f90482e9.tmp', NULL, NULL, NULL, NULL),
(17, 'CapitainSwing5e98784898b1e.tmp', NULL, NULL, NULL, NULL),
(22, 'CapitainSwing5e98c28ee1d58.tmp', 'Desert5e98c28ee2528.tmp', 'Penguins5e98c28ee2910.tmp', 'Lighthouse5e98c28ee2cf8.tmp', 'Koala5e98c28ee34c8.tmp'),
(23, 'shamp5e9f164e3299f.tmp', 'Koala5e9f164e33170.tmp', NULL, NULL, NULL),
(24, 'shamp5e9f16a0d2dbf.tmp', 'Koala5e9f16a0d358f.tmp', NULL, NULL, NULL),
(25, 'shamp5e9f1d42643c2.tmp', 'Koala5e9f1d4264b93.tmp', NULL, NULL, NULL),
(26, 'shamp5e9f1edc64500.tmp', 'Koala5e9f1edc64cd0.tmp', NULL, NULL, NULL),
(27, 'shamp5e9f1ef83afab.tmp', 'Koala5e9f1ef83b77b.tmp', NULL, NULL, NULL),
(28, 'shamp5e9f1f3a94540.tmp', 'Koala5e9f1f3a94d10.tmp', NULL, NULL, NULL),
(29, 'shamp5e9f1f932294e.tmp', 'Koala5e9f1f932311e.tmp', NULL, NULL, NULL),
(30, 'shamp5e9f2817000a9.tmp', NULL, NULL, NULL, NULL),
(31, 'shamp5e9f29b064aed.tmp', NULL, NULL, NULL, NULL),
(32, 'Penguins5ea025cbbf5da.tmp', 'Tulips5ea025cbbfdab.tmp', 'Desert5ea025cbc0193.tmp', NULL, NULL),
(33, 'Bugatti5ea1e8e68b079.tmp', 'Bugatti25ea1e8e68b84a.tmp', 'Bugatti35ea1e8e68bc32.tmp', 'Bugatti55ea1e8e68c01a.tmp', 'Capture25ea1e8e68c402.tmp');

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_courte` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_longue` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` decimal(11,2) NOT NULL,
  `adresse` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F65593E57E9E4C8C` (`photo_id`),
  KEY `IDX_F65593E5BCF5E72D` (`categorie_id`),
  KEY `IDX_F65593E56A99F74A` (`membre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id`, `photo_id`, `categorie_id`, `membre_id`, `titre`, `description_courte`, `description_longue`, `prix`, `adresse`, `ville`, `cp`, `pays`, `date_enregistrement`) VALUES
(1, 9, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 00:00:00'),
(2, 10, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 00:00:00'),
(3, 11, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 12:23:59'),
(4, 12, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 00:00:00'),
(5, 13, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 12:40:53'),
(6, 14, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 13:04:43'),
(7, 15, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 00:00:00'),
(8, 16, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 14:45:36'),
(9, 17, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 15:22:48'),
(10, 22, 1, 7, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-16 20:39:42'),
(11, 23, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 15:50:38'),
(12, 24, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 15:52:00'),
(13, 25, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 16:20:18'),
(14, 26, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 16:27:08'),
(15, 27, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 16:27:36'),
(16, 28, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 16:28:42'),
(17, 29, 1, 7, 'Lot de mini savons etc', 'voir description longue', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 16:30:11'),
(18, 30, 1, 7, 'Lot de mini savons etc', 'dfdsf', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 17:06:31'),
(19, 31, 1, 7, 'Lot de mini savons etc', 'dfdsf', 'Lot de mini savons, shampoings, gels douche, gels cheveux et corps, bonnets de douche, vanity kit, brosse à dents ... en provenance d\'hôtels de différents pays dans nos voyages en Ecosse, Irlance, Italie, Grèce, Corse .', '35.00', 'null par', 'paris', '75000', 'france', '2020-04-21 17:13:20'),
(20, 32, 1, 10, 'photo', 'qcqsds', 'qsdqsd', '10.00', 'null par', 'paris', '75000', 'france', '2020-04-22 11:08:59'),
(21, 33, 1, 10, 'Bugatti 2019', 'A vendre Bugatti 9000km  contrôle  Technique ok', 'Bugatti , baptisé \"La voiture noire\"  sa production limitée à quatre exemplaires, dont trois qui ont survécu, la Bugatti 57 SC Atlantic est l\'une des voitures de collection les plus convoitées. , puisqu\'un seul exemplaire sera fabriqué. Vendu 11 millions d\'euros hors taxes à un mystérieux \"amateur de le marque\", il ferait presque passer la récente Divo pour abordable et banale, avec ses 40 exemplaires adjugés à 5 millions d\'euros. Mais en dépit de ce tarif stratosphérique, le moteur est  : on retrouve de nouveau le W16 quadri-turbo de la Chiron, toujours fort de 1.500 ch et 1.600 Nm.', '15000.00', '3 rue du bon coin ou du petit coin', 'paris', '75000', 'France', '2020-04-23 19:13:42');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `motscles` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `titre`, `motscles`) VALUES
(1, 'Livre', 'bd'),
(2, 'Auto', 'Automobile'),
(3, 'Sports et loisirs', 'jeux');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annonce_id` int(11) DEFAULT NULL,
  `membre_id` int(11) NOT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67F068BC8805AB2F` (`annonce_id`),
  KEY `IDX_67F068BC6A99F74A` (`membre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `civilite` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F6B4FB29E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `email`, `roles`, `password`, `pseudo`, `civilite`, `prenom`, `nom`, `telephone`, `date_enregistrement`) VALUES
(7, 'ben@gmal.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$UmEwYy9tdnRBZzQ0S1ZHNQ$u64mp7qym82+T5+zIDyHSAWidkw5JDyoi9buZhTDKv8', NULL, '', '', '', '', '0000-00-00 00:00:00'),
(8, 'casimi@ttata.fgr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Ljc2NmRmVERiaFQxVXdSaw$7WVd6Sm5mPzXBM+/mQMU9ysLxpLBO2Ppmq86WUPHiOg', NULL, '', '', '', '', '0000-00-00 00:00:00'),
(9, 'casimir@ttata.fgr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$R0JzUUpneUtpZzg4OHYzYQ$EwPhxCDuqSKeKjlu/m1HjGt1mvE53amJY2MOrnNz5ew', NULL, '', '', '', '', '0000-00-00 00:00:00'),
(10, 'tictac@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$VE9xUjRhUi42bmY0SUo2dA$0bCkjSLXcsbKjA2hfWgvZhxWoB0EOXQFIlnoE+skiJM', NULL, '', '', '', '', '0000-00-00 00:00:00'),
(11, 'tictoc@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$cGRWNXY0dUo2ZUU5QTdYNw$hQDLM74WUirtvPCQTu0IqGC7p0BYZ8fU61kIaDvTJ+4', 'titi', 'h', 'ben', 'grosminet', '0801067898', '2015-01-01 00:00:00'),
(12, 'test@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$WFJSbGR3Z1VEQnp5aUhlRA$rl8rPsx0MYhTv0sJ2EkN/KW7ZYCwsfAhIpgzyix6ju0', 'ben', 'h', 'titi', 'toto', '01020304', '2015-01-01 00:00:00'),
(13, 'test@sfr.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$YzJpTkdKbjQwQXcwUkI0bA$uWn+piWs3bkhBculFt5FF9IokwlZdlOnM4RIDZhMaDY', 'ben', 'h', 'titi', 'toto', '01020304', '2020-04-17 09:23:31'),
(14, 'admin@ben.fr', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$VDhzVFRsVy9kbVgueFF0MQ$g1vgY3okggc35eRRrwgWQaQFiL6oT2HlHC6v5LpP+Sk', 'titi', 'h', 'ben', 'grosminet', '0801067898', '2020-04-17 14:18:00');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200415030516', '2020-04-15 03:06:00'),
('20200415195054', '2020-04-15 19:51:14');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `FK_F65593E56A99F74A` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_F65593E57E9E4C8C` FOREIGN KEY (`photo_id`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `FK_F65593E5BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC6A99F74A` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`),
  ADD CONSTRAINT `FK_67F068BC8805AB2F` FOREIGN KEY (`annonce_id`) REFERENCES `annonce` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
