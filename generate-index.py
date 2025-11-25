#!/usr/bin/env python3
"""
Generate an HTML index of all LilyPond sheet music files
"""
import os
import re
from pathlib import Path
from datetime import datetime

# Configuration
REPO_ROOT = Path(__file__).parent
OUTPUT_FILE = REPO_ROOT / "index.html"
EXCLUDE_DIRS = {'.git', 'stylesheets', 'Lilypond_How-to', 'node_modules', '__pycache__'}

def parse_lilypond_header(ly_file):
    """Extract metadata from LilyPond header"""
    metadata = {
        'title': ly_file.stem.replace('_', ' ').replace('-', ' '),
        'composer': '',
        'meter': '',
        'key': '',
        'subtitle': ''
    }

    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read(2000)  # Read first 2000 chars

            # Extract header section
            header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)
            if header_match:
                header = header_match.group(1)

                # Extract fields
                for field in ['title', 'composer', 'meter', 'subtitle']:
                    pattern = rf'{field}\s*=\s*"([^"]*)"'
                    match = re.search(pattern, header)
                    if match:
                        metadata[field] = match.group(1)

            # Try to extract key signature
            key_match = re.search(r'\\key\s+([a-g][sf]*)\s+\\(major|minor|dorian|mixolydian)', content)
            if key_match:
                metadata['key'] = f"{key_match.group(1)} {key_match.group(2)}"

    except Exception as e:
        print(f"Warning: Could not parse {ly_file}: {e}")

    return metadata

def get_category(file_path):
    """Determine category from folder structure"""
    parts = file_path.parts
    if 'Celtic' in parts:
        return 'Celtic/Irish'
    elif 'Classical' in parts:
        return 'Classical'
    elif 'Jazz' in parts:
        return 'Jazz'
    elif 'Gypsy-Jazz' in parts:
        return 'Gypsy Jazz'
    elif 'Folk_USA' in parts or 'Folk_French' in parts or 'Folk_Canada' in parts:
        return 'Folk/Traditional'
    elif any('Trad_' in str(p) for p in parts):
        # Extract country from Trad_Country
        for p in parts:
            if str(p).startswith('Trad_'):
                country = str(p).replace('Trad_', '')
                return f'Traditional/{country}'
        return 'Traditional'
    elif 'Pop' in parts:
        return 'Pop/Modern'
    elif 'Latina' in parts:
        return 'Latin'
    elif 'Practice' in parts:
        return 'Practice/Exercises'
    else:
        return 'Other'

def scan_repository():
    """Scan repository for all .ly files"""
    tunes = []

    for ly_file in REPO_ROOT.rglob('*.ly'):
        # Skip excluded directories
        if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
            continue

        # Get file stats
        stat = ly_file.stat()
        modified = datetime.fromtimestamp(stat.st_mtime)

        # Parse metadata
        metadata = parse_lilypond_header(ly_file)

        # Get relative path for links
        rel_path = ly_file.relative_to(REPO_ROOT)
        pdf_path = ly_file.with_suffix('.pdf')
        midi_path = ly_file.with_suffix('.midi')

        tune_info = {
            'title': metadata['title'],
            'composer': metadata['composer'],
            'category': get_category(rel_path),
            'meter': metadata['meter'],
            'key': metadata['key'],
            'subtitle': metadata['subtitle'],
            'modified': modified,
            'ly_path': str(rel_path),
            'pdf_exists': pdf_path.exists(),
            'midi_exists': midi_path.exists(),
            'pdf_path': str(rel_path.with_suffix('.pdf')),
            'midi_path': str(rel_path.with_suffix('.midi'))
        }

        tunes.append(tune_info)

    return sorted(tunes, key=lambda x: (x['category'], x['title']))

def generate_html(tunes):
    """Generate HTML index"""
    html = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sheet Music Collection</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            line-height: 1.6;
            color: #333;
            background: #f5f5f5;
            padding: 20px;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 10px;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }

        .stats {
            margin: 20px 0;
            padding: 15px;
            background: #ecf0f1;
            border-radius: 5px;
            font-size: 14px;
        }

        .filters {
            margin: 20px 0;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
        }

        .filters input {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 300px;
            font-size: 14px;
        }

        .filters select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-left: 10px;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: #34495e;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            position: sticky;
            top: 0;
            cursor: pointer;
            user-select: none;
        }

        th:hover {
            background: #2c3e50;
        }

        th::after {
            content: ' ⇅';
            opacity: 0.5;
        }

        td {
            padding: 10px 12px;
            border-bottom: 1px solid #ecf0f1;
        }

        tr:hover {
            background: #f8f9fa;
        }

        .category {
            display: inline-block;
            padding: 4px 10px;
            background: #3498db;
            color: white;
            border-radius: 3px;
            font-size: 12px;
            font-weight: 500;
        }

        .category.classical { background: #9b59b6; }
        .category.jazz { background: #e67e22; }
        .category.folk { background: #27ae60; }
        .category.traditional { background: #16a085; }
        .category.pop { background: #e74c3c; }
        .category.practice { background: #95a5a6; }

        .links a {
            display: inline-block;
            padding: 4px 8px;
            margin-right: 5px;
            background: #ecf0f1;
            color: #2c3e50;
            text-decoration: none;
            border-radius: 3px;
            font-size: 12px;
        }

        .links a:hover {
            background: #3498db;
            color: white;
        }

        .date {
            color: #7f8c8d;
            font-size: 13px;
        }

        .no-results {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🎵 Sheet Music Collection</h1>

        <div class="stats">
            <strong>Total Tunes:</strong> <span id="total-count">""" + str(len(tunes)) + """</span> |
            <strong>Last Updated:</strong> """ + datetime.now().strftime('%Y-%m-%d %H:%M') + """
        </div>

        <div class="filters">
            <input type="text" id="search" placeholder="Search by title, composer, or key..." onkeyup="filterTable()">
            <select id="category-filter" onchange="filterTable()">
                <option value="">All Categories</option>
"""

    # Get unique categories
    categories = sorted(set(t['category'] for t in tunes))
    for cat in categories:
        html += f'                <option value="{cat}">{cat}</option>\n'

    html += """            </select>
        </div>

        <table id="music-table">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">Title</th>
                    <th onclick="sortTable(1)">Composer</th>
                    <th onclick="sortTable(2)">Category</th>
                    <th onclick="sortTable(3)">Type</th>
                    <th onclick="sortTable(4)">Key</th>
                    <th onclick="sortTable(5)">Modified</th>
                    <th>Files</th>
                </tr>
            </thead>
            <tbody>
"""

    for tune in tunes:
        category_class = tune['category'].split('/')[0].lower().replace(' ', '-')

        html += f"""                <tr>
                    <td><strong>{tune['title']}</strong>"""
        if tune['subtitle']:
            html += f"""<br><small style="color: #7f8c8d;">{tune['subtitle']}</small>"""
        html += f"""</td>
                    <td>{tune['composer'] or '—'}</td>
                    <td><span class="category {category_class}">{tune['category']}</span></td>
                    <td>{tune['meter'] or '—'}</td>
                    <td>{tune['key'] or '—'}</td>
                    <td class="date">{tune['modified'].strftime('%Y-%m-%d')}</td>
                    <td class="links">
                        <a href="{tune['ly_path']}" title="View LilyPond source">📝 .ly</a>
"""
        if tune['pdf_exists']:
            html += f"""                        <a href="{tune['pdf_path']}" title="View PDF">📄 PDF</a>
"""
        if tune['midi_exists']:
            html += f"""                        <a href="{tune['midi_path']}" title="Play MIDI">🎵 MIDI</a>
"""
        html += """                    </td>
                </tr>
"""

    html += """            </tbody>
        </table>

        <div id="no-results" class="no-results" style="display: none;">
            No tunes found matching your search.
        </div>
    </div>

    <script>
        function filterTable() {
            const searchInput = document.getElementById('search').value.toLowerCase();
            const categoryFilter = document.getElementById('category-filter').value;
            const table = document.getElementById('music-table');
            const rows = table.getElementsByTagName('tr');
            let visibleCount = 0;

            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const title = row.cells[0].textContent.toLowerCase();
                const composer = row.cells[1].textContent.toLowerCase();
                const category = row.cells[2].textContent;
                const key = row.cells[4].textContent.toLowerCase();

                const matchesSearch = title.includes(searchInput) ||
                                    composer.includes(searchInput) ||
                                    key.includes(searchInput);
                const matchesCategory = !categoryFilter || category === categoryFilter;

                if (matchesSearch && matchesCategory) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            }

            document.getElementById('total-count').textContent = visibleCount;
            document.getElementById('no-results').style.display = visibleCount === 0 ? 'block' : 'none';
            document.getElementById('music-table').style.display = visibleCount === 0 ? 'none' : 'table';
        }

        function sortTable(columnIndex) {
            const table = document.getElementById('music-table');
            const tbody = table.tBodies[0];
            const rows = Array.from(tbody.rows);

            rows.sort((a, b) => {
                const aVal = a.cells[columnIndex].textContent.trim();
                const bVal = b.cells[columnIndex].textContent.trim();
                return aVal.localeCompare(bVal);
            });

            rows.forEach(row => tbody.appendChild(row));
        }
    </script>
</body>
</html>
"""

    return html

def main():
    print("Scanning repository for sheet music files...")
    tunes = scan_repository()
    print(f"Found {len(tunes)} tunes")

    print("Generating HTML index...")
    html = generate_html(tunes)

    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write(html)

    print(f"✓ Index generated: {OUTPUT_FILE}")
    print(f"  Open file://{OUTPUT_FILE.absolute()} in your browser")

if __name__ == '__main__':
    main()
