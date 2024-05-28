--Ürün Kategorileri Tablosu


-- Mobilya kategorisi ekleme
INSERT INTO ÜrünKategorileri (KategoriAdý) VALUES ('Mobilya');

-- Koltuklar alt kategorisi ekleme
INSERT INTO ÜrünKategorileri (KategoriAdý, ÜstKategoriID) VALUES ('Koltuklar', 1);

-- Masalar alt kategorisi ekleme
INSERT INTO ÜrünKategorileri (KategoriAdý, ÜstKategoriID) VALUES ('Masalar', 1);

-- Yataklar alt kategorisi ekleme
INSERT INTO ÜrünKategorileri (KategoriAdý, ÜstKategoriID) VALUES ('Yataklar', 1);

-- Deri Koltuklar alt kategorisi ekleme
INSERT INTO ÜrünKategorileri (KategoriAdý, ÜstKategoriID) VALUES ('Deri Koltuklar', 2);


--Ürünler Tablosu

-- Koltuk ekleme
INSERT INTO Ürünler (ÜrünAdý, KategoriID, Malzeme, Renk, Boyut, Fiyat, StokKodu) 
VALUES ('Deri Koltuk', 4, 'Deri', 'Siyah', 'Büyük', 15000.00, 'KLT-001');

-- Masa ekleme
INSERT INTO Ürünler (ÜrünAdý, KategoriID, Malzeme, Renk, Boyut, Fiyat, StokKodu) 
VALUES ('Ahþap Masa', 3, 'Ahþap', 'Kahverengi', 'Orta', 7500.00, 'MSA-002');

-- Yatak ekleme
INSERT INTO Ürünler (ÜrünAdý, KategoriID, Malzeme, Renk, Boyut, Fiyat, StokKodu) 
VALUES ('Çift Kiþilik Yatak', 5, 'Metal', 'Beyaz', 'Büyük', 19000.00, 'YTK-003');


--Müþteriler Tablosu
-- Müþteri ekleme
INSERT INTO Müþteriler (AdSoyad, Eposta, Telefon, Adres)
VALUES ('Ahmet Yýlmaz', 'ahmetyilmaz@mail.com', '555-123-4567', 'Ýstanbul, Türkiye');


--Sipariþler Tablosu:
-- Sipariþ ekleme
INSERT INTO Sipariþler (MüþteriID, SipariþTarihi, TeslimTarihi, ÖdemeYöntemi, ToplamTutar) 
VALUES (1, GETDATE(), DATEADD(day, 3, GETDATE()), 'Kredi Kartý', 22500.00);


--SipariþDetaylarý Tablosu:
-- Sipariþ detayý ekleme
INSERT INTO SipariþDetaylarý (SipariþID, ÜrünID, Miktar) 
VALUES (1, 1, 1);

-- Ayný sipariþe baþka bir ürün ekleme
INSERT INTO SipariþDetaylarý (SipariþID, ÜrünID, Miktar) 
VALUES (1, 2, 1);

--Çalýþanlar Tablosu
-- Çalýþan ekleme
INSERT INTO Çalýþanlar (AdSoyad, Departman, Rol, Yetkiler)
VALUES ('Mehmet Can Özdemir', 'Satýþ', 'Satýþ Temsilcisi', 'Sipariþ Oluþturma, Stok Görüntüleme');


--Tedarikçiler Tablosu:
-- Tedarikçi ekleme
INSERT INTO Tedarikçiler (Adý, ÝletiþimBilgileri, ÜrünYelpazesi, FiyatListesi, ÖdemeKoþullarý)
VALUES ('ABC Mobilya', 'abcmobilya@mail.com', 'Koltuk, Masa, Yatak', 'Fatura ile', '30 Gün Ödeme');


--Stok Tablosu:
-- Stok ekleme
INSERT INTO Stok (ÜrünID, StokSeviyesi, DepoYeri, SonSatýnAlmaTarihi, SonSatýþTarihi)
VALUES (1, 50, 'Ana Depo', GETDATE(), GETDATE());
