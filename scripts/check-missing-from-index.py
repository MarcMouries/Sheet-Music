#!/usr/bin/env python3
"""
Check for .ly files that are not included in the index page.
Identifies files missing required metadata fields.
"""

import os
import re
from pathlib import Path

def parse_header(file_path):
    """Parse LilyPond header block and extract metadata."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        return None, f"Error reading file: {e}"

    # Find \header block
    header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)
    if not header_match:
        return None, "No \\header block found"

    header_content = header_match.group(1)

    # Extract fields
    metadata = {}
    for field in ['title', 'composer', 'country', 'style']:
        pattern = rf'{field}\s*=\s*"([^"]*)"'
        match = re.search(pattern, header_content)
        if match:
            metadata[field] = match.group(1)

    # Check required fields
    required = ['title', 'composer', 'country', 'style']
    missing = [f for f in required if f not in metadata]

    if missing:
        return metadata, f"Missing required fields: {', '.join(missing)}"

    return metadata, "OK"

def main():
    script_dir = Path(__file__).parent
    repo_root = script_dir.parent

    print("Checking for .ly files missing from index...")
    print(f"Repository root: {repo_root}")
    print()

    # Directories to skip
    skip_dirs = {
        '.git', 'node_modules', '__pycache__',
        'stylesheets',  # Skip stylesheet test files
        'lilypong_how-to',  # Skip tutorial files
    }

    missing_files = []
    total_files = 0

    for root, dirs, files in os.walk(repo_root):
        # Filter out skip directories
        dirs[:] = [d for d in dirs if d not in skip_dirs]

        for file in files:
            if file.endswith('.ly') and not file.endswith('.bak'):
                total_files += 1
                file_path = Path(root) / file

                metadata, status = parse_header(file_path)

                if status != "OK":
                    # Calculate relative path for display
                    rel_path = os.path.relpath(file_path, repo_root)
                    missing_files.append({
                        'path': rel_path,
                        'metadata': metadata or {},
                        'reason': status
                    })

    print(f"Total .ly files scanned: {total_files}")
    print(f"Files missing from index: {len(missing_files)}")
    print()

    if missing_files:
        print("Files missing required metadata:")
        print("=" * 80)

        # Group by reason
        reasons = {}
        for item in missing_files:
            reason = item['reason']
            if reason not in reasons:
                reasons[reason] = []
            reasons[reason].append(item)

        for reason, files in sorted(reasons.items()):
            print(f"\n{reason} ({len(files)} files):")
            print("-" * 80)
            for item in files[:20]:  # Limit to first 20 per category
                print(f"  {item['path']}")
                if item['metadata']:
                    for key, value in item['metadata'].items():
                        print(f"    {key}: {value}")
            if len(files) > 20:
                print(f"  ... and {len(files) - 20} more files")

if __name__ == '__main__':
    main()
