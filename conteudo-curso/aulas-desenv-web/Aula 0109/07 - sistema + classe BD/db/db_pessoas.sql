-- -----------------------------------------------------
-- Schema db_pessoas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_pessoas` DEFAULT CHARACTER SET utf8 ;
USE `db_pessoas` ;

-- -----------------------------------------------------
-- Table `db_pessoas`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pessoas`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL UNIQUE,
  `data_nascimento` DATE NOT NULL,
  `nome_arquivo_foto` VARCHAR(255) NULL,
  `data_cadastro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC))
ENGINE = InnoDB;

-- Inserindo alguns dados de exemplo para teste
INSERT INTO `db_pessoas`.`pessoas` (`nome`, `cpf`, `data_nascimento`) VALUES
('João Silva', '123.456.789-10', '1990-05-15'),
('Maria Santos', '987.654.321-00', '1985-08-22'),
('Pedro Oliveira', '456.789.123-45', '1992-12-03');