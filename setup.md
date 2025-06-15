# Wind Turbine Health-Score Engine Setup

## Virtual Environment Setup

### 1. Create and Activate Virtual Environment

```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment (macOS/Linux)
source venv/bin/activate

# Activate virtual environment (Windows)
# venv\Scripts\activate
```

### 2. Install Dependencies

```bash
# Upgrade pip first
pip install --upgrade pip

# Install all project dependencies
pip install -r requirements.txt
```

### 3. Verify Installation

```bash
# Check key libraries
python -c "import pandas, numpy, sklearn, plotly, seaborn; print('All core libraries installed successfully!')"
```

## Project Structure

```
asset-management-prototype1/
├── venv/                          # Virtual environment
├── fuhrlander/                    # Fuhrländer dataset
│   └── dataset/                   # Wind turbine data
├── tasks/                         # Project documentation
│   └── prd-health-score-engine.md # Product Requirements Document
├── requirements.txt               # Python dependencies
├── setup.md                       # This setup guide
└── README.md                      # Project overview
```

## Development Workflow

### Daily Development
```bash
# Always activate virtual environment first
source venv/bin/activate

# Start Jupyter for data exploration
jupyter lab

# Or run Python scripts
python your_script.py
```

### Deactivate Environment
```bash
# When done working
deactivate
```

## Key Libraries Installed

- **scikit-learn (≥1.3.0)** - Enhanced ML with faster IsolationForest
- **PyOD (≥2.0.5)** - 45+ anomaly detection algorithms
- **Plotly (≥5.17.0)** - Interactive time series visualization
- **Plotly-Resampler (≥0.9.0)** - High-performance large dataset visualization
- **Seaborn (≥0.12.0)** - Statistical visualization
- **Streamlit (≥1.28.0)** - Dashboard development

## Next Steps

1. **Data Exploration:** Start with `fuhrlander/dataset/` analysis
2. **Sensor Selection:** Identify key gearbox and transformer sensors
3. **Model Development:** Begin with Isolation Forest anomaly detection
4. **Visualization:** Create interactive plots with Plotly

## Troubleshooting

### Common Issues

**Import Errors:**
```bash
# Ensure virtual environment is activated
source venv/bin/activate
pip list  # Check installed packages
```

**Memory Issues with Large Dataset:**
```bash
# Use plotly-resampler for large time series
# Enable numba JIT compilation for performance
```

**Jupyter Kernel Issues:**
```bash
# Install kernel in virtual environment
python -m ipykernel install --user --name=venv --display-name="Wind Turbine ML"
``` 