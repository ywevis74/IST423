
-- DROP TABLES IF THEY EXIST
DROP TABLE IF EXISTS Sales, Stock, Staff, Locations, Books, Publishers, Cafes;

-- PUBLISHERS
CREATE TABLE Publishers (
    PublisherID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(255),
    Contact VARCHAR(50),
    Address TEXT
);

-- BOOKS
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(255),
    Type VARCHAR(50),
    Price NUMERIC(6,2),
    Language VARCHAR(50),
    FAuthor VARCHAR(100),
    LAuthor VARCHAR(100),
    PublisherID VARCHAR(10),
    Series VARCHAR(100),
    Barcode VARCHAR(20),
    Length INT,
    Genre VARCHAR(50),
    DoP DATE,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- LOCATIONS (STORES)
CREATE TABLE Locations (
    BranchID VARCHAR(10) PRIMARY KEY,
    Phone VARCHAR(50),
    OpHours VARCHAR(50),
    StaffHours INT,
    Zip VARCHAR(10),
    Street TEXT,
    Email VARCHAR(100),
    Social TEXT,
    City VARCHAR(100),
    Zone VARCHAR(50),
    Type VARCHAR(50)
);

-- STAFF
CREATE TABLE Staff (
    EmpID VARCHAR(10) PRIMARY KEY,
    FName VARCHAR(50),
    Midl VARCHAR(10),
    LName VARCHAR(50),
    Phone VARCHAR(50),
    Email VARCHAR(100),
    Street TEXT,
    City VARCHAR(100),
    Zip VARCHAR(10),
    HireDate DATE,
    Position VARCHAR(50),
    Wage NUMERIC(5,2),
    BranchID VARCHAR(10),
    FOREIGN KEY (BranchID) REFERENCES Locations(BranchID)
);

-- SALES
CREATE TABLE Sales (
    SaleID VARCHAR(10) PRIMARY KEY,
    Quantity INT,
    Date DATE,
    Price NUMERIC(6,2),
    ISBN VARCHAR(20),
    BranchID VARCHAR(10),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (BranchID) REFERENCES Locations(BranchID)
);

-- STOCK (INVENTORY)
CREATE TABLE Stock (
    ISBN VARCHAR(20),
    Branch_ID VARCHAR(10),
    Copies INT,
    PRIMARY KEY (ISBN, Branch_ID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (Branch_ID) REFERENCES Locations(BranchID)
);

-- CAFES
CREATE TABLE Cafes (
    CafeID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(255),
    Location TEXT,
    Hours VARCHAR(50)
);
