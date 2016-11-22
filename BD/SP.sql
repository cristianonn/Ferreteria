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


-- -----------------------------------------------------
-- procedure getUser (para iniciar sesión)
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(in username varchar(50))
BEGIN
select u.idUsuarioCliente AS userID , c.nombreCliente AS nombreCliente, 
c.apellidosCliente AS apellidosCliente, u.usuarioCliente AS usuariocliente, 
u.contrasenaCliente AS contrasenaCliente
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente 
where u.usuarioCliente = username;
END $$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCarrito
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarrito`(in username varchar(50))
BEGIN
select  p.Producto_idProducto
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporcarrito p
on p.Cliente_idCliente = c.idCliente
where u.usuarioCliente = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCantidadCarrito
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadCarrito`(in userid INT)
BEGIN
select  count(p.Producto_idProducto) as cantidad
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporcarrito p
on p.Cliente_idCliente = c.idCliente
where u.idusuarioCliente = userid;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getFerreterias
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFerreterias`()
BEGIN
SELECT * FROM Ferreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProductosPorFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProductosPorFerreteria`
( IN pidFerreteria INT )
BEGIN
	SELECT idProducto, nombreProducto, precioProducto, fotoProducto,
		descripcionProducto, marcaProducto, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad
	FROM Producto, Departamento, inventarioPorFerreteria
	WHERE ferreteria_idFerreteria = pidFerreteria
	AND Producto_idProducto = idProducto
	AND departamento_idDepartamento = idDepartamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProductoENFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoEnFerreteria`
(IN pId varchar(20), IN fId INT)
BEGIN
	select idProducto, nombreProducto, precioProducto, fotoProducto,
		descripcionProducto, marcaProducto, aspectosTecnicosProducto,
		utilidadProducto, garantia, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad,
		nombreFerreteria
	from Producto, Departamento, inventarioPorFerreteria, Ferreteria
    where pId = Producto.idProducto
    AND Producto_idProducto = idProducto
    AND ferreteria_idFerreteria = fId
    AND ferreteria_idFerreteria = idFerreteria
    AND departamento_idDepartamento = idDepartamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure estaEnCarrito
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnCarrito`
(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorCarrito
    where Producto_idProducto = pId
    AND ferreteria_idFerreteria = fId
    AND cliente_idCliente = cId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarACarrito
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarACarrito`
(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporcarrito`
		(`Producto_idProducto`,
		`ferreteria_idFerreteria`,
		`cliente_idCliente`)
		VALUES
		(pId,
		fId,
		cId);
END$$

DELIMITER ;

