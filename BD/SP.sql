-- -----------------------------------------------------
-- procedure agregarABackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarABackOrder`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporbackorder`
		(`Producto_idProducto`,
		`ferreteria_idFerreteria`,
		`cliente_idCliente`)
		VALUES
		(pId,
		fId,
		cId);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarACarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarACarrito`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
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

-- -----------------------------------------------------
-- procedure estaEnBackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnBackOrder`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorBackOrder
    where Producto_idProducto = pId
    AND ferreteria_idFerreteria = fId
    AND cliente_idCliente = cId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure estaEnCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnCarrito`(IN pId varchar(20), IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorCarrito
    where Producto_idProducto = pId
    AND ferreteria_idFerreteria = fId
    AND cliente_idCliente = cId;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCantidadBackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadBackOrder`(in userid INT)
BEGIN
select  count(p.Producto_idProducto) as cantidad
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join productoporbackorder p
on p.Cliente_idCliente = c.idCliente
where u.idusuarioCliente = userid;
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
-- procedure getProductoEnFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoEnFerreteria`(IN pId varchar(20), IN fId INT)
BEGIN
	select idProducto, nombreProducto, precioProducto, fotoProducto,
		descripcionProducto, marcaProducto, aspectosTecnicosProducto,
		utilidadProducto, garantia, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad,
		nombreFerreteria, numeroEstante, numeroPasillo
	from Producto, Departamento, inventarioPorFerreteria, Ferreteria, estante, productoporestante, estanteporpasillo, pasilloporferreteria, pasillo
    where pId = Producto.idProducto
    AND Producto_idProducto = idProducto
    AND ferreteria_idFerreteria = fId
    AND ferreteria_idFerreteria = idFerreteria
    AND producto_idProductoEnEstante = pId
    AND estantePorpasillo_idestantePorpasillo = idestantePorpasillo
    AND estante_idEstante = idEstante
    AND pasilloporferreteria_idpasilloporferreteria = idpasilloporferreteria
    AND idPasillo = pasillo_idPasillo
    AND departamento_idDepartamento = idDepartamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getUser
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productosCarrito
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosCarrito`(in username varchar(50))
BEGIN
select s.nombreProducto, s.precioProducto, s.descripcionProducto, s.idProducto, s.fotoProducto
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join carrito K
on k.Cliente_idCliente = c.idCliente
join productoporcarrito p 
on p.carrito_idcarrito = k.idCarrito
join producto s 
on s.idProducto = p.producto_idproducto 
where u.usuarioCliente = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure productosbackorder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosbackorder`(in username varchar(50))
BEGIN
select s.nombreProducto, s.precioProducto, s.descripcionProducto, s.idProducto, s.fotoProducto
from cliente c
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join backorder K
on k.Cliente_idCliente = c.idCliente
join productoporbackorder p 
on p.backorder_idbackorder = k.idbackorder
join producto s 
on s.idProducto = p.producto_idproducto 
where u.usuarioCliente = username;
END$$

DELIMITER ;

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
-- procedure seleccionarFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarFerreteria`()
BEGIN
	select * from ferrteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId varchar(20),
IN pFerreteria VARCHAR(45)
)
BEGIN
	select p.idProducto, p.nombreProducto, p.precioProducto, p.descripcionProducto,i.cantidad from Producto p
    JOIN inventarioporferreteria i
    ON producto_idProducto = pId
    where pId = p.idProducto AND i.ferreteria_idFerreteria = pFerreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure seleccionarProductosPorFerreteria
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProductosPorFerreteria`( IN pidFerreteria INT )
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
-- procedure getUsuarioEmpleado
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUsuarioEmpleado`(in username varchar(50))
BEGIN
select u.idUsuarioEmpleado AS userID , e.nombreEmpleado AS nombreEmpleado, 
e.apellidosEmpleado AS apellidosEmpleado, u.nombreusuario AS usuarioEmpleado, 
u.contrasennaUsuario AS contrasenaEmpleado
from empleado e 
join usuarioEmpleado u
on u.empleado_idempleado = e.idEmpleado 
where u.nombreUsuario = username;
END$$

DELIMITER ;