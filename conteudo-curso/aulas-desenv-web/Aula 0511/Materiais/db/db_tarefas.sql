-- -----------------------------------------------------
-- Schema db_tarefas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_tarefas` DEFAULT CHARACTER SET utf8 ;
USE `db_tarefas` ;

-- -----------------------------------------------------
-- Table `colaboradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `colaboradores` (
  `id_colaborador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  PRIMARY KEY (`id_colaborador`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tarefas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tarefas` (
  `id_tarefa` INT NOT NULL AUTO_INCREMENT,
  `descricao` TEXT NULL,
  `prioridade` VARCHAR(255) NULL,
  `situacao` VARCHAR(255) NULL,
  `id_colaborador` INT NOT NULL,
  PRIMARY KEY (`id_tarefa`),
  INDEX `fk_tarefas_usuarios_idx` (`id_colaborador` ASC),
  CONSTRAINT `fk_tarefas_usuarios`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `db_tarefas`.`colaboradores` (`id_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Inserts
-- -----------------------------------------------------
INSERT INTO `colaboradores` (`nome`) VALUES ('Teilor Golunski');
INSERT INTO `colaboradores` (`nome`) VALUES ('Mônica Prior');
INSERT INTO `colaboradores` (`nome`) VALUES ('Cícero Nicodem');
INSERT INTO `colaboradores` (`nome`) VALUES ('Diogo Mocelin');
INSERT INTO `colaboradores` (`nome`) VALUES ('Raquel Vernes');
INSERT INTO `colaboradores` (`nome`) VALUES ('Valter Tasca');
INSERT INTO `colaboradores` (`nome`) VALUES ('Thiago Lazarotto');