/*
 * Список курсів, які певному студенту читає певний викладач.
*/
SELECT DISTINCT 
	s.name as student_name
	,l.name as lector
	,sub.subject
FROM students s
INNER JOIN student_marks sm on sm.student_id  = s.id
INNER JOIN subjects sub on sub.id  = sm.subject_id
INNER JOIN lectors l on l.id = sub.lector_id  
WHERE
	s.id = ?
	and l.id = ?
ORDER BY
	subject