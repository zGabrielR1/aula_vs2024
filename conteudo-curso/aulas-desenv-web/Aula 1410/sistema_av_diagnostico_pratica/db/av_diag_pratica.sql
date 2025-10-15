-- -----------------------------------------------------
-- Schema av_diag_pratica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `av_diag_pratica` DEFAULT CHARACTER SET utf8 ;
USE `av_diag_pratica` ;

-- -----------------------------------------------------
-- Table `av_diag_pratica`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `av_diag_pratica`.`usuarios` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `usuario` VARCHAR(255) NULL,
  `senha` VARCHAR(255) NULL,
  PRIMARY KEY (`id_usuario`))
  INSERT INTO `av_diag_pratica`.`colaboradores` (`id_colaborador`, `nome`, `usuario`, `senha`) VALUES ('1', 'Administrador', 'admin', '123');
  -- --------------------------------------------------------------
 CREATE TABLE IF NOT EXISTS `av_diag_pratica`.`colaboradores` (
  `id_colaborador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `telefone` VARCHAR(255) NULL,
  `sexo` TINYINT NULL,
  `usuario` VARCHAR(255) NULL,
  `senha` VARCHAR(255) NULL,
  PRIMARY KEY (`id_colaborador`));
    -- --------------------------------------------------------------
  CREATE TABLE IF NOT EXISTS `av_diag_pratica`.`itens` (
  `id_item` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL,
  `marca` VARCHAR(255) NULL,
  `preco` VARCHAR(255) NULL,
  `estoque` VARCHAR(255) NULL,
  PRIMARY KEY (`id_item`));
  INSERT INTO `av_diag_pratica`.`itens` (`id_item`, `descricao`, `marca`, `preco`, `estoque`) VALUES ('1', 'coca', 'Coca-Cola', '12', '100');
ENGINE = InnoDB;