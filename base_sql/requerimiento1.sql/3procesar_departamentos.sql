-- Este script tiene la finalidad de que funcione el diagrama de geojson en el frontend
-- la idea es cambiar los nombres de los departamentos para mostrarlos correctamente en el mapa

UPDATE UBICACION
SET nomDepartamento = CASE
    WHEN nomDepartamento = 'ARTIGAS' THEN 'Artigas'
    WHEN nomDepartamento = 'CANELONES' THEN 'Canelones'
    WHEN nomDepartamento = 'CERRO LARGO' THEN 'Cerro Largo'
    WHEN nomDepartamento = 'COLONIA' THEN 'Colonia'
    WHEN nomDepartamento = 'DURAZNO' THEN 'Durazno'
    WHEN nomDepartamento = 'FLORES' THEN 'Flores'
    WHEN nomDepartamento = 'FLORIDA' THEN 'Florida'
    WHEN nomDepartamento = 'LAVALLEJA' THEN 'Lavalleja'
    WHEN nomDepartamento = 'MALDONADO' THEN 'Maldonado'
    WHEN nomDepartamento = 'MONTEVIDEO' THEN 'Montevideo'
    WHEN nomDepartamento = 'PAYSANDU' THEN 'Paysandú'
    WHEN nomDepartamento = 'RIO NEGRO' THEN 'Río Negro'
    WHEN nomDepartamento = 'RIVERA' THEN 'Rivera'
    WHEN nomDepartamento = 'ROCHA' THEN 'Rocha'
    WHEN nomDepartamento = 'SALTO' THEN 'Salto'
    WHEN nomDepartamento = 'SAN JOSE' THEN 'San José'
    WHEN nomDepartamento = 'SORIANO' THEN 'Soriano'
    WHEN nomDepartamento = 'TACUAREMBO' THEN 'Tacuarembó'
    WHEN nomDepartamento = 'TREINTA Y TRES' THEN 'Treinta y Tres'
    ELSE nomDepartamento 
END;
UPDATE UBICACIONE
SET nomDepartamento = CASE
    WHEN nomDepartamento = 'ARTIGAS' THEN 'Artigas'
    WHEN nomDepartamento = 'CANELONES' THEN 'Canelones'
    WHEN nomDepartamento = 'CERRO LARGO' THEN 'Cerro Largo'
    WHEN nomDepartamento = 'COLONIA' THEN 'Colonia'
    WHEN nomDepartamento = 'DURAZNO' THEN 'Durazno'
    WHEN nomDepartamento = 'FLORES' THEN 'Flores'
    WHEN nomDepartamento = 'FLORIDA' THEN 'Florida'
    WHEN nomDepartamento = 'LAVALLEJA' THEN 'Lavalleja'
    WHEN nomDepartamento = 'MALDONADO' THEN 'Maldonado'
    WHEN nomDepartamento = 'MONTEVIDEO' THEN 'Montevideo'
    WHEN nomDepartamento = 'PAYSANDU' THEN 'Paysandú'
    WHEN nomDepartamento = 'RIO NEGRO' THEN 'Río Negro'
    WHEN nomDepartamento = 'RIVERA' THEN 'Rivera'
    WHEN nomDepartamento = 'ROCHA' THEN 'Rocha'
    WHEN nomDepartamento = 'SALTO' THEN 'Salto'
    WHEN nomDepartamento = 'SAN JOSE' THEN 'San José'
    WHEN nomDepartamento = 'SORIANO' THEN 'Soriano'
    WHEN nomDepartamento = 'TACUAREMBO' THEN 'Tacuarembó'
    WHEN nomDepartamento = 'TREINTA Y TRES' THEN 'Treinta y Tres'
    ELSE nomDepartamento 
END;

UPDATE DEPARTAMENTO
SET nomDepartamento = CASE
    WHEN nomDepartamento = 'ARTIGAS' THEN 'Artigas'
    WHEN nomDepartamento = 'CANELONES' THEN 'Canelones'
    WHEN nomDepartamento = 'CERRO LARGO' THEN 'Cerro Largo'
    WHEN nomDepartamento = 'COLONIA' THEN 'Colonia'
    WHEN nomDepartamento = 'DURAZNO' THEN 'Durazno'
    WHEN nomDepartamento = 'FLORES' THEN 'Flores'
    WHEN nomDepartamento = 'FLORIDA' THEN 'Florida'
    WHEN nomDepartamento = 'LAVALLEJA' THEN 'Lavalleja'
    WHEN nomDepartamento = 'MALDONADO' THEN 'Maldonado'
    WHEN nomDepartamento = 'MONTEVIDEO' THEN 'Montevideo'
    WHEN nomDepartamento = 'PAYSANDU' THEN 'Paysandú'
    WHEN nomDepartamento = 'RIO NEGRO' THEN 'Río Negro'
    WHEN nomDepartamento = 'RIVERA' THEN 'Rivera'
    WHEN nomDepartamento = 'ROCHA' THEN 'Rocha'
    WHEN nomDepartamento = 'SALTO' THEN 'Salto'
    WHEN nomDepartamento = 'SAN JOSE' THEN 'San José'
    WHEN nomDepartamento = 'SORIANO' THEN 'Soriano'
    WHEN nomDepartamento = 'TACUAREMBO' THEN 'Tacuarembó'
    WHEN nomDepartamento = 'TREINTA Y TRES' THEN 'Treinta y Tres'
    ELSE nomDepartamento 
END;
