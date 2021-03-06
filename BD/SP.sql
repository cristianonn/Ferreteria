-- -----------------------------------------------------
-- procedure agregarABackOrder
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarABackOrder`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarACarrito`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`productoporcarrito`
		(`inventarioporferreteria_idinventarioPorFerreteria`,
		`cliente_idCliente`)
		SELECT idInventarioPorFerreteria, cId FROM InventarioPorFerreteria
			WHERE Producto_idProducto = pId
            AND Ferreteria_idFerreteria = fId 
           	LIMIT 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarEmpleado
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarEmpleado`(
IN pId VARCHAR(15),
IN pNombre varchar(100),
IN pApellidos varchar(100),
IN pTel varchar(15),
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
UTC_DATE(),
0,
pTipo);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure eliminarLineaInventario
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarLineaInventario`(in pidProducto INT, IN pidFerreteria INT)
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnBackOrder`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `estaEnCarrito`(IN pId INT, IN fId INT, IN cId VARCHAR(25))
BEGIN
	select COUNT(Producto_idProducto) as cantidad
	from ProductoPorCarrito, InventarioPorFerreteria
    where idInventarioPorFerreteria = inventarioporferreteria_idinventarioPorFerreteria
    AND InventarioPorFerreteria.ferreteria_idFerreteria = fId
    AND InventarioPorFerreteria.Producto_idProducto = pId
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
SELECT COUNT(idProductoPorCarrito) AS cantidad
FROM ProductoPorCarrito, cliente, usuariocliente
WHERE UsuarioCliente.cliente_idCliente = userid
AND UsuarioCliente.cliente_idCliente = idCliente
AND ProductoPorCarrito.Cliente_idCliente = idCliente;
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
	Select idEmpleado, nombreEmpleado, apellidosEmpleado,
		telEmpleado, fechaEntrada,vacacionesEmpleado, tipo
	FROM empleado, tipoempleado
	WHERE TipoEmpleado_idTipoEmpleado = idTipoEmpleado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getChoferes
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getChoferes`()
BEGIN
	Select idEmpleado, nombreEmpleado, apellidosEmpleado
	FROM empleado, tipoempleado
	WHERE TipoEmpleado_idTipoEmpleado = idTipoEmpleado
	AND idTipoEmpleado = 5;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductoEnFerreteria`(IN pId INT, IN fId INT)
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `productosCarrito`
(in idUsuario INT)
BEGIN
	SELECT imagenProducto, nombreProducto, nombreMarca, precioProducto, 
		ixf.idInventarioPorFerreteria AS idInventario, ixf.cantidad AS disponible,
		nombreFerreteria
	FROM UsuarioCliente uc, Cliente c, ProductoPorCarrito pxc,
		InventarioPorFerreteria ixf, Producto p, ImagenesProducto ip,
		Marca m, Ferreteria f
	WHERE idUsuario = uc.idUsuarioCliente 
	AND uc.cliente_idCliente = c.idCliente
	AND c.idCliente = pxc.Cliente_idCliente
	AND pxc.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	AND p.idProducto = ip.Producto_idProducto
	AND p.Marca_idMarca = m.idMarca
	AND ixf.ferreteria_idFerreteria = f.idFerreteria;
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
IN pId INT,
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

-- -----------------------------------------------------
-- procedure getDepartamentos
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartamentos`()
BEGIN
 select idDepartamento, nombreDepartamento
 FROM Departamento;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getMarcas
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMarcas`()
BEGIN
 select idMarca, nombreMarca
 FROM Marca;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarProducto
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProducto`
(IN pNombre VARCHAR(100), IN pPrecio FLOAT, IN pDescripcion VARCHAR(200),
	IN pAspectosTecnicos VARCHAR(100), IN pUtilidad VARCHAR(100),
	IN pGarantia INT, IN pIdDepartamento VARCHAR(45), IN pIdMarca INT)
BEGIN
 INSERT INTO `ferreterias`.`producto`
	(`nombreProducto`,
	`precioProducto`,
	`descripcionProducto`,
	`aspectosTecnicosProducto`,
	`utilidadProducto`,
	`garantia`,
	`departamento_idDepartamento`,
	`Marca_idMarca`)
	VALUES
	(pNombre,
	pPrecio,
	pDescripcion,
	pAspectosTecnicos,
	pUtilidad,
	pGarantia,
	pIdDepartamento,
	pIdMarca);
 SELECT LAST_INSERT_ID() AS idProducto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarImagenProducto
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarImagenProducto`
(IN pId INT, IN pImagenProducto VARCHAR(100))
BEGIN
 INSERT INTO `ferreterias`.`imagenesproducto`
	(`imagenProducto`,
	`producto_idProducto`)
	VALUES
	(pImagenProducto,
	pId);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarProductoAInventarios
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarProductoAInventarios`
(IN pId INT)
BEGIN
INSERT INTO `ferreterias`.`inventarioporferreteria`
	(`cantidad`,
	`ferreteria_idFerreteria`,
	`estanteporpasillo_idestantePorpasillo`,
	`producto_idProducto`)
	SELECT 0 AS cantidad, idFerreteria, 1 AS estanteporpasillo_idestantePorpasillo, 
    pId AS producto_idProducto
		FROM Ferreteria;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarProductoAInventarios
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProducto`
(IN pId INT)
BEGIN
	DELETE FROM `ferreterias`.`ProductoPorCarrito`
	WHERE inventarioporferreteria_idinventarioPorFerreteria IN 
		(SELECT idinventarioPorFerreteria
			FROM InventarioPorFerreteria
			WHERE producto_idProducto = pId);
	DELETE FROM `ferreterias`.`inventarioporferreteria`
	WHERE producto_idProducto = pId;
    DELETE FROM `ferreterias`.`imagenesProducto`
	WHERE producto_idProducto = pId;
    DELETE FROM `ferreterias`.`producto`
	WHERE idProducto = pId;
END$$

DELIMITER ;


	-- -----------------------------------------------------
	-- procedure agregarCliente
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE PROCEDURE `agregarCliente` (
	IN pId VARCHAR(25),
	IN pNombre VARCHAR(25),
	IN pApellidos VARCHAR(45),
	IN pTel VARCHAR(15),
	IN pCorreo VARCHAR(45)
	)
	BEGIN
	INSERT INTO `ferreterias`.`cliente`
	(`idCliente`,
	`nombreCliente`,
	`apellidosCliente`,
	`telCliente`,
	`correoCliente`)
	VALUES
	(pId,
	pNombre,
	pApellidos,
	pTel,
	pCorreo);

	END$$

	-- -----------------------------------------------------
	-- procedure getClientes
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE PROCEDURE `getClientes` ()
	BEGIN
		SELECT * from cliente;
	END$$

	DELIMITER ;



	-- -----------------------------------------------------
	-- procedure eliminarCliente
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCliente`(IN pId INT)
	BEGIN
		DELETE FROM `ferreterias`.`cliente`
		WHERE idCliente = pId;
	    DELETE FROM `ferreterias`.`usuariocliente`
		WHERE cliente_idCliente = pId;
	END$$

	DELIMITER ;



	-- -----------------------------------------------------
	-- procedure getDepartamentos
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE PROCEDURE `getDepartamento` ()
	BEGIN
		SELECT * from departamentos;
	END$$

	DELIMITER ;


	-- -----------------------------------------------------
	-- procedure getPasillos
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE PROCEDURE `getPasillos` ()
	BEGIN
		SELECT * FROM pasillo;
	END$$

	DELIMITER ;

	-- -----------------------------------------------------
	-- procedure verMejorFerreteria
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `verMejorFerreteria`()
	BEGIN
	select ferreteria_idFerreteria,sum(precioProducto) as ventas
	from (
	select i.ferreteria_idFerreteria, p.precioProducto
	from productoporpedido q
    JOIN inventarioporferreteria i
    ON q.inventarioporferreteria_idinventarioPorFerreteria = i.idinventarioPorFerreteria
    JOIN producto p
    ON i.producto_idProducto = p.idProducto
    JOIN pedidoonline r 
    ON q.Pedido_idPedido = r.idPedido
    WHERE r.fechaPedido BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE()) 
    as precio
    GROUP BY ferreteria_idferreteria
    ORDER BY precioProducto DESC
    LIMIT 1;
	END$$
	DELIMITER ;

	-- -----------------------------------------------------
	-- procedure ventasFerreterias
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `ventasFerreterias`
	(IN fecha1 DATE, IN fecha2 DATE)
	BEGIN
		SELECT idFerreteria, nombreFerreteria, SUM(pxp.cantidad * p.precioProducto) AS ventas
		FROM Ferreteria f, ProductoPorPedido pxp, InventarioPorFerreteria ixf, Producto p, PedidoOnline po
		WHERE f.idFerreteria = ixf.Ferreteria_idFerreteria
		AND ixf.idInventarioPorFerreteria = pxp.inventarioporferreteria_idinventarioPorFerreteria
        AND pxp.Pedido_idPedido = po.idPedido
		AND ixf.Producto_idProducto = p.idProducto
		AND po.fechaPedido BETWEEN (fecha1) AND (fecha2)
        GROUP BY idferreteria
        ORDER BY ventas DESC;
	END$$
	DELIMITER ;

	-- -----------------------------------------------------
	-- procedure getEstantes
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE PROCEDURE `getEstantes` ()
	BEGIN
		Select * from estante;
	END$$

	DELIMITER ;


		-- -----------------------------------------------------
	-- procedure verMejorEmpleado
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `verMejorEmpleado`
	(IN fecha1 DATE, IN fecha2 DATE)
	BEGIN
	SELECT idEmpleado, nombreEmpleado, apellidosEmpleado, 
		SUM(pxp.cantidad * p.precioProducto) AS ventas
	FROM Empleado e, PedidoOnline po, ProductoPorPedido pxp,
		InventarioPorFerreteria ixf, Producto p, Amonestacion a
	WHERE e.idEmpleado = po.empleado_idempleado
	AND po.fechaPedido BETWEEN (fecha1) AND (fecha2)
	AND po.idPedido = pxp.Pedido_idPedido
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	AND idEmpleado NOT IN (SELECT Empleado_idEmpleadoAmonestacion 
		FROM Amonestacion
		WHERE fecha > (NOW() - INTERVAL 6 MONTH))
	GROUP BY idEmpleado
    ORDER BY ventas DESC;
	END$$

	DELIMITER ;

-- -----------------------------------------------------
-- procedure eliminarDeCarrito
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarDeCarrito`
(IN pidInventario INT, IN pidCliente VARCHAR(45))
BEGIN
	DELETE FROM `ferreterias`.`productoporcarrito`
		WHERE cliente_idCliente = (SELECT idCliente 
			FROM Cliente c, UsuarioCliente uc
			WHERE pidCliente = uc.idUsuarioCliente
			AND uc.Cliente_idCliente = c.idCliente)
		AND inventarioporferreteria_idinventarioPorFerreteria = pidInventario;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure hacerPedido
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `hacerPedido`
(IN pidCliente VARCHAR(25), IN pIdEmpleado VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`PedidoOnline`
		(`fechaPedido`,
		`precioPedido`,
		`estadoPedido`,
		`Cliente_idCliente`,
		`empleado_idempleado`)
	SELECT UTC_DATE(), 
		0,
		"No despachado",
		idCliente,
		pIdEmpleado
	FROM Cliente c, UsuarioCliente uc
	WHERE pidCliente = uc.idUsuarioCliente
	AND uc.Cliente_idCliente = c.idCliente;
	SELECT LAST_INSERT_ID() AS idPedido;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarAPedido
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarAPedido`
(IN pidInventario INT, IN pidPedido INT, IN pCantidad INT)
BEGIN
	UPDATE `ferreterias`.`inventarioporferreteria`
	SET
	`cantidad` = `cantidad` - pCantidad
	WHERE `idinventarioPorFerreteria` = pidInventario;
	INSERT INTO `ferreterias`.`ProductoPorPedido`
		(`Pedido_idPedido`,
		`vistoBueno`,
		`inventarioporferreteria_idinventarioPorFerreteria`,
		`cantidad`)
	VALUES
		(pidPedido,
		0,
		pidInventario,
		pCantidad);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getProductosDePedido
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getProductosDePedido`
(IN pidPedido INT)
BEGIN
	SELECT nombreProducto, nombreFerreteria, pxp.cantidad AS cantidad, 
		SUM(pxp.cantidad * precioProducto) AS precio
	FROM ProductoPorPedido pxp, InventarioPorFerreteria ixf, Ferreteria f,
		Producto p
	WHERE pidPedido = pxp.Pedido_idPedido
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.ferreteria_idFerreteria = f.idFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	GROUP BY p.idProducto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getTotalPedido
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotalPedido`
(IN pidPedido INT)
BEGIN
	SELECT SUM(pxp.cantidad * precioProducto) AS precio
	FROM ProductoPorPedido pxp, InventarioPorFerreteria ixf, 
		Producto p
	WHERE pidPedido = pxp.Pedido_idPedido
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getClientesSinRuta
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientesSinRuta`()
BEGIN
	SELECT idCliente, nombreCliente, apellidosCliente, direccion
	FROM Cliente c
	WHERE c.idCliente NOT IN (SELECT Cliente_idCliente
		FROM RutaPorCliente rxc);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure crearRuta
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearRuta`
(IN pzona VARCHAR(100), IN pIdEmpleado VARCHAR(15))
BEGIN
	INSERT INTO `ferreterias`.`Ruta`
		(`estadoRuta`,
		`fechaRuta`,
		`Empleado_idEmpleado`,
		`zona`)
	VALUES
		("En espera",
		UTC_DATE(),
		pIdEmpleado,
		pzona);
	SELECT LAST_INSERT_ID() AS idRuta;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure agregarClienteARuta
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `agregarClienteARuta`
(IN pidRuta INT, IN pidCliente VARCHAR(25))
BEGIN
	INSERT INTO `ferreterias`.`RutaPorCliente`
		(`Ruta_idRuta`,
		`cliente_idCliente`)
	VALUES
		(pidRuta, pidCliente);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getRutas
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRutas`()
BEGIN
	SELECT idRuta, zona
	FROM Ruta;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getClientesPorRuta
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getClientesPorRuta`
(IN pIdRuta INT)
BEGIN
	SELECT idCliente, nombreCliente, apellidosCliente, latitud, longitud
	FROM Cliente c, RutaPorCliente rxc, Ruta r
	WHERE pIdRuta = r.idRuta
	AND r.idRuta = rxc.Ruta_idRuta
	AND rxc.Cliente_idCliente = c.idCliente;
END$$

DELIMITER ;



-- -----------------------------------------------------
-- procedure organizarPasillos
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `organizarPasillos`(IN pIdFerreteria int(11))
BEGIN
	Select  q.idProducto, q.nombreProducto, p.idPasillo, f.idEstante, sum(r.cantidad) as cantidad
    FROM inventarioporferreteria i
    LEFT JOIN estanteporpasillo e
    ON i.estanteporpasillo_idestantePorpasillo = e.idestantePorpasillo
    INNER JOIN estante f
    ON e.estante_idEstante = f.idEstante
    INNER JOIN pasillo p
    ON p.idPasillo = e.pasillo_idPasillo
    INNER JOIN producto q
    ON q.idProducto = i.producto_idProducto
	LEFT JOIN productoporpedido r
    ON r.inventarioporferreteria_idinventarioPorFerreteria = i.idinventarioPorFerreteria
    WHERE i.ferreteria_idFerreteria = pIdFerreteria
    GROUP BY q.idProducto
    Order BY sum(r.cantidad) DESC, p.idPasillo;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure ventasRutas
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ventasRutas`
(IN fecha1 DATE, IN fecha2 DATE)
BEGIN
	SELECT idRuta, zona, SUM(idPedido) as articulos,
		SUM(pxp.cantidad * p.precioProducto) AS ventas
	FROM Ruta r, RutaPorCliente rxc, Cliente c, PedidoOnline po,
		ProductoPorPedido pxp, Producto p, inventarioPorFerreteria ixf
	WHERE r.idRuta = rxc.Ruta_idRuta
	AND rxc.Cliente_idCliente = c.idCliente
	AND po.Cliente_idCliente = c.idCliente
	AND po.idPedido = pxp.Pedido_idPedido
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	AND po.fechaPedido BETWEEN (fecha1) AND (fecha2)
    GROUP BY idRuta
    ORDER BY ventas DESC;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure getPedidosPorRuta
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidosPorRuta`
(IN pIdRuta INT)
BEGIN
	SELECT idPedido, nombreCliente, apellidosCliente, estadoPedido,
		fechaPedido, SUM(pxp.cantidad * precioProducto) AS total
	FROM Ruta r, RutaPorCliente rxc, Cliente c, PedidoOnline po,
		ProductoPorPedido pxp, Producto p, inventarioPorFerreteria ixf
	WHERE pIdRuta = r.idRuta
	AND r.idRuta = rxc.Ruta_idRuta
	AND rxc.Cliente_idCliente = c.idCliente
	AND c.idCliente = po.Cliente_idCliente
	AND po.idPedido = pxp.Pedido_idPedido
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	GROUP BY idPedido;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure getPedidosPorRutaNoDespachados
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidosPorRutaNoDespachados`
(IN pIdRuta INT)
BEGIN
	SELECT idPedido, nombreCliente, apellidosCliente, estadoPedido,
		fechaPedido, SUM(pxp.cantidad * precioProducto) AS total
	FROM Ruta r, RutaPorCliente rxc, Cliente c, PedidoOnline po,
		ProductoPorPedido pxp, Producto p, inventarioPorFerreteria ixf
	WHERE pIdRuta = r.idRuta
	AND r.idRuta = rxc.Ruta_idRuta
	AND rxc.Cliente_idCliente = c.idCliente
	AND c.idCliente = po.Cliente_idCliente
	AND po.idPedido = pxp.Pedido_idPedido
	AND po.estadoPedido = "No despachado"
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	GROUP BY idPedido;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure despacharPedido
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `despacharPedido`
(IN pIdPedido INT)
BEGIN
	UPDATE `ferreterias`.`pedidoonline`
	SET
		`estadoPedido` = "Entregando"
	WHERE `idPedido` = pIdPedido;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure getPedidosPorRutaPendientes
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPedidosPorRutaPendientes`
(IN pIdRuta INT)
BEGIN
	SELECT idPedido, nombreCliente, apellidosCliente, estadoPedido,
		fechaPedido, SUM(pxp.cantidad * precioProducto) AS total,
		c.latitud as latitud, c.longitud as longitud
	FROM Ruta r, RutaPorCliente rxc, Cliente c, PedidoOnline po,
		ProductoPorPedido pxp, Producto p, inventarioPorFerreteria ixf
	WHERE pIdRuta = r.idRuta
	AND r.idRuta = rxc.Ruta_idRuta
	AND rxc.Cliente_idCliente = c.idCliente
	AND c.idCliente = po.Cliente_idCliente
	AND po.idPedido = pxp.Pedido_idPedido
	AND po.estadoPedido = "Entregando"
	AND pxp.inventarioporferreteria_idinventarioPorFerreteria = ixf.idInventarioPorFerreteria
	AND ixf.Producto_idProducto = p.idProducto
	GROUP BY idPedido;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure reportarAmonestacion
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reportarAmonestacion`
(IN pMotivo VARCHAR(200), IN pIdEmpleado VARCHAR(15))
BEGIN
	INSERT INTO `ferreterias`.`amonestacion`
		(`motivoAmonestacion`,
		`fecha`,
		`Empleado_idEmpleadoAmonestacion`)
	VALUES
		(pMotivo,
		UTC_DATE(),
		pIdEmpleado);

END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure getMarcasVehiculos
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMarcasVehiculos`()
BEGIN
	SELECT idMarcaVehiculo, nombreMarcaVehiculo
	FROM MarcaVehiculo;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure getModelosVehiculos
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getModelosVehiculos`()
BEGIN
	SELECT idModeloVehiculo, nombreModeloVehiculo, nombreMarcaVehiculo
	FROM ModeloVehiculo, MarcaVehiculo
	WHERE MarcaVehiculo_idMarcaVehiculo = idMarcaVehiculo;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure getVehiculos
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVehiculos`()
BEGIN
	SELECT placaVehiculo, nombreModeloVehiculo, nombreMarcaVehiculo,
		annoVehiculo, nombreEmpleado, apellidosEmpleado
	FROM Vehiculo v
    INNER JOIN ModeloVehiculo modelo
	ON v.ModeloVehiculo_idModeloVehiculo = modelo.idModeloVehiculo
    INNER JOIN MarcaVehiculo marca
	ON modelo.MarcaVehiculo_idMarcaVehiculo = marca.idMarcaVehiculo
    LEFT JOIN VehiculoPorEmpleado vxe
	ON v.placaVehiculo = vxe.Vehiculo_placaVehiculo
    LEFT JOIN Empleado e
	ON vxe.Empleado_idEmpleado = e.idEmpleado;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- procedure reportarGastosVehiculo
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reportarGastosVehiculo`
(IN pPlaca VARCHAR(10), IN pKilometros FLOAT, IN pGasolina FLOAT)
BEGIN
	UPDATE `ferreterias`.`vehiculo`
	SET
		`gasolina` = gasolina + pGasolina,
		`kilometros` = kilometros + pKilometros
	WHERE `placaVehiculo` = pPlaca;

END$$
DELIMITER ;