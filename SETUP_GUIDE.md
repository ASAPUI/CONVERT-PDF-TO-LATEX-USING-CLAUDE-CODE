# PDF to LaTeX Batch Converter - Complete Setup Guide 📚➡️📄

## Overview

This solution converts **multiple PDF files** in a folder to LaTeX format using Claude's API. It automatically:

✅ Extracts text from all PDFs  
✅ Converts to beautifully formatted LaTeX  
✅ Saves output files to a folder  
✅ Handles errors gracefully  

---

## Prerequisites

### 1. **Claude API Key**
- Get your API key from: https://console.anthropic.com
- Set environment variable:
  ```bash
  export ANTHROPIC_API_KEY='sk-your-actual-key-here'
  ```

### 2. **Install Required Tools**

#### For Python version:
```bash
# Install Python dependencies
pip install anthropic --break-system-packages

# Install pdftotext (poppler-utils)
apt-get update
apt-get install -y poppler-utils
```

#### For Node.js version:
```bash
# Install Node.js dependencies
npm install @anthropic-ai/sdk

# Install pdftotext (poppler-utils)
apt-get update
apt-get install -y poppler-utils
```

---

## Usage

### **Option 1: Python Script** (Recommended)

```bash
# Basic usage
python pdf_to_latex_batch.py ./my_pdfs

# Specify custom output folder
python pdf_to_latex_batch.py ./my_pdfs ./output_latex_files
```

**Example:**
```bash
# Create a folder with PDFs
mkdir my_pdfs
cp document1.pdf document2.pdf my_pdfs/

# Run the converter
python pdf_to_latex_batch.py my_pdfs

# Check results
ls my_pdfs/latex_output/
```

### **Option 2: Node.js Script**

```bash
# Basic usage
node pdf_to_latex_batch.js ./my_pdfs

# Specify custom output folder
node pdf_to_latex_batch.js ./my_pdfs ./output_latex_files
```

---

## Folder Structure

Before:
```
my_pdfs/
├── paper1.pdf
├── paper2.pdf
└── thesis.pdf
```

After:
```
my_pdfs/
├── paper1.pdf
├── paper2.pdf
├── thesis.pdf
└── latex_output/
    ├── paper1.tex
    ├── paper2.tex
    └── thesis.tex
```

---

## What the Converter Does

### Step 1: Text Extraction
Extracts text from each PDF using `pdftotext`:
```bash
pdftotext -layout document.pdf -
```

### Step 2: LaTeX Conversion
Sends the text to Claude Opus 4, which:
- Detects structure (headers, sections, etc.)
- Converts to LaTeX commands (`\section{}`, `\subsection{}`, etc.)
- Formats equations in math mode (`$...$` or `\[...\]`)
- Creates proper document structure
- Adds required packages

### Step 3: Save Output
Saves the LaTeX code to `.tex` files

---

## LaTeX Features Supported

✅ Document structure (`\documentclass`, `\begin{document}`, etc.)  
✅ Sections and subsections (`\section{}`, `\subsection{}`)  
✅ Lists (`\begin{itemize}`, `\begin{enumerate}`)  
✅ Tables (`\begin{tabular}`)  
✅ Math mode (`$...$`, `\[...\]`)  
✅ Code blocks (`\begin{verbatim}`, `\begin{lstlisting}`)  
✅ Proper package imports (amsmath, graphicx, etc.)  

---

## Compiling LaTeX Output

After conversion, compile with:

```bash
# Generate PDF from LaTeX
cd latex_output
pdflatex paper1.tex
pdflatex paper2.tex

# Or use latexmk for automated compilation
latexmk -pdf paper1.tex
```

---

## Advanced Options

### Process Large PDFs (Limit Text)

The script automatically limits extraction to first 10,000 characters to avoid huge context windows. To change this, edit the script:

**Python:**
```python
# Change this line in convert_to_latex()
{pdf_text[:10000]}  # ← Change 10000 to desired limit
```

**Node.js:**
```javascript
// Change this line in convertToLatex()
${pdfText.substring(0, 10000)}  // ← Change 10000 to desired limit
```

### Process Specific PDF Extensions

To only process certain PDFs:

**Python:**
```bash
# Rename PDFs you want to skip
mv unwanted.pdf unwanted.pdf.bak
```

**Node.js:**
```bash
# Same approach
mv unwanted.pdf unwanted.pdf.bak
```

---

## Troubleshooting

### ❌ "pdftotext not found"
```bash
apt-get install -y poppler-utils
```

### ❌ "ANTHROPIC_API_KEY not set"
```bash
export ANTHROPIC_API_KEY='your-key-here'
# Verify:
echo $ANTHROPIC_API_KEY
```

### ❌ "No PDF files found"
- Check folder path is correct
- Verify files end with `.pdf` (case-sensitive)

### ❌ "No text extracted from PDF"
- PDF might be scanned/image-only
- Try opening PDF in viewer to confirm it has text
- For scanned PDFs, consider OCR preprocessing

### ❌ Rate limiting (429 error)
- Add delay between API calls in script
- For Python, add: `import time; time.sleep(2)` between calls

---

## Performance

| Metric | Value |
|--------|-------|
| Typical PDF | 15-30 seconds |
| 5 PDFs | ~2-3 minutes |
| 10 PDFs | ~4-6 minutes |
| 20 PDFs | ~8-12 minutes |

*Times depend on PDF size and API latency*

---

## Customization Examples

### Example 1: Process Only First 5 PDFs

**Python:**
```python
pdf_files = pdf_files[:5]  # Add this after finding PDFs
```

**Node.js:**
```javascript
const pdfFiles = files.filter(file => file.toLowerCase().endsWith('.pdf')).slice(0, 5);
```

### Example 2: Skip PDFs Matching Pattern

**Python:**
```python
pdf_files = [f for f in pdf_files if 'draft' not in f.name.lower()]
```

**Node.js:**
```javascript
const pdfFiles = files.filter(file => 
  file.toLowerCase().endsWith('.pdf') && !file.includes('draft')
);
```

### Example 3: Change Output Format

Modify the Claude prompt in `convert_to_latex()` to request different formatting:

```python
# Add to the prompt:
"Use natbib for citations instead of standard LaTeX citations"
"Add bibliography support with bibtex"
"Include table of contents"
```

---

## Integration with Claude Code

To run from Claude Code:

```bash
# In Claude Code terminal:
python pdf_to_latex_batch.py ./pdfs
```

Claude Code will provide file editing suggestions - accept them to refine the LaTeX output further!

---

## Security Notes

✅ API keys are read from environment variables (not hardcoded)  
✅ No data is logged or stored  
✅ PDFs are processed locally before sending to API  

---

## License

Free to use and modify for your needs.

---

## Questions?

- Check PDF is text-extractable (not scanned)
- Verify ANTHROPIC_API_KEY is set
- Ensure poppler-utils is installed
- Check Claude API status at https://status.anthropic.com

Happy converting! 🎉
