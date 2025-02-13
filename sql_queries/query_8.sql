/*
 * Знайти середній бал, який ставить певний викладач зі своїх предметів.
*/
SELECT
	l.name as lector,
	AVG(sm.mark) as avg_mark
FROM student_marks sm
INNER JOIN subjects sub on sub.id  = sm.subject_id
INNER JOIN lectors l on l.id = sub.lector_id  
WHERE
	l.id = ?
GROUP BY
	l.name