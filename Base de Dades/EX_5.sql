USE biblioteca;

delimiter $$

DROP FUNCTION IF EXISTS llibreEditorial$$
CREATE FUNCTION llibreEditorial(idEditorial int)
RETURNS TEXT
BEGIN
 DECLARE vtitol VARCHAR(100);
 DECLARE resultat text DEFAULT '';
 DECLARE final int default 0;
 DECLARE CRLLIBRES cursor for 
      SELECT TITOL FROM LLIBRES 
      where fk_idedit=idEditorial;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET Final=1;     
 open CRLLIBRES;
 BUCLE:loop
   fetch CRLLIBRES INTO vtitol;
   IF Final=1 THEN leave BUCLE; END IF;
SET resultat=CONCAT(resultat,' - ',vtitol);
 END LOOP  ;
 close CRLLIBRES;
 RETURN resultat;
END$$

SELECT llibreEditorial(2)$$
SELECT titol FROM llibres