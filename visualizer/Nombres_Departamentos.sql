SELECT nomDepartamento
FROM (
    SELECT DISTINCT idDepartamento, nomDepartamento
    FROM ubicacion
    ORDER BY idDepartamento
)