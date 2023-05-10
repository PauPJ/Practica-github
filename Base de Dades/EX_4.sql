USE biblioteca;
delimiter $$

-- 3.1
DROP PROCEDURE if EXISTS mostrar_major$$

CREATE PROCEDURE mostrar_major(IN x INT,IN y INT)
BEGIN 
  if(x is NULL OR y is NULL) THEN 
    SELECT 'error';
  ELSEIF(X > Y) THEN 
  SELECT x;
  ELSE 
  SELECT y;
END IF;
END$$   

CALL mostrar_major(4,5)$$

-- 3.2
DROP PROCEDURE if EXISTS mostrar_diferencia$$

CREATE PROCEDURE mostrar_diferencia(IN x INT,IN y INT,OUT diff int)
BEGIN 
  if(x is NULL OR y is NULL) THEN 
    SELECT 'error';
  ELSEIF(X>Y) then 
  SELECT X - y INTO diff;
  ELSE 
  SELECT Y-x INTO diff;
  SELECT diff;
END IF;
END$$   

CALL mostrar_diferencia(4,5,@diff)$$

-- 3.3
DROP PROCEDURE if EXISTS mostrar_numero$$

CREATE PROCEDURE mostrar_numero(IN x INT)
BEGIN 
  select case x
  when 0 then 'cero'
  when 1 then 'uno'
  when 2 then 'dos'
  when 3 then 'tres'
  when 4 then 'cuatro'
  when 5 then 'cinco'
  when 6 then 'seis'
  when 7 then 'siete'
  when 8 then 'ocho'
  when 9 then 'nueve'
  ELSE ' '
END;
END$$   

 CALL mostrar_numero(9)$$
 
 -- 3.4
DESC autors;
DROP PROCEDURE if EXISTS info_autor$$

CREATE PROCEDURE info_autor(IN code INT)
BEGIN 
    DECLARE x INT;
    DECLARE aut VARCHAR(100);
    SELECT COUNT(*) INTO x FROM lli_aut WHERE fk_idaut = CODE; 
    SELECT nom_aut INTO aut from autors WHERE ID_AUT = CODE;
    
    if(aut is NULL) then
    SELECT CONCAT('el codigo no existe') ;
    
  elseif(X = 0) then
  SELECT CONCAT('el autor ',NOM_AUT,' ','no tiene ningun libro') AS info from autors WHERE ID_AUT = CODE;
  
  ELSEIF(X = 1) then 
  SELECT CONCAT('el autor ',NOM_AUT,' ','solo tiene un libro') AS info from autors WHERE ID_AUT = CODE;
  
  ELSE 
  SELECT CONCAT('el autor ',NOM_AUT,' ',' tiene muchos libros') AS info from autors WHERE ID_AUT = CODE;

END if; 
END$$   

 CALL info_autor(7)$$