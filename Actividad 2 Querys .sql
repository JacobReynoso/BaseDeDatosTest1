SELECT * FROM public.usuarios WHERE id_usuario=1;
SELECT * FROM public.libro

UPDATE public.usuarios
set correo_usuario = 'maria.gonzalez123@email.com'

where id_usuario = 1

UPDATE public.usuarios
set edad = '18'

where id_usuario = 1;

delete from public.usuarios WHERE lugar_proveniencia ='Coacalco';
delete from public.usuarios WHERE id_usuario >=98;
SELECT * FROM public.usuarios;

SELECT nombre_usuario, edad FROM public.usuarios WHERE edad  b




SELECT nombre_editorial, min(edad) FROM public.editorial
GROUP BY pais_editorial;

SELECT DISTINCT pais_editorial FROM public.editorial;

SELECT COUNT(DISTINCT pais_categoria) FROM public.editorial;

SELECT COUNT(DISTINCT pais_categoria) FROM public.categorias;

SELECT * FROM public.usuarios WHERE nombre_usuario LIKE 'A%';

SELECT * FROM public.usuarios WHERE nombre_usuario LIKE '%es';

SELECT * FROM public.usuarios 
	WHERE lugar_proveniencia in ('México','Oaxaca');


SELECT * FROM public.editorial 
	WHERE pais_editorial in ('México','España');


SELECT * FROM public.editorial 
	WHERE pais_editorial ='México' OR pais_editorial ='España';


ALTER TABLE public.libro add column precio INT;
UPDATE libro
SET precio = FLOOR(RANDOM() * 500 + 100)  -- precios aleatorios entre 100 y 599
WHERE id_libro IN (
    SELECT id_libro
    FROM libro
    ORDER BY id_libro
    LIMIT 98
);



--Aqui pondre que ase cada uno nota codigo

-- Selecciona todos los campos del usuario con id_usuario igual a 1
SELECT * FROM public.usuarios WHERE id_usuario=1;

-- Selecciona todos los registros de la tabla libro
SELECT * FROM public.libro;

-- Actualiza el correo electrónico del usuario con id_usuario = 1
UPDATE public.usuarios
SET correo_usuario = 'maria.gonzalez123@email.com'
WHERE id_usuario = 1;

-- Actualiza la edad del usuario con id_usuario = 1 a 18 años
UPDATE public.usuarios
SET edad = '18'
WHERE id_usuario = 1;

-- Elimina todos los usuarios cuya lugar_proveniencia sea 'Coacalco'
DELETE FROM public.usuarios WHERE lugar_proveniencia = 'Coacalco';

-- Elimina todos los usuarios con id_usuario mayor o igual a 98
DELETE FROM public.usuarios WHERE id_usuario >= 98;

-- Muestra todos los registros actuales de la tabla usuarios
SELECT * FROM public.usuarios;

-- ❌ Esta línea está incompleta o contiene un error de sintaxis (falta operador en "edad b")
-- SELECT nombre_usuario, edad FROM public.usuarios WHERE edad b

-- Muestra el nombre de la editorial y la edad mínima de los usuarios agrupados por país de la editorial
SELECT nombre_editorial, MIN(edad) FROM public.editorial
GROUP BY pais_editorial;

-- Muestra todos los países únicos registrados en la tabla editorial
SELECT DISTINCT pais_editorial FROM public.editorial;

-- Cuenta cuántos países únicos hay en la columna pais_categoria de la tabla editorial
SELECT COUNT(DISTINCT pais_categoria) FROM public.editorial;

-- Cuenta cuántos países únicos hay en la columna pais_categoria de la tabla categorias
SELECT COUNT(DISTINCT pais_categoria) FROM public.categorias;

-- Selecciona todos los usuarios cuyo nombre comienza con la letra 'A'
SELECT * FROM public.usuarios WHERE nombre_usuario LIKE 'A%';

-- Selecciona todos los usuarios cuyo nombre termina en 'es'
SELECT * FROM public.usuarios WHERE nombre_usuario LIKE '%es';

-- Selecciona todos los usuarios cuya lugar_proveniencia sea 'México' o 'Oaxaca'
SELECT * FROM public.usuarios 
WHERE lugar_proveniencia IN ('México','Oaxaca');

-- Selecciona todas las editoriales cuya país_editorial sea 'México' o 'España' usando IN
SELECT * FROM public.editorial 
WHERE pais_editorial IN ('México','España');

-- Selecciona todas las editoriales cuya país_editorial sea 'México' o 'España' usando OR
SELECT * FROM public.editorial 
WHERE pais_editorial = 'México' OR pais_editorial = 'España';

-- Agrega una nueva columna llamada precio de tipo entero a la tabla libro
ALTER TABLE public.libro ADD COLUMN precio INT;

-- Asigna precios aleatorios entre 100 y 599 a los primeros 98 libros
UPDATE libro
SET precio = FLOOR(RANDOM() * 500 + 100)  -- precios aleatorios entre 100 y 599
WHERE id_libro IN (
    SELECT id_libro
    FROM libro
    ORDER BY id_libro
    LIMIT 98
);
