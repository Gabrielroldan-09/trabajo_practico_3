# ⚽ Proyecto SQL OLAP - Mundiales

Este proyecto aplica **CTEs, Window Functions y OLAP (emulado)** sobre un dataset con **todos los partidos de los Mundiales de Fútbol**.

## 📂 Contenido del repositorio
- `mundial.db` → Base de datos SQLite con la tabla `todos_los_partidos_de_los_mundiales`
- `todos_los_partidos_de_los_mundiales.csv` → Dataset original importado
- `consultas.sql` → Archivo con las 3 consultas obligatorias
- `README.md` → Explicación y principales insights obtenidos

## 🔍 Consultas realizadas
1. **CTE** → Cálculo del promedio de goles por fase en cada mundial.
2. **Window Functions** → Ranking de equipos goleadores por torneo.
3. **OLAP emulado** → Subtotales de goles por año, fase y total general.

## 📊 Insights principales
1. **Menos goles en etapas finales:** El promedio de goles por partido es más alto en fases de grupos y más bajo en finales (ejemplo: finales con ≤2 goles de promedio).  
2. **Equipos dominantes por mundial:** El ranking muestra que algunas selecciones lideran consistentemente en goles, destacándose campeones históricos.  
3. **Evolución histórica de goles:** El total de goles por torneo fue creciendo hasta cierto punto, pero en mundiales recientes la media de goles por partido es más estable.

## 🚀 Cómo reproducir
1. Abrir `mundial.db` en **DB Browser for SQLite**.  
2. Ir a la pestaña *Execute SQL* y correr el contenido de `consultas.sql`.  
3. Revisar los resultados de cada consulta y exportar si es necesario.  

---
📅 *Trabajo Practico 3 - UTN - FRT - BASE DE DATOS II*
