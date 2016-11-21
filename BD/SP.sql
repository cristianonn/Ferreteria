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
-- procedure getUser
-- -----------------------------------------------------

DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(in username varchar(50))
BEGIN
select c.nombreCliente, c.apellidosCliente, u.usuarioCliente, u.contrasenaCliente
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
select  u.usuarioCliente, p.Producto_idProducto
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join carrito K
on k.Cliente_idCliente = c.idCliente
join productoporcarrito p 
on p.carrito_idcarrito = k.idCarrito 
where u.usuarioCliente = username;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure getCantidadProductos
-- -----------------------------------------------------
DELIMITER $$
USE `ferreterias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCantidadProductos`(in username varchar(50))
BEGIN
select  COUNT(p.Producto_idProducto)
from cliente c 
join usuariocliente u
on u.cliente_idCliente = c.idCliente
join carrito K
on k.Cliente_idCliente = c.idCliente
join productoporcarrito p 
on p.carrito_idcarrito = k.idCarrito 
where u.usuarioCliente = username;
END$$

DELIMITER ;