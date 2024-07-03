
-------------------------
-- Tablas de estudiantes y docentes por departamento
-------------------------

-- Crear tabla de ofertas secundarias por departamento
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
    nomDepartamento VARCHAR(200) NOT NULL,
    idzonapais INTEGER NOT NULL,
    nomZonaPais VARCHAR(200)
);

-- para cada departamento distinto en ubicacion
-- insertar en departamento id y nombre
-- como los departamentos son únicos y están en ambos lados por
-- orden alfabetico, no debería haber problemas de duplicados ni de orden y esta tabla se puede usar en ambos req
INSERT INTO DEPARTAMENTO (idDepartamento, nomDepartamento, idzonapais, nomZonaPais)
SELECT DISTINCT idDepartamento, nomDepartamento, idZonaPais, nomZonaPais
FROM UBICACION;

-- PK
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT PK_OFERTAS_SECUNDARIA_DEPTOS PRIMARY KEY (idLiceo, idModalidad, idNivel, idPlan, idTurnoL, idOpcion, idDepartamento);

-- FK
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_LICEO FOREIGN KEY (idLiceo) REFERENCES LICEO(IDLICEO);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_MODALIDAD FOREIGN KEY (idModalidad) REFERENCES MODALIDAD(IDMODALIDAD);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_NIVEL FOREIGN KEY (idNivel) REFERENCES NIVEL(idGrado);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_PLAN FOREIGN KEY (idPlan) REFERENCES PLAN(IDPLAN);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_TURNO FOREIGN KEY (idTurnoL) REFERENCES TURNOL(IDTURNO);
ALTER TABLE OFERTAS_SECUNDARIA_DEPTOS ADD CONSTRAINT FK_OFERTAS_SECUNDARIA_DEPTOS_OPCION FOREIGN KEY (idOpcion) REFERENCES OPCION(IDOPCION);


-- Copiar datos de ofertas secundarias a ofertas secundarias por departamento
INSERT INTO OFERTAS_SECUNDARIA_DEPTOS (idLiceo, idModalidad, idNivel, idPlan, idTurnoL, idOpcion, idDepartamento)
SELECT
    os.idLiceo,
    os.idModalidad,
    os.idNivel,
    os.idPlan,
    os.idTurnoL,
    os.idOpcion,
    u.idDepartamento
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