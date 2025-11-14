PRAGMA foreign_keys = ON;
INSERT INTO authors (name) VALUES
  ('J. K. Rowling'),
  ('George Orwell'),
  ('Jane Austen'),
  ('Mark Twain');

-- Members
INSERT INTO members (first_name,last_name,email,phone) VALUES
  ('Akhil','Kumar','akhil@example.com','+91-9000000001'),
  ('Priya','Sharma','priya@example.com','+91-9000000002'),
  ('Ravi','Singh','ravi@example.com','+91-9000000003');

-- Books
INSERT INTO books (title, author_id, isbn, pub_year, copies_total, copies_available) VALUES
  ('Harry Potter and the Sorcerer''s Stone', 1, '9780747532699', 1997, 5, 5),
  ('1984', 2, '9780451524935', 1949, 4, 4),
  ('Pride and Prejudice', 3, '9780141199078', 1813, 3, 3),
  ('Adventures of Huckleberry Finn', 4, '9780486280615', 1884, 2, 2);
