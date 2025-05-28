-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2025 at 08:11 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `audiobook`
--

CREATE TABLE `audiobook` (
  `idAudiobook` int(11) NOT NULL,
  `narrator` varchar(45) NOT NULL,
  `rozmiar_pliku` decimal(5,2) NOT NULL COMMENT 'Rozmiar w MB',
  `czas_trwania` time NOT NULL COMMENT 'Format HH:MM:SS',
  `kod` varchar(45) NOT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `audiobook`
--

INSERT INTO `audiobook` (`idAudiobook`, `narrator`, `rozmiar_pliku`, `czas_trwania`, `kod`, `Pozycja_idPozycja`) VALUES
(1, 'Jan Kowalski', 350.45, '10:15:32', 'AUDIO123', 1),
(2, 'Anna Nowak', 200.78, '07:20:10', 'AUDIO124', 2),
(3, 'Piotr Wiśniewski', 450.50, '12:45:00', 'AUDIO125', 3),
(4, 'Katarzyna Lewandowska', 300.00, '09:30:45', 'AUDIO126', 4),
(5, 'Michał Zieliński', 150.25, '05:10:15', 'AUDIO127', 5),
(6, 'Ewa Kamińska', 275.00, '08:50:20', 'AUDIO128', 6),
(7, 'Tomasz Nowicki', 400.30, '11:05:50', 'AUDIO129', 7),
(8, 'Magdalena Wojciechowska', 180.15, '06:25:33', 'AUDIO130', 8),
(9, 'Rafał Kwiatkowski', 360.10, '10:55:45', 'AUDIO131', 9),
(10, 'Joanna Szymańska', 225.75, '07:40:00', 'AUDIO132', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `autor`
--

CREATE TABLE `autor` (
  `idAutor` int(11) NOT NULL,
  `imie` varchar(40) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `narodowosc` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`idAutor`, `imie`, `nazwisko`, `narodowosc`) VALUES
(1, 'Adam', 'Mickiewicz', 'Polska'),
(2, 'J.K.', 'Rowling', 'Wielka Brytania'),
(3, 'George', 'Orwell', 'Wielka Brytania'),
(4, 'Maria', 'Konopnicka', 'Polska'),
(5, 'Franz', 'Kafka', 'Czechy'),
(6, 'Gabriel', 'Garcia Marquez', 'Kolumbia'),
(7, 'Albert', 'Camus', 'Francja'),
(8, 'Haruki', 'Murakami', 'Japonia'),
(9, 'Homer', '', 'Grecja'),
(10, 'Jane', 'Austen', 'Wielka Brytania');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `czytelnik`
--

CREATE TABLE `czytelnik` (
  `idCzytelnik` int(11) NOT NULL,
  `imie` varchar(40) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `pesel` char(11) NOT NULL,
  `data_ur` date NOT NULL,
  `plec` enum('M','K') NOT NULL,
  `miejscowosc` varchar(80) NOT NULL,
  `ulica` varchar(50) NOT NULL,
  `nr_domu` varchar(10) NOT NULL,
  `nr_mieszkania` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `czytelnik`
--

INSERT INTO `czytelnik` (`idCzytelnik`, `imie`, `nazwisko`, `pesel`, `data_ur`, `plec`, `miejscowosc`, `ulica`, `nr_domu`, `nr_mieszkania`) VALUES
(1, 'Jan', 'Kowalski', '92031412345', '1992-03-14', 'M', 'Warszawa', 'Kwiatowa', '15', '2'),
(2, 'Anna', 'Nowak', '85051254321', '1985-05-12', 'K', 'Kraków', 'Lipowa', '10', '4A'),
(3, 'Piotr', 'Wiśniewski', '96010167890', '1996-01-01', 'M', 'Poznań', 'Długa', '7', '3B'),
(4, 'Katarzyna', 'Zielińska', '88122398765', '1988-12-23', 'K', 'Wrocław', 'Słoneczna', '22', '1'),
(5, 'Michał', 'Lewandowski', '93111445678', '1993-11-14', 'M', 'Gdańsk', 'Kolejowa', '5', '6'),
(6, 'Ewa', 'Kowalczyk', '79040723456', '1979-04-07', 'K', 'Lublin', 'Warszawska', '12', '7'),
(7, 'Tomasz', 'Zawadzki', '85090567890', '1985-09-05', 'M', 'Łódź', 'Zielona', '3', '1'),
(8, 'Magdalena', 'Szymańska', '91021654321', '1991-02-16', 'K', 'Szczecin', 'Leśna', '18', '3'),
(9, 'Robert', 'Mazur', '80120812345', '1980-12-08', 'M', 'Bydgoszcz', 'Cicha', '21', '5'),
(10, 'Joanna', 'Dąbrowska', '93071045678', '1993-07-10', 'K', 'Katowice', 'Grunwaldzka', '9', '8');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_logowania`
--

CREATE TABLE `dane_logowania` (
  `idDane_logowania` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `haslo` char(60) NOT NULL,
  `Czytelnik_idCzytelnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `dane_logowania`
--

INSERT INTO `dane_logowania` (`idDane_logowania`, `login`, `haslo`, `Czytelnik_idCzytelnik`) VALUES
(1, 'jankowalski', '$2y$10$C4p/9pFgLs3X/Wvv7vU8iJ07khOqewq5hzV0myv9FwF8MQF5noY2i', 1),
(2, 'annanowak', '$2y$10$P5aZn/Dy9v6l0fQldPjsQwq9Iwdcz0m.zkzqhdm5C7r9uAc5AV/kS', 2),
(3, 'piotrwisniewski', '$2y$10$QpTfOgk2Nq7Ys9c0jlCUy79t.FYZjwHF4lXbPyIRu9D8Oxl.I5y9S', 3),
(4, 'katarzynazielinska', '$2y$10$HySxY1JKLQ7KzK7tb/AblxSwN6M9hMw14g.b7sLbfj1OYX7KNOSw2', 4),
(5, 'michallewandowski', '$2y$10$gG7Xp5zXqZD9PiWxR0z6jdsfUGFvvACa9b6rpwINxMfFj4oa.ZwWe', 5),
(6, 'ewakowalczyk', '$2y$10$4sUbjEqw7Hs.kOX0jzMPvQIU8NjDQOhVhd4IghZpwdb2.XhhdUuAi', 6),
(7, 'tomaszzawadzki', '$2y$10$5qNKQKtB6IQmLzGTeFVQL2Q2nfyQ0ZMGsQkFmV3YbSz6J2CTm7T8u', 7),
(8, 'magdalenaszymanska', '$2y$10$LSXQFiXczPfS0PqUyDqAi8RwiYF87E9v.ZfgkCG5qV9m7P0a5lJ3O', 8),
(9, 'robertmazur', '$2y$10$g6owIkLxKLwwMwI8W4FPHXVfBqAywfQ.EJcHkOEnZ5gdJccmPR7b6', 9),
(10, 'joannadabrowska', '$2y$10$Ml0Hqz9K43HZbIOL1wO2d/UdWmdGbQsUjp/Hi6tyVnPvqtgnwJXlK', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ebook`
--

CREATE TABLE `ebook` (
  `idEbook` int(11) NOT NULL,
  `rozmiar_pliku` bigint(20) NOT NULL,
  `format` varchar(10) NOT NULL,
  `kod` varchar(45) NOT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ebook`
--

INSERT INTO `ebook` (`idEbook`, `rozmiar_pliku`, `format`, `kod`, `Pozycja_idPozycja`) VALUES
(1, 150000000, 'pdf', 'A1B2C3D4E5', 1),
(2, 200000000, 'epub', 'F6G7H8I9J0', 2),
(3, 120000000, 'pdf', 'K1L2M3N4O5', 3),
(4, 180000000, 'epub', 'P6Q7R8S9T0', 4),
(5, 250000000, 'mobi', 'U1V2W3X4Y5', 5),
(6, 100000000, 'pdf', 'Z6A7B8C9D0', 6),
(7, 300000000, 'epub', 'E1F2G3H4I5', 7),
(8, 500000000, 'pdf', 'J6K7L8M9N0', 8),
(9, 700000000, 'mobi', 'O1P2Q3R4S5', 9),
(10, 450000000, 'epub', 'T6U7V8W9X0', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `egzemplarz`
--

CREATE TABLE `egzemplarz` (
  `idEgzemplarz` int(11) NOT NULL,
  `nr_egzemplarza` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL,
  `Lokalizacja_idLokalizacja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `egzemplarz`
--

INSERT INTO `egzemplarz` (`idEgzemplarz`, `nr_egzemplarza`, `status`, `Pozycja_idPozycja`, `Lokalizacja_idLokalizacja`) VALUES
(1, 'EGZ-001', 1, 1, 1),
(2, 'EGZ-002', 0, 1, 2),
(3, 'EGZ-003', 1, 2, 3),
(4, 'EGZ-004', 0, 3, 4),
(5, 'EGZ-005', 1, 4, 5),
(6, 'EGZ-006', 0, 5, 6),
(7, 'EGZ-007', 1, 6, 7),
(8, 'EGZ-008', 0, 7, 8),
(9, 'EGZ-009', 1, 8, 9),
(10, 'EGZ-010', 0, 9, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `egzemplarz_w_wypozyczeniu`
--

CREATE TABLE `egzemplarz_w_wypozyczeniu` (
  `idEgzemplarz_w_Wypozyczeniu` int(11) NOT NULL,
  `Wypozyczenie_idWypozyczenie` int(11) NOT NULL,
  `Egzemplarz_idEgzemplarz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `egzemplarz_w_wypozyczeniu`
--

INSERT INTO `egzemplarz_w_wypozyczeniu` (`idEgzemplarz_w_Wypozyczeniu`, `Wypozyczenie_idWypozyczenie`, `Egzemplarz_idEgzemplarz`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 5, 9),
(10, 5, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `filia`
--

CREATE TABLE `filia` (
  `idFilia` int(11) NOT NULL,
  `ulica` varchar(45) NOT NULL,
  `nr_domu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `filia`
--

INSERT INTO `filia` (`idFilia`, `ulica`, `nr_domu`) VALUES
(1, 'ul. Przykładowa', '10'),
(2, 'ul. Nowa', '5A'),
(3, 'ul. Kwiatowa', '12B'),
(4, 'ul. Stara', '3'),
(5, 'ul. Morska', '7'),
(6, 'ul. Zielona', '10A'),
(7, 'ul. Jasna', '15'),
(8, 'ul. Wesoła', '8'),
(9, 'ul. Długa', '4'),
(10, 'ul. Krótka', '20');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kara`
--

CREATE TABLE `kara` (
  `idKara` int(11) NOT NULL,
  `kwota` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('niezapłacona','zapłacona') NOT NULL DEFAULT 'niezapłacona',
  `data_nalozenia` datetime NOT NULL DEFAULT current_timestamp(),
  `Czytelnik_idCzytelnik` int(11) NOT NULL,
  `Wypozyczenie_Egzemplarz_idWypozyczenie_Egzemplarz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kara`
--

INSERT INTO `kara` (`idKara`, `kwota`, `status`, `data_nalozenia`, `Czytelnik_idCzytelnik`, `Wypozyczenie_Egzemplarz_idWypozyczenie_Egzemplarz`) VALUES
(1, 10.00, 'niezapłacona', '2025-03-07 08:30:00', 1, 1),
(2, 15.50, 'zapłacona', '2025-03-06 14:20:00', 2, 2),
(3, 5.00, 'niezapłacona', '2025-03-05 10:15:00', 3, 3),
(4, 20.00, 'zapłacona', '2025-03-04 16:45:00', 4, 4),
(5, 25.00, 'niezapłacona', '2025-03-03 09:00:00', 5, 5),
(6, 12.75, 'zapłacona', '2025-03-02 18:30:00', 6, 6),
(7, 8.50, 'niezapłacona', '2025-03-01 11:25:00', 7, 7),
(8, 30.00, 'zapłacona', '2025-02-28 13:40:00', 8, 8),
(9, 18.25, 'niezapłacona', '2025-02-27 17:00:00', 9, 9),
(10, 22.50, 'zapłacona', '2025-02-26 15:10:00', 10, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `idKategoria` int(11) NOT NULL,
  `nazwa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kategoria`
--

INSERT INTO `kategoria` (`idKategoria`, `nazwa`) VALUES
(1, 'Fikcja'),
(2, 'Nauka'),
(3, 'Historia'),
(4, 'Podróże'),
(5, 'Biografia'),
(6, 'Kryminał'),
(7, 'Fantastyka'),
(8, 'Poradniki'),
(9, 'Psychologia'),
(10, 'Dziecięca');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazka`
--

CREATE TABLE `ksiazka` (
  `idKsiazka` int(11) NOT NULL,
  `twarda_okladka` tinyint(4) NOT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ksiazka`
--

INSERT INTO `ksiazka` (`idKsiazka`, `twarda_okladka`, `Pozycja_idPozycja`) VALUES
(1, 1, 1),
(2, 0, 2),
(3, 1, 3),
(4, 0, 4),
(5, 1, 5),
(6, 0, 6),
(7, 1, 7),
(8, 0, 8),
(9, 1, 9),
(10, 0, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lokalizacja`
--

CREATE TABLE `lokalizacja` (
  `idLokalizacja` int(11) NOT NULL,
  `dzial` varchar(40) DEFAULT NULL,
  `regal` int(11) DEFAULT NULL,
  `polka` int(11) DEFAULT NULL,
  `pozycja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lokalizacja`
--

INSERT INTO `lokalizacja` (`idLokalizacja`, `dzial`, `regal`, `polka`, `pozycja`) VALUES
(1, 'Literatura piękna', 1, 2, 3),
(2, 'Historia', 2, 3, 4),
(3, 'Nauki ścisłe', 3, 1, 5),
(4, 'Technologia', 4, 2, 6),
(5, 'Sztuka', 5, 1, 2),
(6, 'Dziecięca', 6, 3, 1),
(7, 'Podręczniki', 7, 4, 5),
(8, 'Fantastyka', 8, 2, 3),
(9, 'Biografie', 9, 3, 4),
(10, 'Kuchnia', 10, 1, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pensja`
--

CREATE TABLE `pensja` (
  `idPensja` int(11) NOT NULL,
  `kwota_podstawowa` decimal(10,0) NOT NULL,
  `data_wyplaty` date NOT NULL,
  `premia` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pensja`
--

INSERT INTO `pensja` (`idPensja`, `kwota_podstawowa`, `data_wyplaty`, `premia`) VALUES
(1, 3000, '2025-03-07', 500),
(2, 3200, '2025-02-28', 450),
(3, 2800, '2025-01-31', 400),
(4, 3500, '2025-03-05', 600),
(5, 2900, '2025-02-15', 300),
(6, 3100, '2025-03-01', 550),
(7, 3300, '2025-02-20', 650),
(8, 3400, '2025-03-10', 700),
(9, 3000, '2025-01-15', 350),
(10, 3250, '2025-02-05', 500);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycja`
--

CREATE TABLE `pozycja` (
  `idPozycja` int(11) NOT NULL,
  `tytul` varchar(45) NOT NULL,
  `opis` longtext NOT NULL,
  `rok_wydania` date NOT NULL,
  `jezyk` varchar(45) NOT NULL,
  `typ` enum('ksiazka','e-book','audiobook') NOT NULL,
  `Wydawnictwo_idWydawnictwo` int(11) NOT NULL,
  `Filia_idFilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pozycja`
--

INSERT INTO `pozycja` (`idPozycja`, `tytul`, `opis`, `rok_wydania`, `jezyk`, `typ`, `Wydawnictwo_idWydawnictwo`, `Filia_idFilia`) VALUES
(1, 'Wielka Przygoda', 'Opis książki o wielkiej przygodzie.', '2022-05-01', 'Polski', 'ksiazka', 1, 1),
(2, 'Nauka Programowania', 'Podstawy programowania w różnych językach.', '2021-10-15', 'Polski', 'ksiazka', 2, 2),
(3, 'Wielki Wojownik', 'Opowieść o wojowniku walczącym z mrocznymi siłami.', '2020-07-30', 'Polski', 'audiobook', 3, 3),
(4, 'Zielony Las', 'Relaksująca książka o życiu w lesie.', '2019-08-05', 'Polski', 'e-book', 4, 4),
(5, 'Matematyka dla Każdego', 'Nauka matematyki od podstaw.', '2021-11-21', 'Polski', 'ksiazka', 5, 5),
(6, 'Historie Miłosne', 'Zbiór opowiadań miłosnych.', '2018-12-12', 'Polski', 'audiobook', 6, 6),
(7, 'Sekrety Kosmosu', 'Przewodnik po tajemnicach kosmosu.', '2020-04-18', 'Angielski', 'ksiazka', 7, 7),
(8, 'Skrzynia Skarbów', 'Przygody dzieci w poszukiwaniu skarbów.', '2019-03-11', 'Polski', 'e-book', 8, 8),
(9, 'Mistrzostwo w Sporcie', 'Jak osiągnąć sukces w różnych dyscyplinach sportowych.', '2022-01-20', 'Polski', 'ksiazka', 9, 9),
(10, 'Tajemnice Starożytnego Egiptu', 'Opis najważniejszych odkryć archeologicznych w Egipcie.', '2017-09-05', 'Angielski', 'audiobook', 10, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycja_autor`
--

CREATE TABLE `pozycja_autor` (
  `Pozycja_idPozycja` int(11) NOT NULL,
  `Autor_idAutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pozycja_autor`
--

INSERT INTO `pozycja_autor` (`Pozycja_idPozycja`, `Autor_idAutor`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycja_kategoria`
--

CREATE TABLE `pozycja_kategoria` (
  `Kategoria_idKategoria` int(11) NOT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pozycja_kategoria`
--

INSERT INTO `pozycja_kategoria` (`Kategoria_idKategoria`, `Pozycja_idPozycja`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik_filii`
--

CREATE TABLE `pracownik_filii` (
  `idPracownik_filii` int(11) NOT NULL,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `Filia_idFilia` int(11) NOT NULL,
  `Pensja_idPensja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pracownik_filii`
--

INSERT INTO `pracownik_filii` (`idPracownik_filii`, `imie`, `nazwisko`, `Filia_idFilia`, `Pensja_idPensja`) VALUES
(1, 'Jan', 'Kowalski', 1, 1),
(2, 'Anna', 'Nowak', 2, 2),
(3, 'Piotr', 'Wójcik', 3, 3),
(4, 'Maria', 'Kaczmarek', 1, 4),
(5, 'Krzysztof', 'Lewandowski', 2, 5),
(6, 'Ewa', 'Zielińska', 3, 6),
(7, 'Marek', 'Szymański', 1, 7),
(8, 'Katarzyna', 'Jankowska', 2, 8),
(9, 'Paweł', 'Witkowski', 3, 9),
(10, 'Magdalena', 'Kwiatkowska', 1, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `recenzja`
--

CREATE TABLE `recenzja` (
  `idRecenzja` int(11) NOT NULL,
  `ocena` enum('1','2','3','4','5') DEFAULT NULL,
  `komentarz` text DEFAULT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `recenzja`
--

INSERT INTO `recenzja` (`idRecenzja`, `ocena`, `komentarz`, `Pozycja_idPozycja`) VALUES
(1, '5', 'Niezwykle wciągająca pozycja, zdecydowanie polecam!', 1),
(2, '4', 'Dobra książka, choć momentami nieco przewidywalna.', 2),
(3, '3', 'Średnia fabuła, ale dobrze napisana.', 3),
(4, '5', 'Rewelacyjny audiobook, narrator sprawił, że historia ożyła.', 4),
(5, '2', 'Zbyt długi, trudno było przez niego przebrnąć.', 5),
(6, '1', 'Nie polecam, zmarnowany potencjał.', 6),
(7, '4', 'E-book bardzo wygodny w użytkowaniu, dobrze zredagowany.', 7),
(8, '5', 'Najlepsza książka, jaką czytałem w tym roku!', 8),
(9, '3', 'Przeciętna historia, ale zakończenie było dobre.', 9),
(10, '4', 'Bardzo interesująca, choć momentami nużąca.', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rezerwacja`
--

CREATE TABLE `rezerwacja` (
  `idRezerwacja` int(11) NOT NULL,
  `nr_w_kolejce` int(5) DEFAULT NULL,
  `status` enum('oczekujaca','zrealizowana','anulowana') NOT NULL DEFAULT 'oczekujaca',
  `data_anulowania` datetime DEFAULT NULL,
  `data_utworzenia` datetime NOT NULL DEFAULT current_timestamp(),
  `data_realizacji` datetime DEFAULT NULL,
  `Czytelnik_idCzytelnik` int(11) NOT NULL,
  `Pozycja_idPozycja` int(11) NOT NULL,
  `Pozycja_Filia_idFilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `rezerwacja`
--

INSERT INTO `rezerwacja` (`idRezerwacja`, `nr_w_kolejce`, `status`, `data_anulowania`, `data_utworzenia`, `data_realizacji`, `Czytelnik_idCzytelnik`, `Pozycja_idPozycja`, `Pozycja_Filia_idFilia`) VALUES
(41, 1, 'oczekujaca', NULL, '2025-03-01 00:00:00', NULL, 1, 1, 1),
(42, 2, 'zrealizowana', NULL, '2025-03-02 00:00:00', '2025-03-05 00:00:00', 2, 2, 2),
(43, 3, 'oczekujaca', NULL, '2025-03-03 00:00:00', NULL, 3, 3, 3),
(44, 4, 'anulowana', '2025-03-04 00:00:00', '2025-03-04 00:00:00', NULL, 4, 4, 4),
(45, 5, 'zrealizowana', NULL, '2025-03-05 00:00:00', '2025-03-07 00:00:00', 5, 5, 5),
(46, 6, 'oczekujaca', NULL, '2025-03-06 00:00:00', NULL, 6, 6, 6),
(47, 7, 'zrealizowana', NULL, '2025-03-07 00:00:00', '2025-03-10 00:00:00', 7, 7, 7),
(48, 8, 'anulowana', '2025-03-08 22:00:00', '2025-03-08 00:00:00', NULL, 8, 8, 8),
(49, 9, 'oczekujaca', NULL, '2025-03-09 00:00:00', NULL, 9, 9, 9),
(50, 10, 'zrealizowana', NULL, '2025-03-10 00:00:00', '2025-03-12 00:00:00', 10, 10, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `towary`
--

CREATE TABLE `towary` (
  `idTowary` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `ilosc` int(11) NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `wartosc` decimal(10,2) NOT NULL,
  `Zamowienie_idZamowienie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `towary`
--

INSERT INTO `towary` (`idTowary`, `nazwa`, `ilosc`, `cena`, `wartosc`, `Zamowienie_idZamowienie`) VALUES
(1, 'Towar A', 10, 15.50, 155.00, 1),
(2, 'Towar B', 5, 25.00, 125.00, 2),
(3, 'Towar C', 20, 10.00, 200.00, 3),
(4, 'Towar D', 3, 30.00, 90.00, 4),
(5, 'Towar E', 8, 20.75, 166.00, 5),
(6, 'Towar F', 12, 12.50, 150.00, 6),
(7, 'Towar G', 6, 40.00, 240.00, 7),
(8, 'Towar H', 15, 18.60, 279.00, 8),
(9, 'Towar I', 10, 22.30, 223.00, 9),
(10, 'Towar J', 7, 35.00, 245.00, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `urlop`
--

CREATE TABLE `urlop` (
  `idUrlop` int(11) NOT NULL,
  `data_poczatkowa` date DEFAULT NULL,
  `data_koncowa` date DEFAULT NULL,
  `typ` enum('wypoczynkowy','chorobowy','macierzynski','tacierzynski','inny') DEFAULT NULL,
  `Pracownik_filii_idPracownik_filii` int(11) NOT NULL,
  `Pracownik_filii_Filia_idFilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `urlop`
--

INSERT INTO `urlop` (`idUrlop`, `data_poczatkowa`, `data_koncowa`, `typ`, `Pracownik_filii_idPracownik_filii`, `Pracownik_filii_Filia_idFilia`) VALUES
(1, '2025-05-01', '2025-05-14', 'wypoczynkowy', 1, 1),
(2, '2025-06-01', '2025-06-10', 'chorobowy', 2, 2),
(3, '2025-07-05', '2025-07-12', 'macierzynski', 3, 3),
(4, '2025-08-01', '2025-08-15', 'tacierzynski', 4, 1),
(5, '2025-09-01', '2025-09-07', 'wypoczynkowy', 5, 2),
(6, '2025-10-05', '2025-10-20', 'wypoczynkowy', 6, 3),
(7, '2025-11-10', '2025-11-25', 'chorobowy', 7, 1),
(8, '2025-12-01', '2025-12-10', 'macierzynski', 8, 2),
(9, '2026-01-01', '2026-01-15', 'tacierzynski', 9, 3),
(10, '2026-02-01', '2026-02-10', 'inny', 10, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydawnictwo`
--

CREATE TABLE `wydawnictwo` (
  `idWydawnictwo` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `data_zalozenia` date NOT NULL,
  `NIP` bigint(20) NOT NULL,
  `REGON` bigint(20) NOT NULL,
  `KRS` bigint(20) NOT NULL,
  `adres` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wydawnictwo`
--

INSERT INTO `wydawnictwo` (`idWydawnictwo`, `nazwa`, `data_zalozenia`, `NIP`, `REGON`, `KRS`, `adres`) VALUES
(1, 'Wydawnictwo ABC', '2005-03-10', 1234567890, 9876543210, 1122334455, 'ul. Przykładowa 1, Warszawa'),
(2, 'Wydawnictwo XYZ', '2010-06-15', 2345678901, 8765432109, 2233445566, 'ul. Nowa 5, Kraków'),
(3, 'Wydawnictwo DEF', '2015-09-22', 3456789012, 7654321098, 3344556677, 'ul. Kwiatowa 12, Wrocław'),
(4, 'Wydawnictwo GHI', '2000-01-01', 4567890123, 6543210987, 4455667788, 'ul. Stara 3, Gdańsk'),
(5, 'Wydawnictwo JKL', '2018-11-05', 5678901234, 5432109876, 5566778899, 'ul. Morska 7, Poznań'),
(6, 'Wydawnictwo MNO', '2012-02-18', 6789012345, 4321098765, 6677889900, 'ul. Zielona 10, Łódź'),
(7, 'Wydawnictwo PQR', '2017-07-30', 7890123456, 3210987654, 7788990011, 'ul. Jasna 15, Lublin'),
(8, 'Wydawnictwo STU', '2003-08-22', 8901234567, 2109876543, 8899001122, 'ul. Wesoła 8, Gdynia'),
(9, 'Wydawnictwo VWX', '2014-10-10', 9012345678, 1098765432, 9900112233, 'ul. Długa 4, Białystok'),
(10, 'Wydawnictwo YZA', '2020-05-15', 1123456789, 8765432101, 1010101010, 'ul. Krótka 20, Szczecin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypozyczenie`
--

CREATE TABLE `wypozyczenie` (
  `idWypozyczenie` int(11) NOT NULL,
  `data_wypozyczenia` date NOT NULL,
  `data_zwrotu` date DEFAULT NULL,
  `Czytelnik_idCzytelnik` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `wypozyczenie`
--

INSERT INTO `wypozyczenie` (`idWypozyczenie`, `data_wypozyczenia`, `data_zwrotu`, `Czytelnik_idCzytelnik`) VALUES
(1, '2025-02-01', '2025-02-15', 1),
(2, '2025-02-02', '2025-02-16', 2),
(3, '2025-02-05', '2025-02-20', 3),
(4, '2025-02-10', '2025-02-24', 4),
(5, '2025-02-12', '2025-02-26', 5),
(6, '2025-02-14', '2025-02-28', 6),
(7, '2025-02-16', '2025-03-02', 7),
(8, '2025-02-18', '2025-03-03', 8),
(9, '2025-02-20', '2025-03-05', 9),
(10, '2025-02-22', '2025-03-07', 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `idZamowienie` int(11) NOT NULL,
  `nazwa` varchar(45) NOT NULL,
  `data_zamowienie` date NOT NULL,
  `dostawcy` varchar(60) NOT NULL,
  `wartosc` decimal(10,2) NOT NULL,
  `Pracownik_filii_idPracownik_filii` int(11) NOT NULL,
  `Pracownik_filii_Filia_idFilia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `zamowienie`
--

INSERT INTO `zamowienie` (`idZamowienie`, `nazwa`, `data_zamowienie`, `dostawcy`, `wartosc`, `Pracownik_filii_idPracownik_filii`, `Pracownik_filii_Filia_idFilia`) VALUES
(1, 'Zamówienie A', '2025-03-01', 'Dostawca 1', 150.50, 1, 1),
(2, 'Zamówienie B', '2025-03-02', 'Dostawca 2', 250.75, 2, 2),
(3, 'Zamówienie C', '2025-03-03', 'Dostawca 3', 120.30, 3, 3),
(4, 'Zamówienie D', '2025-03-04', 'Dostawca 4', 185.60, 4, 1),
(5, 'Zamówienie E', '2025-03-05', 'Dostawca 5', 300.00, 5, 2),
(6, 'Zamówienie F', '2025-03-06', 'Dostawca 6', 220.90, 6, 3),
(7, 'Zamówienie G', '2025-03-07', 'Dostawca 7', 400.40, 7, 1),
(8, 'Zamówienie H', '2025-03-08', 'Dostawca 8', 150.20, 8, 2),
(9, 'Zamówienie I', '2025-03-09', 'Dostawca 9', 180.10, 9, 3),
(10, 'Zamówienie J', '2025-03-10', 'Dostawca 10', 320.00, 10, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `audiobook`
--
ALTER TABLE `audiobook`
  ADD PRIMARY KEY (`idAudiobook`),
  ADD UNIQUE KEY `kod_UNIQUE` (`kod`),
  ADD KEY `fk_Audiobook_Pozycja1_idx` (`Pozycja_idPozycja`);

--
-- Indeksy dla tabeli `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idAutor`);

--
-- Indeksy dla tabeli `czytelnik`
--
ALTER TABLE `czytelnik`
  ADD PRIMARY KEY (`idCzytelnik`);

--
-- Indeksy dla tabeli `dane_logowania`
--
ALTER TABLE `dane_logowania`
  ADD PRIMARY KEY (`idDane_logowania`),
  ADD UNIQUE KEY `login_UNIQUE` (`login`),
  ADD KEY `fk_Dane_logowania_Czytelnik_idx` (`Czytelnik_idCzytelnik`);

--
-- Indeksy dla tabeli `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`idEbook`),
  ADD KEY `fk_Ebook_Pozycja1_idx` (`Pozycja_idPozycja`);

--
-- Indeksy dla tabeli `egzemplarz`
--
ALTER TABLE `egzemplarz`
  ADD PRIMARY KEY (`idEgzemplarz`),
  ADD KEY `fk_Egzemplarz_Pozycja1_idx` (`Pozycja_idPozycja`),
  ADD KEY `fk_Egzemplarz_Lokalizacja1_idx` (`Lokalizacja_idLokalizacja`);

--
-- Indeksy dla tabeli `egzemplarz_w_wypozyczeniu`
--
ALTER TABLE `egzemplarz_w_wypozyczeniu`
  ADD PRIMARY KEY (`idEgzemplarz_w_Wypozyczeniu`),
  ADD KEY `fk_Wypozyczenie_has_Egzemplarz_Egzemplarz1_idx` (`Egzemplarz_idEgzemplarz`),
  ADD KEY `fk_Wypozyczenie_has_Egzemplarz_Wypozyczenie1_idx` (`Wypozyczenie_idWypozyczenie`);

--
-- Indeksy dla tabeli `filia`
--
ALTER TABLE `filia`
  ADD PRIMARY KEY (`idFilia`);

--
-- Indeksy dla tabeli `kara`
--
ALTER TABLE `kara`
  ADD PRIMARY KEY (`idKara`),
  ADD KEY `fk_Kara_Czytelnik1_idx` (`Czytelnik_idCzytelnik`),
  ADD KEY `fk_Kara_Wypozyczenie_Egzemplarz1_idx` (`Wypozyczenie_Egzemplarz_idWypozyczenie_Egzemplarz`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`idKategoria`),
  ADD UNIQUE KEY `idKategoria_UNIQUE` (`idKategoria`);

--
-- Indeksy dla tabeli `ksiazka`
--
ALTER TABLE `ksiazka`
  ADD PRIMARY KEY (`idKsiazka`),
  ADD KEY `fk_Ksiazka_Pozycja1` (`Pozycja_idPozycja`);

--
-- Indeksy dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  ADD PRIMARY KEY (`idLokalizacja`);

--
-- Indeksy dla tabeli `pensja`
--
ALTER TABLE `pensja`
  ADD PRIMARY KEY (`idPensja`);

--
-- Indeksy dla tabeli `pozycja`
--
ALTER TABLE `pozycja`
  ADD PRIMARY KEY (`idPozycja`,`Filia_idFilia`),
  ADD KEY `fk_Pozycja_Wydawnictwo1_idx` (`Wydawnictwo_idWydawnictwo`),
  ADD KEY `fk_Pozycja_Filia1` (`Filia_idFilia`);

--
-- Indeksy dla tabeli `pozycja_autor`
--
ALTER TABLE `pozycja_autor`
  ADD PRIMARY KEY (`Pozycja_idPozycja`,`Autor_idAutor`),
  ADD KEY `fk_Pozycja_has_Autor_Autor1` (`Autor_idAutor`);

--
-- Indeksy dla tabeli `pozycja_kategoria`
--
ALTER TABLE `pozycja_kategoria`
  ADD PRIMARY KEY (`Kategoria_idKategoria`,`Pozycja_idPozycja`),
  ADD KEY `fk_Pozycja_Kategoria_Kategoria1_idx` (`Kategoria_idKategoria`),
  ADD KEY `fk_Pozycja_Kategoria_Pozycja1_idx` (`Pozycja_idPozycja`);

--
-- Indeksy dla tabeli `pracownik_filii`
--
ALTER TABLE `pracownik_filii`
  ADD PRIMARY KEY (`idPracownik_filii`,`Filia_idFilia`,`Pensja_idPensja`),
  ADD UNIQUE KEY `idPracownik_filii_UNIQUE` (`idPracownik_filii`),
  ADD KEY `fk_Pracownik_filii_Filia1_idx` (`Filia_idFilia`),
  ADD KEY `fk_Pracownik_filii_Pensja1_idx` (`Pensja_idPensja`);

--
-- Indeksy dla tabeli `recenzja`
--
ALTER TABLE `recenzja`
  ADD PRIMARY KEY (`idRecenzja`),
  ADD KEY `fk_Recenzja_Pozycja1_idx` (`Pozycja_idPozycja`);

--
-- Indeksy dla tabeli `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD PRIMARY KEY (`idRezerwacja`),
  ADD KEY `fk_Rezerwacja_Czytelnik1_idx` (`Czytelnik_idCzytelnik`),
  ADD KEY `fk_Rezerwacja_Pozycja1_idx` (`Pozycja_idPozycja`,`Pozycja_Filia_idFilia`);

--
-- Indeksy dla tabeli `towary`
--
ALTER TABLE `towary`
  ADD PRIMARY KEY (`idTowary`),
  ADD KEY `fk_Towary_Zamowienie1_idx` (`Zamowienie_idZamowienie`);

--
-- Indeksy dla tabeli `urlop`
--
ALTER TABLE `urlop`
  ADD PRIMARY KEY (`idUrlop`),
  ADD KEY `fk_Urlop_Pracownik_filii1` (`Pracownik_filii_idPracownik_filii`,`Pracownik_filii_Filia_idFilia`);

--
-- Indeksy dla tabeli `wydawnictwo`
--
ALTER TABLE `wydawnictwo`
  ADD PRIMARY KEY (`idWydawnictwo`),
  ADD UNIQUE KEY `nazwa_UNIQUE` (`nazwa`);

--
-- Indeksy dla tabeli `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  ADD PRIMARY KEY (`idWypozyczenie`),
  ADD KEY `fk_Wypozyczenie_Czytelnik1_idx` (`Czytelnik_idCzytelnik`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`idZamowienie`),
  ADD KEY `fk_Zamowienie_Pracownik_filii1_idx` (`Pracownik_filii_idPracownik_filii`,`Pracownik_filii_Filia_idFilia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audiobook`
--
ALTER TABLE `audiobook`
  MODIFY `idAudiobook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `idAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `czytelnik`
--
ALTER TABLE `czytelnik`
  MODIFY `idCzytelnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dane_logowania`
--
ALTER TABLE `dane_logowania`
  MODIFY `idDane_logowania` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ebook`
--
ALTER TABLE `ebook`
  MODIFY `idEbook` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kara`
--
ALTER TABLE `kara`
  MODIFY `idKara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `idKategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pozycja`
--
ALTER TABLE `pozycja`
  MODIFY `idPozycja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recenzja`
--
ALTER TABLE `recenzja`
  MODIFY `idRecenzja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  MODIFY `idRezerwacja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `wydawnictwo`
--
ALTER TABLE `wydawnictwo`
  MODIFY `idWydawnictwo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  MODIFY `idWypozyczenie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audiobook`
--
ALTER TABLE `audiobook`
  ADD CONSTRAINT `fk_Audiobook_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dane_logowania`
--
ALTER TABLE `dane_logowania`
  ADD CONSTRAINT `fk_Dane_logowania_Czytelnik` FOREIGN KEY (`Czytelnik_idCzytelnik`) REFERENCES `czytelnik` (`idCzytelnik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ebook`
--
ALTER TABLE `ebook`
  ADD CONSTRAINT `fk_Ebook_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `egzemplarz`
--
ALTER TABLE `egzemplarz`
  ADD CONSTRAINT `fk_Egzemplarz_Lokalizacja1` FOREIGN KEY (`Lokalizacja_idLokalizacja`) REFERENCES `lokalizacja` (`idLokalizacja`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Egzemplarz_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `egzemplarz_w_wypozyczeniu`
--
ALTER TABLE `egzemplarz_w_wypozyczeniu`
  ADD CONSTRAINT `fk_Wypozyczenie_has_Egzemplarz_Egzemplarz1` FOREIGN KEY (`Egzemplarz_idEgzemplarz`) REFERENCES `egzemplarz` (`idEgzemplarz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Wypozyczenie_has_Egzemplarz_Wypozyczenie1` FOREIGN KEY (`Wypozyczenie_idWypozyczenie`) REFERENCES `wypozyczenie` (`idWypozyczenie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kara`
--
ALTER TABLE `kara`
  ADD CONSTRAINT `fk_Kara_Czytelnik1` FOREIGN KEY (`Czytelnik_idCzytelnik`) REFERENCES `czytelnik` (`idCzytelnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Kara_Wypozyczenie_Egzemplarz1` FOREIGN KEY (`Wypozyczenie_Egzemplarz_idWypozyczenie_Egzemplarz`) REFERENCES `egzemplarz_w_wypozyczeniu` (`idEgzemplarz_w_Wypozyczeniu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ksiazka`
--
ALTER TABLE `ksiazka`
  ADD CONSTRAINT `fk_Ksiazka_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pozycja`
--
ALTER TABLE `pozycja`
  ADD CONSTRAINT `fk_Pozycja_Filia1` FOREIGN KEY (`Filia_idFilia`) REFERENCES `filia` (`idFilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pozycja_Wydawnictwo1` FOREIGN KEY (`Wydawnictwo_idWydawnictwo`) REFERENCES `wydawnictwo` (`idWydawnictwo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pozycja_autor`
--
ALTER TABLE `pozycja_autor`
  ADD CONSTRAINT `fk_Pozycja_has_Autor_Autor1` FOREIGN KEY (`Autor_idAutor`) REFERENCES `autor` (`idAutor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pozycja_has_Autor_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pozycja_kategoria`
--
ALTER TABLE `pozycja_kategoria`
  ADD CONSTRAINT `fk_Pozycja_Kategoria_Kategoria1` FOREIGN KEY (`Kategoria_idKategoria`) REFERENCES `kategoria` (`idKategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Pozycja_Kategoria_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pracownik_filii`
--
ALTER TABLE `pracownik_filii`
  ADD CONSTRAINT `fk_Pracownik_filii_Filia1` FOREIGN KEY (`Filia_idFilia`) REFERENCES `filia` (`idFilia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pracownik_filii_Pensja1` FOREIGN KEY (`Pensja_idPensja`) REFERENCES `pensja` (`idPensja`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `recenzja`
--
ALTER TABLE `recenzja`
  ADD CONSTRAINT `fk_Recenzja_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`) REFERENCES `pozycja` (`idPozycja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezerwacja`
--
ALTER TABLE `rezerwacja`
  ADD CONSTRAINT `fk_Rezerwacja_Czytelnik1` FOREIGN KEY (`Czytelnik_idCzytelnik`) REFERENCES `czytelnik` (`idCzytelnik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rezerwacja_Pozycja1` FOREIGN KEY (`Pozycja_idPozycja`,`Pozycja_Filia_idFilia`) REFERENCES `pozycja` (`idPozycja`, `Filia_idFilia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `towary`
--
ALTER TABLE `towary`
  ADD CONSTRAINT `fk_Towary_Zamowienie1` FOREIGN KEY (`Zamowienie_idZamowienie`) REFERENCES `zamowienie` (`idZamowienie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `urlop`
--
ALTER TABLE `urlop`
  ADD CONSTRAINT `fk_Urlop_Pracownik_filii1` FOREIGN KEY (`Pracownik_filii_idPracownik_filii`,`Pracownik_filii_Filia_idFilia`) REFERENCES `pracownik_filii` (`idPracownik_filii`, `Filia_idFilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `wypozyczenie`
--
ALTER TABLE `wypozyczenie`
  ADD CONSTRAINT `fk_Wypozyczenie_Czytelnik1` FOREIGN KEY (`Czytelnik_idCzytelnik`) REFERENCES `czytelnik` (`idCzytelnik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `fk_Zamowienie_Pracownik_filii1` FOREIGN KEY (`Pracownik_filii_idPracownik_filii`,`Pracownik_filii_Filia_idFilia`) REFERENCES `pracownik_filii` (`idPracownik_filii`, `Filia_idFilia`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
