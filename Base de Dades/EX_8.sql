USE biblioteca;
delimiter $$

-- Función para obtener el número de llibres de un autor dado
DROP FUNCTION IF EXISTS numllibresAutor$$
CREATE FUNCTION numllibresAutor(idautor INT) RETURNS INT
BEGIN
DECLARE numllibres INT;
SELECT COUNT(*) INTO numllibres FROM llibres_autores WHERE id_autor = idautor;
RETURN numllibres;
END$$

-- Función para obtener el número de autores de un libro dado

DROP FUNCTION IF EXISTS numAutoresLibro$$
CREATE FUNCTION numAutoresLibro(id_llib INT) RETURNS INT
BEGIN
DECLARE numAutores INT;
SELECT COUNT(*) INTO numAutores FROMbiblioteca autors WHERE id_llib = idllib;
RETURN numAutores;
END$$

-- Función para obtener los números de registros de un libro dado
DROP FUNCTION IF EXISTS nregLibro$$
CREATE FUNCTION nregLibro(id_llib INT) RETURNS VARCHAR(300)
BEGIN
DECLARE nregs VARCHAR(255);
SELECT GROUP_CONCAT(NUMEDICIO SEPARATOR ' ') INTO nregs FROM llibres WHERE id_libro = idllib;
RETURN nregs;
END$$

-- Función para obtener los autores de un libro dado con el formato solicitado
DROP FUNCTION IF EXISTS autoresLibro$$
CREATE FUNCTION autoresLibro(idllib INT) RETURNS VARCHAR(300)
BEGIN
DECLARE autores VARCHAR(300);
SELECT GROUP_CONCAT(CONCAT(nombre,'(',numllibresAutor(autores.id),')') SEPARATOR ' ') INTO autores FROM autors
WHERE id IN (SELECT id_autor FROM llibres_autores WHERE id_llib = idllib);
RETURN autores;
END$$

-- Procedimiento almacenado para generar la lista detallada de llibres
DROP procedure IF EXISTS listaDetallada$$
CREATE PROCEDURE listaDetallada(minimo INT)
BEGIN
SELECT id_llib, titol, nregLibro(id_llib) AS nregs, autoresLibro() AS autores
FROM llibres


WHERE numAutoresLibro(LLOCEDICIO) >= minimo;
END$$

CALL listaDetallada(2);