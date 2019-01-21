Connection à mysql : sudo mysql -u root -p

          SQL - Partie 1 - Création et suppression de bases de données

Attention : Toutes les commandes que vous taperez devront être conservées dans un fichier .sql

Exercice 1

Créer une base de données languages.
CREATE DATABASE `languages`;  // Par convention les mots clés SQL sont écris en majuscule + magique cote afin de protéger les noms de tables, de colonnes ... afin que SQL ne l'interpréte pas s'il connait ce mot.

Exercice 2

Créer une base de données webDevelopment avec l’encodage UTF-8.
CREATE DATABASE `webDevelopment` CHARACTER SET 'utf8';

Exercice 3

Créer une base de données frameworks avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `frameworks` CHARACTER SET 'utf8';

Exercice 4

Créer une base de données languages avec l’encodage UTF-8 si elle n’existe pas.
CREATE DATABASE IF NOT EXISTS `languages` CHARACTER SET 'utf8';

Exercice 5

Supprimer la base de données languages.
DROP DATABASE `languages`;

Exercice 6

Supprimer la base de données frameworks si elle existe.
DROP DATABASE IF EXISTS `frameworks`;

Exercice 7

Supprimer la base de données languages si elle existe.
DROP DATABASE IF EXISTS `languages`;




          SQL - Partie 2 : Création de tables

Attention : Toutes les commandes que vous taperez devront être conservées dans un fichier .sql
Exercice 1

Dans la base de données webDevelopment, créer la table languages avec les colonnes :

    id (type INT, auto-incrémenté, clé primaire)
    language (type VARCHAR)

    mysql> USE webDevelopment;
    CREATE TABLE `languages` (`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`language` VARCHAR(50));

Exercice 2

Dans la base de données webDevelopment, créer la table tools avec les colonnes suivantes

    id (type INT, auto-incrémenté, clé primaire)
    tool (type VARCHAR)

    CREATE TABLE `tools` (`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`tool` VARCHAR(50));


Exercice 3

Dans la base de données webDevelopment, créer la table frameworks avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    name (type VARCHAR)

    CREATE TABLE `frameworks` (`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`name` VARCHAR(80));


Exercice 4

Dans la base de données webDevelopment, créer la table librairies avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    librairy (type VARCHAR)

CREATE TABLE librairies (`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`library` VARCHAR(50));

Exercice 5

Dans la base de données webDevelopment, créer la table ide avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    ideName (type VARCHAR)

CREATE TABLE ide (`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`ideName` VARCHAR(20));

Exercice 6

Dans la base de données webDevelopment, créer, si elle n existe pas, la table frameworks avec les colonnes suivantes :

    id (type INT, auto-incrémenté, clé primaire)
    name (type VARCHAR)

    CREATE TABLE IF NOT EXISTS frameworks (`id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,`name` VARCHAR(80));

Exercice 7

Supprimer la table tools si elle existe.
DROP TABLE IF EXISTS `tools`;

Exercice 8

Supprimer la table librairies
DROP TABLE `librairies`;

Exercice 9

Supprimer la table ide
DROP TABLE `ide`;

TP

Créer la base codex. Y créer une table clients qui aura comme colonnes :
Colonnes 	Type 	Attributs
id 	INT 	Auto-incrémenté, clé primaire
lastName 	VARCHAR
firstName 	VARCHAR
birthDate 	DATE
address 	VARCHAR
firstPhoneNumber 	INT
secondPhoneNumber 	INT
mail 	VARCHAR

CREATE DATABASE `codex`;
USE `codex`;
CREATE TABLE `clients` (
    -> `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> `lastName` VARCHAR(30),
    -> `firstName` VARCHAR(30),
    -> `birthdate` DATE,
    -> `address` VARCHAR(150),
    -> `firstPhoneNumber` INT,
    -> `secondPhoneNumber` INT,
    -> `mail` VARCHAR(30))
    -> ENGINE = INNODB;  --  moteur de stockage pour les systèmes de gestion de base de données MySQL, ET qui gère les clès étrangères

Pour visualiser la table : DESC `clients`

          SQL - Partie 3 : Modifications de tables

Attention : Toutes les commandes que vous taperez devront être conservées dans un fichier .sql


Exercice 1

Dans la base de données webDevelopment, ajouter à la table languages une colonne versions (VARCHAR).
USE `webDevelopment`;
ALTER TABLE `languages`
ADD COLUMN `versions` VARCHAR(5);

-- VARCHAR est un type qui sert à donner une taille variable au nombre de caractères
-- Le [COLUMN]  est facultatif car par défaut, donc, si à la suite de ADD  , vous ne précisez pas ce que vous voulez ajouter,
-- MySQL considérera qu'il s'agit d'une colonne.
-- description_colonne  correspond à la même chose que lorsque l'on crée une table.
-- Il contient le type de donnée et éventuellement NULL  ou NOT NULL, etc

Exercice 2

Dans la base de données webDevelopment, ajouter à la table frameworks une colonne version (INT).
ALTER TABLE `frameworks`
ADD COLUMN `version` INT;  --> on peut ajouter NOT NULL


Exercice 3

Dans la base de données webDevelopment, dans la table languages renommer la colonne versions en version.
ALTER TABLE `languages`
CHANGE `versions` `version` VARCHAR(5);

-- La commande CHANGE permet de modifier le nom des colonnes
-- Syntaxe: CHANGE ancien_nom nouveau_nom description_colonne;
-- Il est important de faire la description complète de la colonne modifiée.


Exercice 4

Dans la base de données webDevelopment, dans la table frameworks, renommer la colonne name en framework.
ALTER TABLE `frameworks`
CHANGE `name` `framework` VARCHAR(15);


Exercice 5

Dans la base de données webDevelopment, dans la table frameworks changer le type de la colonne version en VARCHAR de taille 10.
ALTER TABLE `frameworks`
CHANGE `version` `version` VARCHAR(10);
ou :
ALTER TABLE `frameworks`
MODIFY `version` VARCHAR(10);

TP

Dans la base codex, dans la table clients :

    supprimer la colonne secondPhoneNumber
    renommer la colonne firstPhoneNumber en phoneNumber
    changer le type de la colonne phoneNumber en VARCHAR
    ajouter les colonnes zipCode(VARCHAR) et city(VARCHAR)

USE `codex`;
ALTER TABLE `clients`
DROP `secondPhoneNumber`,
CHANGE `firstPhoneNumber` `phoneNumber` INT,
MODIFY `phoneNumber` VARCHAR(10),
ADD `zipCode` VARCHAR(10),
ADD `city` VARCHAR(20);

-- Lorsque l'on modifie une table, on peut vouloir lui ajouter, retirer ou modifier quelque chose.
-- Dans les trois cas, c'est la commande ALTER TABLE  qui sera utilisée, une variante existant pour chacune des opérations :
-- ALTER TABLE `clients`DROP ... -- permet de retirer quelque chose
-- ALTER TABLE `clients` CHANGE ... permet de changer `firstPhoneNumber`en `phoneNumber`
-- ALTER TABLE `clients` MODIFY ... -- permettent de modifier une colonne
-- ALTER TABLE `clients` ADD ... -- permet d'ajouter quelque chose (une colonne par exemple)

          SQL - Partie 4 : Insertion de données
Exercice 1

Dans la table languages insérez les données suivantes :

    JavaScript version 5
    PHP version 5.2
    PHP version 5.4
    HTML version 5.1
    JavaScript version 6
    JavaScript version 7
    JavaScript version 8
    PHP version 7


INSERT INTO `languages` (`id`, `language`, `version`)
VALUES (1, 'JavaScript', '5' ),
        (2, 'PHP', '5.2' ),
        (3, 'PHP', '5.4' ),
        (4, 'HTLM', '5.1' ),
        (5, 'JavaScript', '6' ),
        (6, 'JavaScript', '7' ),
        (7, 'JavaScript', '8' ),
        (NULL, 'PHP', '7' );

        -- INSERT INTO Permet d'inserer des données dans un tableau
        -- SQL INSERT INTO
        -- L’insertion de données dans une table s’effectue à l’aide de la commande INSERT INTO.
        -- Cette commande permet au choix d’inclure une seule ligne à la base existante ou plusieurs lignes d’un coup.
        -- Lorsque le champ à remplir est de type VARCHAR ou
        -- TEXT il faut indiquer le texte entre guillemet simple.
        -- En revanche, lorsque la colonne est un numérique tel que INT ou BIGINT
        -- il n’y a pas besoin d’utiliser de guillemet, il suffit juste d’indiquer le nombre.

Pour visualiser la table remplie : SELECT * FROM `languages`;

Exercice 2

Dans la table frameworks insérez les données suivantes :

    Symfony version 2.8
    Symfony version 3
    Jquery version 1.6
    Jquery version 2.10

    INSERT INTO `frameworks`(`framework`, `version`)
    VALUES ('Symfony', '2.8'),
            ('Symfony', '3'),
            ('Jquery', '1.6' ),
            ('Jquery', '2.10');



            SQL - Partie 5 : Sélection de données

Exercice 1

Dans la table languages, afficher toutes les données de la table.
SELECT * FROM `languages`;
--> SELECT est une COMMANDE à laquelle on ajoute la CLAUSE FROM qui définit de quelle structure vient les données.


Exercice 2

Dans la table languages, afficher toutes les versions de PHP.
SELECT *
FROM `languages`
WHERE `language`='PHP';


Exercice 3

Dans la table languages, afficher toutes les versions de PHP et de JavaScript.
SELECT *
FROM `languages`
WHERE `language`='PHP' || `language`='JavaScript';


Exercice 4

Dans la table languages, afficher toutes les lignes ayant pour id 3,5,7.
SELECT *
FROM `languages`
WHERE `id`='3' || `id`='5' || `id`='7';
ou
WHERE `id` IN(3, 5, 7);

Exercice 5

Dans la table languages, afficher les deux première entrées de JavaScript.
SELECT *
FROM `languages`
WHERE `language`= 'JavaScript'
ORDER BY `id`
LIMIT 2;

Exercice 6

Dans la table languages, afficher toutes les lignes qui ne sont pas du PHP
SELECT *
FROM `languages`
WHERE `language`!= 'PHP';
ou
SELECT * FROM `languages` WHERE `language` <> 'PHP';

Exercice 7

Dans la table languages, afficher toutes les données par ordre alphabétique.
SELECT *
FROM `languages`
ORDER BY `language` ASC;    --> ASC pour ordre ascendant et DESC pour ordre descendant
ou juste
ORDER BY `language`       --> car ORDER BY par défaut permet de trier par ordre ascendant




          SQL - Partie 6 : Sélection de données - Élargir les possibilités de la clause WHERE

Avant de commencer, exécutez le fichier SQL.

Exercice 1

Dans la table frameworks, afficher toutes les données de la table ayant une version 2.x (x étant un numéro quelconque).
SELECT *
FROM `frameworks`
WHERE `version` LIKE '2.%';
-- L'opérateur LIKE  permet de faire des recherches approximatives,
-- -- Deux jokers existent pour LIKE  :
-- --     '%'  : qui représente n'importe quelle chaîne de caractères, quelle que soit sa longueur (y compris une chaîne de longueur 0) ;
--     '_'  : qui représente un seul caractère.

Exercice 2

Dans la table frameworks, afficher toutes les lignes ayant pour id 1 et 3.
SELECT *
FROM `frameworks`
WHERE `id`='1' || `id`='3';
ou
WHERE `id` IN (1, 3);

-- Enfin, l'opérateur IN  permet de faire une recherche sur une liste de valeurs.
-- A la place du IN ça remplace le OR. Evite d'utiliser trop de fois le OR

Exercice 3

Dans la table ide, afficher toutes les lignes ayant une date comprise entre le premier janvier 2010 et le 31 decembre 2011.
SELECT *
FROM `ide`
WHERE `date`<'2011-12-31' && `date`>'2010-01-01';

ou
SELECT *
FROM `ide`
WHERE `date` BETWEEN '2010-01-01' AND '2011-12-31';


          SQL - Partie 7 : Suppression et modification de données

Exercice 1

Dans la table languages, supprimer toutes les lignes parlant de HTML.
DELETE FROM `languages` WHERE `language`='HTML';


Exercice 2

Dans la table frameworks, modifier toutes les lignes ayant le framework Symfony par Symfony2.
UPDATE `frameworks`
SET `framework`='Symfony2'
WHERE `framework`='Symfony'


Exercice 3

Dans la table languages, modifier la ligne du langage JavaScript version 5 par la version 5.1
UPDATE `languages`
SET `version`='5.1'
WHERE `language`='JavaScript' && `version`='5';


          SQL - Partie 8 : Les jointures

Toutes les tables à utiliser sont dans le fichier bdd.sql

Exercice 1

Afficher tous les frameworks associés à leurs langages. Si un langage n a pas de framework l afficher aussi.
SELECT `frameworks`.`name` AS `name_frameworks`, -->sélection de la colonne name de la table frameworks
        `languages`.`name` AS `name_languages`  -->sélection de la colonne name de la table languages
FROM `frameworks`       -->sélection de la table frameworks
RIGHT JOIN `languages`  -->jointure avec la table languages  (avec right ou left  -> jointure externe)
  ON `frameworks`.`languagesId`=`languages`.`id`;   -- sur quelles colonnes se fait la jointure

-->Jointure interne qd éléments identiques dans chaque tableau.
-->Jointure externe pour afficher colonne qd pas de correspondance.

Exercice 2

Afficher tous les frameworks associés à leurs langages. Si un langage n a pas de framework ne pas l afficher.
SELECT `frameworks`.`name` AS `name_frameworks`,
        `languages`.`name` AS `name_languages`
FROM `frameworks`            -- Précision de la table
INNER JOIN `languages`     -- jointure à la table ... ici frameworhs
  ON `languages`.`id`=`frameworks`.`languagesId`;     -- sur quelles colonnes se fait la jointure


Exercice 3

Afficher le nombre de framework qu a un langage.
SELECT `languages`.`name` AS `name_languages`, COUNT(`frameworks`.`languagesId`) AS `numberFrameworks`  -- COUNT = fonction d'agrégation
FROM `languages`
LEFT JOIN `frameworks`
ON `languages`.`Id` = `frameworks`.`languagesId`
GROUP BY `languages`.`id`;


Exercice 4

Afficher les langages ayant plus de 3 frameworks.
SELECT `languages`.`name` AS `name_languages`, COUNT(`frameworks`.`languagesId`) AS `numberFrameworks`  -- COUNT = fonction d'agrégation
FROM `languages`
INNER JOIN `frameworks`
ON `languages`.`Id` = `frameworks`.`languagesId`
GROUP BY `languages`.`id`
HAVING `numberFrameworks`>=3;

--La condition HAVING en SQL est presque similaire à WHERE à la seule différence que
-- HAVING permet de filtrer en utilisant des fonctions telles que SUM(), COUNT(), AVG(), MIN() ou MAX().
