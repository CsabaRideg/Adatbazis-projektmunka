DROP DATABASE IF EXISTS Amoung_Us;
CREATE DATABASE Amoung_Us DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE Amoung_Us;

CREATE TABLE Gyanusitottak (
  id SERIAL PRIMARY KEY, nev VARCHAR(255)
);

CREATE TABLE Tulajdonsagok (
  id SERIAL PRIMARY KEY,
  gyanusitott_id BIGINT UNSIGNED,
  szerep VARCHAR(255),
  eletkor INTEGER,
  szakma VARCHAR(255),
  kapcsolatStatusz BOOLEAN,
  magassag INTEGER,
  hajszin VARCHAR(255),
  szemszin VARCHAR(255),
  FOREIGN KEY (gyanusitott_id) REFERENCES Gyanusitottak(id)
);

CREATE TABLE Detectivek (
  id SERIAL PRIMARY KEY,
  nev VARCHAR(255),
  tapasztalat INTEGER
);

CREATE TABLE Vallomasok (
  id SERIAL PRIMARY KEY,
  gyanusitott_id BIGINT UNSIGNED,
  detektiv_id BIGINT UNSIGNED,
  name VARCHAR(255),
  body TEXT,
  status VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (gyanusitott_id) REFERENCES Gyanusitottak(id),
  FOREIGN KEY (detektiv_id) REFERENCES Detectivek(id)
);

INSERT INTO Gyanusitottak (nev)
VALUES ('Kovács Béla'),
  ('Nagy Anna'),
  ('Tóth László'),
  ('Szabó Erika'),
  ('Farkas Dénes'),
  ('Kiss Júlia'),
  ('Varga Gábor'),
  ('Molnár Petra'),
  ('Horváth Zoltán'),
  ('Lakatos Kitti');
INSERT INTO Detectivek (nev, tapasztalat)
VALUES ('Nyomozó János', 12),
  ('Detektív Réka', 8);
INSERT INTO Tulajdonsagok (
    gyanusitott_id,
    szerep,
    eletkor,
    szakma,
    kapcsolatStatusz,
    magassag,
    hajszin,
    szemszin
  )
VALUES (
    1,
    'Tanár',
    45,
    'Fizika tanár',
    TRUE,
    172,
    'Barna',
    'Zöld'
  ),
  (
    2,
    'Diák',
    19,
    'Egyetemista',
    FALSE,
    165,
    'Fekete',
    'Kék'
  ),
  (
    3,
    'Vállalkozó',
    38,
    'Informatikus',
    TRUE,
    180,
    'Szőke',
    'Barna'
  ),
  (
    4,
    'Pék',
    33,
    'Pékségvezető',
    TRUE,
    160,
    'Barna',
    'Kék'
  ),
  (
    5,
    'Munkanélküli',
    27,
    'Korábbi pincér',
    FALSE,
    175,
    'Fekete',
    'Zöld'
  ),
  (
    6,
    'Ápoló',
    41,
    'Egészségügy',
    TRUE,
    168,
    'Vörös',
    'Szürke'
  ),
  (
    7,
    'Sofőr',
    36,
    'Buszsofőr',
    TRUE,
    182,
    'Barna',
    'Barna'
  ),
  (
    8,
    'Eladó',
    29,
    'Boltban dolgozik',
    FALSE,
    163,
    'Szőke',
    'Kék'
  ),
  (
    9,
    'Ügyvéd',
    48,
    'Jogász',
    TRUE,
    178,
    'Fekete',
    'Fekete'
  ),
  (
    10,
    'Szakács',
    31,
    'Étterem',
    FALSE,
    170,
    'Barna',
    'Zöld'
  );
INSERT INTO Vallomasok (gyanusitott_id, detektiv_id, name, body, status)
VALUES -- Gyanúsított 1
  (
    1,
    1,
    'Első vallomás',
    'A gyanúsított azt állította, hogy otthon volt a bűntény idején.',
    'nyitott'
  ),
  (
    1,
    2,
    'Második vallomás',
    'Zavaros történetet adott elő, ami ellentmond más tanúknak.',
    'vizsgálat alatt'
  ),
  (
    1,
    1,
    'Harmadik vallomás',
    'Megemlítette, hogy veszekedett az áldozattal előző nap.',
    'zárt'
  ),
  -- Gyanúsított 2
  (
    2,
    2,
    'Első vallomás',
    'Nem emlékszik pontosan a történtekre.',
    'nyitott'
  ),
  (
    2,
    1,
    'Második vallomás',
    'Állítása szerint egész este videojátékozott.',
    'vizsgálat alatt'
  ),
  (
    2,
    2,
    'Harmadik vallomás',
    'Többször is ellentmondott saját magának.',
    'zárt'
  ),
  -- Gyanúsított 3
  (
    3,
    1,
    'Első vallomás',
    'Azt mondta, csak véletlenül járt arra.',
    'nyitott'
  ),
  (
    3,
    1,
    'Második vallomás',
    'Nem tudott alibit biztosítani.',
    'vizsgálat alatt'
  ),
  (
    3,
    2,
    'Harmadik vallomás',
    'Másokra próbálta terelni a gyanút.',
    'zárt'
  ),
  -- Gyanúsított 4
  (
    4,
    2,
    'Első vallomás',
    'Határozottan tagadott mindent.',
    'nyitott'
  ),
  (
    4,
    1,
    'Második vallomás',
    'Megkérdőjelezhető viselkedést mutatott a kihallgatás során.',
    'vizsgálat alatt'
  ),
  (
    4,
    2,
    'Harmadik vallomás',
    'Ismerte az áldozatot, de állítása szerint jóban voltak.',
    'zárt'
  ),
  -- Gyanúsított 5
  (
    5,
    1,
    'Első vallomás',
    'Idegesen viselkedett és sokat hezitált.',
    'nyitott'
  ),
  (
    5,
    2,
    'Második vallomás',
    'Folyton a telefonját nézte, nem tudta leadni.',
    'vizsgálat alatt'
  ),
  (
    5,
    2,
    'Harmadik vallomás',
    'Állítólag félt az áldozattól.',
    'zárt'
  ),
  -- Gyanúsított 6
  (
    6,
    2,
    'Első vallomás',
    'Nem volt hajlandó együttműködni.',
    'nyitott'
  ),
  (
    6,
    1,
    'Második vallomás',
    'Csak ügyvéd jelenlétében nyilatkozott.',
    'vizsgálat alatt'
  ),
  (
    6,
    2,
    'Harmadik vallomás',
    'Később elismert néhány részletet.',
    'zárt'
  ),
  -- Gyanúsított 7
  (
    7,
    1,
    'Első vallomás',
    'A bűntény idején dolgozott, de nincs alibije.',
    'nyitott'
  ),
  (
    7,
    1,
    'Második vallomás',
    'Több szemtanú is látta a környéken.',
    'vizsgálat alatt'
  ),
  (
    7,
    2,
    'Harmadik vallomás',
    'Állítólag régi sérelmei voltak az áldozattal.',
    'zárt'
  ),
  -- Gyanúsított 8
  (
    8,
    2,
    'Első vallomás',
    'Bevallotta, hogy aznap ittas volt.',
    'nyitott'
  ),
  (
    8,
    2,
    'Második vallomás',
    'Sok mindent elfelejtett a történtekről.',
    'vizsgálat alatt'
  ),
  (
    8,
    1,
    'Harmadik vallomás',
    'Állítólag valaki másra próbálta rákenni.',
    'zárt'
  ),
  -- Gyanúsított 9
  (
    9,
    1,
    'Első vallomás',
    'Jogilag próbálta védeni magát.',
    'nyitott'
  ),
  (
    9,
    2,
    'Második vallomás',
    'Ellentmondásos jogi érveket használt.',
    'vizsgálat alatt'
  ),
  (
    9,
    2,
    'Harmadik vallomás',
    'Az áldozat ügyfele volt.',
    'zárt'
  ),
  -- Gyanúsított 10
  (
    10,
    2,
    'Első vallomás',
    'A konyhában tartózkodott állítólag.',
    'nyitott'
  ),
  (
    10,
    1,
    'Második vallomás',
    'Kollégája nem tudja megerősíteni az alibit.',
    'vizsgálat alatt'
  ),
  (
    10,
    2,
    'Harmadik vallomás',
    'Korábban vitáztak a menüről.',
    'zárt'
  );

-- Melyik gyanúsítottak nevei szerepelnek az adatbázisban?
SELECT nev FROM Gyanusitottak;

-- Melyik detektívek rendelkeznek 10 vagy annál több év tapasztalattal?
SELECT nev, tapasztalat FROM Detectivek WHERE tapasztalat >= 10;

-- Mutasd meg a gyanúsítottak nevét és a hozzájuk tartozó tulajdonságokat (életkor, szakma, magasság)!
SELECT g.nev, t.eletkor, t.szakma, t.magassag
FROM Gyanusitottak g
JOIN Tulajdonsagok t ON g.id = t.gyanusitott_id;

-- Melyik gyanúsítottaknak van aktív (nyitott) vallomása?
SELECT DISTINCT g.nev
FROM Gyanusitottak g
JOIN Vallomasok v ON g.id = v.gyanusitott_id
WHERE v.status = 'nyitoStt';

-- Mutasd meg minden detektív nevét és az általuk készített vallomások számát!
SELECT d.nev, COUNT(v.id) AS vallomasok_szama
FROM Detectivek d
LEFT JOIN Vallomasok v ON d.id = v.detektiv_id
GROUP BY d.id, d.nev;

-- Melyik gyanúsítottaknak van legalább egy zárt státuszú vallomása, és mi a vallomásuk szövege?
SELECT g.nev, v.body
FROM Gyanusitottak g
JOIN Vallomasok v ON g.id = v.gyanusitott_id
WHERE v.status = 'zárt';
