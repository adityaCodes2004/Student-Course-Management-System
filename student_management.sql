-- 1. Create tables
CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    department VARCHAR(50)
);


CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name VARCHAR(100),
    credits INTEGER
);

CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    semester VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 2. Insert sample data
INSERT INTO Students VALUES
(1, 'Aditya Shrivastava', 21, 'CSE'),
(2, 'Riya Verma', 20, 'ECE'),
(3, 'Karan Singh', 22, 'Mechanical');

INSERT INTO Courses VALUES
(101, 'DBMS', 4),
(102, 'Operating Systems', 3),
(103, 'Data Structures', 4);

INSERT INTO Enrollments VALUES
(1, 1, 101, 'Fall 2024'),
(2, 1, 103, 'Fall 2024'),
(3, 2, 102, 'Fall 2024'),
(4, 3, 101, 'Spring 2025');

-- 3. Update example
UPDATE Students
SET age = 22
WHERE student_id = 1;

-- 4. Delete example
DELETE FROM Enrollments
WHERE enrollment_id = 4;

-- 5. JOIN query
SELECT s.name, c.course_name, e.semester
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- 6. Aggregation query
SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

