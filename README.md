# Chinook ML Project

This project analyzes and models customer spending behavior using the Chinook music store database. It includes data exploration, preprocessing, feature engineering, and machine learning model evaluation with experiment tracking via MLflow.

## Project Structure
- `explore_data.ipynb`: Explore and visualize the Chinook data, perform basic cleaning, and understand key features.
- `preprocess.ipynb`: Prepare the data for modeling, engineer features, create the target variable, and save train/test splits.
- `evaluate.ipynb`: Train and evaluate multiple machine learning models, log results and artifacts to MLflow, and summarize model performance.
- `models/`: Stores trained models and feature names.
- `mlruns/`: MLflow experiment tracking artifacts.
- `requirements.txt`: List of required Python packages.

## Setup Instructions
1. **Clone the repository** and navigate to the project folder.
2. **Create a virtual environment** (recommended):
   ```bash
   python -m venv myenv
   source myenv/bin/activate  # On Windows: myenv\Scripts\activate
   ```
3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```
4. **Set up the Chinook database** (PostgreSQL):
   - Ensure you have a running PostgreSQL instance with the Chinook database loaded.
   - Update connection details in the notebooks if needed.

## Running the Notebooks
- Open each notebook in Jupyter or VSCode and run cells sequentially:
  1. `explore_data.ipynb` – Explore and visualize the data.
  2. `preprocess.ipynb` – Prepare and split the data for modeling.
  3. `evaluate.ipynb` – Train, evaluate, and track models with MLflow.

## MLflow Tracking
To launch the MLflow UI and explore experiment results:
```bash
mlflow ui --port 5000
```
Then visit [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser.

## Notes
- Update database connection strings in the notebooks as needed for your environment.
- All outputs (plots, models, metrics) are saved in the project directory for easy access.

---
