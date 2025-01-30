--1
SELECT i.GEWINN,u.KONTOSTAND
FROM Investors i
LEFT JOIN "USER" u ON u.ID=i.USER_ID;
--2
SELECT round(AVG(u.KONTOSTAND),2),c.NAME
FROM WALLET w
LEFT JOIN "USER" u ON u.ID=w.USER_ID 
JOIN WAEHRUNG c ON w.WAEHRUNG_ID=c.ID
GROUP BY c.NAME;