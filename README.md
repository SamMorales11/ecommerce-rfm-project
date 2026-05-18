1. **Data Ingestion & Transformation (SQL/DuckDB):** Cleaned raw transactional data and computed RFM scores metrics globally per unique customer.
2. **Advanced Analytics & ML (Python/Pandas/Scikit-Learn):** Performed data preprocessing, log transformations, scale normalization, and executed **K-Means Clustering** to find data-driven customer personas.
3. **Business Intelligence (Tableau):** Designed a high-fidelity dashboard using card-based UI layouts, interactive filters, and executive KPI summaries.

---

## 🛠️ Tech Stack
* **Database & Warehouse:** DuckDB / SQL (Data modeling and transformation pipeline)
* **Programming Language:** Python 3.8+
* **Libraries:** Pandas, NumPy, Scikit-Learn (K-Means), Matplotlib, Seaborn
* **BI & Visualization:** Tableau Desktop / Tableau Public

---

## 📊 Repository Structure
```📂 project-root/
 ├── 📂 data/                 # Raw data files and local DuckDB databases
 ├── 📂 notebooks/            # Jupyter notebooks for K-Means Clustering & EDA
 ├── 📂 screenshots/          # Documentation images for README
 ├── 📄 rfm_final_export_ml.csv # Final curated dataset with ML cluster labels
 └── 📄 README.md             # Project documentation ##
```

## 🚀 Step-by-Step Implementation
1. Data Transformation (SQL)
Aggregated transactional history to extract the three core RFM metrics per customer using optimized DuckDB SQL window functions:

* **Recency**: Days since the customer's last order.

* **Frequency**: Total number of unique orders placed.

* **Monetary Value**: Total amount spent by the customer.

2. Machine Learning Validation (Python)
To eliminate manual threshold biases, a K-Means clustering algorithm was deployed in Python:

* Handled extreme skewness using log-transformations and normalized data with StandardScaler.

* Determined optimal clusters using the Elbow Method and Silhouette Analysis.

* Appended the mathematical cluster_ml labels back to the dataset for visual validation.

3. Executive Dashboard Design (Tableau)
* Created a modern, card-based interface focused on user interaction and corporate presentation guidelines.

## 🖼️ Dashboard Preview & Visual Insights
1. Executive Summary (BANs)
![Executive Summary Card]
<img width="760" height="205" alt="Screenshot 2026-05-15 085007" src="https://github.com/user-attachments/assets/5df9ac8a-f505-4f60-8ae4-bc1c12a940f9" />

* Insight: Displays instant high-level metrics including Total Unique Customers (93,358), Total Revenue (Rp15.4M), and Average Spending per User (Rp165.17).

2. Strategic Customer Distribution (Treemap)
![Customer Distribution Treemap]
<img width="947" height="247" alt="Screenshot 2026-05-15 084945" src="https://github.com/user-attachments/assets/5b8c2b23-825e-4329-84c4-4e49e4b6dd40" />

* Insight: Quickly highlights that At Risk and Hibernating customers occupy a significant volume of the base, identifying a critical retention risk for the company.

3. Efficiency & Value Matrix (Dual Axis)
![Revenue vs Volume Dual Axis]
<img width="1865" height="312" alt="Screenshot 2026-05-15 084912" src="https://github.com/user-attachments/assets/d775a41a-d134-4c36-a041-88f3c80c9a36" />

* Insight: Validates the efficiency of the Champions segment. While representing a smaller volume of customers (shorter bars), they generate disproportionately high revenue (higher line), confirming their status as core value drivers.

4. Mathematical Cluster Validation (Scatter Plot)
![K-Means Cluster Scatter Plot]
<img width="1857" height="281" alt="Screenshot 2026-05-15 084902" src="https://github.com/user-attachments/assets/beb96074-689d-49aa-9cf8-0ff392168b6f" />

* Insight: Showcases how the unsupervised machine learning model separates users in a 2D space based on Recency Days and Monetary Value, removing human classification bias.


## 🔧 How to Run the Project
Clone this repository to your local machine.

Ensure you have your DuckDB database set up inside the data/ directory.

Run the Jupyter Notebook in notebooks/ to execute the K-Means clustering model and generate rfm_final_export_ml.csv.

Open Tableau, connect to the final CSV file, and load the workspace sheets into your custom dashboard layout.

Enable "Use as Filter" on the Treemap viz to explore segment behavior dynamically.
