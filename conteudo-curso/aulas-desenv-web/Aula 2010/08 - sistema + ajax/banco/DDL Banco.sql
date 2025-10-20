CREATE SCHEMA IF NOT EXISTS `db_exemplo` DEFAULT CHARACTER SET utf8mb3 ;
USE `db_exemplo` ;

-- -----------------------------------------------------
-- Table `db_exemplo`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_exemplo`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(20) NOT NULL,
  `nascimento` DATE NULL DEFAULT NULL,
  `sexo` CHAR(1) NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_exemplo`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_exemplo`.`produtos` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  `preco` DOUBLE NULL DEFAULT NULL,
  `estoque` INT NULL DEFAULT NULL,
  `imagem` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_produto`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_exemplo`.`vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_exemplo`.`vendas` (
  `id_venda` INT NOT NULL AUTO_INCREMENT,
  `qtd_total` INT NULL DEFAULT NULL,
  `valor_total` DOUBLE NULL DEFAULT NULL,
  `data_hora` DATETIME NULL DEFAULT NULL,
  `cancelado` TINYINT NULL DEFAULT NULL,
  `id_cliente` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  INDEX `fk_cliente` (`id_cliente` ASC),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `db_exemplo`.`clientes` (`id_cliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_exemplo`.`detalhes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_exemplo`.`detalhes` (
  `id_detalhe` INT NOT NULL AUTO_INCREMENT,
  `qtd` INT NULL DEFAULT NULL,
  `valor` DOUBLE NULL DEFAULT NULL,
  `id_produto` INT NOT NULL,
  `id_venda` INT NOT NULL,
  PRIMARY KEY (`id_detalhe`),
  INDEX `fk_prod` (`id_produto` ASC),
  INDEX `fk_vend` (`id_venda` ASC),
  CONSTRAINT `fk_prod`
    FOREIGN KEY (`id_produto`)
    REFERENCES `db_exemplo`.`produtos` (`id_produto`),
  CONSTRAINT `fk_vend`
    FOREIGN KEY (`id_venda`)
    REFERENCES `db_exemplo`.`vendas` (`id_venda`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `db_exemplo`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_exemplo`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL DEFAULT NULL,
  `usuario` VARCHAR(255) NULL DEFAULT NULL,
  `senha` VARCHAR(255) NULL DEFAULT NULL,
  `tipo` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = utf8mb3;


