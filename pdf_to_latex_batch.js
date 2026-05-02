#!/usr/bin/env node
/**
 * PDF to LaTeX Batch Converter for Claude Code
 * Uses Claude API to convert multiple PDFs to LaTeX format
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const Anthropic = require('@anthropic-ai/sdk');

const client = new Anthropic();

/**
 * Extract text from PDF using pdftotext
 */
function extractTextFromPdf(pdfPath) {
  try {
    const text = execSync(`pdftotext -layout "${pdfPath}" -`, {
      encoding: 'utf-8',
      timeout: 30000,
    });
    return text;
  } catch (error) {
    if (error.code === 'ENOENT') {
      console.error('❌ pdftotext not found. Install with: apt-get install poppler-utils');
      process.exit(1);
    }
    console.warn(`⚠️  Error extracting text from ${pdfPath}: ${error.message}`);
    return '';
  }
}

/**
 * Convert PDF text to LaTeX using Claude
 */
async function convertToLatex(pdfText, filename) {
  const message = await client.messages.create({
    model: 'claude-opus-4-7',
    max_tokens: 4096,
    messages: [
      {
        role: 'user',
        content: `Convert the following PDF content to a well-formatted LaTeX document.

Guidelines:
- Use proper LaTeX document structure with \\documentclass{article}
- Convert headers to \\section{} and \\subsection{}
- Convert bullet points to itemize environments
- Convert tables to tabular environments
- Convert mathematical notation to proper LaTeX math mode ($ $ or \\[ \\])
- Preserve code blocks in verbatim or lstlisting environments
- Add appropriate packages in preamble (amsmath, graphicx, etc. as needed)
- Keep the content structure and meaning
- Use proper LaTeX formatting throughout

PDF Content:
---
${pdfText.substring(0, 10000)}
---

Output only the complete LaTeX code, ready to compile.`,
      },
    ],
  });

  return message.content[0].text;
}

/**
 * Process all PDFs in a folder
 */
async function processPdfFolder(folderPath, outputFolder = null) {
  // Set output folder
  if (!outputFolder) {
    outputFolder = path.join(folderPath, 'latex_output');
  }

  // Create output directory
  if (!fs.existsSync(outputFolder)) {
    fs.mkdirSync(outputFolder, { recursive: true });
  }

  // Find all PDF files
  const files = fs.readdirSync(folderPath);
  const pdfFiles = files.filter(file => file.toLowerCase().endsWith('.pdf'));

  if (pdfFiles.length === 0) {
    console.log(`❌ No PDF files found in ${folderPath}`);
    return;
  }

  console.log(`✅ Found ${pdfFiles.length} PDF file(s)`);
  console.log(`📁 Output folder: ${outputFolder}\n`);

  // Process each PDF
  for (let idx = 0; idx < pdfFiles.length; idx++) {
    const filename = pdfFiles[idx];
    const pdfPath = path.join(folderPath, filename);

    console.log(`[${idx + 1}/${pdfFiles.length}] Processing: ${filename}`);

    try {
      // Step 1: Extract text from PDF
      console.log('  → Extracting text from PDF...');
      const pdfText = extractTextFromPdf(pdfPath);

      if (!pdfText) {
        console.log(`  ⚠️  Skipping ${filename} - No text extracted`);
        continue;
      }

      // Step 2: Convert to LaTeX using Claude
      console.log('  → Converting to LaTeX with Claude...');
      const latexCode = await convertToLatex(pdfText, filename);

      // Step 3: Save LaTeX file
      const outputFilename = path.basename(filename, '.pdf') + '.tex';
      const outputPath = path.join(outputFolder, outputFilename);

      fs.writeFileSync(outputPath, latexCode, 'utf-8');
      console.log(`  ✅ Saved: ${outputFilename}\n`);
    } catch (error) {
      console.error(`  ❌ Error processing ${filename}: ${error.message}\n`);
    }
  }

  console.log(`✨ Conversion complete! Check ${outputFolder} for LaTeX files.`);
}

/**
 * Main entry point
 */
async function main() {
  const args = process.argv.slice(2);

  if (args.length < 1) {
    console.log('Usage: node pdf_to_latex_batch.js <pdf_folder> [output_folder]');
    console.log('\nExample:');
    console.log('  node pdf_to_latex_batch.js ./pdfs ./latex_files');
    process.exit(1);
  }

  const pdfFolder = args[0];
  const outputFolder = args[1] || null;

  // Validate input folder
  if (!fs.existsSync(pdfFolder) || !fs.statSync(pdfFolder).isDirectory()) {
    console.error(`❌ Folder not found: ${pdfFolder}`);
    process.exit(1);
  }

  // Check for API key
  if (!process.env.ANTHROPIC_API_KEY) {
    console.error('❌ ANTHROPIC_API_KEY environment variable not set');
    console.error("Set it with: export ANTHROPIC_API_KEY='your-api-key'");
    process.exit(1);
  }

  // Process PDFs
  await processPdfFolder(pdfFolder, outputFolder);
}

main().catch(error => {
  console.error('Fatal error:', error);
  process.exit(1);
});
