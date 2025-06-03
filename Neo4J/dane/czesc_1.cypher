// Tworzenie struktur węzłów i relacji dla Pozycji, Autorów, Kategorii i Wydawnictw
CREATE (:Autor {
  id: '',
  imie: '',
  nazwisko: '',
  data_urodzenia: date(),
  narodowosc: '',
  biografia: ''
});

CREATE (:Kategoria {
  id: '',
  nazwa: ''
});

CREATE (:Wydawnictwo {
  id: '',
  nazwa: '',
  kraj: '',
  rok_zalozenia: 0,
  nip: 0,
  regon: 0,
  krs: 0,
  Adres: ''
});

CREATE (:Pozycja {
  id: '',
  tytul: '',
  opis: '',
  rok_wydania: 0,
  jezyk: '',
  typ: '',
  isbn: '',
  liczba_stron: 0,
  czas_trwania: 0,
  typ_okładki: '',
  narrator: '',
  Format: ''
});

// Relacje
MATCH (a:Autor), (p:Pozycja), (k:Kategoria), (w:Wydawnictwo)
CREATE (a)-[:NAPISAŁ]->(p),
       (p)-[:NALEŻY_DO]->(k),
       (w)-[:WYDAŁO]->(p);
