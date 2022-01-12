/* Escriba una consulta que devuelva el legajo y la cantidad de cursos que realiza cada estudiante. */
SELECT estudiante_legajo, COUNT(*) AS 'Cantidad de Cursos' FROM INSCRIPCION
WHERE (SELECT DISTINCT estudiante_legajo FROM INSCRIPCION)
GROUP BY estudiante_legajo

/* Escriba una consulta que devuelva el legajo y la cantidad de cursos de los estudiantes que realizan más de un curso. */
SELECT estudiante_legajo, COUNT(*) AS 'Cantidad de Cursos' FROM INSCRIPCION
WHERE (SELECT DISTINCT estudiante_legajo FROM INSCRIPCION)
GROUP BY estudiante_legajo HAVING COUNT(*) > 1

/* Escriba una consulta que devuelva la información de los estudiantes que no realizan ningún curso. */
SELECT * FROM ESTUDIANTE
WHERE legajo NOT IN (SELECT DISTINCT estudiante_legajo FROM INSCRIPCION)
