#!/usr/bin/env python3
"""
PDF to LaTeX Batch Converter
Converts all PDFs in a folder to LaTeX format using Claude API
"""

import os
import sys
import json
import subprocess
from pathlib import Path
import anthropic

def extract_text_from_pdf(pdf_path: str) -> str:
    """Extract text from PDF using pdftotext"""
    try:
        result = subprocess.run(
            ['pdftotext', '-layout', pdf_path, '-'],
            capture_output=True,
            text=True,
            timeout=30
        )
        if result.returncode == 0:
            return result.stdout
        else:
            print(f"⚠️  pdftotext error for {pdf_path}: {result.stderr}")
            return ""
    except FileNotFoundError:
        print("❌ pdftotext not found. Install with: apt-get install poppler-utils")
        sys.exit(1)
    except subprocess.TimeoutExpired:
        print(f"⏱️  Timeout extracting text from {pdf_path}")
        return ""

def convert_to_latex(pdf_text: str, filename: str) -> str:
    """Use Claude to convert extracted PDF text to LaTeX"""
    client = anthropic.Anthropic()
    
    message = client.messages.create(
        model="claude-opus-4-7",
        max_tokens=4096,
        messages=[
            {
                "role": "user",
                "content": f"""Convert the following PDF content to a well-formatted LaTeX document.

Guidelines:
- Use proper LaTeX document structure with \\documentclass{{article}}
- Convert headers to \\section{{}} and \\subsection{{}}
- Convert bullet points to itemize environments
- Convert tables to tabular environments
- Convert mathematical notation to proper LaTeX math mode ($ $ or \[ \])
- Preserve code blocks in verbatim or lstlisting environments
- Add appropriate packages in preamble (amsmath, graphicx, etc. as needed)
- Keep the content structure and meaning
- Use proper LaTeX formatting throughout

PDF Content:
---
{pdf_text[:10000]}  # Limit to first 10k chars to avoid huge context
---

Output only the complete LaTeX code, ready to compile."""
            }
        ]
    )
    
    return message.content[0].text

def process_pdf_folder(folder_path: str, output_folder: str = None):
    """Process all PDFs in a folder"""
    
    # Set output folder
    if output_folder is None:
        output_folder = os.path.join(folder_path, "latex_output")
    
    # Create output directory
    Path(output_folder).mkdir(parents=True, exist_ok=True)
    
    # Find all PDF files
    pdf_files = list(Path(folder_path).glob("*.pdf"))
    
    if not pdf_files:
        print(f"❌ No PDF files found in {folder_path}")
        return
    
    print(f"✅ Found {len(pdf_files)} PDF file(s)")
    print(f"📁 Output folder: {output_folder}\n")
    
    # Process each PDF
    for idx, pdf_path in enumerate(pdf_files, 1):
        print(f"[{idx}/{len(pdf_files)}] Processing: {pdf_path.name}")
        
        # Step 1: Extract text from PDF
        print("  → Extracting text from PDF...")
        pdf_text = extract_text_from_pdf(str(pdf_path))
        
        if not pdf_text:
            print(f"  ⚠️  Skipping {pdf_path.name} - No text extracted")
            continue
        
        # Step 2: Convert to LaTeX using Claude
        print("  → Converting to LaTeX with Claude...")
        try:
            latex_code = convert_to_latex(pdf_text, pdf_path.name)
            
            # Step 3: Save LaTeX file
            output_filename = pdf_path.stem + ".tex"
            output_path = os.path.join(output_folder, output_filename)
            
            with open(output_path, 'w', encoding='utf-8') as f:
                f.write(latex_code)
            
            print(f"  ✅ Saved: {output_filename}")
            
        except Exception as e:
            print(f"  ❌ Error converting {pdf_path.name}: {str(e)}")
    
    print(f"\n✨ Conversion complete! Check {output_folder} for LaTeX files.")

def main():
    """Main entry point"""
    if len(sys.argv) < 2:
        print("Usage: python pdf_to_latex_batch.py <pdf_folder> [output_folder]")
        print("\nExample:")
        print("  python pdf_to_latex_batch.py ./pdfs ./latex_files")
        sys.exit(1)
    
    pdf_folder = sys.argv[1]
    output_folder = sys.argv[2] if len(sys.argv) > 2 else None
    
    # Validate input folder
    if not os.path.isdir(pdf_folder):
        print(f"❌ Folder not found: {pdf_folder}")
        sys.exit(1)
    
    # Check for API key
    if not os.getenv('ANTHROPIC_API_KEY'):
        print("❌ ANTHROPIC_API_KEY environment variable not set")
        print("Set it with: export ANTHROPIC_API_KEY='your-api-key'")
        sys.exit(1)
    
    # Process PDFs
    process_pdf_folder(pdf_folder, output_folder)

if __name__ == "__main__":
    main()
