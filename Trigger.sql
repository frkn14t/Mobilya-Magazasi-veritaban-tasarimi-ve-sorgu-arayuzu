--Trigger
--SipariþDetayEkleTrigger", SipariþDetaylarý tablosuna yeni bir kayýt eklendiðinde,
--ilgili ürünün stok seviyesini günceller.


CREATE TRIGGER SipariþDetayEkleTrigger
ON SipariþDetaylarý
AFTER INSERT
AS
BEGIN
    -- inserted tablosundan ÜrünID'yi alýn
    DECLARE @ÜrünID INT;
    SELECT @ÜrünID = ÜrünID FROM inserted;

    -- Stok tablosunu güncelleyin
    UPDATE Stok
    SET StokSeviyesi = StokSeviyesi - (SELECT Miktar FROM inserted)
    WHERE ÜrünID = @ÜrünID;
END;

/*
DECLARE @ÜrünID INT; ile ÜrünID için bir deðiþken tanýmlanýr.
SELECT @ÜrünID = ÜrünID FROM inserted; ile inserted tablosundan ÜrünID deðeri alýnýr ve deðiþkene atanýr.
UPDATE Stok SET StokSeviyesi = StokSeviyesi - (SELECT Miktar FROM inserted) WHERE ÜrünID = @ÜrünID; ile stok seviyesi güncellenir.
(SELECT Miktar FROM inserted) ile inserted tablosundaki Miktar deðeri alýnýr ve StokSeviyesi'nden çýkarýlýr.
WHERE ÜrünID = @ÜrünID ile güncelleme iþlemi, doðru ürün için yapýlýr.

*/