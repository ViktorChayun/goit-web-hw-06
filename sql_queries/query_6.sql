/*
 * Знайти список студентів у певній групі.
*/
SELECT 
	s.name as student_name
FROM students s
INNER JOIN groups g on g.id = s.group_id 
WHERE
	g.id = ?
ORDER BY
	student_name
