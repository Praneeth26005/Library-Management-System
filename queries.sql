PRAGMA foreign_keys = ON;
SELECT b.book_id, b.title, a.name AS author, b.pub_year, b.copies_available
FROM books b
JOIN authors a ON b.author_id = a.author_id
WHERE b.title LIKE '%' || :q || '%' OR a.name LIKE '%' || :q || '%'
ORDER BY b.title;
SELECT l.loan_id, m.first_name || ' ' || m.last_name AS member, b.title, l.loan_date, l.due_date
FROM loans l
JOIN members m ON l.member_id = m.member_id
JOIN books b ON l.book_id = b.book_id
WHERE l.status = 'OUT' AND date(l.due_date) < date('now')
ORDER BY l.due_date;

-- 5) Member loan history
SELECT l.loan_id, b.title, l.loan_date, l.due_date, l.return_date, l.status
FROM loans l
JOIN books b ON l.book_id = b.book_id
WHERE l.member_id = :member_id
ORDER BY l.loan_date DESC;
