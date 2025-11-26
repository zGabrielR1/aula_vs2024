CREATE SCHEMA IF NOT EXISTS `db_epis` DEFAULT CHARACTER SET utf8mb3 ;
USE `db_epis` ;

-- -----------------------------------------------------
-- Table `db_epis`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_epis`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `tipo` VARCHAR(45),
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `db_epis`.`colaboradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_epis`.`colaboradores` (
  `id_colaborador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`id_colaborador`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `db_epis`.`equipamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_epis`.`equipamentos` (
  `id_equipamento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `quantidade_estoque` INT NOT NULL DEFAULT 0,
  `foto` VARCHAR(255) NULL,
  `codigo_barras` VARCHAR(255) NULL,
  PRIMARY KEY (`id_equipamento`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `db_epis`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_epis`.`emprestimos` (
  `id_emprestimo` INT NOT NULL AUTO_INCREMENT,
  `data_retirada` DATETIME NOT NULL,
  `data_devolucao` DATETIME NULL,
  `id_colaborador` INT NOT NULL,
  `id_equipamento` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `status` ENUM('emprestado', 'devolvido') NOT NULL DEFAULT 'emprestado',
  PRIMARY KEY (`id_emprestimo`),
  INDEX `fk_emprestimos_colaboradores_idx` (`id_colaborador` ASC),
  INDEX `fk_emprestimos_equipamentos_idx` (`id_equipamento` ASC),
  CONSTRAINT `fk_emprestimos_colaboradores`
    FOREIGN KEY (`id_colaborador`)
    REFERENCES `db_epis`.`colaboradores` (`id_colaborador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimos_equipamentos` 
    FOREIGN KEY (`id_equipamento`)
    REFERENCES `db_epis`.`equipamentos` (`id_equipamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;