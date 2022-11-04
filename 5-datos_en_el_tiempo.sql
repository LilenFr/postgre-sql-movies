-- Línea de tiempo para ver cómo se han ido moviendo las rentas de diversas películas a lo largo de los meses y de los años
SELECT date_part('year', rentas.fecha_renta) AS anio,
    date_part('month', rentas.fecha_renta) AS mes, 
    peliculas.titulo,
    COUNT(*) AS numero_rentas
FROM rentas
    INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
    INNER JOIN peliculas ON peliculas.pelicula_id =  inventarios.pelicula_id
GROUP BY anio, mes, peliculas.pelicula_id;

-- Línea de tiempo para ver solamente el número de rentas que ha habido en un año determinado en un mes determinado. Sirve para saber cómo han ido las rentas a lo largo del tiempo
SELECT date_part('year', rentas.fecha_renta) AS anio,
    date_part('month', rentas.fecha_renta) AS mes, 
    COUNT(*) AS numero_rentas
FROM rentas
GROUP BY anio, mes
ORDER BY anio, mes;

-- Cantidad de pagos por año, mes, costos percibidos y películas
SELECT date_part('year', pagos.fecha_pago) AS anio,
	date_part('month', pagos.fecha_pago) AS mes,
	COUNT (*) AS Cant_pagos,
	SUM (cantidad) AS Cant_$_Rentas,
	peliculas.titulo
FROM pagos
	INNER JOIN rentas ON rentas.renta_id = pagos.renta_id
	INNER JOIN inventarios ON inventarios.inventario_id = rentas.inventario_id
	INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.titulo, anio, mes
ORDER BY cant_pagos DESC;

-- Cantidad de pagos por año, mes y costos percibidos
SELECT date_part('year', pagos.fecha_pago) AS anio,
	date_part('month', pagos.fecha_pago) AS mes,
	COUNT (*) AS Cant_pagos,
	SUM (cantidad) AS Cant_$_Rentas
FROM pagos
GROUP BY anio, mes
ORDER BY anio, mes, cant_pagos DESC;
