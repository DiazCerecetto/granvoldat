# granvoldat 2024

[Informe PDF](./informe/Informe.pdf)

Este repositorio contiene los archivos y entregas provistas para el proyecto final de la materia "Sistemas de información para el análisis de grandes volumenes de datos".

## Tecnologias utilizadas
- Kettle / Spoon (Pentaho data integration)
- Mondrian (Pentaho schema workbench)
- PostgreSQL 
- JSON files
- PowerBI
- Pentaho Visualizer
- Pentaho Report designer

## Descripcion del proyecto

La consigna de este trabajo se dividio en distintas etapas o partes, las cuales son descritas a ctontinuacion

- Diseno relacional y logico - Se define un modelo en base a una consigna en el cual se satisfacen requerimientos de filtrado y agrupado por dimensiones, se definen los cubos a implementar y las aditividades de las medidas.

- ETL - Se debe procesar un CSV para normalizar los datos y posteriormente cagar dos modelos, una base de datos a la cual se consulta mediante un esquema OLAP virtual de mondrian y un cubo implementado en archivos JSON.

- Frontend - Se debe implementar tableros dashboard en un front que permita realizar dichas consultas.