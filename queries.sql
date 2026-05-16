-- Show all books

SELECT * FROM books;

-- Show all students

SELECT * FROM students;

-- Show issued books

SELECT * FROM issued_books;

-- Show available books

SELECT title, available_copies
FROM books
WHERE available_copies > 0;

-- Issue a new book

INSERT INTO issued_books
(student_id, book_id, issue_date, return_date)
VALUES
(1, 3, '2026-05-17', NULL);

-- Reduce available copies after issuing

UPDATE books
SET available_copies = available_copies - 1
WHERE book_id = 3;

-- Return a book

UPDATE issued_books
SET return_date = '2026-05-20'
WHERE issue_id = 1;

-- Increase available copies after return

UPDATE books
SET available_copies = available_copies + 1
WHERE book_id = 1;

-- JOIN Query
-- Show student names with issued books

SELECT
    students.student_name,
    books.title,
    issued_books.issue_date,
    issued_books.return_date
FROM issued_books
JOIN students
ON issued_books.student_id = students.student_id
JOIN books
ON issued_books.book_id = books.book_id;

-- Count total books

SELECT COUNT(*) AS total_books
FROM books;

-- Most borrowed books

SELECT
    books.title,
    COUNT(issued_books.book_id) AS times_borrowed
FROM issued_books
JOIN books
ON issued_books.book_id = books.book_id
GROUP BY books.title
ORDER BY times_borrowed DESC;