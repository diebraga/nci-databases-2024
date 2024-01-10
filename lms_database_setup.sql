USE LMS;

-- Publisher Table Creation
CREATE TABLE IF NOT EXISTS Publisher (
    Publisher_ID INT PRIMARY KEY AUTO_INCREMENT,
    PublisherName VARCHAR(255) NOT NULL,
    PublisherAddress TEXT
);

-- Books Table Creation
CREATE TABLE IF NOT EXISTS Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2),
    Availability BOOLEAN,
    ISBN VARCHAR(13),
    Publisher_ID INT,
    FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

-- Member Table Creation
CREATE TABLE IF NOT EXISTS Member (
    Memb_ID INT PRIMARY KEY AUTO_INCREMENT,
    Member_Name VARCHAR(255) NOT NULL,
    Address TEXT,
    Memb_Type VARCHAR(50),
    Memb_Join_Date DATE
);

-- Borrowed By Table Creation
CREATE TABLE IF NOT EXISTS Borrowed_By (
    Book_ID INT,
    Memb_ID INT,
    Issue_Loan_Date DATE,
    Due_Date DATE,
    Return_Date DATE,
    PRIMARY KEY (Book_ID, Memb_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Memb_ID) REFERENCES Member(Memb_ID)
);

-- Inserting data into Publisher Table
INSERT INTO Publisher (PublisherName, PublisherAddress) VALUES 
('ABC Publishing', '123 Main St, Anytown, USA');

-- Inserting data into Books Table
INSERT INTO Books (Title, Author, Price, Availability, ISBN, Publisher_ID) VALUES 
('The Great Book', 'Jane Doe', 19.99, TRUE, '978-3-16-148410-0', 1);

-- Inserting data into Member Table
INSERT INTO Member (Member_Name, Address, Memb_Type, Memb_Join_Date) VALUES 
('John Smith', '456 Elm St, Othertown, USA', 'Student', '2023-01-08');

-- Inserting data into Borrowed_By Table
INSERT INTO Borrowed_By (Book_ID, Memb_ID, Issue_Loan_Date, Due_Date, Return_Date) VALUES 
(1, 1, '2024-01-01', '2024-01-15', NULL);

