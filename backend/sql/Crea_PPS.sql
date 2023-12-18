DELIMITER $$
--
-- Procedure
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CREA_PPS` (IN `param1` INT(6))  MODIFIES  DATA BEGIN
DECLARE filecnt, colcnt, fc,pfd,pfu INT;
DECLARE numpro, numsala, dummysala, maxfile, maxposti INT;
DECLARE cc CHAR(1);
DECLARE lbl CHAR(4);

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
	  set pfd = (colcnt DIV 10) + 48;
      set pfu = (colcnt MOD 10) + 48;
      set lbl = CHAR(fc,pfd,pfu);
      INSERT INTO posti_proiezione (idposto,idproiezione,fila,numero,label) VALUES (NULL,param1, cc, colcnt,lbl);
      SET colcnt = colcnt + 1;
   END WHILE rc;
   SET filecnt=filecnt+1;
END WHILE fc;
END$$

DELIMITER ;