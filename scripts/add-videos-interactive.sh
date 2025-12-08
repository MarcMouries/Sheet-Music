#!/bin/bash
# Interactive script to add videos to top tunes
# This will open YouTube searches and you paste the video URL

echo "=========================================="
echo "ADD VIDEOS TO TOP 10 TUNES"
echo "=========================================="
echo ""
echo "For each tune, I'll open a YouTube search."
echo "Pick the best video and paste the URL here."
echo ""

# Top 10 tunes with their file paths
declare -A TUNES
TUNES["Satie Gymnopedie No 1"]="Classical/Erik_Satie_Gymnopédie/gymnopedie_1_Violin.ly"
TUNES["Bach Badinerie"]="Classical/Bach_Badinerie/Bach-Badinerie.ly"
TUNES["Minor Swing"]="Gypsy-Jazz/Minor-Swing/Minor Swing - van Hemert.ly"
TUNES["The Butterfly"]="Folk_Ireland/The Butterfly/TheButterfly.ly"
TUNES["Brahms Lullaby"]="Classical/Brahms_Berceuse/Brahms-Berceuse.ly"
TUNES["Greensleeves Jig"]="Folk_England/Greensleeves Jig/Greensleeves Jig.ly"
TUNES["The First Noel"]="Christmas/The First Noel_2/The First Noel_Duet.ly"
TUNES["Happy Birthday"]="Pop/Happy Birthday/happy birthday.ly"
TUNES["Sous le ciel de Paris"]="Pop/French/Sous le ciel de Paris/Sous le ciel de Paris.ly"
TUNES["Paganini Caprice 24"]="Classical/Paganini_Caprice_24/Paganini 24 - mvt 2.ly"

# Search queries
declare -A SEARCHES
SEARCHES["Satie Gymnopedie No 1"]="satie+gymnopedie+no+1+violin"
SEARCHES["Bach Badinerie"]="bach+badinerie+violin"
SEARCHES["Minor Swing"]="minor+swing+stephane+grappelli"
SEARCHES["The Butterfly"]="the+butterfly+irish+fiddle+slip+jig"
SEARCHES["Brahms Lullaby"]="brahms+lullaby+wiegenlied+violin"
SEARCHES["Greensleeves Jig"]="greensleeves+jig+irish+fiddle"
SEARCHES["The First Noel"]="the+first+noel+violin"
SEARCHES["Happy Birthday"]="happy+birthday+violin"
SEARCHES["Sous le ciel de Paris"]="sous+le+ciel+de+paris+violin"
SEARCHES["Paganini Caprice 24"]="paganini+caprice+24+violin"

for tune in "${!TUNES[@]}"; do
    echo ""
    echo "=========================================="
    echo "TUNE: $tune"
    echo "File: ${TUNES[$tune]}"
    echo "=========================================="

    # Open YouTube search in browser
    search_url="https://www.youtube.com/results?search_query=${SEARCHES[$tune]}"
    echo "Opening YouTube search..."
    open "$search_url" 2>/dev/null || xdg-open "$search_url" 2>/dev/null || echo "Please open: $search_url"

    echo ""
    echo "Paste the YouTube video URL (or press Enter to skip):"
    read -r video_url

    if [ -n "$video_url" ]; then
        # Add video to the file using Python
        python3 << EOF
import re
from pathlib import Path

ly_file = Path("/Users/marc.mouries/projects/Sheet-Music/${TUNES[$tune]}")
if not ly_file.exists():
    print(f"  ⚠️  File not found: {ly_file}")
    exit(1)

content = ly_file.read_text(encoding='utf-8', errors='ignore')

# Find the header block and add video before tagline
header_match = re.search(r'(\\\\header\s*\{[^}]*)(tagline\s*=\s*"[^"]*")', content, re.DOTALL)

if header_match:
    before_tagline = header_match.group(1)
    tagline = header_match.group(2)

    # Check if video already exists
    if 'video =' in before_tagline:
        print(f"  ⚠️  Video already exists")
    else:
        # Add video field with proper indentation
        new_header = before_tagline + f'  video = "$video_url"\n  ' + tagline
        new_content = content.replace(header_match.group(0), new_header)
        ly_file.write_text(new_content, encoding='utf-8')
        print(f"  ✅ Added video to $tune")
else:
    print(f"  ⚠️  Could not find header/tagline in file")
EOF
    else
        echo "  ⏭️  Skipped"
    fi
done

echo ""
echo "=========================================="
echo "DONE!"
echo "=========================================="
