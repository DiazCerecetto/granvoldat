

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
