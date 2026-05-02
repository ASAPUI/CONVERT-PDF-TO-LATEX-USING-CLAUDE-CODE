# 📚 PDF to LaTeX Batch Converter for Claude Code

A complete solution to convert **multiple PDF files** to beautifully formatted LaTeX documents using Claude's API.

## 📦 What's Included

```
pdf-to-latex-batch-converter/
├── pdf_to_latex_batch.py          # Python implementation (recommended)
├── pdf_to_latex_batch.js          # Node.js implementation
├── setup.sh                        # Interactive setup script
├── SETUP_GUIDE.md                 # Complete setup documentation
├── QUICK_REFERENCE.md             # Quick reference card
└── README.md                       # This file
```

---

## ⚡ Quick Start (5 minutes)

### 1. Get Your API Key
- Go to: https://console.anthropic.com
- Copy your API key

### 2. Run Setup
```bash
bash setup.sh
```

The script will:
- ✅ Check for required tools
- ✅ Save your API key
- ✅ Install missing dependencies
- ✅ Convert your PDFs

### 3. Check Results
```bash
ls my_pdfs/latex_output/
```

---

## 🎯 Main Features

✨ **Batch Processing** - Convert 10+ PDFs automatically  
🤖 **AI-Powered** - Claude intelligently preserves structure  
⚡ **Fast** - 2-3 minutes for 5 PDFs  
🎨 **Beautiful Output** - Proper LaTeX formatting  
🛡️ **Secure** - Keys from environment variables only  
🔧 **Flexible** - Python or Node.js versions  

---

## 📋 System Requirements

- **Python 3** or **Node.js** (or both)
- **Claude API Key** (free trial available)
- **pdftotext** (poppler-utils)
- **Internet connection** (for Claude API)

### Install Requirements

```bash
# Option 1: Use setup.sh (automatic)
bash setup.sh

# Option 2: Manual installation
apt-get update
apt-get install -y poppler-utils
pip install anthropic --break-system-packages
```

---

## 🚀 Usage

### Method 1: Interactive Setup (Recommended)
```bash
bash setup.sh
# Follow the prompts
```

### Method 2: Command Line - Python
```bash
python pdf_to_latex_batch.py <pdf_folder> [output_folder]

# Example:
python pdf_to_latex_batch.py ./papers ./latex_output
```

### Method 3: Command Line - Node.js
```bash
node pdf_to_latex_batch.js <pdf_folder> [output_folder]

# Example:
node pdf_to_latex_batch.js ./papers ./latex_output
```

### Method 4: From Claude Code
1. Open Claude Code in your project folder
2. Run in terminal:
   ```bash
   python pdf_to_latex_batch.py ./pdfs
   ```
3. Claude will suggest edits to the `.tex` files

---

## 🔄 Workflow

```
Your PDFs folder
       ↓
[Extract Text] (pdftotext)
       ↓
[Send to Claude] (Claude API)
       ↓
[Convert to LaTeX] (AI conversion)
       ↓
[Save .tex files] (Output folder)
       ↓
[Compile with pdflatex] (Optional)
```

---

## 📂 Example Usage

### Setup
```bash
# Create folders
mkdir research_pdfs
mkdir latex_files

# Copy PDFs
cp paper1.pdf paper2.pdf paper3.pdf research_pdfs/

# Set API key
export ANTHROPIC_API_KEY='sk-...'
```

### Convert
```bash
python pdf_to_latex_batch.py research_pdfs latex_files
```

### Output
```
latex_files/
├── paper1.tex       ← Ready to compile!
├── paper2.tex
└── paper3.tex
```

### Compile
```bash
cd latex_files
pdflatex paper1.tex
latexmk -pdf paper2.tex
xdg-open paper1.pdf  # View on Linux
```

---

## 🎨 LaTeX Conversion Features

The converter intelligently transforms:

| PDF Element | LaTeX Output |
|------------|--------------|
| Headers | `\section{}`, `\subsection{}` |
| Lists | `\begin{itemize}`, `\begin{enumerate}` |
| Tables | `\begin{tabular}` |
| Math | `$...$`, `\[...\]` |
| Code | `\begin{verbatim}` or `\begin{lstlisting}` |
| Bold/Italic | `\textbf{}`, `\textit{}` |
| Emphasis | `\emph{}` |
| Packages | Auto-included (amsmath, graphicx, etc.) |

---

## 🔧 Environment Setup

### One-time Setup

```bash
# 1. Install dependencies (if not done via setup.sh)
apt-get install -y poppler-utils
pip install anthropic

# 2. Save API key (permanent)
echo "export ANTHROPIC_API_KEY='sk-your-key'" >> ~/.bashrc
source ~/.bashrc

# 3. Verify setup
echo $ANTHROPIC_API_KEY  # Should show your key
which pdftotext         # Should show path
python --version        # Should show Python 3.x
```

### Per-Session Setup

```bash
# Just set the API key
export ANTHROPIC_API_KEY='sk-...'

# Run converter
python pdf_to_latex_batch.py ./pdfs
```

---

## 📊 Performance

| Task | Time | Notes |
|------|------|-------|
| 1 PDF | 15-30s | Small to medium size |
| 5 PDFs | 2-3 min | Typical batch |
| 10 PDFs | 4-6 min | Full research paper set |
| 20 PDFs | 8-12 min | Large batch |

*Actual time depends on PDF size and API response time*

---

## 🐛 Troubleshooting

### "pdftotext not found"
```bash
apt-get install -y poppler-utils
```

### "ANTHROPIC_API_KEY not set"
```bash
export ANTHROPIC_API_KEY='sk-...'
```

### "No PDF files found"
- Check folder path is correct
- Verify files end with `.pdf` (lowercase)
- List files: `ls -la your_folder/`

### "No text extracted from PDF"
This typically means the PDF is **scanned (image-based)**:
- Try opening it in a PDF viewer
- If text isn't selectable, it's scanned
- Consider scanning with OCR first

### "Rate limiting (429 error)"
- Wait a few seconds
- Try again
- Reduce batch size if repeated

### "ModuleNotFoundError: No module named 'anthropic'"
```bash
pip install anthropic --break-system-packages
```

---

## 🔐 Security

✅ **API Keys** - Stored only in environment variables  
✅ **No Logging** - PDFs not logged or stored  
✅ **Local Processing** - Text extracted locally first  
✅ **Temporary Data** - Never persisted to disk  

---

## 📖 File Documentation

### pdf_to_latex_batch.py
Main Python script for batch conversion.

**Usage:**
```bash
python pdf_to_latex_batch.py ./pdfs [./output]
```

**Features:**
- Cross-platform (Windows, macOS, Linux)
- No external dependencies beyond Claude SDK
- Progress reporting
- Error handling per PDF

### pdf_to_latex_batch.js
Node.js version of the converter.

**Usage:**
```bash
node pdf_to_latex_batch.js ./pdfs [./output]
```

**Requirements:**
- Node.js 14+
- `@anthropic-ai/sdk` npm package

### setup.sh
Interactive setup script.

**Does:**
- Checks for required tools
- Validates API key
- Installs missing dependencies
- Runs conversion with user guidance

**Usage:**
```bash
bash setup.sh
```

### SETUP_GUIDE.md
Complete setup and configuration documentation.

- Prerequisites
- Detailed installation steps
- Advanced configuration
- Customization examples
- Full troubleshooting guide

### QUICK_REFERENCE.md
Quick reference card for common tasks.

- 30-second quick start
- Command cheat sheet
- Examples
- Troubleshooting quick fixes

---

## 🎓 Use Cases

### Academic Research
Convert PDF papers to editable LaTeX:
```bash
python pdf_to_latex_batch.py ./research_papers ./tex_versions
```

### Thesis Compilation
Convert thesis chapters:
```bash
python pdf_to_latex_batch.py ./chapters ./latex_thesis
```

### Documentation
Convert specification PDFs:
```bash
python pdf_to_latex_batch.py ./specs ./latex_docs
```

### Archive Digitization
Convert scanned documents (with OCR preprocessing):
```bash
python pdf_to_latex_batch.py ./scanned_archive ./digital_texts
```

---

## 💡 Tips & Tricks

### Process Only Certain PDFs
```bash
# Rename PDFs you want to skip
mv draft.pdf draft.pdf.bak
mv temp.pdf temp.pdf.bak

# Run converter
python pdf_to_latex_batch.py ./pdfs
```

### Monitor Progress
```bash
# Watch output folder as files are created
watch -n 1 'ls -la latex_output/ | tail'
```

### Compile All Output
```bash
cd latex_output
for f in *.tex; do
  echo "Compiling $f..."
  pdflatex -interaction=nonstopmode "$f" > /dev/null
done
```

### Verify LaTeX Syntax
```bash
cd latex_output
pdflatex -draftmode *.tex  # Check syntax without output
```

---

## 🔗 Related Tools

### Compile Generated LaTeX
- **latexmk**: `apt-get install latexmk`
- **texlive**: `apt-get install texlive-full`

### View Results
- **zathura**: `apt-get install zathura`
- **evince**: `apt-get install evince`

### Edit LaTeX
- **TeXstudio**: GUI LaTeX editor
- **VS Code**: LaTeX Workshop extension

---

## 📚 Further Reading

- [Anthropic Claude API Docs](https://docs.claude.com)
- [LaTeX Documentation](https://www.latex-project.org)
- [Poppler Documentation](https://poppler.freedesktop.org/)
- [MCP Documentation](https://modelcontextprotocol.io/)

---

## ❓ FAQ

**Q: Can I process scanned PDFs?**  
A: Not directly. You'd need to run OCR first (e.g., with Tesseract).

**Q: How much does this cost?**  
A: Claude API pricing applies. Check https://www.anthropic.com/pricing

**Q: Can I customize the LaTeX format?**  
A: Yes! Edit the Claude prompt in the script to specify formatting preferences.

**Q: Is there a batch size limit?**  
A: No hard limit, but rate limiting may apply. Process 20-50 at a time for best results.

**Q: Can I use this with Claude Desktop?**  
A: Yes, use the Python/Node.js scripts directly from the terminal.

---

## 📝 Version Info

- **Python Script**: 1.0
- **Node.js Script**: 1.0
- **Setup Script**: 1.0
- **Last Updated**: 2026

---

## 🤝 Contributing

Found a bug? Have improvements?

1. Check the troubleshooting section
2. Review SETUP_GUIDE.md
3. Verify all prerequisites are installed

---

## 📄 License

Free to use and modify for personal and commercial use.

---

## 🎉 Happy Converting!

Convert your PDFs to beautiful LaTeX with ease.

Questions? Check:
1. **QUICK_REFERENCE.md** - Fast answers
2. **SETUP_GUIDE.md** - Detailed help
3. **setup.sh** - Automatic diagnostics

**Good luck!** 🚀
