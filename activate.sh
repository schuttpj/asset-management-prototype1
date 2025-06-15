#!/bin/bash
# Wind Turbine Health-Score Engine - Development Environment Activation

echo "🌪️  Activating Wind Turbine Health-Score Engine Environment..."

# Activate virtual environment
source venv/bin/activate

# Check if activation was successful
if [[ "$VIRTUAL_ENV" != "" ]]; then
    echo "✅ Virtual environment activated: $(basename $VIRTUAL_ENV)"
    echo "🐍 Python version: $(python --version)"
    echo "📦 Key libraries available:"
    python -c "
import sys
try:
    import pandas as pd
    import numpy as np
    import sklearn
    import plotly
    import seaborn as sns
    print(f'   • pandas {pd.__version__}')
    print(f'   • numpy {np.__version__}')
    print(f'   • scikit-learn {sklearn.__version__}')
    print(f'   • plotly {plotly.__version__}')
    print(f'   • seaborn {sns.__version__}')
    print('🚀 Ready for wind turbine analysis!')
except ImportError as e:
    print(f'❌ Missing library: {e}')
    print('Run: pip install -r requirements.txt')
"
    echo ""
    echo "💡 Quick commands:"
    echo "   jupyter lab          # Start Jupyter Lab"
    echo "   python script.py     # Run Python scripts"
    echo "   deactivate          # Exit virtual environment"
    echo ""
else
    echo "❌ Failed to activate virtual environment"
    echo "Make sure you're in the project root directory"
fi 