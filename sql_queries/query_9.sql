/*
 * Знайти список курсів, які відвідує студент
*/
SELECT DISTINCT
	s.name as student_name
	,sub.subject
FROM students s
INNER JOIN student_marks sm on sm.student_id  = s.id
INNER JOIN subjects sub on sub.id  = sm.subject_id
WHERE
	s.id = ?
ORDER BY
	subject