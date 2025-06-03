// Tworzenie struktur węzłów i relacji dla Pozycji, Egzemplarzy, Filii i Czytelników
CREATE (:Filia {
  id: '',
  nazwa: '',
  adres: ''
});

CREATE (:Egzemplarz {
  id: '',
  numer_egzemplarza: '',
  status: ''
});

CREATE (:Czytelnik {
  id: '',
  imie: '',
  nazwisko: '',
  email: '',
  login: '',
  hasło: '',
  adres: '',
  telefon: '',
  data_urodzenia: date(),
  płeć: ''
});

// Relacje
MATCH (p:Pozycja), (e:Egzemplarz), (f:Filia), (c:Czytelnik)
CREATE (p)-[:JEST_EGZEMPLARZEM]->(e),
       (e)-[:ZNAJDUJE_SIE_W]->(f),
       (c)-[:WYPOŻYCZA {
         data_wypozyczenia: date(),
         data_przewidywanego_zwrotu: date(),
         data_zwrotu: date(),
         status: ''
       }]->(e),
       (c)-[:REZERWUJE {
         data_rezerwacji: date(),
         status: '',
         data_wygasniecia: date()
       }]->(p),
       (c)-[:WYSTAWIA_RECENZJE {
         data_recenzji: date(),
         ocena: 0,
         komentarz: ''
       }]->(p),
       (c)-[:POSIADA_KARE {
         data_nalozenia: date(),
         kwota: 0.0,
         opis: '',
         czy_oplacona: false
       }]->(e);
