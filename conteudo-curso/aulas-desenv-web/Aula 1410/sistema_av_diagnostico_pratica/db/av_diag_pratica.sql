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
  INSERT INTO `av_diag_pratica`.`usuarios` (`id_usuario`, `nome`, `usuario`, `senha`) VALUES ('1', 'Administrador', 'admin', '123');
ENGINE = InnoDB;