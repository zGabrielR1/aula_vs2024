-- -----------------------------------------------------
-- Schema db_pessoas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_pessoas` DEFAULT CHARACTER SET utf8 ;
USE `db_pessoas` ;

-- -----------------------------------------------------
-- Table `db_pessoas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pessoas`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `usuario` VARCHAR(255) NULL,
  `senha` VARCHAR(255) NULL,
  `tipo` CHAR(1) DEFAULT 'a',
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `db_pessoas`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pessoas`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL UNIQUE,
  `data_nascimento` DATE NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Inserir usuário padrão
INSERT INTO `db_pessoas`.`usuarios` (`nome`, `usuario`, `senha`, `tipo`) VALUES
('Administrador', 'admin', '123', 'a');