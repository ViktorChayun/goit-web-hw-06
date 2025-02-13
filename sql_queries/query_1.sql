/*
 * Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
*/

SELECT 
	students.name
	,AVG(student_marks.mark) as avg_mark
FROM students
INNER JOIN student_marks ON students.id = student_marks.student_id
GROUP BY 
	students.name
ORDER BY avg_mark DESC
LIMIT 5