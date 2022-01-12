/* 1. Escriba una consulta que devuelva el legajo y la cantidad de cursos que realiza cada estudiante. */
SELECT estudiante_legajo, COUNT(*) AS 'Cantidad de Cursos' FROM INSCRIPCION
WHERE (SELECT DISTINCT estudiante_legajo FROM INSCRIPCION)
GROUP BY estudiante_legajo

/* 2. Escriba una consulta que devuelva el legajo y la cantidad de cursos de los estudiantes que realizan más de un curso. */
SELECT estudiante_legajo, COUNT(*) AS 'Cantidad de Cursos' FROM INSCRIPCION
WHERE (SELECT DISTINCT estudiante_legajo FROM INSCRIPCION)
GROUP BY estudiante_legajo HAVING COUNT(*) > 1

/* 3. Escriba una consulta que devuelva la información de los estudiantes que no realizan ningún curso. */
SELECT * FROM ESTUDIANTE
WHERE legajo NOT IN (SELECT DISTINCT estudiante_legajo FROM INSCRIPCION)

/* 4. Escriba para cada tabla, los index (incluyendo su tipo) que tiene cada una. */
/* 
TABLA CURSO
    codigo INDICE CLOUSTERIZADO
    PROFESOR_id INDICE NO CLOUSTERIZADO
TABLA ESTUDIANTE
    legajo INDICE CLOUSTERIZADO
TABLA PROFESOR
    id INDICE CLOUSTERIZADO
TABLA INSCRIPCION
    numero INDICE CLOUSTERIZADO
    CURSO_codigo INDICE NO CLOUSTERIZADO
    ESTUDIANTE_legajo INDICE NO CLOUSTERIZADO
 */

 /* 5. Liste toda la información sobre los estudiantes que realizan cursos con los profesores de apellido “Pérez” y “Paz”. */
SELECT * FROM ESTUDIANTE
WHERE legajo in (SELECT DISTINCT estudiante_legajo 
    FROM INSCRIPCION
    WHERE curso_codigo IN (
        SELECT codigo FROM CURSO
        INNER JOIN PROFESOR ON CURSO.PROFESOR_ID = PROFESOR.id
        WHERE apellido='Pérez' OR apellido='Paz'))