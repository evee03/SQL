// Tworzenie struktur węzłów i relacji dla Filii, Pracowników, Pensji, Towarów i Urlopów
CREATE (:Pracownik {
  id: '',
  imie: '',
  nazwisko: '',
  stanowisko: '',
  data_zatrudnienia: date(),
  email: '',
  telefon: ''
});

CREATE (:Pensja {
  id: '',
  Kwota_podstawowa: 0.0,
  premia: 0.0,
  data_wyplaty: date(),
  kwota_calkowita: 0.0
});

CREATE (:Urlop {
  id: '',
  data_rozpoczecia: date(),
  data_zakonczenia: date(),
  typ: '',
  status: ''
});

CREATE (:Towar {
  id: '',
  nazwa: '',
  kategoria: '',
  ilosc: 0,
  cena: 0.0,
  data_dostawy: date(),
  dostawca: ''
});

// Relacje
MATCH (p:Pracownik), (pe:Pensja), (u:Urlop), (t:Towar), (f:Filia)
CREATE (p)-[:OTRZYMUJE]->(pe),
       (p)-[:MA_URLOP {
         data_przypisania: date()
       }]->(u),
       (p)-[:ZAMAWIA {
         data_zamowienia: date(),
         ilosc: 0,
         status: ''
       }]->(t),
       (p)-[:PRACUJE_W {
         data_rozpoczecia: date(),
         etat: 0.0
       }]->(f);
