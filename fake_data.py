import faker
import random


class FakeUniversityData(faker.Faker):
    def __init__(self,
                 locale,
                 numb_students,
                 numb_groups,
                 numb_subjects,
                 numb_lectors,
                 numb_marks):
        super().__init__(locale)
        self.numb_students = numb_students
        self.numb_groups = numb_groups
        self.numb_subjects = numb_subjects
        self.numb_lectors = numb_lectors
        self.numb_marks = numb_marks

    def fake_students(self) -> list:
        """
        Generates fake data for students
        :param n_students: number of students
        :return: tuple with lists of fake data
        """
        students = []
        for _ in range(self.numb_students):
            students.append(
                (self.name(), random.randint(1, self.numb_groups),)
            )
        return students

    def fake_subjects(self, numb_words=2) -> list:
        """
        Generates fake data for subjects
        :param n_subjects: number of subjects
        :return: tuple with lists of fake data
        """
        subjects = []
        for _ in range(self.numb_subjects):
            subjects.append(
                (
                    self.sentence(nb_words=numb_words),
                    random.randint(1, self.numb_lectors),
                )
            )
        return subjects

    def fake_lectors(self) -> list:
        """
        Generates fake data for lectors
        :param n_lectors: number of lectors
        :return: tuple with lists of fake data
        """
        lectors = []
        for _ in range(self.numb_lectors):
            lectors.append((self.name(),))
        return lectors

    def fake_groups(self) -> list:
        """
        Generates fake data for lectors
        :param n_groups: number of groups
        :return: tuple with lists of fake data
        """
        groups = []
        for _ in range(self.numb_groups):
            groups.append(
                (f"{self.word()}-{random.randint(10, 99)}",)
            )
        # for_groups = [(group,) for group in groups]
        return groups

    def fake_marks(self, min, max) -> list:
        student_marks = []
        for student_id in range(1, self.numb_students + 1):
            for subject_id in range(1, self.numb_subjects + 1):
                for _ in range(self.numb_marks):
                    rand_date = self.date()
                    student_marks.append(
                        (
                            student_id,
                            subject_id,
                            rand_date,
                            random.randint(min, max),
                        )
                    )
        return student_marks
