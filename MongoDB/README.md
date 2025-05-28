# MongoDB - System Biblioteki

Projekt systemu bibliotecznego zbudowany w oparciu o dokumentową bazę danych MongoDB. Demonstruje umiejętności pracy z bazami NoSQL, projektowania struktury dokumentów oraz wykonywania zapytań w MongoDB.

## Zawartość

- **[System_biblioteczny_MongoDB.pdf](./System_biblioteczny_MongoDB.pdf)** - pełna dokumentacja projektu
- **Kolekcje MongoDB** (folder `/Kolekcje/`):
- **[czytelnicy.json](./Kolekcje/czytelnicy.json)** - dane czytelników z danymi logowania i rezerwacjami
- **[pozycje.json](./Kolekcje/pozycje.json)** - katalog książek, e-booków i audiobooków z egzemplarzami
- **[pracownicy.json](./Kolekcje/pracownicy.json)** - informacje o pracownikach, filiach i zamówieniach
- **[recenzje.json](./Kolekcje/recenzje.json)** - oceny i komentarze do książek
- **[wypozyczenie.json](./Kolekcje/wypozyczenie.json)** - historia wypożyczeń z karami i statusami

## Umiejętności w nierelacyjnej bazie MongoDB

- **Projektowanie schematów**: Embedded vs Referenced documents
- **Denormalizacja**: Optymalizacja pod kątem zapytań
- **Agregacja**: Pipeline aggregation w MongoDB
- **Indeksowanie**: Compound indexes, text indexes
- **Zapytania**: Find, match, lookup, group
- **Modelowanie**: One-to-One, One-to-Many, Many-to-Many w NoSQL

## Migracja SQL → MongoDB

Projekt pokazuje transformację relacyjnego modelu biblioteki (SQL) do dokumentowego modelu (MongoDB), demonstrując:
- Łączenie tabel w dokumenty
- Przekształcanie foreign keys w embedded documents
- Optymalizację zapytań poprzez denormalizację

---
*Projekt został wykonany w zespole grupowym w ramach zaliczenia przedmiotu na studiach*
