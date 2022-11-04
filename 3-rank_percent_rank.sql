-- Experimentando con más Window functions: RANK Y PERCENT_RANK

-- Sacar el porcentil del rango
SELECT
    peliculas.pelicula_id AS id,
    peliculas.titulo,
    COUNT(*) AS numero_rentas,
    PERCENT_RANK () OVER (
        ORDER BY COUNT(*) DESC
        ) AS lugar
FROM rentas
    INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
    INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC;

-- Sacar el rango a la inversa
SELECT
    peliculas.pelicula_id AS id,
    peliculas.titulo,
    COUNT(*) AS numero_rentas,
    PERCENT_RANK () OVER (
        ORDER BY COUNT(*) ASC
        ) AS lugar
FROM rentas
    INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
    INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC;

-- Traer un rango más directo con DENSE RANK
SELECT
    peliculas.pelicula_id AS id,
    peliculas.titulo,
    COUNT(*) AS numero_rentas,
    DENSE_RANK () OVER (
        ORDER BY COUNT(*) DESC
        ) AS lugar
FROM rentas
    INNER JOIN inventarios ON rentas.inventario_id = inventarios.inventario_id
    INNER JOIN peliculas ON inventarios.pelicula_id = peliculas.pelicula_id
GROUP BY peliculas.pelicula_id
ORDER BY numero_rentas DESC;
