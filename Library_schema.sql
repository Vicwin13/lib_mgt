-- Create database (optional)
CREATE DATABASE IF NOT EXISTS library_db;
USE library_db;  

CREATE TABLE LibraryUsers(
    userId int primary key,
    name varchar(100) not null,
    email varchar(100) not null unique

);


create table authors (
    authorId int primary key auto_increment,
    name varchar(100) not null,
    email varchar(100) not null unique
);

create table books(

    bookId int primary key auto_increment,
    title varchar(100) not null,
    isbn varchar(13)not null unique

);

-- Table for (many to many)
create table book_authors (
bookId int,
authorId int,
primary key (bookId, authorId),
foreign key (bookId) references books(bookId),
foreign key (authorId) references authors(authorId)
);

-- Table for (one-to-many)

create table loans(
    loanId int primary key auto_increment,
    userId int not null,
    bookId int not null,
    loanDate date not null,
    foreign key (userId) references LibraryUsers(userId),
    foreign key (bookId) references books(bookId)
);


-- table for (one to one)

create table returnTable(
returnId int primary key auto_increment,
loanId int not null,
returnDate date not null,
foreign key (loanId) references loans(loanId)
);