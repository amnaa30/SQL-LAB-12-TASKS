-- Q2(A) — Users where age > 25 AND subscriptionType = "Premium"
use("StartupDB");
 
db.Users.insertMany([
  { name: "Ali Hassan",    age: 28, city: "Karachi",  subscriptionType: "Premium" },
  { name: "Sara Khan",     age: 22, city: "Lahore",   subscriptionType: "Free" },
  { name: "Usman Malik",   age: 31, city: "Islamabad",subscriptionType: "Premium" },
  { name: "Ayesha Tariq",  age: 25, city: "Karachi",  subscriptionType: "Premium" },
  { name: "Bilal Ahmed",   age: 19, city: "Quetta",   subscriptionType: "Free" }
]);
 
db.Users.find({
  age: { $gt: 25 },
  subscriptionType: "Premium"
});
 
-- Q2(B) — Orders where totalAmount > 5000 OR status = "Pending"
 
use("EcommerceDB");
 
db.Orders.insertMany([
  { orderId: 101, customerName: "Hamza Raza",   totalAmount: 7500,  status: "Delivered" },
  { orderId: 102, customerName: "Nida Sheikh",  totalAmount: 2000,  status: "Pending" },
  { orderId: 103, customerName: "Zara Iqbal",   totalAmount: 12000, status: "Shipped" },
  { orderId: 104, customerName: "Omar Farooq",  totalAmount: 800,   status: "Cancelled" },
  { orderId: 105, customerName: "Hira Baig",    totalAmount: 3000,  status: "Pending" }
]);
 
db.Orders.find({
  $or: [
    { totalAmount: { $gt: 5000 } },
    { status: "Pending" }
  ]
});

*/
 
