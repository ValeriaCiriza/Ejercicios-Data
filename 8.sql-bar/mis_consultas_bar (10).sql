-- Bar La Consulta: mis consultas
-- Descargado el 12/11/2026 a las 21:59
-- Para recuperarlas, abre https://ulzuhan.github.io/bar-la-consulta/ y pulsa "Cargar mi trabajo".
-- Caso cerrado: sí

-- ## 0. Abrimos

-- [0.a] Ejemplo: La carta entera.
SELECT * FROM carta;

-- [0.1] Muestra la tabla personal entera.
SELECT * FROM personal

-- [0.2] Muestra la tabla comandas entera. ¿Cuántas comandas hay?
SELECT * FROM comandas

-- ## 1. SELECT

-- [1.a] Ejemplo: Solo el plato y el precio de la carta.
SELECT plato, precio FROM carta;

-- [1.b] Ejemplo: Las 5 primeras comandas.
SELECT * FROM comandas LIMIT 5;

-- [1.c] Ejemplo: Las categorías de la carta, sin repetir.
SELECT DISTINCT categoria FROM carta

-- [1.d] Ejemplo: Cómo quedarían los precios con una subida del 10 %.
SELECT plato, precio , precio * 1.10 AS precio_nuevo FROM carta;

-- [1.1] Muestra el nombre y el puesto de todo el personal.
SELECT nombre, puesto FROM personal

-- [1.2] Muestra la fecha, la hora y el total de cada comanda.
SELECT fecha, hora, total
FROM comandas

-- [1.3] Muestra las 10 primeras filas de la tabla fichajes.
SELECT * FROM fichajes LIMIT 10

-- [1.4] ¿En qué zonas del bar se sirven comandas? Que salga cada zona una sola vez.
SELECT DISTINCT zona
FROM comandas;

-- [1.5] ¿Cómo pagan los clientes? Que salga cada forma de pago una sola vez.
SELECT DISTINCT pago FROM comandas;

-- [1.6] El dueño quiere hacer un 20 % de descuento en toda la carta. Muestra el plato, el precio y el precio con el descuento (precio * 0.8) en una columna llamada precio_oferta.
SELECT plato, precio, precio * 0.80 AS precio_oferta FROM carta

-- [1.7] ¿Cuánto pagó cada comensal? Muestra el id, el total, los comensales y el total dividido entre los comensales, en una columna llamada por_persona.
SELECT id, total, comensales, total / comensales AS por_persona FROM comandas;

-- ## 2. WHERE

-- [2.a] Ejemplo: Los platos de más de 10 €.
SELECT plato, precio 
FROM carta
WHERE precio > 10;

-- [2.b] Ejemplo: Los postres.
SELECT plato, categoria
FROM carta
WHERE categoria = 'postres';

-- [2.c] Ejemplo: Las comandas que se pagaron con bizum.
SELECT *
FROM comandas
WHERE pago = 'bizum';

-- [2.d] Ejemplo: Las comandas del día de Halloween.
SELECT*
FROM comandas
WHERE fecha = '2026-10-31'

-- [2.1] ¿Qué hay en la carta por menos de 3 €? Muestra el plato y el precio.
SELECT plato, precio
FROM carta
WHERE precio < 3;

-- [2.2] ¿Qué platos son vegetarianos? Muestra solo el plato. En la columna vegetariano pone 'si' o 'no'.
SELECT plato
FROM carta
WHERE vegetariano = 'si';

-- [2.3] ¿Quién trabaja en el turno de noche? Muestra el nombre y el turno.
SELECT nombre, turno
FROM personal
WHERE turno = 'noche';

-- [2.4] Muestra todas las comandas de la terraza.
SELECT *
FROM comandas
WHERE zona = 'terraza';

-- [2.5] ¿Qué comandas dejaron más de 5 € de propina? Muestra el id, el total y la propina.
SELECT id, total, propina
FROM comandas
WHERE propina > 5;

-- [2.6] ¿Qué comandas fueron de grupos de 10 personas o más? Muestra todas sus columnas.
SELECT *
FROM comandas
WHERE comensales >= 10;

-- [2.7] Muestra todas las comandas del sábado 7 de noviembre de 2026.
SELECT*
FROM comandas
WHERE fecha = '2026-11-07'

-- [2.8] Muestra el plato y la categoría de todo lo que no sea bebida.
SELECT DISTINCT plato, categoria
FROM carta
WHERE categoria <> 'bebidas';

-- [2.9] El dueño quiere reunir a todo el personal de cocina. ¿A quién tiene que llamar?
SELECT nombre
FROM personal
WHERE puesto = 'cocina';

-- ## 3. AND, OR, LIKE

-- [3.a] Ejemplo: Las tapas de menos de 4 €.
SELECT plato, precio
FROM carta 
WHERE categoria = 'tapas' AND precio < 4

-- [3.b] Ejemplo: Los postres y las bebidas.
SELECT plato, precio , categoria
FROM carta
WHERE categoria = 'bebidas' OR categoria ='postres'

-- [3.c] Ejemplo: Los postres y las bebidas, otra vez, pero con IN.
SELECT plato, categoria
FROM carta
WHERE categoria IN ('postre', 'bebida');

-- [3.d] Ejemplo: Lo que cuesta entre 5 y 8 €.
SELECT plato, precio
FROM carta
WHERE precio BETWEEN 5 AND 8;

-- [3.e] Ejemplo: Los platos que empiezan por "Bocadillo".
SELECT plato
FROM carta
WHERE plato LIKE 'Bocadillo%';

-- [3.f] Ejemplo: Los platos que llevan queso.
SELECT plato
FROM carta
WHERE plato LIKE '%queso%';

-- [3.g] Ejemplo: Tapas y raciones de más de 10 €. ¿Sale lo que esperabas?
SELECT plato, categoria, precio
FROM carta
WHERE (categoria = 'tapas' OR categoria = 'raciones')
AND precio > 10;

-- [3.1] ¿Qué platos vegetarianos cuestan menos de 5 €? Muestra el plato y el precio.
SELECT plato, precio
FROM carta
WHERE vegetariano = 'si'
  AND precio < 5;

-- [3.2] Muestra las comandas de la terraza que se pagaron en efectivo.
SELECT *
FROM comandas
WHERE zona = 'terraza'
  AND pago = 'efectivo';

-- [3.3] ¿Quién trabaja en cocina o en barra? Muestra el nombre y el puesto.
SELECT nombre, puesto
FROM personal
WHERE puesto = 'cocina' OR puesto = 'barra';

-- [3.4] Haz el 3.3 otra vez, pero con IN.
SELECT nombre, puesto
FROM personal
WHERE puesto IN ('cocina', 'barra');

-- [3.5] ¿Qué platos cuestan entre 3 y 5 €, los dos incluidos? Muestra el plato y el precio.
SELECT plato, precio
FROM carta
WHERE precio BETWEEN 3 AND 5;

-- [3.6] Muestra las comandas de la semana de Halloween, del lunes 26 de octubre al domingo 1 de noviembre de 2026.
SELECT *
FROM comandas
WHERE fecha BETWEEN '2026-10-26' AND '2026-11-01';

-- [3.7] ¿Qué platos llevan patatas? Busca la palabra en el nombre y muestra solo el plato.
SELECT plato
FROM carta
WHERE plato LIKE '%patata%';

-- [3.8] Muestra las comandas de la terraza o de la barra que se pagaron con bizum.
SELECT *
FROM comandas
WHERE zona IN ('terraza', 'barra')
  AND pago = 'bizum';

-- [3.9] Llega un cliente vegetariano que quiere picar tapas o raciones, sin pasar de 5 € por plato. ¿Qué le puedes ofrecer?
SELECT plato, categoria, precio
FROM carta
WHERE vegetariano = 'si'
  AND categoria = 'tapas' OR 'raciones'
  AND precio <= 5;

-- ## 4. ORDER BY

-- [4.a] Ejemplo: La carta, de lo más barato a lo más caro.
SELECT plato, precio
FROM carta
ORDER BY precio;

-- [4.b] Ejemplo: La carta al revés: de lo más caro a lo más barato.
SELECT plato, precio
FROM carta
ORDER BY precio DESC;

-- [4.c] Ejemplo: Los 5 platos más caros.
SELECT plato, precio
FROM carta
ORDER BY precio DESC
LIMIT 5;

-- [4.d] Ejemplo: Las raciones, de la más cara a la más barata.
SELECT plato, precio
FROM carta
WHERE categoria = 'raciones'
ORDER BY precio DESC;

-- [4.1] Ordena al personal por antigüedad, de quien lleva más tiempo en el bar a quien acaba de llegar. Muestra el nombre y la fecha de alta.
SELECT nombre, fecha_alta
FROM personal
ORDER BY fecha_alta;

-- [4.2] ¿Cuáles son las 3 propinas más altas? Muestra el id de la comanda y la propina.
SELECT id, propina
FROM comandas
ORDER BY propina DESC
LIMIT 3;

-- [4.3] ¿Cuáles son las 5 comandas más caras? Muestra el id, la fecha y el total.
SELECT id, fecha, total
FROM comandas
ORDER BY total DESC
LIMIT 5;

-- [4.4] ¿Qué es lo más barato de la carta? Muestra el plato y el precio.
SELECT plato, precio
FROM carta
ORDER BY precio
LIMIT 1;

-- [4.5] Ordena al personal de sala del que llegó más tarde al que lleva más tiempo. Muestra el nombre y la fecha de alta.
SELECT nombre, fecha_alta
FROM personal
WHERE puesto = 'sala'
ORDER BY fecha_alta DESC;

-- [4.6] ¿Cuáles son las 3 tapas vegetarianas más caras? Muestra el plato y el precio.
SELECT plato, precio
FROM carta
WHERE categoria = 'tapas'
  AND vegetariano = 'si'
ORDER BY precio DESC
LIMIT 3;

-- [4.7] ¿Quién es la última persona que ha empezado a trabajar en el bar?
SELECT nombre, fecha_alta
FROM personal
ORDER BY fecha_alta DESC
LIMIT 1;

-- ## 5. COUNT, SUM

-- [5.a] Ejemplo: Cuántas comandas hay.
SELECT COUNT(*) FROM comandas;

-- [5.b] Ejemplo: Cuántas comandas se pagaron en efectivo.
SELECT COUNT(*) AS num_comandas
FROM comandas
WHERE pago ='efectivo';

-- [5.c] Ejemplo: Cuánto se ha facturado en total.
SELECT SUM(TOTAL) AS facturacion
FROM comandas

-- [5.d] Ejemplo: El ticket medio, con 2 decimales.
SELECT ROUND(AVG(total),2) AS ticket_medio
FROM comandas

-- [5.e] Ejemplo: El precio más barato y el más caro de la carta.
SELECT MIN(precio) AS mas_barato, MAX(precio) AS mas_caro
FROM CARTA;

-- [5.1] ¿Cuántas personas trabajan en el bar?
SELECT COUNT(*)
FROM personal;

-- [5.2] ¿Cuántas comandas se pagaron con bizum?
SELECT COUNT(*)
FROM comandas
WHERE pago = 'bizum';

-- [5.3] ¿Cuánto se facturó el 31 de octubre de 2026, el día de Halloween?
SELECT SUM(total)
FROM comandas
WHERE fecha = '2026-10-31';

-- [5.4] ¿Cuánto dinero hay en el bote de las propinas? Suma todas las propinas.
SELECT SUM(propina)
FROM comandas;

-- [5.5] ¿Cuál es la propina media? Redondéala a 2 decimales.
SELECT ROUND(AVG(propina), 2)
FROM comandas;

-- [5.6] ¿Cuántas personas había en el grupo más grande?
SELECT MAX(comensales)
FROM comandas;

-- [5.7] ¿Cuántos clientes pasaron por el bar en octubre? Suma los comensales de las comandas del 1 al 31 de octubre de 2026.
SELECT SUM(comensales)
FROM comandas
WHERE fecha BETWEEN '2026-10-01' AND '2026-10-31';

-- [5.8] El dueño duda si seguir aceptando bizum. ¿Cuánto dinero se ha cobrado con bizum en total?
SELECT SUM(total)
FROM comandas
WHERE pago = 'bizum';

-- ## 6. GROUP BY

-- [6.a] Ejemplo: Cuántos platos hay en cada categoría.
SELECT categoria, COUNT(*) AS num_platos
FROM carta
GROUP BY categoria

-- [6.b] Ejemplo: Cuánto factura cada zona del bar.
SELECT zona, SUM(total) AS facturacion
FROM comandas
GROUP BY zona

-- [6.c] Ejemplo: Cuántas comandas hay de cada forma de pago, de más a menos.
SELECT pago, COUNT(*) AS num_comandas
FROM comandas
GROUP BY pago
ORDER BY num_comandas DESC;

-- [6.d] Ejemplo: Las categorías con más de 5 platos.
SELECT categoria, COUNT(*) AS num_platos
FROM carta
GROUP BY categoria
HAVING COUNT(*) >5;

-- [6.1] ¿Cuántas personas hay en cada puesto? Muestra el puesto y cuántas son.
SELECT puesto, COUNT(*)
FROM personal
GROUP BY puesto;

-- [6.2] Compara lo que gasta cada mesa en cada zona: muestra cada zona y su ticket medio (la media del total), redondeado a 2 decimales. ¿Dónde se gasta más?
SELECT zona, ROUND(AVG(total), 2) AS ticket_medio
FROM comandas
GROUP BY zona
ORDER BY ticket_medio DESC;

-- [6.3] ¿Con qué forma de pago se deja más propina? Muestra cada forma de pago y su propina media, redondeada a 2 decimales.
SELECT pago, ROUND(AVG(propina), 2) AS propina_media
FROM comandas
GROUP BY pago
ORDER BY propina_media DESC;

-- [6.4] ¿Cuáles fueron los 3 días que más se facturó? Muestra la fecha y la facturación, de más a menos.
SELECT fecha, SUM(total) AS facturacion
FROM comandas
GROUP BY fecha
ORDER BY facturacion DESC
LIMIT 3;

-- [6.5] ¿Qué 3 camareros han servido más comandas? Muestra el camarero_id y cuántas comandas, de más a menos.
SELECT camarero_id, COUNT(*) AS comandas
FROM comandas
GROUP BY camarero_id
ORDER BY comandas DESC
LIMIT 3;

-- [6.6] ¿Qué días se facturó más de 1.400 €? Muestra la fecha y la facturación.
SELECT fecha, SUM(total) AS facturacion
FROM comandas
GROUP BY fecha
HAVING SUM(total) > 1400;

-- [6.7] En la tabla lineas está cada plato de cada comanda, con su cantidad. ¿Cuáles son los 3 platos que más se venden? Muestra el plato_id y las unidades (la suma de cantidad), de más a menos.
SELECT plato_id, SUM(cantidad) AS unidades
FROM lineas
GROUP BY plato_id
ORDER BY unidades DESC
LIMIT 3;

-- [6.8] ¿Qué día vino más gente al bar, y cuántas personas fueron?
SELECT fecha, SUM(comensales) AS total_personas
FROM comandas
GROUP BY fecha
ORDER BY total_personas DESC
LIMIT 1;

-- ## Misión

-- [M.1] Lo que pasó
SELECT *
FROM incidencias
WHERE fecha = '2026-11-07'
AND tipo = 'caja';

-- [M.2] El ticket del cliente
SELECT *
FROM comandas
WHERE fecha = '2026-11-07'
AND zona = 'terraza'
AND pago = 'efectivo'
AND total = 44.70;

-- [M.3] ¿Quién anuló ese ticket?
SELECT *
FROM anulaciones
WHERE comanda_id = 
(SELECT id 
FROM comandas
WHERE fecha = '2026-11-07'
AND zona = 'terraza'
AND pago = 'efectivo'
AND total = 44.70);

-- [M.4] ¿Fue solo ese ticket?
SELECT personal_id, SUM(importe) AS total_anulado
FROM anulaciones
WHERE fecha = '2026-11-07'
AND pago = 'efectivo'
GROUP BY personal_id
ORDER BY total_anulado DESC;

-- [M.5] ¿Quién es?
SELECT *
FROM personal
WHERE id = (SELECT personal_id
FROM anulaciones
WHERE fecha = '2026-11-07'
AND pago = 'efectivo'
GROUP BY personal_id
ORDER BY SUM(importe) DESC
LIMIT 1);

-- [M.6] La coartada
SELECT *
FROM fichajes
WHERE personal_id = (
SELECT personal_id
FROM anulaciones
WHERE fecha = '2026-11-07'
AND pago = 'efectivo'
GROUP BY personal_id
ORDER BY SUM(importe) DESC
LIMIT 1)
AND entrada LIKE '2026-11-07%';

-- [M.7] ¿Era la primera vez?
SELECT *
FROM anulaciones
WHERE personal_id = 6
AND fecha < '2026-11-07';

-- [M.8] La hora del robo
SELECT MIN(momento) AS primera, MAX(momento) AS ultima
FROM anulaciones
WHERE personal_id = 6
AND fecha = '2026-11-07';

-- [M.9] Quién seguía en el bar
SELECT *
FROM fichajes
WHERE entrada < '2026-11-07 23:48'
AND salida > '2026-11-08 01:12';

-- [M.10] Los testigos
SELECT *
FROM declaraciones
WHERE texto LIKE '%TPV%';

-- [M.11] Quién fue
SELECT *
FROM personal
WHERE id IN (SELECT personal_id
FROM fichajes
WHERE entrada < '2026-11-07 23:48'
AND salida > '2026-11-08 01:12')
AND puesto = 'cocina'
AND fecha_alta >= '2026-09-01';

-- ## Práctica

-- [P.1] ¿Qué cuesta exactamente 4 €? Muestra solo el plato.
SELECT plato
FROM carta
WHERE precio = 4;

-- [P.2] ¿Cuántas comandas se han servido en la barra?
SELECT COUNT(*)
FROM comandas
WHERE zona = 'barra';

-- [P.3] ¿Qué bocadillos hay y cuánto cuestan? Muestra el plato y el precio, del más caro al más barato.
SELECT plato, precio
FROM carta
WHERE categoria = 'bocadillos'
ORDER BY precio DESC;

-- [P.4] ¿Cuál fue la comanda más cara de la terraza? Muestra el id, la fecha y el total.
SELECT id, fecha, total
FROM comandas
WHERE zona = 'terraza'
ORDER BY total DESC
LIMIT 1;

-- [P.5] El sábado 7 de noviembre por la noche se rompió un rato la máquina de tarjetas. ¿Cuántas comandas se pagaron con tarjeta ese día de las 20:00 en adelante?
SELECT COUNT(*)
FROM comandas
WHERE fecha = '2026-11-07'
AND pago = 'tarjeta'
AND hora >= '20:00';

-- [P.6] ¿Cuánto se ha cobrado con cada forma de pago? Muestra la forma de pago y el total cobrado.
SELECT pago, SUM(total) AS total_cobrado
FROM comandas
GROUP BY pago;

-- [P.7] Compara la propina de cada zona: muestra cada zona y su propina media, redondeada a 2 decimales. ¿Dónde se deja más?
SELECT zona, ROUND(AVG(propina), 2) AS propina_media
FROM comandas
GROUP BY zona
ORDER BY propina_media DESC;

-- [P.8] ¿Cuántas comandas sirvió cada persona el sábado 7 de noviembre? Muestra el camarero_id y cuántas.
SELECT camarero_id, COUNT(*) AS num_comandas
FROM comandas
WHERE fecha = '2026-11-07'
GROUP BY camarero_id;

-- [P.9] ¿A qué hora entró la primera comanda del día de Halloween, y a qué hora la última? Las dos en la misma consulta.
SELECT MIN(hora) AS primera, MAX(hora) AS ultima
FROM comandas
WHERE fecha = '2026-10-31';

-- [P.10] ¿Qué mesas de la terraza han tenido más de 30 comandas? Muestra la mesa y cuántas comandas.
SELECT mesa, COUNT(*) AS num_comandas
FROM comandas
WHERE zona = 'terraza'
GROUP BY mesa
HAVING COUNT(*) > 30;

-- [P.11] ¿Qué categorías de la carta tienen un precio medio de más de 5 €? Muestra la categoría y el precio medio, redondeado a 2 decimales.
SELECT categoria, ROUND(AVG(precio), 2) AS precio_medio
FROM carta
GROUP BY categoria
HAVING precio_medio > 5;

-- [P.12] El dueño quiere premiar a quien más propina ha recibido en efectivo. ¿Quién es (su camarero_id) y cuánto ha recibido?
SELECT camarero_id, SUM(propina) AS propina_total
FROM comandas
WHERE pago = 'efectivo'
GROUP BY camarero_id
ORDER BY propina_total DESC
LIMIT 1;

-- ## NULL y CASE

-- [E.a] Ejemplo: Los platos con los alérgenos sin revisar.
SELECT plato, alergenos
FROM carta
WHERE alergenos IS NULL;

-- [E.b] Ejemplo: La carta con una columna nueva que dice si el plato es caro.
SELECT plato, precio,
  CASE
    WHEN precio >= 10 THEN 'cara'
    ELSE 'normal'
  END AS gama
FROM carta;

-- [E.c] Ejemplo: Volvemos a NULL: contar filas no es lo mismo que contar datos.
SELECT COUNT(*) AS platos, COUNT(alergenos) AS revisados
FROM carta;

-- [E.d] Ejemplo: La carta, con un texto en lugar de la casilla vacía.
SELECT plato, COALESCE(alergenos, 'sin revisar') AS alergenos
FROM carta;

-- [E.1] ¿Qué platos tienen ya los alérgenos revisados? Muestra el plato y los alérgenos.
SELECT plato, alergenos
FROM carta
WHERE alergenos IS NOT NULL;

-- [E.2] ¿Cuántos platos tienen los alérgenos sin revisar?
SELECT COUNT(*)
FROM carta
WHERE alergenos IS NULL;

-- [E.3] Clasifica la carta. Muestra el plato, el precio y una columna gama que diga 'cara' si cuesta 10 € o más, 'media' si cuesta 5 € o más, y 'barata' en el resto.
SELECT plato, precio,
  CASE
    WHEN precio >= 10 THEN 'cara'
    WHEN precio >= 5 THEN 'media'
    ELSE 'barata'
  END AS gama
FROM carta;

-- [E.4] Clasifica las propinas. Muestra el id, la propina y una columna tipo que diga 'generosa' si es de 5 € o más, 'normal' si es mayor que 0, y 'sin propina' si es 0.
SELECT id, propina,
  CASE
    WHEN propina >= 5 THEN 'generosa'
    WHEN propina > 0 THEN 'normal'
    ELSE 'sin propina'
  END AS tipo
FROM comandas;

-- [E.5] ¿Cuántos platos hay de cada gama (cara, media y barata)? Muestra la gama y cuántos platos.
SELECT
  CASE
    WHEN precio >= 10 THEN 'cara'
    WHEN precio >= 5 THEN 'media'
    ELSE 'barata'
  END AS gama,
  COUNT(*) AS num_platos
FROM carta
GROUP BY gama;

-- [E.6] Entra un cliente celíaco. ¿Qué platos le puedes asegurar que no llevan gluten? Muestra el plato y los alérgenos.
SELECT plato, alergenos
FROM carta
WHERE alergenos IS NOT NULL
  AND alergenos NOT LIKE '%gluten%';

-- [E.7] ¿Cuántos platos sin revisar hay en cada categoría? Muestra la categoría y cuántos.
SELECT categoria, COUNT(*) AS sin_revisar
FROM carta
WHERE alergenos IS NULL
GROUP BY categoria;

-- [E.8] Para la inspección, saca la carta entera con el plato y los alérgenos. Donde no haya dato tiene que poner PENDIENTE.
SELECT plato,
  CASE
    WHEN alergenos IS NULL THEN 'PENDIENTE'
    ELSE alergenos
  END AS alergenos
FROM carta;

-- ## JOIN

-- [J.a] Ejemplo: Cada comanda con el nombre de quien la sirvió.
SELECT comandas.id, comandas.total, personal.nombre
FROM comandas
JOIN personal ON comandas.camarero_id = personal.id;

-- [J.b] Ejemplo: Cuántas comandas ha servido cada camarero, con su nombre.
SELECT personal.nombre, COUNT(*) AS num_comandas
FROM comandas
JOIN personal ON comandas.camarero_id = personal.id
GROUP BY personal.nombre
ORDER BY num_comandas DESC;

-- [J.c] Ejemplo: Lo mismo, con nombres cortos para las tablas.
SELECT p.nombre, COUNT(*) AS num_comandas
FROM comandas AS c
JOIN personal AS p ON c.camarero_id = p.id
GROUP BY p.nombre
ORDER BY num_comandas DESC;

-- [J.d] Ejemplo: Los platos de las 5 primeras comandas, con su nombre.
SELECT l.comanda_id, ca.plato, l.cantidad
FROM lineas AS l
JOIN carta AS ca ON l.plato_id = ca.id
WHERE l.comanda_id <= 5;

-- [J.e] Ejemplo: Una comanda junto a sus líneas: su total se repite en cada fila.
SELECT c.id, c.total, l.plato_id, l.cantidad
FROM comandas AS c
JOIN lineas AS l ON l.comanda_id = c.id
WHERE c.id = 2;

-- [J.f] Ejemplo: Quién no ha servido nunca una comanda.
SELECT p.nombre, p.puesto
FROM personal AS p
LEFT JOIN comandas AS c ON c.camarero_id = p.id
WHERE c.id IS NULL;

-- [J.1] Vuelve a las anulaciones del sábado 7 de noviembre (fecha '2026-11-07'), pero ahora con nombres. Muestra el id de la anulación, el importe y el nombre del dueño del código con el que se anuló.
SELECT a.id, a.importe, p.nombre
FROM anulaciones a
JOIN personal p ON a.personal_id = p.id
WHERE a.fecha = '2026-11-07';

-- [J.2] ¿Quién se ha llevado más propinas? Muestra el nombre de cada camarero y la suma de sus propinas, de más a menos.
SELECT p.nombre, SUM(c.propina) AS total_propinas
FROM comandas c
JOIN personal p ON c.camarero_id = p.id
GROUP BY p.nombre
ORDER BY total_propinas DESC;

-- [J.3] ¿Cuántas comandas sirvió cada persona el sábado 7 de noviembre? Muestra el nombre y cuántas.
SELECT p.nombre, COUNT(*) AS num_comandas
FROM comandas c
JOIN personal p ON c.camarero_id = p.id
WHERE c.fecha = '2026-11-07'
GROUP BY p.nombre;

-- [J.4] Repite el M.9 de la misión con nombres: quién estuvo en el bar desde las 23:48 del sábado hasta la 01:12 del domingo. Muestra el nombre, la entrada y la salida.
SELECT p.nombre, f.entrada, f.salida
FROM fichajes f
JOIN personal p ON f.personal_id = p.id
WHERE f.entrada <= '2026-11-07 23:48'
AND f.salida >= '2026-11-08 01:12';

-- [J.5] ¿Qué 5 platos se venden más? Muestra el nombre del plato y las unidades vendidas, de más a menos.
SELECT ca.plato, SUM(l.cantidad) AS unidades
FROM lineas l
JOIN carta ca ON l.plato_id = ca.id
GROUP BY ca.plato
ORDER BY unidades DESC
LIMIT 5;

-- [J.6] ¿Y qué 5 platos dejan más dinero? Muestra el plato y lo facturado con él (la cantidad por el precio, sumado), de más a menos.
SELECT ca.plato, SUM(l.cantidad * ca.precio) AS facturado
FROM lineas l
JOIN carta ca ON l.plato_id = ca.id
GROUP BY ca.plato
ORDER BY facturado DESC
LIMIT 5;

-- [J.7] ¿Qué camarero ha atendido a más gente? Dime su nombre y a cuántas personas.
SELECT p.nombre, SUM(c.comensales) AS personas_atendidas
FROM comandas c
JOIN personal p ON c.camarero_id = p.id
GROUP BY p.nombre
ORDER BY personas_atendidas DESC
LIMIT 1;

-- [J.8] ¿Quién de la tabla personal no tiene ninguna anulación con su código? Muestra sus nombres.
SELECT p.nombre
FROM personal p
LEFT JOIN anulaciones a ON p.id = a.personal_id
WHERE a.id IS NULL;
