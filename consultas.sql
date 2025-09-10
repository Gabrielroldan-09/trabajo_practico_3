-- ===========================
-- PROYECTO SQL OLAP - MUNDIALES
-- ===========================

-- CONSULTA 1: CTE - Promedio de goles por partido en cada mundial y fase
WITH goles_por_partido AS (
  SELECT
    Year,
    Stage,
    ("Home Team Goals" + "Away Team Goals") AS total_goles
  FROM todos_los_partidos_de_los_mundiales
)
SELECT
  Year,
  Stage,
  ROUND(AVG(total_goles), 2) AS promedio_goles
FROM goles_por_partido
GROUP BY Year, Stage
ORDER BY Year DESC, promedio_goles DESC;


-- CONSULTA 2: WINDOW FUNCTIONS - Ranking de equipos por goles en cada mundial
SELECT
  Year,
  "Home Team Name" AS team,
  SUM("Home Team Goals") AS goles,
  RANK() OVER (PARTITION BY Year ORDER BY SUM("Home Team Goals") DESC) AS rank_equipo
FROM todos_los_partidos_de_los_mundiales
GROUP BY Year, "Home Team Name"

UNION ALL

SELECT
  Year,
  "Away Team Name" AS team,
  SUM("Away Team Goals") AS goles,
  RANK() OVER (PARTITION BY Year ORDER BY SUM("Away Team Goals") DESC) AS rank_equipo
FROM todos_los_partidos_de_los_mundiales
GROUP BY Year, "Away Team Name"

ORDER BY Year DESC, rank_equipo ASC, goles DESC;


-- CONSULTA 3: OLAP EMULADO - Subtotales de goles por año y fase
-- (ROLLUP emulado con UNION ALL en SQLite)
SELECT Year, Stage, SUM("Home Team Goals" + "Away Team Goals") AS goles, 'DETALLE' AS nivel
FROM todos_los_partidos_de_los_mundiales
GROUP BY Year, Stage

UNION ALL

SELECT Year, NULL AS Stage, SUM("Home Team Goals" + "Away Team Goals") AS goles, 'SUBTOTAL_ANUAL' AS nivel
FROM todos_los_partidos_de_los_mundiales
GROUP BY Year

UNION ALL

SELECT NULL AS Year, NULL AS Stage, SUM("Home Team Goals" + "Away Team Goals") AS goles, 'TOTAL_GENERAL' AS nivel
FROM todos_los_partidos_de_los_mundiales

ORDER BY Year DESC, nivel;
