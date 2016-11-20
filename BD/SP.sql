-- -----------------------------------------------------
-- procedure seleccionar6Random
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar6Random`()
BEGIN
 select idProducto,nombreProducto, descripcionProducto, precioProducto, fotoProducto FROM Producto
 ORDER BY RAND()
 LIMIT 6;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId varchar(20)
)
BEGIN
	select * from Producto
    where pId = Producto.idProducto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarTodosProductos
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarTodosProductos`()
BEGIN
 select * from Producto;
END$$

DELIMITER ;
