-- Actualizar precios para obtener una tabla con el precio de las películas en pesos argentinos

-- Primero introducir el cambio a pesos argentinos en la base de datos:

INSERT INTO tipos_cambio (nombre, codigo, cambio_usd) VALUES
('Peso Argentino', 'ARS', 303);

-- Luego

SELECT peliculas.pelicula_id,
        tipos_cambio.tipo_cambio_id,
        tipos_cambio.cambio_usd * peliculas.precio_renta AS precio_ars
FROM peliculas,
    tipos_cambio
WHERE tipos_cambio.codigo = 'ARS';
