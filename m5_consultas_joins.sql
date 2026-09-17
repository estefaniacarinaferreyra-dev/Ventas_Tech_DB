--Consulta 1 — Vista base del proyecto (INNER JOIN)

SELECT 
c.id_cliente,
c.nombre,
c.ciudad,
p.nombre_producto,
ca.nombre_categoria,
ca.descripcion,
v.cantidad,
v.precio_unitario,
(v.cantidad * v.precio_unitario) as total_venta
FROM ventas as v
INNER JOIN clientes as c on c.id_cliente = v.id_cliente
INNER JOIN productos as p on p.id_producto = v.id_producto
INNER JOIN categorias as ca on ca.id_categoria = p.id_categoria

--Consulta 2 — Clientes sin ventas (LEFT JOIN) 

SELECT 
c.id_cliente,
c.nombre,
c.ciudad,
c.email,
c.fecha_registro,
id_venta
FROM clientes as c
LEFT JOIN ventas as v on c.id_cliente = v.id_cliente
WHERE id_venta is null

--Consulta 3 — Productos sin ventas (LEFT JOIN) 

SELECT 
p.nombre_producto,
p.precio,
ca.nombre_categoria,
ca.descripcion
FROM productos as p
LEFT JOIN ventas as v on p.id_producto = v.id_producto
INNER JOIN categorias as ca on ca.id_categoria = p.id_categoria
WHERE id_venta IS NULL

SELECT * FROM PRODUCTOS
SELECT * FROM VENTAS

INSERT INTO dbo.productos (nombre_producto, id_categoria, precio, stock , activo) 
VALUES ('Laptop Pro 17',1, 1500.00, 15, 1);

Consulta 4 — Consolidado por canal (UNION ALL)
Importante: la columna canal no se consulta, se crea. No busques ese dato en tus tablas — 
lo generás vos dentro de cada SELECT como valor literal. Ese es el punto de este ejercicio.
Escribí dos SELECT sobre tus ventas, separados por el criterio que corresponda a tu caso 
(por ejemplo, ventas de dos períodos, dos sucursales o dos orígenes distintos), 
y agregá en cada uno una columna de texto fija que identifique el origen. 
Unilos con UNION ALL y cerrá con un GROUP BY para obtener el total por cada origen.
La estructura es esta:
SELECT fecha, total, 'Online' AS canal FROM ventas WHERE ... 
UNION ALL 
SELECT fecha, total, 'Presencial' AS canal FROM ventas WHERE ...
Las dos consultas tienen que devolver la misma cantidad de columnas, en el mismo orden y con tipos compatibles. 
Usamos UNION ALL y no UNION porque no queremos que se eliminen filas repetidas: cada venta debe contarse una 
sola vez, aunque coincida con otra en todos sus valores.

SELECT
    'Online' AS canal,
     fecha_venta,
    cantidad * precio_unitario AS total
FROM ventas
WHERE id_producto < 4
UNION ALL
SELECT
    'Presencial' AS canal,
    fecha_venta,
    cantidad * precio_unitario AS total
FROM ventas
WHERE id_producto >= 4
ORDER BY canal ASC;