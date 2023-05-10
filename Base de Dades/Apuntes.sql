USE biblioteca;
delimiter $$

-- primera --
DROP PROCEDURE if EXISTS hola$$

CREATE PROCEDURE hola()
BEGIN
	SELECT "hola";
END$$

-- segona --

DROP PROCEDURE if EXISTS parametres$$
CREATE PROCEDURE parametres(IN x INT,INOUT y INT,OUT z INT)
BEGIN 
	SET X=X+1, Y=Y+1, z=z+1;
	SELECT x AS 'Valor x', y AS 'Valor y', z AS 'Valor z';
END$$
SET @X=10, @Y=20, @z=30$$
CALL parametres(@X,@Y,@z)$$ 

-- tercera --

DROP PROCEDURE if EXISTS calcul$$
CREATE PROCEDURE calcul(x INT, y INT, OUT suma INT, OUT resta INT)
BEGIN 
	SET suma=X+Y;
	SET resta=X-Y;
END$$

CALL calcul(100, 35, @s, @r)$$ 
SELECT @s, @r$$

-- quarta --

DROP PROCEDURE if EXISTS nom_autor$$
CREATE PROCEDURE nom_autor(IN pid int)
BEGIN 
	DECLARE vnom_aut VARCHAR(100);
	SELECT nom_aut INTO vnom_aut FROM autors WHERE id_aut=pid;
	SELECT vnom_aut;
END$$

CALL nom_autor(2)$$

-- quinta --

DROP PROCEDURE if EXISTS nom_llibre$$
CREATE PROCEDURE nom_llibre(IN pet INT)
BEGIN 
	DECLARE vnom_llib varchar(200);
	SELECT titol INTO vnom_llib FROM llibres WHERE id_llib=pet;
	SELECT vnom_llib;
END$$

CALL nom_llibre(7)$$


