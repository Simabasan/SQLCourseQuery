DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS fb;

CREATE TABLE fb (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);
CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES fb(dept_id)
);

INSERT INTO fb(dept_id, dept_name) VALUES
(1, 'Computer Science'),
(2, 'Electrical'),
(3, 'Mechanical'),
(4, 'Civil'),
(5, 'Electronics');
INSERT INTO courses(course_id, course_name, dept_id) VALUES
(101, 'DBMS', 1),
(102, 'Operating System', 1),
(111, 'Machine Learning', 1),
(103, 'Power System', 1),
(104, 'Digital Circuits', 2),
(105, 'Thermodynamics', 3),
(106, 'Fluid Mechanics', 3),
(107, 'Structural Engineering', 4),
(108, 'Surveying', 4),
(109, 'Embedded System', 5),
(110, 'VLSI Design', 5);

SELECT dept_name
FROM fb
WHERE dept_id IN (
    SELECT dept_id
    FROM courses
    GROUP BY dept_id
    HAVING COUNT(course_id) > 2
);
