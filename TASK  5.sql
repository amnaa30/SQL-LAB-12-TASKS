-- Q5 — Online Store: find, update, group, text search

use("OnlineStoreDB");
 
db.Products.insertMany([
  { productName: "Samsung Galaxy Buds",  category: "Electronics", price: 800,  stock: 20, reviews: ["Good", "Worth it"] },
  { productName: "Nike Running Shoes",   category: "Footwear",    price: 5500, stock: 15, reviews: ["Comfy"] },
  { productName: "USB-C Charging Cable", category: "Electronics", price: 350,  stock: 50, reviews: ["Durable", "Fast charging"] },
  { productName: "Yoga Mat",             category: "Sports",      price: 700,  stock: 30, reviews: ["Great grip"] },
  { productName: "Laptop Stand",         category: "Electronics", price: 950,  stock: 8,  reviews: ["Sturdy", "Nice build"] },
  { productName: "Leather Wallet",       category: "Accessories", price: 600,  stock: 0,  reviews: [] },
  { productName: "Wireless Mouse",       category: "Electronics", price: 1200, stock: 12, reviews: ["Smooth"] }
]);
 
-- 1. Find products where price < 1000 AND stock > 0
db.Products.find({
  price: { $lt: 1000 },
  stock: { $gt: 0 }
});

-- 2. Update stock: decrease by 5 for category "Electronics"
db.Products.updateMany(
  { category: "Electronics" },
  { $inc: { stock: -5 } }
);

-- 3. Group by category and count products
db.Products.aggregate([
  {
    $group: {
      _id: "$category",
      totalProducts: { $sum: 1 }
    }
  }
]);
 
--4. Text search on productName
--  First create a text index on productName
db.Products.createIndex({ productName: "text" });
 
--Search for "cable"
db.Products.find({ $text: { $search: "cable" } });
 
--Search for "wireless"
db.Products.find({ $text: { $search: "wireless" } });
 
