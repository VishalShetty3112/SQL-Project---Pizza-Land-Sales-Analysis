# SQL-Project---Pizza-Land-Sales-Analysis

Pizza Land is a multinational chain of pizza restaurants and delivery outlets known for its extensive menu of pizzas. Here we are analyzing the given data set on different parameters to find valuable information.</br>
The objective of the Project is to analyze pizza sales data using SQL in order to uncover meaningful business insights such as top-selling products, peak sales hours, revenue trends, and customer ordering behavior with the goal of supporting data-driven decision-making for sales growth and operational efficiency

This data set contains 4 tables.
</br>
1.	Orders:</br>
•	Order_id: It contains the total orders placed at pizza land.</br>
•	Date: It contains the date on which pizza is ordered.</br>
•	Time: It contains timestamp when pizza order is placed.</br>

3.	Order details:</br>
•	Order_details_id: It contains the id for each pizza that is ordered.</br>
•	Order_id: It contains the total orders placed at pizza land.</br>
•	Pizza_id: It contains pizza id with size that is orderd.</br>
•	Quantity: It contains total count for that particular pizza that is ordered.</br>

4.	Pizzas:
•	Pizza_id: It contains pizza id with size for all the available pizzas.</br>
•	Pizza_type_id: It contains pizza id for all the available pizzas at pizza land.</br>
•	Size: It contains size of all the pizzas available at pizza land.</br>
•	Price: It contains price for each pizza depending upon its size.</br>

5.	Pizza_types:</br>
•	Pizza_type_id: It contains pizza id for all the available pizzas at pizza land.</br>
•	Name: It contains detail name of the pizzas available at pizza land.</br>
•	Category: It contains category for each pizza.</br></br>

🚩  Problem Statements 

Total Revenue Generated

Average Order Value

Total Pizzas Sold

Top 5 Best-Selling Pizzas

Sales by Pizza Category

Revenue by Pizza Size

Peak Order Days and Hours

Monthly Revenue Trend

Cumulative Monthly Revenue

Contribution of Each Pizza to Total Revenue (%)

Top 3 Pizzas per Category by Quantity Sold

</br>
🖥️  Tools Used </br>
SQL ( MySQL Workbench)

</br></br>
 🍕 Key Insights</br></br>
The Barbecue Chicken Pizza was the top-selling pizza.

Fridays and Saturdays recorded the highest number of orders.

Large-sized pizzas contributed the most to revenue.

There is a noticeable increase in revenue during weekends and dinner hours.

</br>
  📁 Folder Structure
  
├── SQL_Queries/

│ ├── pizza_sales_analysis.sql

├── README.md

├── Dataset/

│ ├── orders.csv

│ ├── order_details.csv

│ ├── pizzas.csv

│ ├── pizza_types.csv
 

</br>
📈 Future Enhancements


Create interactive dashboards using Power BI or Tableau

Perform predictive sales modeling

Add customer feedback data (NPS, reviews) for sentiment analysis
