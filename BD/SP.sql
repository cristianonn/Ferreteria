/*--------Selecciona todos ls detalles de cada producto----------*/
/*---------------------------------------------------------------*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarProducto`(
IN pId varchar(20)
)
BEGIN
	select * from Producto
    where pId = Producto.idProducto;
END

/*----------------Escoge 6 procutso random ----------------------*/
/*---------------------------------------------------------------*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionar6Random`()
BEGIN
 select idProducto,nombreProducto, descripcionProducto, precioProducto, fotoProducto FROM Producto
 ORDER BY RAND()
 LIMIT 6;
END

/*-------------Selecciona todos los productos------------------*/
/*-------------------------------------------------------------*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `seleccionarTodosProductos`()
BEGIN
 select * from Producto;
END$$