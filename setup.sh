#!/bin/bash
# Interactive Setup Script for PDF to LaTeX Batch Converter

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║   PDF to LaTeX Batch Converter - Interactive Setup        ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

# Check if API key is set
if [ -z "$ANTHROPIC_API_KEY" ]; then
    echo "⚠️  ANTHROPIC_API_KEY is not set"
    echo ""
    echo "To get your API key:"
    echo "1. Go to https://console.anthropic.com"
    echo "2. Create an account or log in"
    echo "3. Copy your API key"
    echo ""
    read -p "🔑 Paste your API key here: " API_KEY
    
    if [ -z "$API_KEY" ]; then
        echo "❌ No API key provided. Exiting."
        exit 1
    fi
    
    # Set the API key
    export ANTHROPIC_API_KEY="$API_KEY"
    
    # Ask to save to ~/.bashrc
    read -p "📝 Save to ~/.bashrc for future sessions? (y/n): " SAVE_KEY
    if [ "$SAVE_KEY" = "y" ]; then
        echo "export ANTHROPIC_API_KEY='$API_KEY'" >> ~/.bashrc
        echo "✅ API key saved to ~/.bashrc"
    fi
else
    echo "✅ ANTHROPIC_API_KEY is already set"
fi

echo ""
echo "─────────────────────────────────────────────────────────────"
echo ""

# Check for required tools
echo "🔍 Checking for required tools..."
echo ""

# Check Python
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo "✅ Python: $PYTHON_VERSION"
    PYTHON_AVAILABLE=1
else
    echo "⚠️  Python 3 not found"
    PYTHON_AVAILABLE=0
fi

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js: $NODE_VERSION"
    NODE_AVAILABLE=1
else
    echo "⚠️  Node.js not found"
    NODE_AVAILABLE=0
fi

# Check pdftotext
if command -v pdftotext &> /dev/null; then
    echo "✅ pdftotext: installed"
else
    echo "⚠️  pdftotext not found (required)"
    read -p "📦 Install poppler-utils now? (y/n): " INSTALL_POPPLER
    if [ "$INSTALL_POPPLER" = "y" ]; then
        echo "Installing poppler-utils..."
        apt-get update && apt-get install -y poppler-utils
        if [ $? -eq 0 ]; then
            echo "✅ poppler-utils installed"
        else
            echo "❌ Failed to install poppler-utils"
            echo "Try manually: apt-get install -y poppler-utils"
        fi
    fi
fi

echo ""
echo "─────────────────────────────────────────────────────────────"
echo ""

# Choose script version
echo "📋 Which version would you like to use?"
echo ""

CHOICE=0
if [ $PYTHON_AVAILABLE -eq 1 ] && [ $NODE_AVAILABLE -eq 1 ]; then
    echo "1. Python version (recommended)"
    echo "2. Node.js version"
    read -p "Choose (1 or 2): " CHOICE
elif [ $PYTHON_AVAILABLE -eq 1 ]; then
    echo "🐍 Using Python version (Node.js not found)"
    CHOICE=1
elif [ $NODE_AVAILABLE -eq 1 ]; then
    echo "⬢ Using Node.js version (Python not found)"
    CHOICE=2
else
    echo "❌ Neither Python nor Node.js found"
    echo "Please install one of them first"
    exit 1
fi

echo ""
echo "─────────────────────────────────────────────────────────────"
echo ""

# Get PDF folder path
read -p "📁 Enter path to PDF folder: " PDF_FOLDER

if [ ! -d "$PDF_FOLDER" ]; then
    echo "❌ Folder not found: $PDF_FOLDER"
    exit 1
fi

# Count PDFs
PDF_COUNT=$(find "$PDF_FOLDER" -maxdepth 1 -name "*.pdf" | wc -l)
echo "📊 Found $PDF_COUNT PDF file(s) in $PDF_FOLDER"

if [ $PDF_COUNT -eq 0 ]; then
    echo "⚠️  No PDFs found. Copy PDFs to the folder and try again."
    exit 1
fi

echo ""
read -p "📂 Enter output folder (leave blank for default): " OUTPUT_FOLDER

if [ -z "$OUTPUT_FOLDER" ]; then
    OUTPUT_FOLDER="$PDF_FOLDER/latex_output"
fi

echo ""
echo "─────────────────────────────────────────────────────────────"
echo ""
echo "✨ Starting conversion..."
echo ""

# Run the appropriate script
if [ $CHOICE -eq 1 ]; then
    # Python version
    if command -v python3 &> /dev/null; then
        python3 pdf_to_latex_batch.py "$PDF_FOLDER" "$OUTPUT_FOLDER"
    else
        python pdf_to_latex_batch.py "$PDF_FOLDER" "$OUTPUT_FOLDER"
    fi
else
    # Node.js version
    node pdf_to_latex_batch.js "$PDF_FOLDER" "$OUTPUT_FOLDER"
fi

echo ""
echo "─────────────────────────────────────────────────────────────"
echo ""
echo "🎉 Done!"
echo "📂 LaTeX files saved to: $OUTPUT_FOLDER"
echo ""
echo "Next steps:"
echo "1. Check the generated .tex files"
echo "2. Compile with: pdflatex filename.tex"
echo "3. Or use: latexmk -pdf filename.tex"
echo ""
