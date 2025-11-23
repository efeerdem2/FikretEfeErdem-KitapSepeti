IF DB_ID('KitapSepeti') IS NULL
    CREATE DATABASE KitapSepeti;
GO

-- Database'i kullan
USE KitapSepeti;
GO

Create Table Musteri(
MusteriId int primary key identity(1,1) not null,
MustAd varchar(30),
MustSoyad varchar(30),
MustTelefon1 varchar(18),
MustTelefon2 varchar(18),
MustAdres1 varchar (100),
MustAdresMah varchar (100)
);
create table Siparis(
SiparisId int primary key identity(1,1) not null,
MusteriId int not null,
SiparisTarihi Date,
Odeme varchar(30),
KargoFirma varchar(30),
KargoTakipNo varchar(30),
TeslimDurumu varchar(30),
KampanyaKodu varchar(30),
KampanyaIndirim int,
foreign key (MusteriId) REFERENCES Musteri(MusteriId)
);
create table kategori(
KategoriId int primary key identity,
KategoriAdi varchar(30)
);
create table KitapBilgi(
KitapId int primary key identity,
KitapAdi varchar(30),
YazarAdi varchar(30),
KategoriId int,
BirimFÝyat decimal(10,2),
foreign key (KategoriId) REFERENCES Kategori(KategoriId)
);
create table Yorum(
YorumId int primary key identity,
SiparisId int,
YorumMetni varchar(300),
YorumPuani int,
foreign key (SiparisId) references Siparis(SiparisId)
);
create table SiparisBilgi(
SiparisBilgiId int primary key identity,
SiparisId int,
KitapId int,
Adet int,
ToplamTutar decimal(10,2),
foreign key (SiparisId) references Siparis(SiparisId),
foreign key (KitapId) references  KitapBilgi(KitapId)
);