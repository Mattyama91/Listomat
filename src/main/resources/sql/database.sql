-- -----------------------------------------------------
-- Schema listomat
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `listomat` DEFAULT CHARACTER SET utf8 ;
USE `listomat` ;

-- -----------------------------------------------------
-- Table `listomat`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listomat`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli.',
    `first_name` VARCHAR(245) NULL COMMENT 'Imię',
    `last_name` VARCHAR(245) NULL COMMENT 'Nazwisko',
    `email` VARCHAR(245) NULL COMMENT 'Adres email',
    `password` VARCHAR(60) NULL COMMENT 'Hasło',
    `superadmin` TINYINT(1) NULL COMMENT 'Czy użytkownik jest Super Administratorem.',
    `enable` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Czy jest aktywny i może się logować.',
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    COMMENT = 'Tabela zawierająca dane użytkowników';


-- -----------------------------------------------------
-- Table `listomat`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listomat`.`products` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli.',
    `name` VARCHAR(255) NULL COMMENT 'Nazwa produktu.',
    `ingredients` TEXT NULL COMMENT 'Składniki przepisu.',
    `description` TEXT NULL COMMENT 'Opis przepisu.',
    `created` DATETIME NULL COMMENT 'Data dodania.',
    `updated` DATETIME NULL COMMENT 'Data edycji.',
--     `preparation_time` INT NULL COMMENT 'Czas przygotowania w minutach.',
--     `preparation` TEXT NULL COMMENT 'Sposób przygotowania.',
    `list_id` INT NOT NULL COMMENT 'Klucz obcy tabeli list.',
    PRIMARY KEY (`id`),
    INDEX `fk_products_list1_idx` (`list_id` ASC),
    CONSTRAINT `fk_products_list1`
    FOREIGN KEY (`list_id`)
    REFERENCES `listomat`.`list` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB
    COMMENT = 'Tabela zawierająca produkty';


-- -----------------------------------------------------
-- Table `listomat`.`list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listomat`.`list` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli',
    `name` VARCHAR(45) NULL COMMENT 'Nazwa listy.',
    `created` DATETIME NULL COMMENT 'Data utworzenia.',
    `user_id` INT NOT NULL COMMENT 'Klucz obcy tabeli users.',
    PRIMARY KEY (`id`),
    INDEX `fk_list_users1_idx` (`user_id` ASC),
    CONSTRAINT `fk_list_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `listomat`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB
    COMMENT = 'Tabela zawierająca informacje na temat list.';


-- -----------------------------------------------------
-- Table `listomat`.`day_name`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listomat`.`day_name` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL COMMENT 'Nazwa dnia.',
    `display_order` INT NULL COMMENT 'Kolejność wyświetlania.',
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    COMMENT = 'Tabela zawierająca nazwy dni.';


-- -----------------------------------------------------
-- Table `listomat`.`recipe_plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listomat`.`recipe_plan` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli.',
    `recipe_id` INT NOT NULL COMMENT 'Klucz obcy tabeli przepisów.',
    `meal_name` VARCHAR(245) NULL COMMENT 'Nazwa posiłku',
    `display_order` INT NULL COMMENT 'Kolejność wyświetlania posiłku w ciągu dnia.',
    `day_name_id` INT NOT NULL COMMENT 'Klucz obcy tabeli dni.',
    `plan_id` INT NOT NULL COMMENT 'Klucz obcy tabeli plany.',
    PRIMARY KEY (`id`),
    INDEX `fk_recipe_plan_recipe1_idx` (`recipe_id` ASC),
    INDEX `fk_recipe_day_day_name1_idx` (`day_name_id` ASC),
    INDEX `fk_recipe_plan_plan1_idx` (`plan_id` ASC),
    CONSTRAINT `fk_recipe_plan_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `scrumlab`.`recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_recipe_day_day_name1`
    FOREIGN KEY (`day_name_id`)
    REFERENCES `scrumlab`.`day_name` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `fk_recipe_plan_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `scrumlab`.`plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB
    COMMENT = 'Tabela zawierająca informacje o połączeniu przepisu oraz planu.';


-- -----------------------------------------------------
-- Table `listomat`.`pages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `listomat`.`pages` (
    `id` INT NOT NULL AUTO_INCREMENT COMMENT 'Klucz główny tabeli',
    `title` VARCHAR(245) NULL COMMENT 'Tytuł strony.',
    `description` TEXT NULL COMMENT 'Zawartość strony.',
    `slug` VARCHAR(245) NULL COMMENT 'Unikalny identyfikator strony tworzony na podstawie tytułu.',
    PRIMARY KEY (`id`),
    UNIQUE INDEX `slug_UNIQUE` (`slug` ASC))
    ENGINE = InnoDB;


CREATE TABLE `book` (
                        `id` INT NOT NULL AUTO_INCREMENT,
                        `title` varchar(255) COLLATE utf8_polish_ci NOT NULL,
                        `author` varchar(255) COLLATE utf8_polish_ci NOT NULL,
                        `isbn` varchar(255) COLLATE utf8_polish_ci NOT NULL,
                        PRIMARY KEY (`id`))
    ENGINE = InnoDB
COMMENT = 'Przykładowa tabela.';