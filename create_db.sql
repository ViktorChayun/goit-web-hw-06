DROP TABLE IF EXISTS student_marks CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS lectors CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS groups CASCADE;


CREATE TABLE groups(
    id SERIAL PRIMARY KEY,
    name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) not NULL,
    group_id INTEGER,
    CONSTRAINT fk_group
        FOREIGN KEY (group_id) REFERENCES groups (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE lectors(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE subjects(
    id SERIAL PRIMARY KEY,
    subject VARCHAR(255) NOT NULL,
    lector_id INTEGER,
    CONSTRAINT fk_lector
        FOREIGN KEY (lector_id) REFERENCES lectors (id)
            ON DELETE SET NULL
            ON UPDATE CASCADE
);


CREATE TABLE student_marks(
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    lecture_date DATE NOT NULL,
    mark INTEGER,
    CONSTRAINT fk_student
        FOREIGN KEY (student_id) REFERENCES students (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_subject
        FOREIGN KEY (subject_id) REFERENCES subjects (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);