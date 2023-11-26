DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREA_PPS`(IN `param1` INT(6))
    MODIFIES SQL DATA
BEGIN
DECLARE filecnt, colcnt, fc INT;
DECLARE numpro, numsala, dummysala, maxfile, maxposti INT;
DECLARE cc CHAR(1);

SELECT idproiezione, idsala INTO numpro, numsala FROM proiezioni WHERE idproiezione = param1 LIMIT 1;

SELECT idsala, fila, posti_fila
INTO dummysala,maxfile,maxposti
FROM sale
WHERE idsala = numsala LIMIT 1;

SET filecnt = 1; 
fc: WHILE filecnt <= maxfile DO
      SET colcnt = 1;
      SET fc = filecnt + 64;
      SET cc = CHAR(fc);
rc:   WHILE colcnt <= maxposti DO       
      INSERT INTO posti_proiezione (idposto,idproiezione,fila,numero) VALUES (NULL,param1, cc, colcnt);
      SET colcnt = colcnt + 1;
   END WHILE rc;
   SET filecnt=filecnt+1;
END WHILE fc;
END$$
DELIMITER ;