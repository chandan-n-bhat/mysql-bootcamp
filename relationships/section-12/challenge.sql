# Joins Challenge
USE customers_orders;

-- Create Schema
DROP TABLE IF EXISTS papers;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
    id    INT    PRIMARY KEY    AUTO_INCREMENT,
    first_name    VARCHAR(20)    UNIQUE    NOT NULL
);

CREATE TABLE papers(
    title    VARCHAR(50)    PRIMARY KEY,
    grade    INT,
    student_id    INT,
    FOREIGN KEY(student_id) REFERENCES students(id) ON DELETE CASCADE
);

-- Populating the tables

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- Challenges
# Print This
# +------------+---------------------------------------+-------+
# | first_name | title                                 | grade |
# +------------+---------------------------------------+-------+
# | Samantha   | De Montaigne and The Art of The Essay |    98 |
# | Samantha   | Russian Lit Through The Ages          |    94 |
# | Carlos     | Borges and Magical Realism            |    89 |
# | Caleb      | My Second Book Report                 |    75 |
# | Caleb      | My First Book Report                  |    60 |
# +------------+---------------------------------------+-------+
SELECT
    first_name AS 'Name',
    title AS 'Title',
    grade AS 'Grade'
FROM students JOIN papers ON students.id = papers.student_id
ORDER BY grade DESC;

-- Print This

# +------------+---------------------------------------+-------+
# | first_name | title                                 | grade |
# +------------+---------------------------------------+-------+
# | Caleb      | My First Book Report                  |    60 |
# | Caleb      | My Second Book Report                 |    75 |
# | Samantha   | Russian Lit Through The Ages          |    94 |
# | Samantha   | De Montaigne and The Art of The Essay |    98 |
# | Raj        | NULL                                  |  NULL |
# | Carlos     | Borges and Magical Realism            |    89 |
# | Lisa       | NULL                                  |  NULL |
# +------------+---------------------------------------+-------+

SELECT
    first_name AS Name,
    title AS Title,
    grade AS Grade
FROM students LEFT JOIN papers ON students.id=papers.student_id;

-- Print This

# +------------+---------------------------------------+-------+
# | first_name | title                                 | grade |
# +------------+---------------------------------------+-------+
# | Caleb      | My First Book Report                  | 60    |
# | Caleb      | My Second Book Report                 | 75    |
# | Samantha   | Russian Lit Through The Ages          | 94    |
# | Samantha   | De Montaigne and The Art of The Essay | 98    |
# | Raj        | MISSING                               | 0     |
# | Carlos     | Borges and Magical Realism            | 89    |
# | Lisa       | MISSING                               | 0     |
# +------------+---------------------------------------+-------+

SELECT
    first_name AS Name,
    IFNULL(title,'Missing') AS Title,
    IFNULL(grade,0) AS Grade
FROM students LEFT JOIN papers ON students.id=papers.student_id;

-- Print This

# +------------+---------+
# | first_name | average |
# +------------+---------+
# | Samantha   | 96.0000 |
# | Carlos     | 89.0000 |
# | Caleb      | 67.5000 |
# | Raj        | 0       |
# | Lisa       | 0       |
# +------------+---------+

SELECT
    first_name AS Name,
    IFNULL(AVG(grade),0) AS Average
FROM students LEFT JOIN papers ON id=student_id
GROUP BY id
ORDER BY Average DESC;

-- Print This: Passing Threshold >= 75 average

# +------------+---------+----------------+
# | first_name | average | passing_status |
# +------------+---------+----------------+
# | Samantha   | 96.0000 | PASSING        |
# | Carlos     | 89.0000 | PASSING        |
# | Caleb      | 67.5000 | FAILING        |
# | Raj        | 0       | FAILING        |
# | Lisa       | 0       | FAILING        |
# +------------+---------+----------------+

SELECT
    first_name AS Name,
    IFNULL(AVG(grade),0) AS Average,
    CASE
        WHEN AVG(grade) >= 75 THEN 'Passing'
        ELSE 'Failing'
    END AS 'Status'
FROM students LEFT JOIN papers ON students.id = papers.student_id
GROUP BY students.id
ORDER BY AVG(grade) DESC;
    