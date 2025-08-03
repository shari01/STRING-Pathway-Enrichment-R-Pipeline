# STRING-Pathway-Enrichment-R-Pipeline
 fully modular R implementation of a pathway enrichment

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
 
</head>
<body>

  <h2>🔍 What it does</h2>
  <ul>
    <li>Automates gene-to-STRING ID mapping and enrichment retrieval</li>
    <li>Supports GO (BP, MF, CC), KEGG (including disease/reaction), Reactome, and WikiPathways</li>
    <li>Saves results into clearly separated folders for ontology and pathway databases</li>
    <li>Merges all results into a standardized CSV format for downstream analysis</li>
  </ul>

  <h2>🧠 Key Features</h2>
  <ul>
    <li>Supports extended KEGG categories like <code>KEGG_DISEASE</code> and <code>KEGG_REACTIONS</code></li>
    <li>Dynamic category-to-folder mapping based on ontology type</li>
    <li>Modular file structure for maintainability and automation</li>
  </ul>

  <h2>📁 Folder Structure</h2>
  <div class="folder">
    ├── config.R<br>
    ├── 01_read_genes.R<br>
    ├── 02_chunk_genes.R<br>
    ├── 03_map_to_string_ids.R<br>
    ├── 04_fetch_enrichment.R<br>
    ├── 05_write_files.R<br>
    ├── 06_combine_results.R<br>
    └── 07_runner.R
  </div>

  <h2>⚙️ Use Cases</h2>
  <ul>
    <li>Pathway discovery from transcriptomic gene sets</li>
    <li>Multi-database enrichment extraction for systems biology</li>
    <li>Agentic pipelines in genomics and cancer research</li>
  </ul>

  <h2>🧬 Ontology Coverage</h2>
  <ul>
    <li><strong>GO:</strong> Biological Process, Molecular Function, Cellular Component</li>
    <li><strong>KEGG:</strong> General + Disease + Reaction</li>
    <li><strong>Others:</strong> Reactome, WikiPathways</li>
  </ul>

  <h2>🧠 Developed By</h2>
  <p>
    <strong>Sheryar Malik</strong>
   <br>
    Bioinformatics Scientist <br>
   
  </p>
</body>
</html>
