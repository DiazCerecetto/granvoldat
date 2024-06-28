-- REQUERIMIENTO 1


CREATE TABLE LICEO (
    IDLICEO INTEGER PRIMARY KEY,
    nomLiceo VARCHAR(200) NOT NULL
);

CREATE TABLE MODALIDAD (
    IDMODALIDAD INTEGER PRIMARY KEY,
    nomModalidad VARCHAR(50) NOT NULL
);

CREATE TABLE NIVEL (
    idGrado INTEGER PRIMARY KEY,
    idCiclo INTEGER NOT NULL,
    nomCiclo VARCHAR(200) NOT NULL
);

CREATE TABLE OPCION (
    IDOPCION INTEGER PRIMARY KEY,
    nomOpcion VARCHAR(50)
);

CREATE TABLE PLAN (
    IDPLAN INTEGER PRIMARY KEY,
    nomPlan VARCHAR(200) NOT NULL,
    idEpoca INTEGER NOT NULL,
    nomEpoca VARCHAR(200) NOT NULL,
    idEsNuevo INTEGER NOT NULL,
    esNuevo VARCHAR(200) NOT NULL,
    idFranjaEdad INTEGER NOT NULL,
    franjaEdad VARCHAR(200) NOT NULL
);

CREATE TABLE TURNOL(
    IDTURNO INTEGER PRIMARY KEY,
    nomTurno VARCHAR(50) NOT NULL,
    idHorario INTEGER NOT NULL,
    nomHorario VARCHAR(50) NOT NULL,
    idFranjaHoraria INTEGER NOT NULL,
    franjaHoraria VARCHAR(50) NOT NULL
);

CREATE TABLE UBICACION (
    IDUBICACION INTEGER PRIMARY KEY,
    latitud FLOAT,
    longitud FLOAT,
    idArea INTEGER,
    nomArea VARCHAR(200),
    idBarrio INTEGER,
    nomBarrio VARCHAR(200),
    idZona INTEGER,
    nomZona VARCHAR(200), 
    idLocalidad INTEGER NOT NULL,
    nomLocalidad VARCHAR(200) NOT NULL,
    idDepartamento INTEGER NOT NULL,
    nomDepartamento VARCHAR(200) NOT NULL,
    idZonaPais INTEGER NOT NULL,
    nomZonaPais VARCHAR(200) NOT NULL
);

CREATE TABLE UBICACIONE (
    IDUBICACION INTEGER PRIMARY KEY,
    latitud FLOAT, -- lo tengo
    longitud FLOAT, -- lo tengo
    idArea INTEGER,
    nomArea VARCHAR(200),
    idBarrio INTEGER,
    nomBarrio VARCHAR(200),
    idZona INTEGER, -- lo tengo
    nomZona VARCHAR(200), 
    idLocalidad INTEGER NOT NULL,-- lo tengo
    nomLocalidad VARCHAR(200) NOT NULL,-- lo tengo
    idDepartamento INTEGER NOT NULL,-- lo tengo
    nomDepartamento VARCHAR(200) NOT NULL,-- lo tengo
    idZonaPais INTEGER NOT NULL,-- lo tengo
    nomZonaPais VARCHAR(200) NOT NULL -- lo tengo
);
-- REQUERIMIENTO 2

CREATE TABLE ESCUELA(
    IDESCUELA INTEGER PRIMARY KEY,
    nomEscuela VARCHAR(50) NOT NULL,
    idTipo INTEGER NOT NULL,
    nomTipo VARCHAR(50) NOT NULL
);

CREATE TABLE TURNOE(
    idTurno INTEGER PRIMARY KEY,
    nomTurno VARCHAR(50) NOT NULL,
    idTipoTurno INTEGER NOT NULL,
    nomTipoTurno VARCHAR(50) NOT NULL,
    idFranjaHoraria INTEGER NOT NULL,
    franjaHoraria VARCHAR(50) NOT NULL
);

CREATE TABLE CATEGORIA(
    idCategoria INTEGER PRIMARY KEY,
    nomCategoria VARCHAR(50) NOT NULL,
    idPractica INTEGER NOT NULL,
    nomPractica VARCHAR(50) NOT NULL,
    idDiscapacidad INTEGER NOT NULL,
    nomDiscapacidad VARCHAR(50) NOT NULL
);

CREATE TABLE NIVELE(
    idNivel INTEGER PRIMARY KEY,
    nomNivel VARCHAR(50) NOT NULL,
    idCiclo INTEGER NOT NULL,
    nomCiclo VARCHAR(50) NOT NULL
);



-- tablas de hechos

CREATE TABLE OFERTAS_SECUNDARIA(
    idLiceo INTEGER NOT NULL,
    idModalidad INTEGER NOT NULL,
    idNivel INTEGER NOT NULL,
    idPlan INTEGER NOT NULL,
    idTurnoL INTEGER NOT NULL,
    idOpcion INTEGER NOT NULL,
    idUbicacion INTEGER NOT NULL,
    porcLiceos FLOAT
);
CREATE TABLE OFERTAS_INICIAL_PRIMARIA(
    idEscuela INTEGER NOT NULL,
    idTurnoE INTEGER NOT NULL,
    idCategoria INTEGER NOT NULL,
    idNivelDesde INTEGER NOT NULL,
    idNivelHasta INTEGER NOT NULL,
    idUbicacion INTEGER NOT NULL,
    cant_aulas INTEGER,
    gruposXnivel INTEGER,
    cant_niveles Integer
);
CREATE TABLE OFERTAS_SECUNDARIA_DEPTOS(
    idLiceo INTEGER NOT NULL,
    idModalidad INTEGER NOT NULL,
    idNivel INTEGER NOT NULL,
    idPlan INTEGER NOT NULL,
    idTurnoL INTEGER NOT NULL,
    idOpcion INTEGER NOT NULL,
    idDepartamento INTEGER NOT NULL,
    porcestsxdepto FLOAT,
	porcdocsxdepto FLOAT
);

CREATE TABLE DEPARTAMENTO (
    idDepartamento INTEGER PRIMARY KEY,
    nomDepartamento VARCHAR(200) NOT NULL
);

-- para cada departamento distinto en ubicacion
-- insertar en departamento id y nombre
INSERT INTO DEPARTAMENTO (idDepartamento, nomDepartamento)
SELECT DISTINCT idDepartamento, nomDepartamento
FROM UBICACIONE;

-- primary keys

ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT PK_OFERTAS_SECUNDARIA PRIMARY KEY (idLiceo, idModalidad, idNivel, idPlan, idTurnoL, idOpcion, idUbicacion);
ALTER TABLE OFERTAS_ESCUELAS ADD CONSTRAINT PK_OFERTAS_ESCUELAS PRIMARY KEY (idEscuela, idTurnoE, idCategoria, idNivelDesde, idNivelHasta, idUbicacion);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT PK_OFERTAS_SECUNDARIA_DEPTOS PRIMARY KEY (idLiceo, idModalidad, idNivel, idPlan, idTurnoL, idOpcion, idDepartamento);
-- foreign keys

ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_LICEO FOREIGN KEY (idLiceo) REFERENCES LICEO(IDLICEO);
ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_MODALIDAD FOREIGN KEY (idModalidad) REFERENCES MODALIDAD(IDMODALIDAD);
ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_NIVEL FOREIGN KEY (idNivel) REFERENCES NIVEL(idGrado);
ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_PLAN FOREIGN KEY (idPlan) REFERENCES PLAN(IDPLAN);
ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_TURNO FOREIGN KEY (idTurnoL) REFERENCES TURNOL(IDTURNO);
ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_OPCION FOREIGN KEY (idOpcion) REFERENCES OPCION(IDOPCION);
ALTER TABLE OFERTAS_SECUNDARIA ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_UBICACION FOREIGN KEY (idUbicacion) REFERENCES UBICACION(IDUBICACION);

ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_LICEO FOREIGN KEY (idLiceo) REFERENCES LICEO(IDLICEO);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_MODALIDAD FOREIGN KEY (idModalidad) REFERENCES MODALIDAD(IDMODALIDAD);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_NIVEL FOREIGN KEY (idNivel) REFERENCES NIVEL(idGrado);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_PLAN FOREIGN KEY (idPlan) REFERENCES PLAN(IDPLAN);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_TURNO FOREIGN KEY (idTurnoL) REFERENCES TURNOL(IDTURNO);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_OPCION FOREIGN KEY (idOpcion) REFERENCES OPCION(IDOPCION);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_UBICACION FOREIGN KEY (idDepartamento) REFERENCES UBICACION(idDepartamento);


INSERT INTO OFERTAS_SECUNDARIA_DEPTOS (idLiceo, idModalidad, idNivel, idPlan, idTurnoL, idOpcion, idDepartamento, porcestsxdepto, porcdocsxdepto)
SELECT
    os.idLiceo,
    os.idModalidad,
    os.idNivel,
    os.idPlan,
    os.idTurnoL,
    os.idOpcion,
    u.idDepartamento,
    os.porcLiceos
FROM
    OFERTAS_SECUNDARIA os
JOIN
    UBICACION u ON os.idUbicacion = u.IDUBICACION;


-- Actualizar porcestsxdepto y porcdocsxdepto en OFERTAS_SECUNDARIA_DEPTOS por nomDepartamento
UPDATE OFERTAS_SECUNDARIA_DEPTOS AS osd
SET 
    porcestsxdepto = 
        CASE 
            WHEN u.nomDepartamento = 'ARTIGAS' THEN 0.3134
            WHEN u.nomDepartamento = 'CANELONES' THEN 0.0286
            WHEN u.nomDepartamento = 'CERRO LARGO' THEN 0.1776
            WHEN u.nomDepartamento = 'COLONIA' THEN 0.0309
            WHEN u.nomDepartamento = 'DURAZNO' THEN 0.0422
            WHEN u.nomDepartamento = 'FLORES' THEN 0.019
            WHEN u.nomDepartamento = 'FLORIDA' THEN 0.0078
            WHEN u.nomDepartamento = 'LAVALLEJA' THEN 0.0212
            WHEN u.nomDepartamento = 'MALDONADO' THEN 0.0174
            WHEN u.nomDepartamento = 'MONTEVIDEO' THEN 0.0555
            WHEN u.nomDepartamento = 'PAYSANDU' THEN 0.0375
            WHEN u.nomDepartamento = 'RIO NEGRO' THEN 0.0185
            WHEN u.nomDepartamento = 'RIVERA' THEN 0.0425
            WHEN u.nomDepartamento = 'ROCHA' THEN 0.0275
            WHEN u.nomDepartamento = 'SALTO' THEN 0.0468
            WHEN u.nomDepartamento = 'SAN JOSE' THEN 0.0388
            WHEN u.nomDepartamento = 'SORIANO' THEN 0.0276
            WHEN u.nomDepartamento = 'TACUAREMBO' THEN 0.0318
            WHEN u.nomDepartamento = 'TREINTA Y TRES' THEN 0.0154
            ELSE 0.0 -- Ajusta este valor por defecto según tu lógica
        END,
    porcdocsxdepto = 
        CASE 
            WHEN u.nomDepartamento = 'ARTIGAS' THEN 0.3111
            WHEN u.nomDepartamento = 'CANELONES' THEN 0.0302
            WHEN u.nomDepartamento = 'CERRO LARGO' THEN 0.1727
            WHEN u.nomDepartamento = 'COLONIA' THEN 0.0331
            WHEN u.nomDepartamento = 'DURAZNO' THEN 0.0474
            WHEN u.nomDepartamento = 'FLORES' THEN 0.0221
            WHEN u.nomDepartamento = 'FLORIDA' THEN 0.009
            WHEN u.nomDepartamento = 'LAVALLEJA' THEN 0.0262
            WHEN u.nomDepartamento = 'MALDONADO' THEN 0.0199
            WHEN u.nomDepartamento = 'MONTEVIDEO' THEN 0.0552
            WHEN u.nomDepartamento = 'PAYSANDU' THEN 0.0426
            WHEN u.nomDepartamento = 'RIO NEGRO' THEN 0.0207
            WHEN u.nomDepartamento = 'RIVERA' THEN 0.0412
            WHEN u.nomDepartamento = 'ROCHA' THEN 0.0289
            WHEN u.nomDepartamento = 'SALTO' THEN 0.0457
            WHEN u.nomDepartamento = 'SAN JOSE' THEN 0.0391
            WHEN u.nomDepartamento = 'SORIANO' THEN 0.0306
            WHEN u.nomDepartamento = 'TACUAREMBO' THEN 0.0363
            WHEN u.nomDepartamento = 'TREINTA Y TRES' THEN 0.0192
            ELSE 0.0 -- Ajusta este valor por defecto según tu lógica
        END
FROM
    UBICACION AS u
WHERE
	
    u.iddepartamento = osd.idDepartamento;

--probar lo anterior
SELECT DISTINCT porcestsxdepto from OFERTAS_SECUNDARIA_DEPTOS;
select distinct porcdocsxdepto from OFERTAS_SECUNDARIA_DEPTOS;

SELECT SUM(DISTINCT porcestsxdepto) from OFERTAS_SECUNDARIA_DEPTOS;
select SUM(distinct porcdocsxdepto) from OFERTAS_SECUNDARIA_DEPTOS;

-- agregar subsistemas a la tabla departamentos
ALTER TABLE DEPARTAMENTO
ADD COLUMN idzonapais INTEGER,
ADD COLUMN nomZonaPais VARCHAR(200);

UPDATE DEPARTAMENTO d
SET 
    idzonapais = u.idzonapais,
    nomzonapais = u.nomzonapais
FROM UBICACION u
WHERE
    d.idDepartamento = u.idDepartamento;


-- 
-- -- foreign keys
-- 
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT FK_OFERTAS_ESCUELAS_ESCUELA FOREIGN KEY (idEscuela) REFERENCES ESCUELA(IDESCUELA);
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT FK_OFERTAS_ESCUELAS_TURNO FOREIGN KEY (idTurnoE) REFERENCES TURNOE(idTurno);
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT FK_OFERTAS_ESCUELAS_CATEGORIA FOREIGN KEY (idCategoria) REFERENCES CATEGORIA(idCategoria);
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT FK_OFERTAS_ESCUELAS_NIVELD FOREIGN KEY (idNivelDesde) REFERENCES NIVELE(idNivel);
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT FK_OFERTAS_ESCUELAS_NIVELH FOREIGN KEY (idNivelHasta) REFERENCES NIVELE(idNivel);
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT FK_OFERTAS_ESCUELAS_UBICACION FOREIGN KEY (idUbicacion) REFERENCES UBICACION(IDUBICACION);
ALTER TABLE OFERTAS_INICIAL_PRIMARIA ADD CONSTRAINT PK_OFERTAS_ESCUELAS PRIMARY KEY (idEscuela, idTurnoE, idCategoria, idNivelDesde, idNivelHasta, idUbicacion);



-- Para cada valor distinto de idZonaPais en UBICACIONE, sumar la cantidad de aulas en OFERTAS_INICIAL_PRIMARIA
-- para cada departamento y retornar una lista con las zonapais con un promedio de las cantidades de aulas
-- de sus departamentos ordenada de mayor a menor

-- primero una tabla donde cada departamento tiene la cantidad de aulas
SELECT nomZonaPais, nomDepartamento, sum(cant_aulas) as total_aulas
FROM UBICACIONE
JOIN (
SELECT DISTINCT idUbicacion, idEscuela, idCategoria, idNivelDesde, idNivelHasta, cant_aulas, gruposXnivel, cant_niveles
FROM OFERTAS_INICIAL_PRIMARIA;
) a ON UBICACIONE.IDUBICACION = a.idUbicacion

GROUP BY nomZonaPais, nomDepartamento
ORDER BY total_aulas DESC;

-- luego, para cada zonapais, obtener el promedio de cantidad de aulas por cada departamento
-- y retornar una lista con las zonapais que tengan un promedio mayor a 10
SELECT nomZonaPais, avg(total_aulas) as promedio
FROM (
    SELECT nomZonaPais, nomDepartamento, sum(cant_aulas) as total_aulas
    FROM UBICACIONE
    JOIN (
    SELECT DISTINCT idUbicacion, idEscuela, idCategoria, idNivelDesde, idNivelHasta, cant_aulas, gruposXnivel, cant_niveles
    FROM OFERTAS_INICIAL_PRIMARIA;
    ) a ON UBICACIONE.IDUBICACION = a.idUbicacion
    GROUP BY nomZonaPais, nomDepartamento
) b
GROUP BY nomZonaPais;





---
-- medidas
ALTER TABLE OFERTAS_SECUNDARIA
ADD COLUMN cant_ofertas integer DEFAULT 1;
ALTER TABLE OFERTAS_SECUNDARIA
ADD COLUMN cant_liceos INTEGER DEFAULT 1;

-- Testing
-- para cada zonapais, 
-- obtener el promedio de cantidad de aulas por cada departamento 
-- y retornar una lista con los departamentos que tengan un promedio mayor a 10

SELECT nomZonaPais, nomDepartamento, avg(cant_aulas) as promedio
FROM UBICACIONE
JOIN OFERTAS_INICIAL_PRIMARIA ON UBICACIONE.IDUBICACION = OFERTAS_INICIAL_PRIMARIA.idUbicacion
GROUP BY nomZonaPais, nomDepartamento
HAVING avg(cant_aulas) > 10;

ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT FK_OFERTAS_ESCUELAS_ESCUELA;
ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT FK_OFERTAS_ESCUELAS_TURNO;
ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT FK_OFERTAS_ESCUELAS_CATEGORIA;
ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT FK_OFERTAS_ESCUELAS_NIVELD;
ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT FK_OFERTAS_ESCUELAS_NIVELH;
ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT FK_OFERTAS_ESCUELAS_UBICACION;
ALTER TABLE OFERTAS_INICIAL_PRIMARIA DROP CONSTRAINT PK_OFERTAS_ESCUELAS;

-- elegir todos los departamentos que tienen al menos una entrada en OFERTAS_INICIAL_PRIMARIA
SELECT DISTINCT nomDepartamento
FROM UBICACIONE
JOIN OFERTAS_INICIAL_PRIMARIA ON UBICACIONE.IDUBICACION = OFERTAS_INICIAL_PRIMARIA.idUbicacion;

-- indicar aquellos que no figuran en la consulta anterior
SELECT distinct nomDepartamento
FROM UBICACIONE
WHERE nomDepartamento NOT IN (
    SELECT DISTINCT nomDepartamento
    FROM UBICACIONE
    JOIN OFERTAS_INICIAL_PRIMARIA ON UBICACIONE.IDUBICACION = OFERTAS_INICIAL_PRIMARIA.idUbicacion
);

select distinct nomDepartamento from ubicacione;
