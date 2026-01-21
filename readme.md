# Employee Promotion Analytics & Prediction  
**End-to-End Analytics Project | Tableau | SQL | Python**

---

## Project Overview
This project analyses employee promotion data using **Tableau, SQL, and Python** to understand promotion patterns and build a **promotion likelihood prediction model**.

The project is designed as a **decision-support analytics solution**, not an automated promotion system.

---

## Objectives
- Analyse promotion trends across employees  
- Explore factors influencing promotion decisions  
- Perform structured business analysis using SQL  
- Conduct exploratory data analysis and machine learning modeling in Python  
- Present insights through an interactive dashboard  

---

## Tools & Technologies
- **Tableau** – Dashboarding and KPI visualization  
- **SQL Server** – Business logic and analytical queries  
- **Python** – Data analysis and machine learning  
  - pandas, numpy  
  - scikit-learn  
  - XGBoost  
- **Jupyter Notebook**

---

## Analytical Components

### Dashboard (Tableau)
- High-level KPIs and promotion trends  
- Interactive slicers for segmentation  
- Visual exploration of promotion patterns

### Dashboard insights
- Demand and revenue increase steadily over time.
- Growth is mainly driven by order volume, not high prices.
- Most orders are placed on weekdays and delivered on time.
- Revenue is concentrated in a few key product categories.

### SQL Analysis
- Business-driven analytical queries  
- Promotion efficiency and policy evaluation  
- Controlled analysis across departments, performance, and experience

### SQL Insights
- Promotion rate is low (8–9%), showing a highly selective promotion process.
- Higher training levels do not increase promotion probability.
- Award winners have a much higher promotion rate than non-award employees.
- 1,306 high-performing employees were not promoted, indicating retention risk.
- Some departments promote <10% of high performers, showing structural constraints.
- Performance-controlled analysis shows no gender bias in promotions.

### Python & Machine Learning
- Data validation and exploratory analysis  
- Feature behaviour analysis  
- Binary classification framing for promotion likelihood  
- XGBoost model used for prediction as decision support

### Python Insights
- Promotions are rare (9%), so competition is high.
- Strong performance matters most , high ratings and awards outweigh years of service.
- Training scores alone aren’t enough to secure a promotion.
- Promotion decisions consider multiple factors, combining performance, recognition, and managerial judgment.

---

## Dashboard Preview
Download twbx: https://drive.google.com/file/d/1oPodSmN7U2CuoMO1ullIIqy2sLRGGU8v/view?usp=sharing

Screenshot: https://drive.google.com/file/d/1KzHVRGz1_d3URH5g6fp3PUh1y1069QcV/view?usp=sharing

---

## Machine Learning Scope
- **Problem Type:** Binary Classification  
- **Target Variable:** `is_promoted`  
- **Model:** XGBoost  
- **Purpose:** Promotion likelihood estimation  

>  Model outputs are intended to **support human decision-making**, not automate promotion decisions.


---

## How to Run 
1. Clone the repository  
2. Execute SQL scripts in SQL Server  
3. Run the Python notebook for EDA and modelling  
4. Open the tableau file for dashboard exploration  

---

## Notes
- This project emphasizes **analysis, validation, and decision support**  
- Business insights are communicated through dashboards and SQL outputs  
- The README focuses on **structure and scope**, not final decisions  

---

## Author
**Nandana V Shamjith**  
Aspiring Data Analyst / Business Analyst





