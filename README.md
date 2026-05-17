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

🚀 Step-by-Step Implementation
1. Data Transformation (SQL)
Aggregated transactional history to extract the three core RFM metrics per customer using optimized DuckDB SQL window functions:

Recency: Days since the customer's last order.

Frequency: Total number of unique orders placed.

Monetary Value: Total amount spent by the customer.

2. Machine Learning Validation (Python)
To eliminate manual threshold biases, a K-Means clustering algorithm was deployed in Python:

Handled extreme skewness using log-transformations and normalized data with StandardScaler.

Determined optimal clusters using the Elbow Method and Silhouette Analysis.

Appended the mathematical cluster_ml labels back to the dataset for visual validation.

3. Executive Dashboard Design (Tableau)
Created a modern, card-based interface focused on user interaction and corporate presentation guidelines.
