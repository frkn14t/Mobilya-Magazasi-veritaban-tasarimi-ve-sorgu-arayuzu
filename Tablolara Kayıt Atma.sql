--�r�n Kategorileri Tablosu


-- Mobilya kategorisi ekleme
INSERT INTO �r�nKategorileri (KategoriAd�) VALUES ('Mobilya');

-- Koltuklar alt kategorisi ekleme
INSERT INTO �r�nKategorileri (KategoriAd�, �stKategoriID) VALUES ('Koltuklar', 1);

-- Masalar alt kategorisi ekleme
INSERT INTO �r�nKategorileri (KategoriAd�, �stKategoriID) VALUES ('Masalar', 1);

-- Yataklar alt kategorisi ekleme
INSERT INTO �r�nKategorileri (KategoriAd�, �stKategoriID) VALUES ('Yataklar', 1);

-- Deri Koltuklar alt kategorisi ekleme
INSERT INTO �r�nKategorileri (KategoriAd�, �stKategoriID) VALUES ('Deri Koltuklar', 2);


--�r�nler Tablosu

-- Koltuk ekleme
INSERT INTO �r�nler (�r�nAd�, KategoriID, Malzeme, Renk, Boyut, Fiyat, StokKodu) 
VALUES ('Deri Koltuk', 4, 'Deri', 'Siyah', 'B�y�k', 15000.00, 'KLT-001');

-- Masa ekleme
INSERT INTO �r�nler (�r�nAd�, KategoriID, Malzeme, Renk, Boyut, Fiyat, StokKodu) 
VALUES ('Ah�ap Masa', 3, 'Ah�ap', 'Kahverengi', 'Orta', 7500.00, 'MSA-002');

-- Yatak ekleme
INSERT INTO �r�nler (�r�nAd�, KategoriID, Malzeme, Renk, Boyut, Fiyat, StokKodu) 
VALUES ('�ift Ki�ilik Yatak', 5, 'Metal', 'Beyaz', 'B�y�k', 19000.00, 'YTK-003');


--M��teriler Tablosu
-- M��teri ekleme
INSERT INTO M��teriler (AdSoyad, Eposta, Telefon, Adres)
VALUES ('Ahmet Y�lmaz', 'ahmetyilmaz@mail.com', '555-123-4567', '�stanbul, T�rkiye');


--Sipari�ler Tablosu:
-- Sipari� ekleme
INSERT INTO Sipari�ler (M��teriID, Sipari�Tarihi, TeslimTarihi, �demeY�ntemi, ToplamTutar) 
VALUES (1, GETDATE(), DATEADD(day, 3, GETDATE()), 'Kredi Kart�', 22500.00);


--Sipari�Detaylar� Tablosu:
-- Sipari� detay� ekleme
INSERT INTO Sipari�Detaylar� (Sipari�ID, �r�nID, Miktar) 
VALUES (1, 1, 1);

-- Ayn� sipari�e ba�ka bir �r�n ekleme
INSERT INTO Sipari�Detaylar� (Sipari�ID, �r�nID, Miktar) 
VALUES (1, 2, 1);

--�al��anlar Tablosu
-- �al��an ekleme
INSERT INTO �al��anlar (AdSoyad, Departman, Rol, Yetkiler)
VALUES ('Mehmet Can �zdemir', 'Sat��', 'Sat�� Temsilcisi', 'Sipari� Olu�turma, Stok G�r�nt�leme');


--Tedarik�iler Tablosu:
-- Tedarik�i ekleme
INSERT INTO Tedarik�iler (Ad�, �leti�imBilgileri, �r�nYelpazesi, FiyatListesi, �demeKo�ullar�)
VALUES ('ABC Mobilya', 'abcmobilya@mail.com', 'Koltuk, Masa, Yatak', 'Fatura ile', '30 G�n �deme');


--Stok Tablosu:
-- Stok ekleme
INSERT INTO Stok (�r�nID, StokSeviyesi, DepoYeri, SonSat�nAlmaTarihi, SonSat��Tarihi)
VALUES (1, 50, 'Ana Depo', GETDATE(), GETDATE());
