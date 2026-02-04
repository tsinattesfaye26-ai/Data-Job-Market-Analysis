#🛒 Consumer Behavior Analysis (100k Rows)
This project is a comprehensive SQL-based data analysis exploring a dataset of 100,000 consumer transactions. The analysis focuses on understanding customer demographics, purchasing patterns, and the effectiveness of loyalty programs to drive revenue growth.

#🛠️ Data Cleaning & Quality Assurance
To ensure the integrity of the 100,000 records, I implemented the following SQL "data hygiene" steps:

Deduplication: Identified and removed duplicate transaction records.

Standardization: Cleaned text fields for Category, Location, and Gender to ensure consistent grouping.

Outlier Detection: Filtered for logical errors (e.g., impossible ages or negative purchase amounts).

Null Handling: Verified key columns like Purchase_Amount_USD contained no missing values.

#❓ Business Questions Answered
I used complex SQL queries (including Window Functions and Case Logic) to solve 15 critical business questions, categorized into:

## 1. Demographics & Geography
Age Distribution: Identified which age groups drive the highest total revenue.
Regional Performance: Mapped out high-value geographic locations and identified hubs of frequent shoppers.
## 2. Product & Seasonal Trends
Inventory Insights: Determined top-selling products by volume and revenue-generating categories.
Seasonal Impact: Analyzed how shopping behavior shifts between Summer, Winter, Spring, and Fall.
Preference Matrix: Discovered the most popular color and size combinations for specific product lines.

## 3. Loyalty & Marketing Effectiveness
Subscription Value: Compared the spending habits and purchase frequency of subscribed vs. non-subscribed customers.
Promo Analysis: Evaluated the ROI of discounts and promo codes on total basket size.
Predictive Modeling: Built a "Repeat Purchase Likelihood" score based on historical frequency and spend.
## 4. Customer Satisfaction
Rating Correlation: Analyzed how Review_Rating impacts customer lifetime value and repeat purchase rates.
