\c francoriquelme
DROP DATABASE pokemones;
CREATE DATABASE pokemones;
\c pokemones

CREATE TABLE pokemones(
    pokedex SERIAL,
    nombre VARCHAR(30),
    tipo1 VARCHAR(20),
    tipo2 VARCHAR(20),
    PRIMARY KEY(pokedex)
);
SELECT * FROM pokemones;

\copy pokemones FROM 'pokemonesKanto.csv' csv header;
SELECT * FROM pokemones LIMIT 2;

CREATE TABLE mis_pokemones(
    pokedex INT,
    fecha_captura DATE,
    lugar VARCHAR(30),
    huevo BOOLEAN,
    peso FLOAT,
    estatura FLOAT,
    FOREIGN KEY (pokedex) REFERENCES pokemones(pokedex)
);
SELECT * FROM mis_pokemones;

\copy mis_pokemones FROM 'mis_pokemones.csv' csv header;
SELECT * FROM mis_pokemones LIMIT 5;

-- SELECT * FROM mis_pokemones;
-- SELECT * FROM pokemones;

-- ver que pokemones tengo;
SELECT * FROM pokemones
JOIN mis_pokemones
ON pokemones.pokedex = mis_pokemones.pokedex;

--necesitamos saber que pokemones no tenemos
--como dice saber que pokemones no tenemos mostramos info de pokemones

-- SELECT pokemones.*
-- FROM pokemones
-- LEFT JOIN mis_pokemones
-- ON pokemones.pokedex = mis_pokemones.pokedex
-- WHERE mis_pokemones.pokedex IS NULL;

-- SELECT *
-- FROM mis_pokemones
-- FULL OUTER JOIN pokemones
-- ON mis_pokemones.pokedex = pokemones.pokedex

-- SELECT nombre
-- FROM pokemones
-- WHERE pokedex
-- IN (SELECT pokedex
-- FROM mis_pokemones);

SELECT DISTINCT pokedex 
FROM mis_pokemones;

-- La intrucción IN compara con un rango [1,2,3,4,5,6,7]
SELECT nombre
FROM pokemones
WHERE pokedex
IN (SELECT DISTINCT pokedex 
FROM mis_pokemones);

