# Product Requirements Document: Health-Score Engine for Wind Turbine Failure Prediction

## Introduction/Overview

The Health-Score Engine is a machine learning system designed to predict wind turbine component failures using SCADA sensor data, specifically targeting gearbox and transformer failures. This system will analyze historical sensor data from the Fuhrländer dataset to develop normality models that can detect anomalies indicating impending failures. The primary goal is to demonstrate how predictive maintenance can inform dynamic Forced Outage Rates (FOR) for capacity planning purposes, moving beyond static availability assumptions in grid planning models.

**Problem Statement:** Current grid capacity planning treats wind turbines as either "perfectly available" or uses static forced outage rates, missing the opportunity to use real-time health indicators to improve planning accuracy and reduce unnecessary reserve capacity costs.

## Goals

1. **Primary Goal:** Successfully predict the known gearbox failure in wind turbine WT84 using the Fuhrländer dataset with at least 7-day advance warning
2. **Secondary Goal:** Develop transformer health monitoring capabilities using the same algorithmic approach
3. **Technical Goal:** Create a reusable Health-Score Engine that can be applied to other wind turbine datasets
4. **Research Goal:** Generate results suitable for CIGRE paper publication and DNV Joint Industry Project development
5. **Validation Goal:** Achieve <5% false positive rate while maintaining reliable failure detection

## User Stories

**As a Grid Operator:**
- I want to receive dynamic forced outage rate updates based on real-time turbine health so that I can optimize reserve capacity planning
- I want to understand the probability of turbine failures at 24-hour, 3-day, and 7-day horizons so that I can make informed dispatch decisions
- I want to reduce unnecessary reserve capacity costs by having more accurate availability forecasts

**As a Wind Farm Operator:**
- I want to validate that ML-based health monitoring can detect failures in advance so that I can plan maintenance more effectively
- I want to understand which sensor combinations are most predictive of failures so that I can optimize my monitoring strategy

**As a Researcher:**
- I want to demonstrate the technical feasibility of health-aware capacity planning so that I can build the case for industry adoption
- I want to generate publishable results that advance the state of the art in wind turbine predictive maintenance

## Functional Requirements

### Core ML Engine Requirements
1. **Data Processing:** The system must load and preprocess the Fuhrländer dataset (5 turbines, 312 variables, 5-minute intervals, 2012-2014)
2. **Sensor Selection:** The system must identify and extract the minimum viable sensor set for gearbox and transformer monitoring
3. **Normality Modeling:** The system must train normality models using data from healthy turbines (WT80, WT81, WT82, WT83)
4. **Anomaly Detection:** The system must detect anomalies in WT84 data that correlate with the known gearbox failure
5. **Multi-Horizon Prediction:** The system must provide failure probability scores for 24-hour, 3-day, and 7-day time horizons
6. **Model Validation:** The system must validate predictions against the known failure timeline in the paper.md documentation

### Gearbox Monitoring Requirements (Priority 1)
7. **Gearbox Sensor Integration:** The system must utilize key gearbox sensors including:
   - Oil temperature (`wtrm_avg_TrmTmp_GbxOil`)
   - Bearing temperatures (151, 152, 450, 451)
   - Rotor speed monitoring
8. **Gearbox Failure Detection:** The system must successfully identify the WT84 gearbox failure with at least 7-day advance warning
9. **Gearbox Model Performance:** The system must achieve <5% false positive rate on healthy turbine data

### Transformer Monitoring Requirements (Priority 2)
10. **Transformer Sensor Integration:** The system must utilize transformer-related sensors including:
    - Bearing temperatures (`wtrm_avg_TrmTmp_Brg1`, `wtrm_avg_TrmTmp_Brg2`)
    - Oil/cooling system monitoring
11. **Transformer Health Scoring:** The system must apply the same algorithmic approach to transformer monitoring
12. **Transformer Model Development:** The system must develop transformer health models despite lack of failure validation data

### Output Requirements
13. **Health Score Calculation:** The system must generate normalized health scores (0-100) for each monitored component
14. **Risk Probability Output:** The system must output failure probabilities for multiple time horizons
15. **Visualization:** The system must generate plots comparing predicted vs. actual failure timelines (similar to paper figures)
16. **Performance Metrics:** The system must calculate and report precision, recall, F1-score, and false positive rates

## Non-Goals (Out of Scope)

- **Real-time Integration:** No integration with live SCADA systems or real-time alerting
- **Antares Integration:** No direct integration with capacity planning software at this stage
- **Commercial Deployment:** No production-ready user interfaces or commercial features
- **Multi-Dataset Validation:** No validation on datasets other than Fuhrländer
- **Advanced ML Optimization:** Focus on working solution rather than optimal algorithm performance
- **Real-time Processing:** No requirements for low-latency or streaming data processing
- **User Authentication:** No user management or security features
- **Data Storage:** No persistent database or data management system

## Design Considerations

### Algorithm Selection
- **Primary Approach:** Isolation Forest for anomaly detection (handles high-dimensional data well)
- **Secondary Options:** One-Class SVM, Local Outlier Factor as comparison baselines
- **Validation Method:** Time-series cross-validation respecting temporal order

### Data Architecture
- **Input Format:** JSON files from Fuhrländer dataset
- **Processing Pipeline:** Python-based with pandas/numpy for data manipulation
- **Output Format:** CSV files with timestamps, health scores, and probability predictions

### Visualization Requirements

**Essential Time Series Visualizations:**
- **Health Score Timeline:** Interactive plots showing health scores over time with:
  - Failure event markers and annotations
  - Multi-horizon prediction confidence bands
  - Sensor-specific anomaly highlighting
  - Zoom/pan capabilities for detailed analysis

**Anomaly Detection Visualizations:**
- **Real-time Anomaly Plots:** Interactive scatter plots with:
  - Normal vs. anomalous data points color-coded
  - 3D visualization for multi-sensor correlation
  - Time-based animation showing anomaly progression
  - Threshold adjustment sliders

**Comparative Analysis Plots:**
- **Measured vs. Predicted:** Replicating paper figures with:
  - Side-by-side comparison of actual vs. predicted failure timelines
  - Confidence intervals and prediction accuracy metrics
  - Multi-turbine comparison views

**Performance Monitoring Dashboards:**
- **Model Performance:** Interactive dashboards featuring:
  - ROC curves with adjustable thresholds
  - Precision-recall curves for different time horizons
  - Confusion matrices with drill-down capabilities
  - False positive/negative analysis tools

**Statistical Analysis Visualizations:**
- **Sensor Correlation:** Heatmaps and pair plots showing:
  - Cross-sensor correlation matrices
  - Feature importance rankings
  - Distribution analysis for healthy vs. failing periods

## Technical Considerations

### Technology Stack & Dependencies

#### Core ML Libraries (Updated 2024)
- **Primary ML Framework:** scikit-learn (≥1.3) 
  - Enhanced IsolationForest with 2-4x faster prediction (parallel processing)
  - Improved TimeSeriesSplit for temporal validation
  - Support for missing values in RandomForest models
- **Specialized Anomaly Detection:** PyOD (≥2.0.5)
  - 45+ outlier detection algorithms in unified framework
  - ECOD (Empirical Cumulative Distribution) - state-of-the-art 2022 algorithm
  - Deep learning models with PyTorch backend
  - LLM-powered model selection capabilities

#### Data Processing & Analysis
- **Data Manipulation:** pandas (≥2.0), numpy (≥1.24)
- **Time Series:** pandas TimeSeriesSplit for proper temporal cross-validation
- **Performance:** joblib for parallelization, numba for JIT compilation
- **Data Processing:** JSON parsing capabilities for Fuhrländer format

#### Visualization & Reporting (Updated 2024)

**Primary Interactive Visualization Stack:**
- **Plotly (≥5.17)** - Interactive time series with advanced features:
  - Time series with range sliders and selectors for multi-horizon analysis
  - Real-time anomaly highlighting with custom markers and colors
  - 3D scatter plots for multi-sensor correlation analysis
  - Built-in peak detection visualization capabilities
  - Seamless integration with Dash for dashboards

**Specialized Time Series Visualization:**
- **Plotly-Resampler (≥0.9)** - High-performance time series visualization:
  - Handles large datasets (millions of points) efficiently
  - Automatic data resampling for smooth interaction
  - Perfect for 3-year SCADA data visualization

**Statistical & Publication-Quality Plots:**
- **Seaborn (≥0.12)** - Enhanced statistical visualization:
  - Advanced correlation heatmaps for sensor relationships
  - Distribution plots for failure pattern analysis
  - Pair plots for multi-sensor anomaly detection
  - Publication-ready statistical graphics

**Real-time Monitoring Dashboards:**
- **Streamlit (≥1.28)** - Rapid dashboard development:
  - Real-time health score monitoring
  - Interactive parameter tuning for ML models
  - Easy deployment for stakeholder access

**Foundation Plotting:**
- **Matplotlib (≥3.7)** - Publication-quality static plots
- **Model Persistence:** joblib for reliable model saving/loading

#### Recommended Algorithm Stack
1. **Primary:** IsolationForest (scikit-learn) - Fast, handles high-dimensional data
2. **Secondary:** ECOD (PyOD) - Latest probabilistic approach, excellent performance
3. **Baseline:** LocalOutlierFactor (scikit-learn) - For comparison and validation
4. **Ensemble:** Feature Bagging + Average combination for robustness

### Performance Constraints
- **Training Time:** Models should train within reasonable time on standard hardware
- **Memory Usage:** Must handle 3 years of 5-minute interval data for 5 turbines
- **Scalability:** Code structure should allow easy extension to additional turbines/sensors

### Validation Strategy
- **Historical Validation:** Use known WT84 failure as ground truth
- **Cross-Validation:** Validate on healthy turbines to measure false positive rates
- **Paper Comparison:** Results should align with findings in paper.md

## Success Metrics

### Primary Success Criteria
1. **Failure Detection:** Successfully identify WT84 gearbox failure with ≥7-day advance warning
2. **False Positive Rate:** Achieve <5% false positive rate on healthy turbine data
3. **Model Performance:** F1-score >0.8 for failure detection task

### Secondary Success Criteria
4. **Multi-Horizon Accuracy:** Provide meaningful probability scores for 24h, 3-day, 7-day horizons
5. **Sensor Efficiency:** Identify minimum viable sensor set (target <20 sensors vs. 312 total)
6. **Reproducibility:** Generate results that match or improve upon paper.md findings

### Research Success Criteria
7. **Publication Readiness:** Results suitable for CIGRE paper submission
8. **Industry Relevance:** Demonstrate clear value proposition for capacity planning applications
9. **Technical Validation:** Prove feasibility of health-aware FOR concept

## Open Questions

1. **Sensor Selection Methodology:** What systematic approach should be used to identify the minimum viable sensor set?
2. **Failure Definition:** How should we define the exact failure onset time for WT84 to measure prediction accuracy?
3. **Threshold Optimization:** What methodology should be used to set health score thresholds for different warning horizons?
4. **Seasonal Effects:** Should the model account for seasonal variations in sensor readings?
5. **Model Interpretability:** What level of explainability is needed for the health score calculations?
6. **Validation Timeline:** What specific timeline from the paper should be used to validate the WT84 failure prediction?

## Implementation Priority

### Phase 1: Foundation (Weeks 1-2)
- Data loading and preprocessing pipeline
- Sensor selection and feature engineering
- Basic anomaly detection model (Isolation Forest)

### Phase 2: Gearbox Focus (Weeks 3-4)
- Gearbox-specific model development
- WT84 failure validation
- Performance optimization and tuning

### Phase 3: Transformer Extension (Weeks 5-6)
- Transformer monitoring implementation
- Comparative analysis between components
- Visualization and reporting

### Phase 4: Validation & Documentation (Weeks 7-8)
- Paper comparison and validation
- Performance benchmarking
- Documentation for CIGRE/DNV applications 