--Trigger
--Sipari�DetayEkleTrigger", Sipari�Detaylar� tablosuna yeni bir kay�t eklendi�inde,
--ilgili �r�n�n stok seviyesini g�nceller.


CREATE TRIGGER Sipari�DetayEkleTrigger
ON Sipari�Detaylar�
AFTER INSERT
AS
BEGIN
    -- inserted tablosundan �r�nID'yi al�n
    DECLARE @�r�nID INT;
    SELECT @�r�nID = �r�nID FROM inserted;

    -- Stok tablosunu g�ncelleyin
    UPDATE Stok
    SET StokSeviyesi = StokSeviyesi - (SELECT Miktar FROM inserted)
    WHERE �r�nID = @�r�nID;
END;

/*
DECLARE @�r�nID INT; ile �r�nID i�in bir de�i�ken tan�mlan�r.
SELECT @�r�nID = �r�nID FROM inserted; ile inserted tablosundan �r�nID de�eri al�n�r ve de�i�kene atan�r.
UPDATE Stok SET StokSeviyesi = StokSeviyesi - (SELECT Miktar FROM inserted) WHERE �r�nID = @�r�nID; ile stok seviyesi g�ncellenir.
(SELECT Miktar FROM inserted) ile inserted tablosundaki Miktar de�eri al�n�r ve StokSeviyesi'nden ��kar�l�r.
WHERE �r�nID = @�r�nID ile g�ncelleme i�lemi, do�ru �r�n i�in yap�l�r.

*/