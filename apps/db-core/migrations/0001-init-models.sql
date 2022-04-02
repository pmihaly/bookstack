-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Book" (
    "bookId" UUID   NOT NULL,
    "title" varchar   NOT NULL,
    "yearOfPublish" int   NOT NULL,
    "description" varchar   NULL,
    "isbn" varchar   NOT NULL,
    "coverUrl" varchar   NULL,
    "authorId" UUID   NOT NULL,
    CONSTRAINT "pk_Book" PRIMARY KEY (
        "bookId"
     )
);

CREATE TABLE "Author" (
    "authorId" UUID   NOT NULL,
    "namePrefix" varchar   NULL,
    "familyName" varchar   NOT NULL,
    "surName" varchar   NOT NULL,
    "middleName" varchar   NULL,
    "openLibraryId" varchar   NULL,
    CONSTRAINT "pk_Author" PRIMARY KEY (
        "authorId"
     )
);

CREATE TABLE "Reader" (
    "readerId" UUID   NOT NULL,
    "namePrefix" varchar   NULL,
    "familyName" varchar   NOT NULL,
    "surName" varchar   NOT NULL,
    "middleName" varchar   NULL,
    "address1" varchar   NOT NULL,
    "address2" varchar   NULL,
    "address3" varchar   NULL,
    "emailAddress" varchar   NOT NULL,
    "phoneNumber" varchar   NOT NULL,
    CONSTRAINT "pk_Reader" PRIMARY KEY (
        "readerId"
     )
);

CREATE TABLE "Lending" (
    "lendingId" UUID   NOT NULL,
    "readerId" UUID   NOT NULL,
    "bookdId" UUID   NOT NULL,
    "deadline" Datetime   NOT NULL,
    CONSTRAINT "pk_Lending" PRIMARY KEY (
        "lendingId"
     )
);

ALTER TABLE "Book" ADD CONSTRAINT "fk_Book_authorId" FOREIGN KEY("authorId")
REFERENCES "Author" ("authorId");

ALTER TABLE "Lending" ADD CONSTRAINT "fk_Lending_readerId" FOREIGN KEY("readerId")
REFERENCES "Reader" ("readerId");

ALTER TABLE "Lending" ADD CONSTRAINT "fk_Lending_bookdId" FOREIGN KEY("bookdId")
REFERENCES "Book" ("bookId");

CREATE INDEX "idx_Reader_emailAddress"
ON "Reader" ("emailAddress");

