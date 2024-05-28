--"EnÇokSatılanÜrünler" adlı bir View,
--her ürünün toplam satış miktarını (SiparişDetayları tablosundan) listeler ve en çok satılan ürünleri gösterir.

CREATE VIEW EnÇokSatılanÜrünler AS
SELECT 
    p.ÜrünAdı,
    SUM(sd.Miktar) AS ToplamSatışMiktarı
FROM 
    Ürünler p
JOIN 
    SiparişDetayları sd ON p.ÜrünID = sd.ÜrünID
GROUP BY 
    p.ÜrünAdı


