--trabajo Alfredo Carrera Marco Contreras 

SELECT 
    p.id_producto,
    p.nombre AS producto,
    p.descripcion,
    p.precio,
    c.nombre AS categoria
FROM Productos p
INNER JOIN Categorias c ON p.categoria_id = c.i


SELECT DISTINCT 
    c.id_cliente,
    c.nombre,
    c.direccion,
    c.telefono,
    c.email
FROM Clientes c
INNER JOIN Pedidos p ON c.id_cliente = p.cliente_id;


SELECT 
    c.id_cliente,
    c.nombre AS cliente,
    COUNT(p.id_pedido) AS total_pedidos
FROM Clientes c
LEFT JOIN Pedidos p ON c.id_cliente = p.cliente_id
GROUP BY c.id_cliente, c.nombre;

SELECT 
    p.id_pedido,
    p.fecha_pedido,
    c.nombre AS cliente,
    prod.nombre AS producto,
    cat.nombre AS categoria,
    prod.precio AS precio_unitario,
    dp.cantidad,
    dp.subtotal,
    p.total AS total_pedido
FROM Pedidos p
INNER JOIN Clientes c ON p.cliente_id = c.id_cliente
INNER JOIN Detalles_Pedido dp ON p.id_pedido = dp.pedido_id
INNER JOIN Productos prod ON dp.producto_id = prod.id_producto
INNER JOIN Categorias cat ON prod.categoria_id = cat.id_categoria
ORDER BY p.id_pedido ASC, dp.id_detalle ASC;

SELECT c.nombre AS categoria,
sum(dp.cantidad) AS unidades_vendidas, 
SUM(dp.subtotal) AS total_ventas
FROM Categorias c
INNER JOIN Poductos p ON c.id_categoria = p.categoria_id
INNER JOIN Detalles_pedido dp ON P.id_producto = dp.producto_id
group by c.id_categoria, c.nombre
order by total_ventas DESC;