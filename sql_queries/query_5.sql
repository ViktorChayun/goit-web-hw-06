/*
 * Знайти які курси читає певний викладач. 
*/
SELECT
	l.name as lector_name,
    sub.subject
FROM subjects sub
INNER JOIN lectors l on l.id = sub.lector_id  
WHERE
	l.id = ?
ORDER BY
	subject