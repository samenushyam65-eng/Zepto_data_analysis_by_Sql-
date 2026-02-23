# Zepto_data_analysis_by_Sql-
SQL analysis of 3,700+ Zepto product listings — covers data cleaning, discount trends, revenue estimation &amp; inventory insights using MySQL.

# 🛒 Zepto SQL Data Analysis Project

A structured SQL project that explores and analyzes product data from **Zepto** — a quick-commerce grocery delivery platform. The project covers end-to-end data exploration, cleaning, and business-driven analysis using MySQL.

---

## 📁 Project Structure

```
├── zepto.csv        # Raw dataset with Zepto product listings
├── zepto.sql        # SQL script with exploration, cleaning & analysis queries
└── README.md        # Project documentation
```

---

## 📦 Dataset Overview

The dataset contains product-level data scraped from Zepto, with the following columns:

| Column | Description |
|---|---|
| `sku_id` | Auto-incremented unique product ID |
| `Category` | Product category (e.g., Fruits & Vegetables, Snacks) |
| `name` | Product name |
| `mrp` | Maximum Retail Price (in paise, converted to ₹) |
| `discountPercent` | Discount offered (%) |
| `discountedSellingPrice` | Final selling price after discount |
| `availableQuantity` | Stock available |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Whether the product is out of stock (True/False) |
| `quantity` | Quantity per unit |

---

## 🔧 Data Cleaning

Before analysis, the following cleaning steps were applied:

- Removed records where `mrp = 0` (invalid/placeholder entries)
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** (divided by 100)
- Checked for NULL values across all key columns

---

## 🔍 Exploratory Analysis

- Total product count
- Sample data inspection
- Distinct product categories
- Products appearing under multiple SKUs
- In-stock vs out-of-stock distribution

---

## 📊 Business Questions Answered

| # | Question |
|---|---|
| Q1 | Top 10 best-value products by discount percentage |
| Q2 | High MRP products (>₹300) that are out of stock |
| Q3 | Estimated revenue per category |
| Q4 | Premium products (MRP >₹500) with low discounts (<10%) |
| Q5 | Top 5 categories with highest average discount |
| Q6 | Price per gram for products above 100g (best value sort) |
| Q7 | Products grouped into weight categories: Low / Medium / Bulk |
| Q8 | Total inventory weight per category |

---

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **Language:** SQL
- **Dataset Format:** CSV

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/zepto-sql-project.git
   cd zepto-sql-project
   ```

2. Create the database and import data:
   ```sql
   CREATE DATABASE zepto_sql_project;
   USE zepto_sql_project;
   ```

3. Import the CSV into the `zepto` table using MySQL Workbench or:
   ```bash
   mysqlimport --local --fields-terminated-by=',' --lines-terminated-by='\n' \
     --ignore-lines=1 zepto_sql_project zepto.csv
   ```

4. Run the SQL script:
   ```bash
   mysql -u your_user -p zepto_sql_project < zepto.sql
   ```

---

## 📌 Key Insights

- Several high-MRP products remain out of stock, representing potential lost revenue opportunities.
- Certain categories consistently offer higher discounts, making them more competitive.
- Price-per-gram analysis surfaces products with the best value for weight-conscious shoppers.
- Bulk-weight products make up a significant share of total inventory weight.

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
