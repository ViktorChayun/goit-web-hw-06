/*
 * Оцінки студентів у певній групі з певного предмета на останньому занятті.
*/
SELECT 
	g.name,
	s.name as student_name,	
	sub.subject,
	sm.mark
FROM students s
INNER JOIN groups g on g.id = s.group_id 
INNER JOIN student_marks sm on sm.student_id  = s.id
INNER JOIN subjects sub on sub.id  = sm.subject_id
WHERE
	g.id = ?
	and sub.id = ?
	--останнє заняття студента по даному преедмету
    --пошук останьої дати лекції по даному студенту і предмету
    and sm.lecture_date = (
		SELECT
			MAX(lecture_date)
		FROM student_marks sm2 
		WHERE
			sm2.student_id = sm.student_id
			and sm2.subject_id = sm.subject_id
	)
ORDER BY
	student_name,
	subject