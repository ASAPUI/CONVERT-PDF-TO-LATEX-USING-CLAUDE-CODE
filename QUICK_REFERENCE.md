# 🚀 PDF to LaTeX Batch Converter - Quick Reference

## 30-Second Quick Start

```bash
# 1. Set your API key
export ANTHROPIC_API_KEY='your-key-here'

# 2. Install tools
apt-get install -y poppler-utils

# 3. Run the converter
python pdf_to_latex_batch.py ./my_pdfs

# 4. Done! Check ./my_pdfs/latex_output/
```

---

## Commands Cheat Sheet

### Setup (One-time)
```bash
# Interactive setup (recommended)
bash setup.sh

# Manual setup
export ANTHROPIC_API_KEY='sk-...'
pip install anthropic
apt-get install poppler-utils
```

### Run Conversion

**Python:**
```bash
python pdf_to_latex_batch.py <pdf_folder> [output_folder]
```

**Node.js:**
```bash
node pdf_to_latex_batch.js <pdf_folder> [output_folder]
```

**Interactive:**
```bash
bash setup.sh
```

### Compile LaTeX Results
```bash
cd latex_output/
pdflatex paper.tex
latexmk -pdf paper.tex  # Recommended
```

---

## File Structure

| File | Purpose |
|------|---------|
| `pdf_to_latex_batch.py` | Main Python script |
| `pdf_to_latex_batch.js` | Main Node.js script |
| `setup.sh` | Interactive setup |
| `SETUP_GUIDE.md` | Full documentation |

---

## Examples

### Example 1: Convert papers folder
```bash
python pdf_to_latex_batch.py ~/Documents/papers ~/Documents/papers_latex
```

### Example 2: Convert with setup wizard
```bash
bash setup.sh
# Follow prompts
```

### Example 3: Convert and compile
```bash
python pdf_to_latex_batch.py ./pdfs
cd pdfs/latex_output
latexmk -pdf *.tex
```

---

## Environment Variables

```bash
# Required
export ANTHROPIC_API_KEY='sk-your-key'

# Optional (for customization)
export MCP_TIMEOUT=10000           # Timeout in ms
export MAX_MCP_OUTPUT_TOKENS=50000 # Max output
```

---

## Troubleshooting Quick Fixes

| Problem | Solution |
|---------|----------|
| `pdftotext not found` | `apt-get install poppler-utils` |
| `ANTHROPIC_API_KEY not set` | `export ANTHROPIC_API_KEY='...'` |
| `No PDF files found` | Check folder path and file extensions |
| `No text extracted` | PDF might be scanned (image-based) |
| `Rate limit (429)` | Wait a few seconds, try again |

---

## What Gets Converted

✅ **Structure:** Headers, sections, subsections  
✅ **Lists:** Bullet points, numbered lists  
✅ **Math:** Equations, inline math  
✅ **Tables:** Data tables with formatting  
✅ **Code:** Code blocks in verbatim/lstlisting  
✅ **Formatting:** Bold, italic, emphasis  
✅ **Packages:** Auto-detected & included  

---

## Performance

- 1 PDF: ~15-30 seconds
- 5 PDFs: ~2-3 minutes
- 10 PDFs: ~4-6 minutes
- 20 PDFs: ~8-12 minutes

*Depends on PDF size and API latency*

---

## API Key Sources

- **Anthropic Console:** https://console.anthropic.com
- **Get free trial credit:** https://console.anthropic.com/account/billing/overview

---

## Integration with Claude Code

Run directly in Claude Code:

```bash
# In Claude Code terminal
python pdf_to_latex_batch.py ./pdfs

# Or use setup wizard
bash setup.sh
```

Then use Claude's editing features to refine the generated `.tex` files!

---

## Useful Commands

```bash
# Check LaTeX syntax
pdflatex -interaction=nonstopmode document.tex

# View LaTeX source
cat latex_output/document.tex | head -50

# List all generated files
ls -la latex_output/*.tex

# Count PDFs in folder
find ./pdfs -name "*.pdf" | wc -l

# Backup originals
cp -r ./pdfs ./pdfs_backup
```

---

## Need Help?

1. **Check setup.sh** - runs diagnostics
2. **Read SETUP_GUIDE.md** - full documentation
3. **Verify API key** - `echo $ANTHROPIC_API_KEY`
4. **Check pdftotext** - `pdftotext -v`
5. **Test with one PDF** first

---

## Key Features

🚀 **Batch processing** - Convert 10+ PDFs at once  
🤖 **AI-powered** - Claude intelligently converts structure  
⚡ **Fast** - 2-3 minutes for 5 PDFs  
🎨 **Beautiful output** - Properly formatted LaTeX  
🛡️ **Secure** - API key from env variables, no logging  
🔧 **Flexible** - Python or Node.js version  

---

**Made with ❤️ for researchers and writers**
