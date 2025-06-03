// Tworzenie węzłów Autorów
CREATE (:Autor {
  id: "A1",
  imie: "Stephen",
  nazwisko: "King",
  data_urodzenia: date("1947-09-21"),
  narodowosc: "amerykańska",
  biografia: "Autor horrorów i thrillerów psychologicznych"
});

CREATE (:Autor {
  id: "A2",
  imie: "Andrzej",
  nazwisko: "Sapkowski",
  data_urodzenia: date("1948-06-21"),
  narodowosc: "polska",
  biografia: "Twórca sagi o Wiedźminie"
});

CREATE (:Autor {
  id: "A3",
  imie: "J.K.",
  nazwisko: "Rowling",
  data_urodzenia: date("1965-07-31"),
  narodowosc: "brytyjska",
  biografia: "Autorka serii o Harrym Potterze"
});

CREATE (:Autor {
  id: "A4",
  imie: "Olga",
  nazwisko: "Tokarczuk",
  data_urodzenia: date("1962-01-29"),
  narodowosc: "polska",
  biografia: "Laureatka Nagrody Nobla w dziedzinie literatury"
});

// Tworzenie węzłów Kategorii
CREATE (:Kategoria {id: "K1", nazwa: "horror"});
CREATE (:Kategoria {id: "K2", nazwa: "fantastyka"});
CREATE (:Kategoria {id: "K3", nazwa: "literatura piękna"});
CREATE (:Kategoria {id: "K4", nazwa: "thriller"});
CREATE (:Kategoria {id: "K5", nazwa: "dla dzieci"});

// Tworzenie węzłów Wydawnictw
CREATE (:Wydawnictwo {
  id: "W1",
  nazwa: "Albatros",
  kraj: "Polska",
  rok_zalozenia: 1991,
  nip: 1234567890,
  regon: 123456,
  krs: 789012,
  Adres: "Warszawa, ul. Książkowa 15"
});

CREATE (:Wydawnictwo {
  id: "W2",
  nazwa: "SuperNOWA",
  kraj: "Polska",
  rok_zalozenia: 1987,
  nip: 9876543210,
  regon: 654321,
  krs: 210987,
  Adres: "Warszawa, ul. Fantastyczna 22"
});

CREATE (:Wydawnictwo {
  id: "W3",
  nazwa: "Bloomsbury",
  kraj: "Wielka Brytania",
  rok_zalozenia: 1986,
  Adres: "London, 50 Bedford Square"
});

// Tworzenie węzłów Pozycji
CREATE (p1:Pozycja {
  id: "P1",
  tytul: "To",
  opis: "Horror o klaunie Pennywise'ie terroryzującym miasteczko Derry",
  rok_wydania: 1986,
  jezyk: "polski",
  typ: "książka",
  isbn: "9788373191723",
  liczba_stron: 1138,
  typ_okładki: "twarda"
});

CREATE (p2:Pozycja {
  id: "P2",
  tytul: "Wiedźmin: Ostatnie życzenie",
  opis: "Pierwszy zbiór opowiadań o wiedźminie Geralcie",
  rok_wydania: 1993,
  jezyk: "polski",
  typ: "książka",
  isbn: "9788375780635",
  liczba_stron: 332,
  typ_okładki: "miękka"
});

CREATE (p3:Pozycja {
  id: "P3",
  tytul: "Harry Potter i Kamień Filozoficzny",
  opis: "Pierwsza część serii o młodym czarodzieju Harrym Potterze",
  rok_wydania: 1997,
  jezyk: "polski",
  typ: "książka",
  isbn: "9788372780563",
  liczba_stron: 328,
  typ_okładki: "twarda"
});

CREATE (p4:Pozycja {
  id: "P4",
  tytul: "Księgi Jakubowe",
  opis: "Epicka powieść historyczna osadzona w XVIII-wiecznej Polsce",
  rok_wydania: 2014,
  jezyk: "polski",
  typ: "książka",
  isbn: "9788308061528",
  liczba_stron: 912,
  typ_okładki: "twarda"
});

CREATE (p5:Pozycja {
  id: "P5",
  tytul: "To",
  opis: "Audiobook horroru o klaunie Pennywise'ie",
  rok_wydania: 2017,
  jezyk: "polski",
  typ: "audiobook",
  czas_trwania: 1440,
  narrator: "Janusz Zadura"
});

CREATE (p6:Pozycja {
  id: "P6",
  tytul: "Wiedźmin: Ostatnie życzenie",
  opis: "Ebook pierwszego zbioru opowiadań o wiedźminie Geralcie",
  rok_wydania: 2015,
  jezyk: "polski",
  typ: "ebook",
  liczba_stron: 332,
  Format: "EPUB"
});

// Tworzenie relacji między Pozycjami a Autorami
MATCH (a:Autor {nazwisko: "King"}), (p:Pozycja {tytul: "To", typ: "książka"})
CREATE (a)-[:NAPISAŁ]->(p);

MATCH (a:Autor {nazwisko: "King"}), (p:Pozycja {tytul: "To", typ: "audiobook"})
CREATE (a)-[:NAPISAŁ]->(p);

MATCH (a:Autor {nazwisko: "Sapkowski"}), (p:Pozycja {tytul: "Wiedźmin: Ostatnie życzenie", typ: "książka"})
CREATE (a)-[:NAPISAŁ]->(p);

MATCH (a:Autor {nazwisko: "Sapkowski"}), (p:Pozycja {tytul: "Wiedźmin: Ostatnie życzenie", typ: "ebook"})
CREATE (a)-[:NAPISAŁ]->(p);

MATCH (a:Autor {nazwisko: "Rowling"}), (p:Pozycja {tytul: "Harry Potter i Kamień Filozoficzny"})
CREATE (a)-[:NAPISAŁ]->(p);

MATCH (a:Autor {nazwisko: "Tokarczuk"}), (p:Pozycja {tytul: "Księgi Jakubowe"})
CREATE (a)-[:NAPISAŁ]->(p);

// Tworzenie relacji między Pozycjami a Kategoriami
MATCH (p:Pozycja {tytul: "To"}), (k:Kategoria {nazwa: "horror"})
CREATE (p)-[:NALEŻY_DO]->(k);

MATCH (p:Pozycja {tytul: "To"}), (k:Kategoria {nazwa: "thriller"})
CREATE (p)-[:NALEŻY_DO]->(k);

MATCH (p:Pozycja {tytul: "Wiedźmin: Ostatnie życzenie"}), (k:Kategoria {nazwa: "fantastyka"})
CREATE (p)-[:NALEŻY_DO]->(k);

MATCH (p:Pozycja {tytul: "Harry Potter i Kamień Filozoficzny"}), (k:Kategoria {nazwa: "fantastyka"})
CREATE (p)-[:NALEŻY_DO]->(k);

MATCH (p:Pozycja {tytul: "Harry Potter i Kamień Filozoficzny"}), (k:Kategoria {nazwa: "dla dzieci"})
CREATE (p)-[:NALEŻY_DO]->(k);

MATCH (p:Pozycja {tytul: "Księgi Jakubowe"}), (k:Kategoria {nazwa: "literatura piękna"})
CREATE (p)-[:NALEŻY_DO]->(k);

// Tworzenie relacji między Pozycjami a Wydawnictwami
MATCH (p:Pozycja {tytul: "To", typ: "książka"}), (w:Wydawnictwo {nazwa: "Albatros"})
CREATE (w)-[:WYDAŁO]->(p);

MATCH (p:Pozycja {tytul: "To", typ: "audiobook"}), (w:Wydawnictwo {nazwa: "Albatros"})
CREATE (w)-[:WYDAŁO]->(p);

MATCH (p:Pozycja {tytul: "Wiedźmin: Ostatnie życzenie", typ: "książka"}), (w:Wydawnictwo {nazwa: "SuperNOWA"})
CREATE (w)-[:WYDAŁO]->(p);

MATCH (p:Pozycja {tytul: "Wiedźmin: Ostatnie życzenie", typ: "ebook"}), (w:Wydawnictwo {nazwa: "SuperNOWA"})
CREATE (w)-[:WYDAŁO]->(p);

MATCH (p:Pozycja {tytul: "Harry Potter i Kamień Filozoficzny"}), (w:Wydawnictwo {nazwa: "Bloomsbury"})
CREATE (w)-[:WYDAŁO]->(p);

MATCH (p:Pozycja {tytul: "Księgi Jakubowe"}), (w:Wydawnictwo {nazwa: "Albatros"})
CREATE (w)-[:WYDAŁO]->(p);

// Tworzenie węzłów Filii
CREATE (:Filia {
  id: "F1",
  nazwa: "Biblioteka Główna",
  adres: "Warszawa, ul. Centralna 10"
});

CREATE (:Filia {
  id: "F2",
  nazwa: "Filia Nr 1",
  adres: "Warszawa, ul. Północna 5"
});

CREATE (:Filia {
  id: "F3",
  nazwa: "Filia Nr 2",
  adres: "Warszawa, ul. Południowa 20"
});

// Tworzenie węzłów Egzemplarzy i relacji z Pozycjami i Filiami
// Egzemplarze dla "To" (książka)
CREATE (e1:Egzemplarz {
  id: "E1",
  numer_egzemplarza: "TO-001",
  status: "dostępny"
});

CREATE (e2:Egzemplarz {
  id: "E2",
  numer_egzemplarza: "TO-002",
  status: "dostępny"
});

CREATE (e3:Egzemplarz {
  id: "E3",
  numer_egzemplarza: "TO-003",
  status: "dostępny"
});

MATCH (p:Pozycja {id: "P1"}), (e:Egzemplarz {id: "E1"}), (f:Filia {id: "F1"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

MATCH (p:Pozycja {id: "P1"}), (e:Egzemplarz {id: "E2"}), (f:Filia {id: "F2"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

MATCH (p:Pozycja {id: "P1"}), (e:Egzemplarz {id: "E3"}), (f:Filia {id: "F3"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

// Egzemplarze dla "Wiedźmin: Ostatnie życzenie" (książka)
CREATE (e4:Egzemplarz {
  id: "E4",
  numer_egzemplarza: "WOL-001",
  status: "dostępny"
});

CREATE (e5:Egzemplarz {
  id: "E5",
  numer_egzemplarza: "WOL-002",
  status: "dostępny"
});

MATCH (p:Pozycja {id: "P2"}), (e:Egzemplarz {id: "E4"}), (f:Filia {id: "F1"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

MATCH (p:Pozycja {id: "P2"}), (e:Egzemplarz {id: "E5"}), (f:Filia {id: "F2"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

// Egzemplarze dla "Harry Potter i Kamień Filozoficzny"
CREATE (e6:Egzemplarz {
  id: "E6",
  numer_egzemplarza: "HPKF-001",
  status: "dostępny"
});

CREATE (e7:Egzemplarz {
  id: "E7",
  numer_egzemplarza: "HPKF-002",
  status: "dostępny"
});

MATCH (p:Pozycja {id: "P3"}), (e:Egzemplarz {id: "E6"}), (f:Filia {id: "F1"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

MATCH (p:Pozycja {id: "P3"}), (e:Egzemplarz {id: "E7"}), (f:Filia {id: "F3"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

// Egzemplarze dla "Księgi Jakubowe"
CREATE (e8:Egzemplarz {
  id: "E8",
  numer_egzemplarza: "KJ-001",
  status: "dostępny"
});

MATCH (p:Pozycja {id: "P4"}), (e:Egzemplarz {id: "E8"}), (f:Filia {id: "F2"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

// Egzemplarz dla "To" (audiobook)
CREATE (e9:Egzemplarz {
  id: "E9",
  numer_egzemplarza: "TO-A-001",
  status: "dostępny"
});

MATCH (p:Pozycja {id: "P5"}), (e:Egzemplarz {id: "E9"}), (f:Filia {id: "F1"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

// Egzemplarz dla "Wiedźmin: Ostatnie życzenie" (ebook)
CREATE (e10:Egzemplarz {
  id: "E10",
  numer_egzemplarza: "WOL-E-001",
  status: "dostępny"
});

MATCH (p:Pozycja {id: "P6"}), (e:Egzemplarz {id: "E10"}), (f:Filia {id: "F1"})
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f);

// Tworzenie węzłów Czytelników
CREATE (:Czytelnik {
  id: "C1",
  imie: "Jan",
  nazwisko: "Kowalski",
  email: "jan.kowalski@example.com",
  login: "jkowalski",
  hasło: "haslo123",
  adres: "Warszawa, ul. Kwiatowa 10/2",
  telefon: "123456789",
  data_urodzenia: date("1985-05-15"),
  płeć: "mężczyzna"
});

CREATE (:Czytelnik {
  id: "C2",
  imie: "Anna",
  nazwisko: "Nowak",
  email: "anna.nowak@example.com",
  login: "anowak",
  hasło: "nowak456",
  adres: "Warszawa, ul. Słoneczna 5",
  telefon: "987654321",
  data_urodzenia: date("1990-08-22"),
  płeć: "kobieta"
});

CREATE (:Czytelnik {
  id: "C3",
  imie: "Piotr",
  nazwisko: "Wiśniewski",
  email: "piotr.wisniewski@example.com",
  login: "pwisniewski",
  hasło: "wisnia789",
  adres: "Warszawa, ul. Leśna 15",
  telefon: "555666777",
  data_urodzenia: date("1978-11-30"),
  płeć: "mężczyzna"
});

// Tworzenie relacji WYPOŻYCZA między Czytelnikami a Egzemplarzami
MATCH (c:Czytelnik {nazwisko: "Kowalski"}), (e:Egzemplarz {id: "E1"})
CREATE (c)-[:WYPOŻYCZA {
  data_wypozyczenia: date("2023-05-10"),
  data_przewidywanego_zwrotu: date("2023-06-10"),
  status: "wypożyczony"
}]->(e);

MATCH (c:Czytelnik {nazwisko: "Nowak"}), (e:Egzemplarz {id: "E4"})
CREATE (c)-[:WYPOŻYCZA {
  data_wypozyczenia: date("2023-05-15"),
  data_przewidywanego_zwrotu: date("2023-06-15"),
  data_zwrotu: date("2023-06-12"),
  status: "zwrócony"
}]->(e);

MATCH (c:Czytelnik {nazwisko: "Nowak"}), (e:Egzemplarz {id: "E6"})
CREATE (c)-[:WYPOŻYCZA {
  data_wypozyczenia: date("2023-06-01"),
  data_przewidywanego_zwrotu: date("2023-07-01"),
  status: "wypożyczony"
}]->(e);

MATCH (c:Czytelnik {nazwisko: "Wiśniewski"}), (e:Egzemplarz {id: "E5"})
CREATE (c)-[:WYPOŻYCZA {
  data_wypozyczenia: date("2023-04-20"),
  data_przewidywanego_zwrotu: date("2023-05-20"),
  data_zwrotu: date("2023-05-25"),
  status: "przeterminowany"
}]->(e);

// Tworzenie relacji REZERWUJE między Czytelnikami a Pozycjami
MATCH (c:Czytelnik {nazwisko: "Kowalski"}), (p:Pozycja {tytul: "Księgi Jakubowe"})
CREATE (c)-[:REZERWUJE {
  data_rezerwacji: date("2023-06-05"),
  status: "oczekująca",
  data_wygasniecia: date("2023-06-12")
}]->(p);

MATCH (c:Czytelnik {nazwisko: "Wiśniewski"}), (p:Pozycja {tytul: "To", typ: "audiobook"})
CREATE (c)-[:REZERWUJE {
  data_rezerwacji: date("2023-05-28"),
  status: "zrealizowana",
  data_wygasniecia: date("2023-06-04")
}]->(p);

// Tworzenie relacji WYSTAWIA_RECENZJE między Czytelnikami a Pozycjami
MATCH (c:Czytelnik {nazwisko: "Nowak"}), (p:Pozycja {tytul: "Wiedźmin: Ostatnie życzenie", typ: "książka"})
CREATE (c)-[:WYSTAWIA_RECENZJE {
  data_recenzji: date("2023-06-13"),
  ocena: 5,
  komentarz: "Fantastyczna książka, polecam każdemu miłośnikowi fantasy!"
}]->(p);

MATCH (c:Czytelnik {nazwisko: "Wiśniewski"}), (p:Pozycja {tytul: "To", typ: "książka"})
CREATE (c)-[:WYSTAWIA_RECENZJE {
  data_recenzji: date("2023-05-26"),
  ocena: 4,
  komentarz: "Dobry horror, chociaż trochę za długi."
}]->(p);

// Tworzenie relacji POSIADA_KARĘ między Czytelnikami a Egzemplarzami
MATCH (c:Czytelnik {nazwisko: "Wiśniewski"}), (e:Egzemplarz {id: "E5"})
CREATE (c)-[:POSIADA_KARE {
  data_nalozenia: date("2023-05-26"),
  kwota: 15.50,
  opis: "Opóźniony zwrot o 5 dni",
  czy_oplacona: false
}]->(e);

// Tworzenie węzłów Pracowników
CREATE (:Pracownik {
  id: "PR1",
  imie: "Maria",
  nazwisko: "Zielińska",
  stanowisko: "bibliotekarz",
  data_zatrudnienia: date("2015-03-10"),
  email: "m.zielinska@biblioteka.pl",
  telefon: "111222333"
});

CREATE (:Pracownik {
  id: "PR2",
  imie: "Tomasz",
  nazwisko: "Wójcik",
  stanowisko: "manager",
  data_zatrudnienia: date("2010-07-15"),
  email: "t.wojcik@biblioteka.pl",
  telefon: "444555666"
});

CREATE (:Pracownik {
  id: "PR3",
  imie: "Agnieszka",
  nazwisko: "Lewandowska",
  stanowisko: "bibliotekarz",
  data_zatrudnienia: date("2018-11-20"),
  email: "a.lewandowska@biblioteka.pl",
  telefon: "777888999"
});

// Tworzenie węzłów Pensji
CREATE (:Pensja {
  id: "PE1",
  Kwota_podstawowa: 4500.00,
  premia: 500.00,
  data_wyplaty: date("2023-06-05"),
  kwota_calkowita: 5000.00
});

CREATE (:Pensja {
  id: "PE2",
  Kwota_podstawowa: 6000.00,
  premia: 1000.00,
  data_wyplaty: date("2023-06-05"),
  kwota_calkowita: 7000.00
});

CREATE (:Pensja {
  id: "PE3",
  Kwota_podstawowa: 4200.00,
  premia: 300.00,
  data_wyplaty: date("2023-06-05"),
  kwota_calkowita: 4500.00
});

// Tworzenie relacji OTRZYMUJE między Pracownikami a Pensjami
MATCH (p:Pracownik {nazwisko: "Zielińska"}), (pe:Pensja {id: "PE1"})
CREATE (p)-[:OTRZYMUJE]->(pe);

MATCH (p:Pracownik {nazwisko: "Wójcik"}), (pe:Pensja {id: "PE2"})
CREATE (p)-[:OTRZYMUJE]->(pe);

MATCH (p:Pracownik {nazwisko: "Lewandowska"}), (pe:Pensja {id: "PE3"})
CREATE (p)-[:OTRZYMUJE]->(pe);

// Tworzenie węzłów Urlopów
CREATE (:Urlop {
  id: "U1",
  data_rozpoczecia: date("2023-07-01"),
  data_zakonczenia: date("2023-07-14"),
  typ: "wypoczynkowy",
  status: "zatwierdzony"
});

CREATE (:Urlop {
  id: "U2",
  data_rozpoczecia: date("2023-08-15"),
  data_zakonczenia: date("2023-08-28"),
  typ: "wypoczynkowy",
  status: "oczekujący"
});

// Tworzenie relacji MA_URLOP między Pracownikami a Urlopami
MATCH (p:Pracownik {nazwisko: "Zielińska"}), (u:Urlop {id: "U1"})
CREATE (p)-[:MA_URLOP {data_przypisania: date("2023-05-20")}]->(u);

MATCH (p:Pracownik {nazwisko: "Lewandowska"}), (u:Urlop {id: "U2"})
CREATE (p)-[:MA_URLOP {data_przypisania: date("2023-06-01")}]->(u);

// Tworzenie węzłów Towarów
CREATE (:Towar {
  id: "T1",
  nazwa: "papier ksero",
  kategoria: "biurowe",
  ilosc: 50,
  cena: 25.99,
  data_dostawy: date("2023-05-15"),
  dostawca: "BiuroPlus"
});

CREATE (:Towar {
  id: "T2",
  nazwa: "długopisy",
  kategoria: "biurowe",
  ilosc: 100,
  cena: 1.99,
  data_dostawy: date("2023-06-01"),
  dostawca: "BiuroPlus"
});

CREATE (:Towar {
  id: "T3",
  nazwa: "książka rejestrowa",
  kategoria: "biurowe",
  ilosc: 10,
  cena: 15.50,
  data_dostawy: date("2023-05-20"),
  dostawca: "Księgarnia ABC"
});

// Tworzenie relacji ZAMAWIA między Pracownikami a Towarami
MATCH (p:Pracownik {nazwisko: "Wójcik"}), (t:Towar {id: "T1"})
CREATE (p)-[:ZAMAWIA {
  data_zamowienia: date("2023-05-10"),
  ilosc: 10,
  status: "zrealizowane"
}]->(t);

MATCH (p:Pracownik {nazwisko: "Zielińska"}), (t:Towar {id: "T2"})
CREATE (p)-[:ZAMAWIA {
  data_zamowienia: date("2023-05-25"),
  ilosc: 50,
  status: "zrealizowane"
}]->(t);

MATCH (p:Pracownik {nazwisko: "Lewandowska"}), (t:Towar {id: "T3"})
CREATE (p)-[:ZAMAWIA {
  data_zamowienia: date("2023-06-05"),
  ilosc: 5,
  status: "złożone"
}]->(t);

// Tworzenie relacji PRACUJE_W między Pracownikami a Filiami
MATCH (p:Pracownik {nazwisko: "Zielińska"}), (f:Filia {id: "F1"})
CREATE (p)-[:PRACUJE_W {
  data_rozpoczecia: date("2015-03-10"),
  etat: 1.0
}]->(f);

MATCH (p:Pracownik {nazwisko: "Wójcik"}), (f:Filia {id: "F1"})
CREATE (p)-[:PRACUJE_W {
  data_rozpoczecia: date("2010-07-15"),
  etat: 1.0
}]->(f);

MATCH (p:Pracownik {nazwisko: "Lewandowska"}), (f:Filia {id: "F2"})
CREATE (p)-[:PRACUJE_W {
  data_rozpoczecia: date("2018-11-20"),
  etat: 0.5
}]->(f);

MATCH (p:Pracownik {nazwisko: "Lewandowska"}), (f:Filia {id: "F3"})
CREATE (p)-[:PRACUJE_W {
  data_rozpoczecia: date("2018-11-20"),
  etat: 0.5
}]->(f);