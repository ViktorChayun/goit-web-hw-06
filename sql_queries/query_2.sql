/*
 * Знайти студента із найвищим середнім балом з певного предмета. 
*/
SELECT
	s.name, 
	AVG(sm.mark) as avg_mark
FROM students s
INNER JOIN student_marks sm ON s.id = sm.student_id
WHERE 
	sm.subject_id = ?
GROUP BY 
	s.name
ORDER BY 
	avg_mark DESC
LIMIT 1
