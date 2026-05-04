 --Q1(a) — Create LibraryDB, Books collection & Insert 3 docs
use("LibraryDB");
 
db.Books.insertMany([
  {
    title: "The Pragmatic Programmer",
    author: "Andrew Hunt",
    year: 2019
  },
  {
    title: "Clean Code",
    author: "Robert C. Martin",
    year: 2008
  },
  {
    title: "Designing Data-Intensive Applications",
    author: "Martin Kleppmann",
    year: 2017
  }
]);

-- Q1(b) — Find all documents
db.Books.find();
 
-- Q1(b) — Find books published after 2015

db.Books.find({ year: { $gt: 2015 } });
 

