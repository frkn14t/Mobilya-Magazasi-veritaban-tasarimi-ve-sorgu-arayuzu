-- �r�n Kategorileri Tablosu
CREATE TABLE �r�nKategorileri (
    KategoriID INT PRIMARY KEY IDENTITY(1,1),
    KategoriAd� VARCHAR(255) NOT NULL,
    �stKategoriID INT NULL,
    FOREIGN KEY (�stKategoriID) REFERENCES �r�nKategorileri(KategoriID)
);

-- �r�nler Tablosu
CREATE TABLE �r�nler (
    �r�nID INT PRIMARY KEY IDENTITY(1,1),
    �r�nAd� VARCHAR(255) NOT NULL,
    KategoriID INT FOREIGN KEY REFERENCES �r�nKategorileri(KategoriID),
    Malzeme VARCHAR(100),
    Renk VARCHAR(50),
    Boyut VARCHAR(50),
    Fiyat DECIMAL(10,2) NOT NULL,
    StokKodu VARCHAR(50)
);

-- M��teriler Tablosu
CREATE TABLE M��teriler (
    M��teriID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad VARCHAR(255) NOT NULL,
    Eposta VARCHAR(255) NOT NULL,
    Telefon VARCHAR(20),
    Adres VARCHAR(255)
);

-- Sipari�ler Tablosu
CREATE TABLE Sipari�ler (
    Sipari�ID INT PRIMARY KEY IDENTITY(1,1),
    M��teriID INT FOREIGN KEY REFERENCES M��teriler(M��teriID),
    Sipari�Tarihi DATETIME NOT NULL,
    TeslimTarihi DATETIME,
    �demeY�ntemi VARCHAR(50),
    ToplamTutar DECIMAL(10,2)
);

-- Sipari�Detaylar� Tablosu
CREATE TABLE Sipari�Detaylar� (
    Sipari�DetayID INT PRIMARY KEY IDENTITY(1,1),
    Sipari�ID INT FOREIGN KEY REFERENCES Sipari�ler(Sipari�ID),
    �r�nID INT FOREIGN KEY REFERENCES �r�nler(�r�nID),
    Miktar INT NOT NULL
);

-- �al��anlar Tablosu
CREATE TABLE �al��anlar (
    �al��anID INT PRIMARY KEY IDENTITY(1,1),
    AdSoyad VARCHAR(255) NOT NULL,
    Departman VARCHAR(50),
    Rol VARCHAR(50),
    Yetkiler VARCHAR(255)
);

-- Tedarik�iler Tablosu
CREATE TABLE Tedarik�iler (
    Tedarik�iID INT PRIMARY KEY IDENTITY(1,1),
    Ad� VARCHAR(255) NOT NULL,
    �leti�imBilgileri VARCHAR(255),
    �r�nYelpazesi VARCHAR(255),
    FiyatListesi VARCHAR(255),
    �demeKo�ullar� VARCHAR(255)
);

-- Stok Tablosu
CREATE TABLE Stok (
    StokID INT PRIMARY KEY IDENTITY(1,1),
    �r�nID INT FOREIGN KEY REFERENCES �r�nler(�r�nID),
    StokSeviyesi INT NOT NULL,
    DepoYeri VARCHAR(100),
    SonSat�nAlmaTarihi DATETIME,
    SonSat��Tarihi DATETIME
);

