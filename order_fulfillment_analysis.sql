/*===========================================================
   ORDER FULFILLMENT ANALYSIS – SQL SCRIPT
   Author: Sean
   Description:
     SQL queries used to analyze order performance such as:
     - Orders by region
     - Revenue by product
     - On-time vs. late shipments
     - Delivery speed
===========================================================*/



/*===========================================================
   1. TOTAL ORDERS BY REGION
   Purpose:
      Identify demand distribution across regions to see
      where the company sells the most products.
===========================================================*/
SELECT 
    Region, 
    COUNT(*) AS Orders
FROM Orders
GROUP BY Region
ORDER BY Orders DESC;



/*===========================================================
   2. REVENUE BY PRODUCT
   Purpose:
      Determine which products generate the most revenue.
===========================================================*/
SELECT 
    Product,
    SUM(Revenue) AS TotalRevenue
FROM Orders
GROUP BY Product
ORDER BY TotalRevenue DESC;



/*===========================================================
   3. ON-TIME VS LATE SHIPMENTS
   Purpose:
      Measure delivery performance and overall reliability.
===========================================================*/
SELECT 
    OnTime,
    COUNT(*) AS Count
FROM Orders
WHERE Status = 'Shipped'
GROUP BY OnTime
ORDER BY Count DESC;



/*===========================================================
   4. AVERAGE DELIVERY TIME BY PRODUCT
   Purpose:
      Identify products responsible for slowdowns and delays.
===========================================================*/
SELECT 
    Product,
    AVG(TotalDays) AS AvgDeliveryTime
FROM Orders
WHERE Status = 'Shipped'
GROUP BY Product
ORDER BY AvgDeliveryTime DESC
LIMIT 5;
