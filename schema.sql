CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    total_copies INT,
    available_copies INT
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100),
    department VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,

    FOREIGN KEY (student_id)
    REFERENCES students(student_id),

    FOREIGN KEY (book_id)
    REFERENCES books(book_id)
);

-- Insert Books Data

INSERT INTO books
(title, author, category, total_copies, available_copies)
VALUES
('Python Basics', 'Smith', 'Programming', 5, 5),
('SQL Mastery', ' tim David ', 'Database', 4, 4),
('Data Science 101', 'Sara ali Khan', 'AI', 3, 3);

-- Insert Students Data

INSERT INTO students
(student_name, department, email)
VALUES
('Rahul Sharma', 'Computer Science', 'rahul@gmail.com'),
('Priya Patel', 'IT', 'priya@gmail.com');

-- Insert Issued Books Data

INSERT INTO issued_books
(student_id, book_id, issue_date, return_date)
VALUES
(1, 1, '2026-05-15', NULL),
(2, 2, '2026-05-16', NULL);