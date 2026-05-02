# 📖 How to Use PDF to LaTeX Batch Converter

## Table of Contents
1. [Before You Start](#before-you-start)
2. [Installation](#installation)
3. [Basic Usage](#basic-usage)
4. [Step-by-Step Examples](#step-by-step-examples)
5. [Troubleshooting](#troubleshooting)

---

## Before You Start

You need **3 things** to get started:

### ✅ 1. Claude API Key
- Go to: https://console.anthropic.com
- Sign up or log in
- Copy your API key (starts with `sk-`)
- You'll use this in Step 2

### ✅ 2. A Folder with PDF Files
- Create a folder with your PDF files
- Example: `./my_pdfs/` or `./research_papers/`
- PDFs must have **extractable text** (not scanned images)

### ✅ 3. Terminal Access
- Linux/Mac: Open Terminal
- Windows: Use WSL (Windows Subsystem for Linux) or similar
- Claude Code terminal also works

---

## Installation

### Option 1: Automatic Setup (Easiest) ⭐ RECOMMENDED

```bash
bash setup.sh
```

This script will:
- ✅ Check for required tools
- ✅ Ask for your API key
- ✅ Install missing dependencies
- ✅ Run the conversion automatically

**That's it!** Just follow the prompts.

### Option 2: Manual Installation

#### Step 1: Install Required Tools

```bash
# On Ubuntu/Debian:
apt-get update
apt-get install -y poppler-utils

# On macOS:
brew install poppler

# Install Python dependencies:
pip install anthropic --break-system-packages
```

#### Step 2: Set Your API Key

```bash
# Paste your API key (from console.anthropic.com):
export ANTHROPIC_API_KEY='sk-your-actual-key-here'

# To make it permanent, add to ~/.bashrc:
echo "export ANTHROPIC_API_KEY='sk-your-actual-key-here'" >> ~/.bashrc
source ~/.bashrc
```

#### Step 3: Verify Installation

```bash
# Check if pdftotext is installed:
pdftotext -v

# Check if API key is set:
echo $ANTHROPIC_API_KEY

# Should show your key, not blank
```

---

## Basic Usage

### The Simplest Command

```bash
python pdf_to_latex_batch.py ./my_pdfs
```

This will:
1. Find all `.pdf` files in `./my_pdfs/`
2. Convert them to LaTeX
3. Save them in `./my_pdfs/latex_output/`

### With Custom Output Folder

```bash
python pdf_to_latex_batch.py ./my_pdfs ./my_latex_files
```

This saves output to `./my_latex_files/` instead.

### Using Node.js Instead

```bash
node pdf_to_latex_batch.js ./my_pdfs
node pdf_to_latex_batch.js ./my_pdfs ./my_latex_files
```

---

## Step-by-Step Examples

### Example 1: Convert a Single Paper 📄

**Goal:** Convert one PDF paper to LaTeX

```bash
# Step 1: Create a folder
mkdir papers
cd papers

# Step 2: Copy your PDF
cp ~/Downloads/my_paper.pdf .

# Step 3: Run the converter
python pdf_to_latex_batch.py .

# Step 4: Check the result
ls latex_output/
cat latex_output/my_paper.tex

# Step 5: Compile to PDF (optional)
cd latex_output
pdflatex my_paper.tex
```

**Result:** You now have `my_paper.pdf` compiled from LaTeX!

---

### Example 2: Convert Multiple Research Papers 📚

**Goal:** Convert 5 research papers at once

```bash
# Step 1: Create project folder
mkdir research_project
cd research_project

# Step 2: Create pdfs subfolder
mkdir pdfs
cd pdfs

# Step 3: Copy all your PDFs
cp ~/Downloads/paper1.pdf .
cp ~/Downloads/paper2.pdf .
cp ~/Downloads/paper3.pdf .
cp ~/Downloads/paper4.pdf .
cp ~/Downloads/paper5.pdf .

# Step 4: Go back to main folder
cd ..

# Step 5: Run converter
python pdf_to_latex_batch.py ./pdfs

# Step 6: Check results
ls pdfs/latex_output/
# Output:
# paper1.tex
# paper2.tex
# paper3.tex
# paper4.tex
# paper5.tex

# Step 7: Compile all to PDF
cd pdfs/latex_output
for file in *.tex; do
  echo "Compiling $file..."
  pdflatex "$file" -interaction=nonstopmode > /dev/null
done

# Step 8: View results
ls *.pdf
```

**Result:** All papers converted and compiled!

---

### Example 3: Convert Thesis Chapters 📖

**Goal:** Convert thesis chapters and compile them

```bash
# Step 1: Create thesis folder structure
mkdir my_thesis
cd my_thesis
mkdir chapters latex_output

# Step 2: Copy chapter PDFs
cp ~/thesis/chapter1.pdf chapters/
cp ~/thesis/chapter2.pdf chapters/
cp ~/thesis/chapter3.pdf chapters/

# Step 3: Convert all chapters
python pdf_to_latex_batch.py chapters ./latex_output

# Step 4: View the LaTeX files
ls -la latex_output/

# Step 5: Create a main.tex to include all chapters
cat > latex_output/main.tex << 'EOF'
\documentclass{book}
\usepackage[utf-8]{inputenc}

\title{My Thesis}
\author{Your Name}
\date{\today}

\begin{document}

\maketitle
\tableofcontents

\chapter{Chapter 1}
\input{chapter1.tex}

\chapter{Chapter 2}
\input{chapter2.tex}

\chapter{Chapter 3}
\input{chapter3.tex}

\end{document}
EOF

# Step 6: Compile the complete thesis
cd latex_output
pdflatex main.tex
pdflatex main.tex  # Run twice for TOC
```

**Result:** A complete, compiled thesis!

---

### Example 4: Using Interactive Setup 🎯

**Goal:** Let setup.sh guide you through everything

```bash
# Just run the setup script
bash setup.sh

# Follow the prompts:
# 1. It will ask for your API key (paste it)
# 2. It will detect your tools
# 3. It will ask which script to use (1 for Python, 2 for Node)
# 4. Enter your PDF folder path
# 5. Enter output folder path (or press Enter for default)
# 6. Watch it convert!
```

**That's it!** No manual commands needed.

---

### Example 5: Using from Claude Code 💻

**Goal:** Convert PDFs directly from Claude Code

```bash
# Step 1: Open Claude Code in your project folder
code .

# Step 2: In Claude Code terminal, run:
python pdf_to_latex_batch.py ./pdfs

# Step 3: Watch the progress
# The script will show:
# [1/5] Processing: paper1.pdf
#   → Extracting text from PDF...
#   → Converting to LaTeX with Claude...
#   ✅ Saved: paper1.tex

# Step 4: Claude may suggest improvements
# Accept the suggestions to refine the LaTeX

# Step 5: Your .tex files are ready to compile!
```

---

## Monitoring Progress

### What You'll See

```
✅ Found 5 PDF file(s)
📁 Output folder: ./latex_output

[1/5] Processing: paper1.pdf
  → Extracting text from PDF...
  → Converting to LaTeX with Claude...
  ✅ Saved: paper1.tex

[2/5] Processing: paper2.pdf
  → Extracting text from PDF...
  → Converting to LaTeX with Claude...
  ✅ Saved: paper2.tex

[3/5] Processing: paper3.pdf
  → Extracting text from PDF...
  ⚠️  Skipping paper3.pdf - No text extracted
  
[4/5] Processing: paper4.pdf
  → Extracting text from PDF...
  → Converting to LaTeX with Claude...
  ✅ Saved: paper4.tex

[5/5] Processing: paper5.pdf
  → Extracting text from PDF...
  → Converting to LaTeX with Claude...
  ✅ Saved: paper5.tex

✨ Conversion complete! Check ./latex_output for LaTeX files.
```

### Understanding the Messages

- ✅ **Saved** = Successfully converted
- ⚠️ **Skipping** = PDF had no extractable text (likely scanned)
- ❌ **Error** = Conversion failed (check internet connection)

---

## What Happens Next?

### Option A: Compile to PDF 📄

```bash
cd latex_output
pdflatex paper1.tex
```

### Option B: Edit the LaTeX 📝

```bash
# View the generated LaTeX
cat latex_output/paper1.tex

# Edit with any text editor
nano latex_output/paper1.tex
gedit latex_output/paper1.tex
code latex_output/paper1.tex
```

### Option C: Use in Your Project 🚀

```bash
# Copy to your LaTeX project
cp latex_output/*.tex ~/my-latex-project/chapters/
```

---

## Troubleshooting

### Problem: "pdftotext not found"

**Solution:**
```bash
# Ubuntu/Debian:
apt-get install -y poppler-utils

# macOS:
brew install poppler
```

### Problem: "ANTHROPIC_API_KEY not set"

**Solution:**
```bash
# Set it temporarily:
export ANTHROPIC_API_KEY='sk-...'

# Or permanently add to ~/.bashrc:
echo "export ANTHROPIC_API_KEY='sk-...'" >> ~/.bashrc
source ~/.bashrc

# Verify:
echo $ANTHROPIC_API_KEY
```

### Problem: "No PDF files found"

**Solution:**
```bash
# Check your folder:
ls -la your_folder/

# Make sure files end with .pdf (lowercase)
# If uppercase, rename them:
rename 's/\.PDF$/.pdf/' your_folder/*
```

### Problem: "No text extracted from PDF"

**This means the PDF is scanned (image-based).**

**Solutions:**
- Option 1: Use a different PDF with extractable text
- Option 2: Run OCR on the PDF first (advanced)
- Option 3: Manually extract text and save as .txt

**To test if PDF has text:**
```bash
pdftotext -f 1 -l 1 your_file.pdf -
# If output is blank, PDF is scanned
```

### Problem: "Rate limit (429) error"

**Solution:**
```bash
# Wait a few seconds and try again
sleep 10
python pdf_to_latex_batch.py ./pdfs

# Or reduce batch size
# Move some PDFs out of the folder
```

### Problem: "Command not found: python"

**Solution:**
```bash
# Try python3 instead:
python3 pdf_to_latex_batch.py ./pdfs

# Or install Python:
apt-get install python3
```

### Problem: "No module named 'anthropic'"

**Solution:**
```bash
pip install anthropic --break-system-packages
```

---

## Common Mistakes to Avoid

### ❌ Mistake 1: Wrong API Key

```bash
# WRONG: Just pasting without export
sk-your-key-here

# RIGHT: Use export command
export ANTHROPIC_API_KEY='sk-your-key-here'
```

### ❌ Mistake 2: PDF Folder is Empty

```bash
# WRONG: Folder has no PDFs
python pdf_to_latex_batch.py ./empty_folder

# RIGHT: Copy PDFs first
cp my_papers.pdf ./my_folder/
python pdf_to_latex_batch.py ./my_folder/
```

### ❌ Mistake 3: Mixing File Types

```bash
# WRONG: Folder has mix of PDF and other files
# The script only processes .pdf files, so this is actually OK
python pdf_to_latex_batch.py ./mixed_folder/

# Output: Only PDFs are processed, others ignored
```

### ❌ Mistake 4: Absolute vs Relative Paths

```bash
# Both work fine:
python pdf_to_latex_batch.py ./my_pdfs
python pdf_to_latex_batch.py /home/user/my_pdfs
python pdf_to_latex_batch.py ~/my_pdfs
```

---

## Quick Reference Commands

```bash
# Setup
bash setup.sh

# Convert with Python
python pdf_to_latex_batch.py ./pdfs
python pdf_to_latex_batch.py ./pdfs ./output

# Convert with Node.js
node pdf_to_latex_batch.js ./pdfs
node pdf_to_latex_batch.js ./pdfs ./output

# Check results
ls latex_output/*.tex
ls -la latex_output/

# Compile to PDF
cd latex_output
pdflatex paper.tex
latexmk -pdf paper.tex

# View PDF
evince paper.pdf
xdg-open paper.pdf
open paper.pdf  # macOS

# Count PDFs
find ./pdfs -name "*.pdf" | wc -l

# Check API key
echo $ANTHROPIC_API_KEY

# Check pdftotext
pdftotext -v
```

---

## Success Checklist ✅

Before you start, make sure you have:

- [ ] Claude API key from https://console.anthropic.com
- [ ] Folder with PDF files
- [ ] Terminal/CLI access
- [ ] About 2-3 minutes per 5 PDFs
- [ ] Internet connection (for Claude API)

After installation:

- [ ] `pdftotext -v` works
- [ ] `echo $ANTHROPIC_API_KEY` shows your key
- [ ] Python 3 or Node.js installed

---

## Getting Help

1. **Check this file** - Most issues are covered above
2. **Read SETUP_GUIDE.md** - More detailed information
3. **Read QUICK_REFERENCE.md** - Quick answers
4. **Run setup.sh** - Automatic diagnostics

---

## Examples of What Gets Converted

### Before (PDF):
```
SECTION 1: INTRODUCTION
The goal of this paper is to...

• Point 1
• Point 2
• Point 3

Table 1: Results
Name    Value
A       10
B       20

Equation: E = mc²
```

### After (LaTeX):
```latex
\section{Introduction}
The goal of this paper is to\ldots

\begin{itemize}
\item Point 1
\item Point 2
\item Point 3
\end{itemize}

\begin{table}
\centering
\begin{tabular}{ll}
Name & Value \\
A & 10 \\
B & 20 \\
\end{tabular}
\caption{Results}
\end{table}

Equation: $E = mc^2$
```

---

## Next Steps

### After Successful Conversion:

1. **View the LaTeX files:**
   ```bash
   cat latex_output/paper.tex
   ```

2. **Check for any issues:**
   ```bash
   pdflatex -interaction=nonstopmode paper.tex
   ```

3. **Compile to PDF:**
   ```bash
   pdflatex paper.tex
   ```

4. **Fine-tune if needed:**
   - Open `.tex` file in editor
   - Make any manual adjustments
   - Recompile

5. **Use in your project:**
   - Copy to your thesis folder
   - Include in larger documents
   - Share with collaborators

---

## Tips for Best Results

1. **Use text-based PDFs** - Not scanned documents
2. **One PDF at a time** - Start small, scale up
3. **Check the LaTeX** - Review for accuracy
4. **Compile and test** - Make sure it works
5. **Keep originals** - Don't delete source PDFs

---

## You're Ready! 🚀

You now know everything needed to convert PDFs to LaTeX. 

**Quick start:**
```bash
bash setup.sh
```

**Or manual start:**
```bash
export ANTHROPIC_API_KEY='your-key'
python pdf_to_latex_batch.py ./my_pdfs
```

**Enjoy!**
