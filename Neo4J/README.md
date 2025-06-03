# Neo4J - System Biblioteki (Grafowa Baza Danych)

Projekt systemu bibliotecznego zbudowany w oparciu o grafową bazę danych Neo4J. Demonstruje umiejętności modelowania relacji jako grafów, wykorzystania języka Cypher oraz projektowania struktury węzłów i krawędzi.

## Cel Projektu

Transformacja relacyjnego modelu biblioteki do grafowego modelu danych, pokazując zalety reprezentacji złożonych relacji jako graf węzłów i krawędzi.

## Zawartość

- 📄 **[Projekt Neo4j.pdf](./Projekt%20Neo4j.pdf)** - dokumentacja projektu
- 📊 **Skrypty Cypher** (folder `/dane/`):
  - **[biblioteka.cypher](./dane/biblioteka.cypher)** - kompletny model z danymi testowymi
  - **[czesc_1.cypher](./dane/czesc_1.cypher)** - struktura: Autorzy, Pozycje, Kategorie, Wydawnictwa
  - **[czesc_2.cypher](./dane/czesc_2.cypher)** - struktura: Filie, Egzemplarze, Czytelnicy
  - **[czesc_3.cypher](./dane/czesc_3.cypher)** - struktura: Pracownicy, Pensje, Urlopy, Towary
  - **[calosc-szkielet.cypher](./dane/calosc-szkielet.cypher)** - szablon struktury bez danych

## Neo4j vs SQL:

- **Naturalne modelowanie relacji** - bez złożonych JOIN-ów
- **Elastyczność schema** - łatwe dodawanie nowych typów relacji
- **Performance dla traversal** - szybkie przechodzenie po związkach
- **Intuicyjne zapytania** - Cypher przypomina naturalny język

---
*Projekt został wykonany w zespole grupowym w ramach zaliczenia przedmiotu na studiach*
