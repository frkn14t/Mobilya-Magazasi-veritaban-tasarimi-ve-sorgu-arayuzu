-- Ürün Kategorileri Tablosu
CREATE TABLE ÜrünKategorileri (
    KategoriID INT PRIMARY KEY IDENTITY(1,1),
    KategoriAdý VARCHAR(255) NOT NULL,
    ÜstKategoriID INT NULL,
    FOREIGN KEY (ÜstKategoriID) REFERENCES ÜrünKategorileri(KategoriID)
);

-- Ürünler Tablosu
CREATE TABLE Ürünler (
    ÜrünID INT PRIMARY KEY IDENTITY(1,1),
    ÜrünAdý VARCHAR(255) NOT NULL,
    KategoriID INT FOREIGN KEY REFERENCES ÜrünKategorileri(KategoriID),
    Malzeme VARCHAR(100),
    Renk VARCHAR(50),
    Boyut VARCHAR(50),
    Fiyat DECIMAL(10,2) NOT NULL,
    StokKodu VARCHAR(50)
);

-- Müþteriler Tablosu
CREATE TABLE Müþteriler (
    MüþteriID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad VARCHAR(255) NOT NULL,
    Eposta VARCHAR(255) NOT NULL,
    Telefon VARCHAR(20),
    Adres VARCHAR(255)
);

-- Sipariþler Tablosu
CREATE TABLE Sipariþler (
    SipariþID INT PRIMARY KEY IDENTITY(1,1),
    MüþteriID INT FOREIGN KEY REFERENCES Müþteriler(MüþteriID),
    SipariþTarihi DATETIME NOT NULL,
    TeslimTarihi DATETIME,
    ÖdemeYöntemi VARCHAR(50),
    ToplamTutar DECIMAL(10,2)
);

-- SipariþDetaylarý Tablosu
CREATE TABLE SipariþDetaylarý (
    SipariþDetayID INT PRIMARY KEY IDENTITY(1,1),
    SipariþID INT FOREIGN KEY REFERENCES Sipariþler(SipariþID),
    ÜrünID INT FOREIGN KEY REFERENCES Ürünler(ÜrünID),
    Miktar INT NOT NULL
);

-- Çalýþanlar Tablosu
CREATE TABLE Çalýþanlar (
    ÇalýþanID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad VARCHAR(255) NOT NULL,
    Departman VARCHAR(50),
    Rol VARCHAR(50),
    Yetkiler VARCHAR(255)
);

-- Tedarikçiler Tablosu
CREATE TABLE Tedarikçiler (
    TedarikçiID INT PRIMARY KEY IDENTITY(1,1),
    Adý VARCHAR(255) NOT NULL,
    ÝletiþimBilgileri VARCHAR(255),
    ÜrünYelpazesi VARCHAR(255),
    FiyatListesi VARCHAR(255),
    ÖdemeKoþullarý VARCHAR(255)
);

-- Stok Tablosu
CREATE TABLE Stok (
    StokID INT PRIMARY KEY IDENTITY(1,1),
    ÜrünID INT FOREIGN KEY REFERENCES Ürünler(ÜrünID),
    StokSeviyesi INT NOT NULL,
    DepoYeri VARCHAR(100),
    SonSatýnAlmaTarihi DATETIME,
    SonSatýþTarihi DATETIME
);

