-- Q4 — Aggregation: total revenue per city, cities > 50000, DESC
use("RideHailingDB");
 
db.Trips.insertMany([
  { driverId: "D01", city: "Karachi",   fare: 30000, status: "Completed" },
  { driverId: "D02", city: "Karachi",   fare: 25000, status: "Completed" },
  { driverId: "D03", city: "Lahore",    fare: 18000, status: "Completed" },
  { driverId: "D04", city: "Lahore",    fare: 40000, status: "Completed" },
  { driverId: "D05", city: "Islamabad", fare: 12000, status: "Completed" },
  { driverId: "D06", city: "Islamabad", fare: 15000, status: "Completed" },
  { driverId: "D07", city: "Peshawar",  fare: 8000,  status: "Completed" }
]);
 
db.Trips.aggregate([
  {
    $group: {
      _id: "$city",
      totalRevenue: { $sum: "$fare" }
    }
  },
  {
    $match: {
      totalRevenue: { $gt: 50000 }
    }
  },
  {
    $sort: { totalRevenue: -1 }
  }
]);
 
