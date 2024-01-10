-- i. Insert a new record for the Book table
INSERT INTO Books (Title, Author, Price, Availability, ISBN, Publisher_ID) 
VALUES ('Sample Book Title', 'Sample Author', 25.00, TRUE, '1234567890123', 1);

-- ii. Increase the price of the Book by 20% (for the above-inserted item)
UPDATE Books 
SET Price = Price * 1.20 
WHERE ISBN = '1234567890123';

-- iii. List the Title of all books that cost $20 or more
SELECT Title 
FROM Books 
WHERE Price >= 20.00;

-- iv. Display the names of all members who have a membership joining date in the last week
-- (Replace '2024-01-03' and '2024-01-10' with the actual dates you want to query between)
SELECT Member_Name 
FROM Member 
WHERE Memb_Join_Date BETWEEN '2024-01-03' AND '2024-01-10';

-- v. List the author, Title, Publisher name where the Book ISBN matches '1292061189'
SELECT b.Author, b.Title, p.PublisherName 
FROM Books b 
JOIN Publisher p ON b.Publisher_ID = p.Publisher_ID 
WHERE b.ISBN = '1292061189';

-- vi. List the loaned Book Titles, Book Loaned/Issued Date, Book Due date, Book Return date and Member name where member_id = 2
SELECT bk.Title, bb.Issue_Loan_Date, bb.Due_Date, bb.Return_Date, m.Member_Name 
FROM Borrowed_By bb
JOIN Books bk ON bb.Book_ID = bk.Book_ID 
JOIN Member m ON bb.Memb_ID = m.Memb_ID 
WHERE bb.Memb_ID = 2;

