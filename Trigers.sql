CREATE OR REPLACE TRIGGER KONTOSTAND_USER 
BEFORE INSERT OR UPDATE ON WALLET
FOR EACH ROW
BEGIN
    IF :OLD.KONTOSTAND!=0 THEN
        UPDATE "USER" --Ziehe alte Kontostand ab
        SET KONTOSTAND = KONTOSTAND +( :OLD.KONTOSTAND* (SELECT KURS  
                                                    FROM Pair 
                                                    WHERE :NEW.WAEHRUNG_ID =Pair.BaseCrypto_ID 
                                                    AND PAIR.QUOTECRYPTO_ID= 1))
        WHERE ID = :NEW.USER_ID;    
    END IF;                          
   
    UPDATE "USER" --Addiere neue Kontostand 
    SET KONTOSTAND = KONTOSTAND +( :NEW.KONTOSTAND* (SELECT KURS 
                                                    FROM Pair 
                                                    WHERE :NEW.WAEHRUNG_ID =Pair.BaseCrypto_ID 
                                                    AND PAIR.QUOTECRYPTO_ID= 1))
    WHERE ID = :NEW.USER_ID;
END;
