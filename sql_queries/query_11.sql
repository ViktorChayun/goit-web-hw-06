/*
 * Середній бал, який певний викладач ставить певному студентові.
*/
SELECT 
	s.name as student_name,
	l.name as lector,
	AVG(sm.mark) as avg_mark
FROM students s
INNER JOIN student_marks sm on sm.student_id  = s.id
INNER JOIN subjects sub on sub.id  = sm.subject_id
INNER JOIN lectors l on l.id = sub.lector_id  
WHERE
	s.id = ?
	and l.id = ?
GROUP BY
    s.name,
	l.name