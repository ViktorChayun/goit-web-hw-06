/*
 * Знайти оцінки студентів у окремій групі з певного предмета
*/
SELECT
	sub.subject
	,g.name
	,s.name as student_name
	,sm.mark
FROM students s
INNER JOIN groups g on g.id = s.group_id
INNER JOIN student_marks sm on sm.student_id  = s.id
INNER JOIN subjects sub on sub.id  = sm.subject_id
WHERE
	g.id = ?
	and sub.id = ?
ORDER BY
	student_name