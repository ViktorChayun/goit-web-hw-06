/*
 * Знайти середній бал у групах з певного предмета. 
*/
SELECT
	g.name,
	AVG(sm.mark) as avg_mark
FROM student_marks sm
INNER JOIN students s ON s.id = sm.student_id
INNER JOIN groups g on s.group_id =g.id 
WHERE 
	sm.subject_id = ?
GROUP BY 
	g.name
ORDER BY 
	avg_mark DESC
