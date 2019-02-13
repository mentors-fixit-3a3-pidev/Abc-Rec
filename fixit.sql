-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 13 fév. 2019 à 09:17
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `fixit`
--

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

DROP TABLE IF EXISTS `avis`;
CREATE TABLE IF NOT EXISTS `avis` (
  `id_prestation` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `description_avis` varchar(300) NOT NULL,
  `note_prestation` int(11) NOT NULL,
  PRIMARY KEY (`id_prestation`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `catégories`
--

DROP TABLE IF EXISTS `catégories`;
CREATE TABLE IF NOT EXISTS `catégories` (
  `id_catégorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom_catégorie` varchar(50) NOT NULL,
  `description_catégorie` varchar(200) NOT NULL,
  PRIMARY KEY (`id_catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fos_users`
--

DROP TABLE IF EXISTS `fos_users`;
CREATE TABLE IF NOT EXISTS `fos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `username_canonical` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_canonical` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `id_catégorie` int(11) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  KEY `id_catégorie` (`id_catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id_client` int(11) NOT NULL,
  `id_matériel` int(11) NOT NULL,
  `période_location` int(11) NOT NULL,
  PRIMARY KEY (`id_client`,`id_matériel`),
  KEY `id_matériel` (`id_matériel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `matériels`
--

DROP TABLE IF EXISTS `matériels`;
CREATE TABLE IF NOT EXISTS `matériels` (
  `id_matériel` int(11) NOT NULL AUTO_INCREMENT,
  `id_catégorie` int(11) NOT NULL,
  `nom_matériel` varchar(50) NOT NULL,
  `prix_location` int(11) NOT NULL,
  PRIMARY KEY (`id_matériel`),
  KEY `id_catégorie` (`id_catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `prestations`
--

DROP TABLE IF EXISTS `prestations`;
CREATE TABLE IF NOT EXISTS `prestations` (
  `id_prestation` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_prestataire` int(11) NOT NULL,
  `id_sous_catégorie` int(11) NOT NULL,
  `date_prestation` date NOT NULL,
  `état_prestation` int(11) NOT NULL,
  `nom_prestation` varchar(50) NOT NULL,
  `description_prestation` varchar(300) NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`id_prestation`),
  UNIQUE KEY `date_prestation` (`date_prestation`),
  KEY `date_prestation_2` (`date_prestation`),
  KEY `id_client` (`id_client`),
  KEY `id_prestataire` (`id_prestataire`),
  KEY `id_sous_catégorie` (`id_sous_catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `propositions_prix`
--

DROP TABLE IF EXISTS `propositions_prix`;
CREATE TABLE IF NOT EXISTS `propositions_prix` (
  `id_prestation` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `état` int(11) NOT NULL,
  PRIMARY KEY (`id_prestation`),
  KEY `id_prestation` (`id_prestation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id_question` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `titre_question` varchar(50) NOT NULL,
  `description_question` varchar(300) NOT NULL,
  `état_question` int(11) NOT NULL,
  PRIMARY KEY (`id_question`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

DROP TABLE IF EXISTS `reclamation`;
CREATE TABLE IF NOT EXISTS `reclamation` (
  `id_reclamation` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `description_reclamation` varchar(300) NOT NULL,
  `id_service` int(11) NOT NULL,
  `date_reclamation` date NOT NULL,
  `reponse` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `statut` varchar(50) NOT NULL,
  PRIMARY KEY (`id_reclamation`),
  KEY `id_client` (`id_utilisateur`),
  KEY `id_prestation` (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reclamation`
--

INSERT INTO `reclamation` (`id_reclamation`, `id_utilisateur`, `description_reclamation`, `id_service`, `date_reclamation`, `reponse`, `type`, `statut`) VALUES
(3, 25, 'jjjj', 11, '2019-02-13', 'response', 'yy', 'traitee'),
(4, 86, 'karriimmm', 24, '2019-02-15', 'no response', 'uhr', 'en cours');

-- --------------------------------------------------------

--
-- Structure de la table `réponses`
--

DROP TABLE IF EXISTS `réponses`;
CREATE TABLE IF NOT EXISTS `réponses` (
  `id_réponse` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_question` int(11) NOT NULL,
  `contenu_réponse` varchar(300) NOT NULL,
  PRIMARY KEY (`id_réponse`),
  KEY `id_client` (`id_client`),
  KEY `id_question` (`id_question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sous_catégories`
--

DROP TABLE IF EXISTS `sous_catégories`;
CREATE TABLE IF NOT EXISTS `sous_catégories` (
  `id_sous_catégorie` int(11) NOT NULL AUTO_INCREMENT,
  `id_catégorie` int(11) NOT NULL,
  `nom_sous_catégorie` varchar(50) NOT NULL,
  `description_sous_catégorie` varchar(200) NOT NULL,
  `urgence` int(11) NOT NULL,
  PRIMARY KEY (`id_sous_catégorie`),
  KEY `id_catégorie` (`id_catégorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `votes_réponse`
--

DROP TABLE IF EXISTS `votes_réponse`;
CREATE TABLE IF NOT EXISTS `votes_réponse` (
  `id_réponse` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `type_vote` int(11) NOT NULL,
  PRIMARY KEY (`id_réponse`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestations` (`id_prestation`),
  ADD CONSTRAINT `avis_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `fos_users` (`id`);

--
-- Contraintes pour la table `fos_users`
--
ALTER TABLE `fos_users`
  ADD CONSTRAINT `fos_users_ibfk_1` FOREIGN KEY (`id_catégorie`) REFERENCES `catégories` (`id_catégorie`);

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `fos_users` (`id`),
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`id_matériel`) REFERENCES `matériels` (`id_matériel`);

--
-- Contraintes pour la table `matériels`
--
ALTER TABLE `matériels`
  ADD CONSTRAINT `matériels_ibfk_1` FOREIGN KEY (`id_catégorie`) REFERENCES `catégories` (`id_catégorie`);

--
-- Contraintes pour la table `propositions_prix`
--
ALTER TABLE `propositions_prix`
  ADD CONSTRAINT `propositions_prix_ibfk_1` FOREIGN KEY (`id_prestation`) REFERENCES `prestations` (`id_prestation`);

--
-- Contraintes pour la table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `fos_users` (`id`);

--
-- Contraintes pour la table `réponses`
--
ALTER TABLE `réponses`
  ADD CONSTRAINT `réponses_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `fos_users` (`id`),
  ADD CONSTRAINT `réponses_ibfk_2` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id_question`);

--
-- Contraintes pour la table `sous_catégories`
--
ALTER TABLE `sous_catégories`
  ADD CONSTRAINT `sous_catégories_ibfk_1` FOREIGN KEY (`id_catégorie`) REFERENCES `catégories` (`id_catégorie`);

--
-- Contraintes pour la table `votes_réponse`
--
ALTER TABLE `votes_réponse`
  ADD CONSTRAINT `votes_réponse_ibfk_1` FOREIGN KEY (`id_réponse`) REFERENCES `réponses` (`id_réponse`),
  ADD CONSTRAINT `votes_réponse_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `fos_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
