/*
 * Знайти середній бал на потоці (по всій таблиці оцінок) 
*/
SELECT
	AVG(sm.mark) as avg_mark
FROM student_marks sm