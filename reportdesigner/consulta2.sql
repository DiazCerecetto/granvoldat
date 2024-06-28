SELECT nomZonaPais, avg(total_aulas) as promedio
FROM (
    SELECT nomZonaPais, nomDepartamento, sum(cant_aulas) as total_aulas
    FROM UBICACIONE
    JOIN (
    SELECT DISTINCT idUbicacion, idEscuela, idCategoria, idNivelDesde, idNivelHasta, cant_aulas, gruposXnivel, cant_niveles
    FROM OFERTAS_INICIAL_PRIMARIA
    ) a ON UBICACIONE.IDUBICACION = a.idUbicacion
    GROUP BY nomZonaPais, nomDepartamento
) b
GROUP BY nomZonaPais;
