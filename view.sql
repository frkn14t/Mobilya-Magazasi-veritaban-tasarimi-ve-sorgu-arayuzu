--"En�okSat�lan�r�nler" adl� bir View,
--her �r�n�n toplam sat�� miktar�n� (Sipari�Detaylar� tablosundan) listeler ve en �ok sat�lan �r�nleri g�sterir.

CREATE VIEW En�okSat�lan�r�nler AS
SELECT 
    p.�r�nAd�,
    SUM(sd.Miktar) AS ToplamSat��Miktar�
FROM 
    �r�nler p
JOIN 
    Sipari�Detaylar� sd ON p.�r�nID = sd.�r�nID
GROUP BY 
    p.�r�nAd�


