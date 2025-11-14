PRAGMA foreign_keys = ON;

-- Members
CREATE TABLE IF NOT EXISTS members (
  member_id   INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name  TEXT NOT NULL,
  last_name   TEXT NOT NULL,
  email       TEXT UNIQUE NOT NULL,
  phone       TEXT,
  joined_at   TEXT DEFAULT (datetime('now'))
);

-- Authors
CREATE TABLE IF NOT EXISTS authors (
  author_id   INTEGER PRIMARY KEY AUTOINCREMENT,
  name        TEXT NOT NULL
);

-- Books
CREATE TABLE IF NOT EXISTS books (
  book_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  title       TEXT NOT NULL,
  author_id   INTEGER NOT NULL,
  isbn        TEXT UNIQUE,
  pub_year    INTEGER,
  copies_total INTEGER NOT NULL DEFAULT 1,
  copies_available INTEGER NOT NULL DEFAULT 1,
  created_at  TEXT DEFAULT (datetime('now')),
  FOREIGN KEY(author_id) REFERENCES authors(author_id) ON DELETE RESTRICT
);

-- Loans
CREATE TABLE IF NOT EXISTS loans (
  loan_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id     INTEGER NOT NULL,
  member_id   INTEGER NOT NULL,
  loan_date   TEXT DEFAULT (datetime('now')),
  due_date    TEXT,
  return_date TEXT,
  status      TEXT NOT NULL CHECK (status IN ('OUT','RETURNED')),
  FOREIGN KEY(book_id) REFERENCES books(book_id) ON DELETE CASCADE,
  FOREIGN KEY(member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

-- Simple fines table (optional)
CREATE TABLE IF NOT EXISTS fines (
  fine_id     INTEGER PRIMARY KEY AUTOINCREMENT,
  loan_id     INTEGER NOT NULL,
  amount      REAL NOT NULL,
  paid        INTEGER DEFAULT 0, -- 0 = unpaid, 1 = paid
  FOREIGN KEY(loan_id) REFERENCES loans(loan_id) ON DELETE CASCADE
);
