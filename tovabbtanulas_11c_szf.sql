-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 21. 11:07
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tovabbtanulas_11c_szf`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `altalanos_iskola`
--

CREATE TABLE `altalanos_iskola` (
  `id_altalanos_iskola` tinyint(3) UNSIGNED NOT NULL,
  `altalanos_iskola_neve` varchar(250) NOT NULL,
  `altalanos_iskola_cime` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `altalanos_iskola`
--

INSERT INTO `altalanos_iskola` (`id_altalanos_iskola`, `altalanos_iskola_neve`, `altalanos_iskola_cime`) VALUES
(1, 'Csillagvár Általános Iskola', 'Kocka u. 14.'),
(2, 'Napsugár Általános Iskola', 'Gyöngyvirág u. 4.'),
(3, 'Tóparti Általános Iskola', 'Strand út 23.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jelentkezes`
--

CREATE TABLE `jelentkezes` (
  `id_jelentkezes` tinyint(3) UNSIGNED NOT NULL,
  `tanulo_id` tinyint(3) UNSIGNED NOT NULL,
  `kozepiskola_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `jelentkezes`
--

INSERT INTO `jelentkezes` (`id_jelentkezes`, `tanulo_id`, `kozepiskola_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 1),
(6, 3, 2),
(7, 3, 1),
(8, 4, 3),
(9, 4, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kozepiskola`
--

CREATE TABLE `kozepiskola` (
  `id_kozepiskola` tinyint(3) UNSIGNED NOT NULL,
  `kozepiskola_neve` varchar(255) NOT NULL,
  `kozepiskola_cime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `kozepiskola`
--

INSERT INTO `kozepiskola` (`id_kozepiskola`, `kozepiskola_neve`, `kozepiskola_cime`) VALUES
(1, 'Zengő Gimnázium', 'Zerge u. 13.'),
(2, 'Dobogó Szakközépiskola', 'Sziklás u. 44.'),
(3, 'Kékes Gimnázium', 'Havas út 51.'),
(4, 'Baradla Gimnázium', 'Köves tér 3.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tanulo`
--

CREATE TABLE `tanulo` (
  `id_tanulo` tinyint(3) UNSIGNED NOT NULL,
  `tanulo_neve` varchar(255) NOT NULL,
  `id_alt_isk` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `tanulo`
--

INSERT INTO `tanulo` (`id_tanulo`, `tanulo_neve`, `id_alt_isk`) VALUES
(1, 'Alföldi Noémi', 1),
(2, 'Kis Virág', 2),
(3, 'Tóth Aladár', 3),
(4, 'Végső Albert', 4);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `altalanos_iskola`
--
ALTER TABLE `altalanos_iskola`
  ADD PRIMARY KEY (`id_altalanos_iskola`);

--
-- A tábla indexei `jelentkezes`
--
ALTER TABLE `jelentkezes`
  ADD PRIMARY KEY (`id_jelentkezes`),
  ADD KEY `tanulo_id` (`tanulo_id`),
  ADD KEY `kozepiskola_id` (`kozepiskola_id`);

--
-- A tábla indexei `kozepiskola`
--
ALTER TABLE `kozepiskola`
  ADD PRIMARY KEY (`id_kozepiskola`);

--
-- A tábla indexei `tanulo`
--
ALTER TABLE `tanulo`
  ADD PRIMARY KEY (`id_tanulo`),
  ADD KEY `id_alt_isk` (`id_alt_isk`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `altalanos_iskola`
--
ALTER TABLE `altalanos_iskola`
  MODIFY `id_altalanos_iskola` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `jelentkezes`
--
ALTER TABLE `jelentkezes`
  MODIFY `id_jelentkezes` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT a táblához `kozepiskola`
--
ALTER TABLE `kozepiskola`
  MODIFY `id_kozepiskola` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `tanulo`
--
ALTER TABLE `tanulo`
  MODIFY `id_tanulo` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `altalanos_iskola`
--
ALTER TABLE `altalanos_iskola`
  ADD CONSTRAINT `altalanos_iskola_ibfk_1` FOREIGN KEY (`id_altalanos_iskola`) REFERENCES `tanulo` (`id_alt_isk`);

--
-- Megkötések a táblához `kozepiskola`
--
ALTER TABLE `kozepiskola`
  ADD CONSTRAINT `kozepiskola_ibfk_1` FOREIGN KEY (`id_kozepiskola`) REFERENCES `jelentkezes` (`kozepiskola_id`);

--
-- Megkötések a táblához `tanulo`
--
ALTER TABLE `tanulo`
  ADD CONSTRAINT `tanulo_ibfk_1` FOREIGN KEY (`id_tanulo`) REFERENCES `jelentkezes` (`tanulo_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
