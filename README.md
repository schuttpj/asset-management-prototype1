# Wind Turbine Health-Score Engine

A machine learning system for predicting wind turbine component failures using SCADA sensor data, specifically targeting gearbox and transformer failures for dynamic Forced Outage Rate (FOR) calculation in capacity planning.

## 🎯 Project Overview

This project develops a Health-Score Engine that analyzes historical sensor data from the Fuhrländer dataset to create normality models for detecting anomalies indicating impending failures. The primary goal is to demonstrate how predictive maintenance can inform dynamic FOR calculations, moving beyond static availability assumptions in grid planning models.

### Key Objectives
- **Primary Goal**: Predict WT84 gearbox failure with ≥7-day advance warning
- **Secondary Goal**: Develop transformer health monitoring capabilities
- **Research Goal**: Generate results suitable for CIGRE paper publication and DNV Joint Industry Project

## 📊 Dataset

**Fuhrländer FL2500 2.5MW Wind Turbine Dataset**
- **Turbines**: 5 wind turbines (WT80, WT81, WT82, WT83, WT84)
- **Variables**: 312 sensor variables per turbine
- **Frequency**: 5-minute intervals
- **Period**: 2012-2014 (3 years)
- **Known Failure**: WT84 gearbox failure for validation

## 🔧 Technology Stack

### Core ML Libraries
- **scikit-learn (≥1.3)** - Enhanced IsolationForest with parallel processing
- **PyOD (≥2.0.5)** - 45+ anomaly detection algorithms including ECOD
- **pandas (≥2.0)** - Data manipulation and analysis
- **numpy (≥1.24)** - Numerical computing

### Visualization & Dashboards
- **Plotly (≥5.17)** - Interactive time series visualization
- **Plotly-Resampler (≥0.9)** - High-performance large dataset visualization
- **Seaborn (≥0.12)** - Statistical visualization
- **Streamlit (≥1.28)** - Dashboard development

## 🚀 Quick Start

### 1. Environment Setup
```bash
# Clone the repository
git clone https://github.com/schuttpj/asset-management-prototype1.git
cd asset-management-prototype1

# Create and activate virtual environment
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt
```

### 2. Quick Environment Check
```bash
# Use the convenience script
./activate.sh

# Or manually verify installation
python -c "import pandas, numpy, sklearn, plotly, seaborn; print('All libraries installed successfully!')"
```

### 3. Data Exploration
```bash
# Start Jupyter Lab for interactive analysis
jupyter lab

# Open the data exploration notebook
# notebooks/01_data_exploration.ipynb
```

## 📋 Implementation Plan

The project follows a structured task-based approach with incremental testing and validation:

### Phase 1: Data Foundation (Tasks 1.1-1.7)
- Data loading and preprocessing pipeline
- Configuration management and error handling
- Data integrity validation across all turbines

### Phase 2: Sensor Intelligence (Tasks 2.1-2.5)
- Gearbox and transformer sensor identification
- Statistical correlation analysis
- Feature engineering and normalization

### Phase 3: ML Engine Development (Tasks 3.1-3.7)
- IsolationForest and ECOD anomaly detectors
- Time-series cross-validation
- Performance benchmarking and integration testing

### Phase 4: Health Scoring (Tasks 4.1-4.6)
- Multi-horizon prediction (24h, 3-day, 7-day)
- WT84 failure validation
- Model persistence and ensemble methods

### Phase 5: Visualization (Tasks 5.1-5.5)
- Interactive time series plots
- Performance dashboards
- Streamlit health monitoring interface

## 🎯 Success Metrics

### Primary Success Criteria
- **Failure Detection**: ≥7-day advance warning for WT84 gearbox failure
- **False Positive Rate**: <5% on healthy turbine data (WT80-83)
- **Model Performance**: F1-score >0.8 for failure detection

### Secondary Success Criteria
- **Multi-Horizon Accuracy**: Meaningful probability scores for 24h, 3-day, 7-day horizons
- **Sensor Efficiency**: Identify minimum viable sensor set (<20 sensors vs. 312 total)
- **Paper Comparison**: Results that match or improve upon existing research

## 📁 Project Structure

```
asset-management-prototype1/
├── src/                           # Source code
│   ├── data/                      # Data loading and preprocessing
│   ├── models/                    # ML models and algorithms
│   ├── validation/                # Model validation logic
│   ├── visualization/             # Plotting and dashboard code
│   └── utils/                     # Utilities and configuration
├── tests/                         # Test suite
│   ├── integration/               # Integration tests
│   └── performance/               # Performance benchmarks
├── notebooks/                     # Jupyter notebooks for analysis
├── tasks/                         # Project documentation
│   ├── prd-health-score-engine.md # Product Requirements Document
│   └── tasks-prd-health-score-engine.md # Detailed task list
├── fuhrlander/                    # Fuhrländer dataset
├── requirements.txt               # Python dependencies
├── setup.md                       # Setup instructions
└── README.md                      # This file
```

## 🧪 Testing Strategy

Every component includes comprehensive testing:
- **Unit Tests**: `pytest src/[module]/[file]_test.py -v`
- **Integration Tests**: `pytest tests/integration/ -v`
- **Performance Tests**: `pytest tests/performance/ -v`
- **Visual Validation**: Interactive Jupyter notebooks

## 📈 Visualization Features

### Interactive Time Series
- Health scores over time with failure markers
- Multi-horizon prediction confidence bands
- Sensor-specific anomaly highlighting
- Zoom/pan capabilities for detailed analysis

### Anomaly Detection Plots
- Normal vs. anomalous data points (color-coded)
- 3D visualization for multi-sensor correlation
- Real-time threshold adjustment

### Performance Dashboards
- ROC curves with adjustable thresholds
- Precision-recall curves for different time horizons
- Confusion matrices with drill-down capabilities

## 🔬 Research Applications

This project supports:
- **CIGRE Paper Development**: Publication-ready results and methodology
- **DNV Joint Industry Project**: Technical validation of health-aware capacity planning
- **Grid Planning Innovation**: Dynamic FOR calculation for improved reserve optimization

## 🤝 Contributing

This project follows a structured development approach:
1. **One task at a time**: Complete each sub-task with full testing before proceeding
2. **Validation required**: No task is complete until tests pass and validation confirms expected behavior
3. **Documentation**: Update task list and relevant files as work progresses

## 📄 License

This project is part of research into wind turbine health monitoring and capacity planning optimization.

## 🔗 References

- Fuhrländer Dataset: Wind turbine SCADA data for failure prediction research
- Paper.md: Detailed research methodology and validation approach
- PRD: Complete product requirements and technical specifications

---

**Status**: Initial setup complete, ready for Task 1.1 implementation
**Next Step**: Begin with data foundation and validation tasks
