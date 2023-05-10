USE biblioteca; 
delimiter $$
DESC autors$$

-- 2.1
DROP PROCEDURE IF EXISTS donar_alta$$



CREATE PROCEDURE donar_alta(IN nom VARCHAR(100))
BEGIN 
  DECLARE x INT;
  SELECT  MAX(id_aut)+1 INTO x FROM autors;
  INSERT INTO autors(id_aut,nom_aut)
  VALUES (x,nom);
  END$$
  
CALL donar_alta('mar')$$

-- 2.2

DESC llibres$$
DROP PROCEDURE IF EXISTS info_llibre$$



CREATE PROCEDURE info_llibre(IN id int, OUT nombre_autors int, OUT nombre_exemplars int)
BEGIN 
  SELECT COUNT(*) INTO nombre_autors FROM llibres l INNER JOIN lli_aut ll on
   l.ID_LLIB = ll.FK_IDLLIB WHERE id_llib = id;
  SELECT COUNT(*) INTO nombre_exemplars FROM exemplars INNER JOIN llibres on
  llibres.ID_LLIB = exemplars.FK_IDLLIB WHERE id_llib = id; 
  
  END$$


  SET @aut = "" $$
  SET @ex = 1 $$
  CALL info_llibre(22,@aut,@ex)$$
   
   SELECT @aut,@ex$$


