# 🎯 START HERE - PDF to LaTeX Batch Converter

## Welcome! 👋

You now have a **complete, production-ready system** to convert multiple PDF files to beautiful LaTeX documents.

This file tells you **which file to read first** depending on your needs.

---

## 🚀 I Want to Start NOW (5 minutes)

**Read:** [`HOW_TO_USE.md`](./HOW_TO_USE.md)

This file has:
- ✅ Step-by-step instructions
- ✅ Real-world examples
- ✅ Common mistakes to avoid
- ✅ Troubleshooting tips

**Then run:**
```bash
bash setup.sh
```

---

## 📖 I Want to Understand Everything

**Read in this order:**

1. **[README.md](./README.md)** ← Overview & features
2. **[HOW_TO_USE.md](./HOW_TO_USE.md)** ← Step-by-step guide
3. **[SETUP_GUIDE.md](./SETUP_GUIDE.md)** ← Detailed setup
4. **[QUICK_REFERENCE.md](./QUICK_REFERENCE.md)** ← Quick answers

---

## 🔍 I'm Looking for Something Specific

### "How do I install this?"
→ [SETUP_GUIDE.md](./SETUP_GUIDE.md)

### "How do I use it? Show me examples"
→ [HOW_TO_USE.md](./HOW_TO_USE.md)

### "What are all the features?"
→ [README.md](./README.md)

### "Quick answers, I'm in a hurry"
→ [QUICK_REFERENCE.md](./QUICK_REFERENCE.md)

### "Something isn't working"
→ [HOW_TO_USE.md](./HOW_TO_USE.md) - Troubleshooting section

---

## 📁 What Files Do What?

### Scripts (The Programs)

| File | What It Does | When to Use |
|------|-------------|-----------|
| `pdf_to_latex_batch.py` | Main converter (Python) | **Recommended** |
| `pdf_to_latex_batch.js` | Converter (Node.js) | If you prefer JavaScript |
| `setup.sh` | Automatic setup | **First time setup** |

### Documentation (The Guides)

| File | Best For | Read First? |
|------|----------|-----------|
| **`HOW_TO_USE.md`** | Learning by doing | ⭐ **YES** |
| `README.md` | Complete overview | Overview only |
| `SETUP_GUIDE.md` | Detailed setup | If setup fails |
| `QUICK_REFERENCE.md` | Quick answers | Quick lookup |

---

## ⚡ The Quickest Path to Success

### 3 Steps:

#### Step 1️⃣: Run Setup
```bash
bash setup.sh
```

This script will:
- Check your system
- Install missing tools
- Ask for your API key
- Run the converter

#### Step 2️⃣: Follow the Prompts
The script guides you through everything.

#### Step 3️⃣: Done! 🎉
Your LaTeX files are in the output folder.

---

## 📚 File Descriptions

### 🟢 START WITH THESE:

#### HOW_TO_USE.md
- **What:** Complete "how to" guide with examples
- **Why:** Most practical, easiest to follow
- **Length:** ~15 minutes to read
- **Contains:** Step-by-step examples, troubleshooting, common mistakes

#### setup.sh
- **What:** Interactive setup script
- **Why:** Automatic - doesn't require manual setup
- **How:** Just run `bash setup.sh`
- **Does:** Installs tools, validates API key, runs conversion

### 🔵 THEN READ THESE:

#### README.md
- **What:** Complete project overview
- **Why:** Understand all features and capabilities
- **Length:** ~20 minutes to read
- **Contains:** Features, use cases, performance, requirements

#### SETUP_GUIDE.md
- **What:** Detailed setup & configuration
- **Why:** For advanced customization
- **Length:** ~30 minutes to read
- **Contains:** Installation details, advanced options, customization

### 🟡 USE THESE FOR QUICK LOOKUP:

#### QUICK_REFERENCE.md
- **What:** Quick reference card
- **Why:** Fast answers to common questions
- **Length:** ~5 minutes to scan
- **Contains:** Commands, examples, troubleshooting quick fixes

### 🔴 THE ACTUAL PROGRAMS:

#### pdf_to_latex_batch.py
- **What:** Main Python converter script
- **Why:** Recommended version, works on all systems
- **How:** `python pdf_to_latex_batch.py ./pdfs`
- **Requires:** Python 3, Anthropic SDK, pdftotext

#### pdf_to_latex_batch.js
- **What:** Node.js version of converter
- **Why:** Alternative if you prefer JavaScript
- **How:** `node pdf_to_latex_batch.js ./pdfs`
- **Requires:** Node.js 14+, Anthropic SDK, pdftotext

---

## ❓ Quick Answers

### Q: What do I read first?
**A:** [`HOW_TO_USE.md`](./HOW_TO_USE.md) - It's made for getting started fast.

### Q: I'm stuck on setup
**A:** Run `bash setup.sh` - It automates everything.

### Q: I want examples
**A:** See [HOW_TO_USE.md - Step-by-Step Examples](./HOW_TO_USE.md#step-by-step-examples)

### Q: What about Python vs Node.js?
**A:** Use Python - it's recommended. [QUICK_REFERENCE.md](./QUICK_REFERENCE.md) shows both.

### Q: I have 20 PDFs to convert
**A:** See [HOW_TO_USE.md - Example 2](./HOW_TO_USE.md#example-2-convert-multiple-research-papers-)

### Q: Something's broken
**A:** Check [HOW_TO_USE.md - Troubleshooting](./HOW_TO_USE.md#troubleshooting)

### Q: How long will it take?
**A:** ~2-3 minutes for 5 PDFs. See [README.md - Performance](./README.md#-performance)

---

## 🎯 Your Learning Path

### Path 1: "Just Run It" (15 minutes)
1. Read [`HOW_TO_USE.md`](./HOW_TO_USE.md) intro
2. Run `bash setup.sh`
3. Done!

### Path 2: "Understand First" (1 hour)
1. Read [`README.md`](./README.md)
2. Read [`HOW_TO_USE.md`](./HOW_TO_USE.md)
3. Read [`SETUP_GUIDE.md`](./SETUP_GUIDE.md)
4. Run `bash setup.sh` or manual setup
5. Try an example

### Path 3: "Learn By Doing" (30 minutes)
1. Skim [`HOW_TO_USE.md`](./HOW_TO_USE.md) - Example 1
2. Run `bash setup.sh`
3. Try it with your PDFs
4. Refer to troubleshooting if needed

### Path 4: "Just Give Me Commands" (5 minutes)
1. Check [`QUICK_REFERENCE.md`](./QUICK_REFERENCE.md)
2. Copy the command you need
3. Run it
4. Done!

---

## 🚀 Getting Started Right Now

### Absolute Quickest (1 minute):

```bash
bash setup.sh
```

That's it! The script handles everything.

### Manual Way (3 minutes):

```bash
# 1. Get API key from console.anthropic.com
export ANTHROPIC_API_KEY='sk-your-key'

# 2. Install tools
apt-get install poppler-utils
pip install anthropic

# 3. Run converter
python pdf_to_latex_batch.py ./your_pdfs
```

---

## 📖 File Organization

```
📦 Your Complete Toolkit
│
├── 🎯 START_HERE.md           ← You are here!
│
├── 🚀 SCRIPTS (Run these)
│   ├── setup.sh               ← Run for automatic setup
│   ├── pdf_to_latex_batch.py  ← Main converter (Python)
│   └── pdf_to_latex_batch.js  ← Alternative (Node.js)
│
└── 📚 DOCUMENTATION (Read these)
    ├── HOW_TO_USE.md          ← ⭐ Start here for learning
    ├── README.md              ← Complete overview
    ├── SETUP_GUIDE.md         ← Detailed setup help
    └── QUICK_REFERENCE.md     ← Quick lookup
```

---

## ✅ Checklist

Before starting, have:
- [ ] Claude API key (from console.anthropic.com)
- [ ] PDFs to convert
- [ ] Terminal/CLI access
- [ ] 5-10 minutes

Then:
- [ ] Read `HOW_TO_USE.md` OR
- [ ] Run `bash setup.sh`

---

## 🎓 Next Steps

### Once you're done reading:

1. **Run setup:**
   ```bash
   bash setup.sh
   ```

2. **Follow the prompts** - They guide you through everything

3. **Check the output:**
   ```bash
   ls output_folder/*.tex
   ```

4. **Compile (optional):**
   ```bash
   cd output_folder
   pdflatex paper.tex
   ```

---

## 💡 Pro Tips

1. **Start small** - Try with 1 PDF first
2. **Check the LaTeX** - Review generated files
3. **Compile and test** - Make sure it works before using
4. **Keep originals** - Don't delete source PDFs

---

## 🆘 Need Help?

1. **Getting started?** → [`HOW_TO_USE.md`](./HOW_TO_USE.md)
2. **Installation issues?** → [`SETUP_GUIDE.md`](./SETUP_GUIDE.md)
3. **Quick answers?** → [`QUICK_REFERENCE.md`](./QUICK_REFERENCE.md)
4. **Understanding?** → [`README.md`](./README.md)
5. **Script errors?** → Run `bash setup.sh` for diagnostics

---

## 🎉 You're Ready!

Pick where to start:

👉 **[Read HOW_TO_USE.md](./HOW_TO_USE.md)** - Best for learning  
👉 **Run `bash setup.sh`** - Best for just getting started  
👉 **[Read README.md](./README.md)** - Best for understanding everything  

---

**Good luck! You've got this! 🚀**
