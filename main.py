from db import (
    create_db,
    get_connection,
    insert_groups,
    insert_lectors,
    insert_student_marks,
    insert_students,
    insert_subjects
)
from fake_data import FakeUniversityData

HOST = "localhost"
DB = "university"
USER = "postgres"
PASS = "123456"
SQL_FILE = r"C:\GitHub\pytraining-1\2 - Web\Module 6 - реляційні БД\Home work\Postrgres\create_db.sql"
NUMB_STUDENTS = 50
NUMB_SUBJECTS = 8
NUMB_LECTORS = 5
NUMB_GROUPS = 3
NUMB_MARKS = 20


if __name__ == "__main__":
    faker = FakeUniversityData(
        locale="uk-ua",
        numb_students=NUMB_STUDENTS,
        numb_groups=NUMB_GROUPS,
        numb_subjects=NUMB_LECTORS,
        numb_lectors=NUMB_SUBJECTS,
        numb_marks=NUMB_MARKS
    )
    students = faker.fake_students()
    groups = faker.fake_groups()
    lectors = faker.fake_lectors()
    subjects = faker.fake_subjects()
    student_marks = faker.fake_marks(1, 100)

    with get_connection(HOST, DB, USER, PASS) as conn:
        create_db(conn, SQL_FILE)
        insert_groups(conn, groups)
        insert_students(conn, students)
        insert_lectors(conn, lectors)
        insert_subjects(conn, subjects)
        insert_student_marks(conn, student_marks)
    print("Data was successfully inserted.")
