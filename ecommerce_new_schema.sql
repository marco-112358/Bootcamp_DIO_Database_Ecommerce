-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`states` (
  `uf` CHAR(2) NOT NULL COMMENT 'Sigla da Unidade Federativa',
  `name_uf` CHAR(19) NOT NULL COMMENT 'Nome da Unidade Federativa',
  PRIMARY KEY (`uf`))
ENGINE = InnoDB
COMMENT = 'Tabela dos estados da federação.';


-- -----------------------------------------------------
-- Table `ecommerce`.`providers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`providers` (
  `idproviders` INT NOT NULL AUTO_INCREMENT,
  `cnpj` CHAR(14) NOT NULL COMMENT 'Número do CNPJ',
  `rsocial` VARCHAR(45) NOT NULL COMMENT 'Razão Social da Empresa',
  `contact_name` VARCHAR(45) NOT NULL COMMENT 'Nome para contato',
  `function_name` VARCHAR(45) NOT NULL COMMENT 'Descrição do cargo.',
  `email` VARCHAR(45) NOT NULL COMMENT 'email do contato',
  `phone` CHAR(11) NOT NULL COMMENT 'Telefone contato/empresa',
  `address` VARCHAR(45) NOT NULL COMMENT 'Endereço empresa',
  `neighborhood` VARCHAR(45) NOT NULL COMMENT 'Bairro empresa',
  `city` VARCHAR(45) NOT NULL COMMENT 'Cidade da empresa',
  `cep` CHAR(8) NOT NULL COMMENT 'Código de endereçamento postal da empresa',
  `states_uf` CHAR(2) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`idproviders`),
  INDEX `fk_providers_states_uf` (`states_uf` ASC) VISIBLE,
  CONSTRAINT `fk_providers_states_uf`
    FOREIGN KEY (`states_uf`)
    REFERENCES `ecommerce`.`states` (`uf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela de Fornecedores.';


-- -----------------------------------------------------
-- Table `ecommerce`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`products` (
  `idproducts` INT NOT NULL AUTO_INCREMENT,
  `description_prod` VARCHAR(70) NOT NULL COMMENT 'Descrição do produto',
  `unit` CHAR(3) NOT NULL COMMENT 'Unidade de medida do produto',
  `inventory_date` DATE NOT NULL COMMENT 'Data do inventário',
  `inventory_qtd` INT NOT NULL COMMENT 'Quantidade inventariado',
  `price_unit` FLOAT(7,2) NOT NULL COMMENT 'Preço unitário',
  `current_qtd` INT NOT NULL COMMENT 'Quantidade atual',
  `min_qtd` INT NOT NULL COMMENT 'Quantidade mínima do estoque',
  `discontinued` TINYINT NOT NULL DEFAULT 0 COMMENT '0 = Produto Continuado; 1 = Produto Descontinuado',
  PRIMARY KEY (`idproducts`))
ENGINE = InnoDB
COMMENT = 'Tabela de Produtos';


-- -----------------------------------------------------
-- Table `ecommerce`.`customers_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`customers_pf` (
  `idcustomers_pf` INT NOT NULL AUTO_INCREMENT COMMENT 'PK pessoa física',
  `cpf` CHAR(11) NOT NULL COMMENT 'Cadastro de Pessoa Física ',
  `fname` VARCHAR(45) NOT NULL COMMENT 'Primeiro Nome pessoa física',
  `lname` VARCHAR(45) NOT NULL COMMENT 'Último nome pessoa física',
  `sex` ENUM('M', 'F') NOT NULL COMMENT 'Gênero sexual pessoa física',
  `bdate` DATE NOT NULL COMMENT 'Data de Nascimento pessoa física',
  `email` VARCHAR(45) NOT NULL COMMENT 'Endereço email pessoa física',
  `phone` CHAR(11) NOT NULL COMMENT 'Número telefone pessoa física',
  `address` VARCHAR(45) NOT NULL COMMENT 'Endereço cliente pessoa física',
  `neighborhood` VARCHAR(45) NOT NULL COMMENT 'Bairro pessoa física',
  `city` VARCHAR(45) NOT NULL COMMENT 'Cidade pessoa física',
  `cep` CHAR(8) NOT NULL COMMENT 'Código de endereçamento postal pessoa física',
  `states_uf` CHAR(2) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`idcustomers_pf`),
  INDEX `fk_customers_pf_states_uf` (`states_uf` ASC) VISIBLE,
  CONSTRAINT `fk_customers_pf_states_uf`
    FOREIGN KEY (`states_uf`)
    REFERENCES `ecommerce`.`states` (`uf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela Clientes Pessoa Física';


-- -----------------------------------------------------
-- Table `ecommerce`.`customers_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`customers_pj` (
  `idcustomers_pj` INT NOT NULL AUTO_INCREMENT COMMENT 'PK pessoa Jurídica',
  `cnpj` CHAR(14) NOT NULL COMMENT 'Cadastro Nacional da Pessoa Jurídica',
  `rsocial` VARCHAR(45) NOT NULL COMMENT 'Razão Social',
  `contact_name` VARCHAR(45) NOT NULL COMMENT 'Nome responsável pessoa jurídica',
  `function_name` VARCHAR(45) NOT NULL COMMENT 'Cargo(função) pessoa jurídica',
  `email` VARCHAR(45) NOT NULL COMMENT 'Endereço email pessoa jurídica',
  `phone` CHAR(11) NOT NULL COMMENT 'Número telefone pessoa jurídia',
  `address` VARCHAR(45) NOT NULL COMMENT 'Endereço cliente pessoa jurídica',
  `neighborhood` VARCHAR(45) NOT NULL COMMENT 'Bairro pessoa jurídica',
  `city` VARCHAR(45) NOT NULL COMMENT 'Cidade pessoa jurídica',
  `cep` CHAR(8) NOT NULL COMMENT 'Código de endereçamento postal pessoa jurídica',
  `states_uf` CHAR(2) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`idcustomers_pj`),
  INDEX `fk_customers_pj_states_uf` (`states_uf` ASC) VISIBLE,
  CONSTRAINT `fk_customers_pj_states_uf`
    FOREIGN KEY (`states_uf`)
    REFERENCES `ecommerce`.`states` (`uf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela Clientes Pessoa Jurídica';


-- -----------------------------------------------------
-- Table `ecommerce`.`products_entry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`products_entry` (
  `idproducts_entry` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `providers_idproviders` INT NOT NULL,
  `nf` CHAR(12) NOT NULL COMMENT 'Nota Fiscal',
  `date_entry` DATE NOT NULL COMMENT 'Data emissão da Nota Fiscal',
  PRIMARY KEY (`idproducts_entry`),
  INDEX `fk_products_entry_providers_idproviders` (`providers_idproviders` ASC) VISIBLE,
  CONSTRAINT `fk_products_entry_providers_idproviders`
    FOREIGN KEY (`providers_idproviders`)
    REFERENCES `ecommerce`.`providers` (`idproviders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela para entrada(compra) de produtos';


-- -----------------------------------------------------
-- Table `ecommerce`.`products_entry_det`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`products_entry_det` (
  `products_entry_idproducts_entry` INT NOT NULL COMMENT 'FK - products_entry',
  `products_idproducts` INT NOT NULL COMMENT 'FK - products',
  `products_entry_qtd` INT NOT NULL COMMENT 'Quantidade da compra',
  `products_entry_price` FLOAT(7,2) NOT NULL COMMENT 'Preço unitário da compra',
  INDEX `fk_products_entry_det_products_entry_idproducts_entry` (`products_entry_idproducts_entry` ASC) VISIBLE,
  INDEX `fk_products_entry_det_products_idproducts` (`products_idproducts` ASC) VISIBLE,
  CONSTRAINT `fk_products_entry_det_products_entry_idproducts_entry`
    FOREIGN KEY (`products_entry_idproducts_entry`)
    REFERENCES `ecommerce`.`products_entry` (`idproducts_entry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_entry_det_products_idproducts`
    FOREIGN KEY (`products_idproducts`)
    REFERENCES `ecommerce`.`products` (`idproducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Detalha entrada(compra) de produtos';


-- -----------------------------------------------------
-- Table `ecommerce`.`type_payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`type_payments` (
  `idtype_payments` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `description_payment` CHAR(17) NOT NULL DEFAULT 'Cartão de crédito' COMMENT 'Descrição da forma de pagamento',
  PRIMARY KEY (`idtype_payments`))
ENGINE = InnoDB
COMMENT = 'Tabela tipos de pagamentos';


-- -----------------------------------------------------
-- Table `ecommerce`.`sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`sellers` (
  `idsellers` INT NOT NULL AUTO_INCREMENT,
  `fname_seller` VARCHAR(45) NOT NULL COMMENT 'Primeiro nome do vendedor',
  `lname_seller` VARCHAR(45) NOT NULL COMMENT 'Último nome do vendedor',
  `email_seller` VARCHAR(45) NOT NULL COMMENT 'email vendedor',
  `phone_seller` CHAR(11) NOT NULL COMMENT 'Telefone vendedor',
  PRIMARY KEY (`idsellers`))
ENGINE = InnoDB
COMMENT = 'Tabela vendedores(terceiros)';


-- -----------------------------------------------------
-- Table `ecommerce`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`orders` (
  `idorders` INT NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `order_date` DATE NOT NULL COMMENT 'Data do pedido',
  `type_payments_idtype_payments` INT NOT NULL,
  `sellers_idsellers` INT NOT NULL,
  `canceled` TINYINT NOT NULL DEFAULT 0 COMMENT '0 = confirmado\n1 = cancelado',
  `status` ENUM('in progress', 'delivered') NOT NULL DEFAULT 'in progress',
  PRIMARY KEY (`idorders`),
  INDEX `fk_orders_type_payments_idtype_payments` (`type_payments_idtype_payments` ASC) VISIBLE,
  INDEX `fk_orders_sellers_idsellers` (`sellers_idsellers` ASC) VISIBLE,
  CONSTRAINT `fk_orders_type_payments_idtype_payments`
    FOREIGN KEY (`type_payments_idtype_payments`)
    REFERENCES `ecommerce`.`type_payments` (`idtype_payments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_sellers_idsellers`
    FOREIGN KEY (`sellers_idsellers`)
    REFERENCES `ecommerce`.`sellers` (`idsellers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabela pedidos\n';


-- -----------------------------------------------------
-- Table `ecommerce`.`orders_details_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`orders_details_pf` (
  `orders_idorders` INT NOT NULL COMMENT 'FK - orders',
  `customers_pf_idcustomers_pf` INT NOT NULL COMMENT 'FK - customers_pf',
  `products_idproducts` INT NOT NULL COMMENT 'FK - products',
  `orders_details_pf_qtd` INT NOT NULL COMMENT 'Quantidade do pedido',
  INDEX `fk_orders_datails_pf_orders_idorders` (`orders_idorders` ASC) VISIBLE,
  INDEX `fk_orders_datails_pf_customers_pf_idcustomers_pf` (`customers_pf_idcustomers_pf` ASC) VISIBLE,
  INDEX `fk_orders_datails_pf_products_idproducts` (`products_idproducts` ASC) VISIBLE,
  CONSTRAINT `fk_orders_datails_pf_orders_idorders`
    FOREIGN KEY (`orders_idorders`)
    REFERENCES `ecommerce`.`orders` (`idorders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_datails_pf_customers_pf_idcustomers_pf`
    FOREIGN KEY (`customers_pf_idcustomers_pf`)
    REFERENCES `ecommerce`.`customers_pf` (`idcustomers_pf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_datails_pf_products_idproducts`
    FOREIGN KEY (`products_idproducts`)
    REFERENCES `ecommerce`.`products` (`idproducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`orders_details_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`orders_details_pj` (
  `orders_idorders` INT NOT NULL COMMENT 'FK - orders',
  `customers_pj_idcustomers_pj` INT NOT NULL COMMENT 'FK - customers_pj',
  `products_idproducts` INT NOT NULL COMMENT 'FK - products',
  `orders_details_pj_qtd` INT NOT NULL COMMENT 'quantidade do pedido',
  INDEX `fk_orders_details_pj_orders_idorders` (`orders_idorders` ASC) VISIBLE,
  INDEX `fk_orders_details_pj_customers_pj_idcustomers_pj` (`customers_pj_idcustomers_pj` ASC) VISIBLE,
  INDEX `fk_orders_details_pj_products_idproducts` (`products_idproducts` ASC) VISIBLE,
  CONSTRAINT `fk_orders_details_pj_orders_idorders`
    FOREIGN KEY (`orders_idorders`)
    REFERENCES `ecommerce`.`orders` (`idorders`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_details_pj_customers_pj_idcustomers_pj`
    FOREIGN KEY (`customers_pj_idcustomers_pj`)
    REFERENCES `ecommerce`.`customers_pj` (`idcustomers_pj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_details_pj_products_idproducts`
    FOREIGN KEY (`products_idproducts`)
    REFERENCES `ecommerce`.`products` (`idproducts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
