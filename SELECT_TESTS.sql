SELECT u.NAME,w.KONTOSTAND,w.ADRESSE 
FROM "USER" u, WALLET w, WAEHRUNG c
WHERE u.ID=w.USER_ID and c.ID=w.WAEHRUNG_ID and c.NAME='ETH';