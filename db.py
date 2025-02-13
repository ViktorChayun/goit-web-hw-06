import sys
import psycopg2
from contextlib import contextmanager


@contextmanager
def get_connection(host, db, user, password):
    try:
        conn = psycopg2.connect(
            dbname=db,
            user=user,
            password=password,
            host=host
        )
        conn.autocommit = True
        yield conn
    except psycopg2.DatabaseError as err:
        print(f"Database error: {err}")
    finally:
        conn.close()


def create_db(conn, sql_file):
    try:
        with open(sql_file, 'r') as file:
            sql = file.read()
    except Exception as err:
        print(f"Issue with reading create db script. {err}")
        sys.exit(1)
    try:
        cur = conn.cursor()
        cur.execute(sql)
    except Exception as err:
        print(f"Issue with creating db. {err}")
        sys.exit(2)


def insert(conn, sql, dataset):
    try:
        cur = conn.cursor()
        cur.executemany(sql, dataset)
        conn.commit()
    except Exception as err:
        print(f"Issue with inserting data to db. {err}")
        sys.exit(3)


def insert_groups(conn, groups):
    sql_groups = "INSERT INTO groups (name) VALUES (%s)"
    insert(conn, sql_groups, groups)


def insert_students(conn, students):
    sql_students = "INSERT INTO students (name, group_id) VALUES (%s, %s)"
    insert(conn, sql_students, students)


def insert_lectors(conn, lectors):
    sql_lectors = "INSERT INTO lectors (name) VALUES (%s)"
    insert(conn, sql_lectors, lectors)


def insert_subjects(conn, subjects):
    sql_subjects = "INSERT INTO subjects (subject, lector_id) VALUES (%s, %s)"
    insert(conn, sql_subjects, subjects)


def insert_student_marks(conn, student_marks):
    sql_student_mark = """
    INSERT INTO student_marks (student_id, subject_id, lecture_date, mark)
    VALUES (%s, %s, %s, %s)
    """
    insert(conn, sql_student_mark, student_marks)
