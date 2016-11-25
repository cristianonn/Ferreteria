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
-- procedure agregarEmpleado
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarEmpleado`(
IN pId varchar(15),
IN pNombre varchar(45),
IN pApellidos varchar(45),
IN pTel varchar(15),
IN pFechaI DATE,
IN pVacas INT(11),
IN pTipo INT(11)
)
BEGIN
	INSERT INTO `ferreterias`.`empleado`
(`idEmpleado`,
`nombreEmpleado`,
`apellidosEmpleado`,
`telEmpleado`,
`fechaEntrada`,
`vacacionesEmpleado`,
`TipoEmpleado_idTipoEmpleado`)
	VALUES
(pId,
pNombre,
pApellidos,
pTel,
pFechaI,
pVacas,
pTipo);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure eliminarLineaInventario
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarLineaInventario`(in pidProducto varchar(20), IN pidFerreteria INT)
BEGIN
	DELETE FROM `ferreterias`.`inventarioporferreteria`
	WHERE Producto_idProducto = pidProducto
	AND ferreteria_idFerreteria = pidFerreteria;
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
-- procedure getEmpleados
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEmpleados`()
BEGIN
	Select * FROM empleado;
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
	select idProducto, nombreProducto, precioProducto, imagenProducto AS fotoProducto,
		descripcionProducto, nombreMarca AS marcaProducto, aspectosTecnicosProducto,
		utilidadProducto, garantia, nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad,
		nombreFerreteria, numeroEstante, numeroPasillo
	from Producto, Departamento, inventarioPorFerreteria, Ferreteria, 
	estante, estanteporpasillo, pasillo, imagenesProducto, Marca
	WHERE pId = Producto.idProducto
	AND Producto.idProducto = inventarioporferreteria.Producto_idProducto
	AND fId = Ferreteria.idFerreteria
	AND Ferreteria.idFerreteria = inventarioporferreteria.ferreteria_idFerreteria
	AND Producto.idProducto = imagenesProducto.Producto_idProducto
	AND Marca.idMarca = Producto.Marca_idMarca
	AND Departamento.idDepartamento = Producto.departamento_idDepartamento
	AND inventarioporferreteria.estanteporpasillo_idestantePorpasillo = estanteporpasillo.idestantePorpasillo
	AND estanteporpasillo.estante_idEstante = Estante.idEstante
	AND estanteporpasillo.pasillo_idPasillo = Pasillo.idPasillo;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProductos
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductos`()
BEGIN
	SELECT idProducto, nombreProducto, precioProducto, descripcionProducto,
	garantia, nombreDepartamento, nombreMarca
	FROM Producto, Departamento, Marca 
	WHERE departamento_idDepartamento = idDepartamento
	AND Marca_idMarca = idMarca;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getTipoEmpleados
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTipoEmpleados`()
BEGIN
	Select * from tipoempleado;
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
 select idProducto, nombreProducto, descripcionProducto, precioProducto, 
 imagenProducto AS fotoProducto 
 FROM Producto, imagenesProducto
 WHERE idProducto = producto_idproducto
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
	SELECT idProducto, nombreProducto, precioProducto,
		descripcionProducto, nombreMarca AS marcaProducto, 
		nombreDepartamento,
		inventarioPorFerreteria.cantidad AS cantidad
	FROM Producto, Departamento, inventarioPorFerreteria, Marca
	WHERE ferreteria_idFerreteria = pidFerreteria
	AND Producto_idProducto = idProducto
	AND departamento_idDepartamento = idDepartamento
	AND idMarca = Marca_idMarca;
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