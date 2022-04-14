\c francoriquelme
DROP DATABASE pokerols;
CREATE DATABASE pokerols;
\c pokerols


CREATE TABLE rol(
    id SERIAL,
    nombre VARCHAR(50),
    descripcion VARCHAR,
    PRIMARY KEY (id)
);

SELECT * FROM rol;

CREATE TABLE usuario(
    rut VARCHAR(12),
    nombre VARCHAR(50),
    telefono INT,
    mail VARCHAR(30),
    genero VARCHAR(30),
    fecha_nacimiento DATE,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES rol(id)
);

SELECT * FROM usuario;

INSERT INTO rol(nombre, descripcion)
VALUES ('administrador', 'contro total');
INSERT INTO rol (nombre, descripcion)
VALUES ('marketing', 'editar y crear anuncios');
INSERT INTO rol (nombre, descripcion)
VALUES ('editor', 'editar articulos');
INSERT INTO rol (nombre, descripcion)
VALUES ('suscriptor', 'leer articulos');
SELECT * FROM rol;

INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('1-9', 'Juan Soto', 99999999, 'juan.soto@gmail.com', 'M', '2000-06-24', 1);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('2-7', 'Jorge Perez', 88888888, 'jorge.perez@gmail.com', 'M', '1998-03-12', 4);
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento)
VALUES ('3-5', 'Sara Morales', 44444444, 'sara.morales@gmail.com', 'F', '1990-02-11');
INSERT INTO usuario (rut, nombre, telefono, mail, genero, fecha_nacimiento, rol_id)
VALUES ('4-6', 'Sarita Morales', 77777777, 'sarita.morales@gmail.com', 'F', '1990-02-11', 2);

SELECT * FROM usuario;

SELECT * FROM rol INNER JOIN usuario ON rol.id = usuario.rol_id;
SELECT * FROM rol JOIN usuario ON rol.id = usuario.rol_id;

-- Qué roles tienen los de genero M
-- Selecciona el nombre de roles donde el usuario tenga genero M
-- Nombre está en la tabla rol
-- Genero está en la tabla usuario

-- /////// Una forma //////
-- SELECT rol.nombre FROM rol JOIN usuario ON rol.id = usuario.rol_id WHERE usuario.genero = 'M';

-- ////// Segunda forma //////
-- SELECT A.nombre
-- FROM rol AS A
-- JOIN usuario AS B
-- ON A.id = B.rol_id
-- WHERE B.genero = 'M';

-- ////// tercera forma la más óptima /////
SELECT rol.nombre
FROM rol JOIN usuario
ON rol.id = usuario.rol_id
WHERE usuario.genero = 'M';

-- join desde usuario
SELECT * FROM usuario
JOIN rol
ON usuario.rol_id = rol.id;

-- left join desde usuario
SELECT * FROM usuario
LEFT JOIN rol
ON usuario.rol_id = rol.id;

-- vamos a traer los roles que no tengan usuario
-- Null es la ausencia de valor
-- blank es que está en blanco, por ejemplo al borrar un dato de una tabla

-- SELECT rol.*
-- FROM rol
-- LEFT JOIN usuario 
-- ON rol.id = usuario.rol_id
-- WHERE usuario.rol_id IS NULL;


-- --Ejemplo de Full Outer Join
-- SELECT *
-- FROM rol
-- FULL OUTER JOIN usuario
-- ON rol.id = usuario.rol_id;

--Ejemplo de Full Outer Join con datos vacíos
SELECT *
FROM usuario
FULL OUTER JOIN rol
ON usuario.rol_id = rol.id
WHERE usuario.rol_id IS NULL
OR rol.id IS NULL;