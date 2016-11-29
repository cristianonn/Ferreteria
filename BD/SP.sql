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
	SELECT * FROM ferreterias.usuarioempleado;INSERT INTO `ferreterias`.`cliente`
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

	DELIMITER ;

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
	-- procedure getMejorEmpleado
	-- -----------------------------------------------------
	DELIMITER $$
	USE `ferreterias`$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `verMejorEmpleado`()
	BEGIN
	select venta.empleado_idEmpleado as  id, e.nombreEmpleado, e.apellidosEmpleado ,venta.ventas
	FROM
		(select empleado_idEmpleado,sum(precioPedido) as ventas
		from (
		select empleado_idEmpleado, precioPedido
		from pedidoonline
		WHERE fechaPedido BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE())
	    as precio
	    GROUP BY empleado_idEmpleado
	    ORDER BY ventas DESC) venta
	    LEFT JOIN amonestacion a
	    ON a.Empleado_idEmpleadoAmonestacion = venta.empleado_idEmpleado and a.fecha BETWEEN (CURRENT_DATE() - INTERVAL 6 MONTH) AND CURRENT_DATE()
	    JOIN empleado e
	    ON e.idEmpleado = venta.empleado_idEmpleado
	    WHERE a.idAmonestacion IS NULL
	    limit 1;
	END$$

	DELIMITER ;
