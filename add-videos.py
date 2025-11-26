#!/usr/bin/env python3
"""
Script to help add video URLs to LilyPond files.
This script will:
1. List all tunes that need videos
2. For each tune, construct a good YouTube search query
3. Show you the query so you can find the video
4. Add the video URL to the .ly file
"""

from pathlib import Path
import re
import sys

REPO_ROOT = Path('/Users/marc.mouries/projects/Sheet-Music')
EXCLUDE_DIRS = {'.git', '.claude', 'stylesheets', 'Lilypond_How-to', 'node_modules', '__pycache__'}

def parse_header(ly_file):
    """Extract title, composer, and check if video exists"""
    try:
        content = ly_file.read_text(encoding='utf-8', errors='ignore')
        header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)
        if not header_match:
            return None, None, None, False

        header = header_match.group(1)

        # Extract title
        title_match = re.search(r'title\s*=\s*[\\markup\s]*"([^"]+)"', header)
        if not title_match:
            title_match = re.search(r'title\s*=\s*\\markup[^"]*"([^"]+)"', header)
        title = title_match.group(1) if title_match else ly_file.stem

        # Extract composer
        composer_match = re.search(r'composer\s*=\s*[\\markup\s]*"([^"]+)"', header)
        composer = composer_match.group(1) if composer_match else ''

        # Extract style
        style_match = re.search(r'style\s*=\s*"([^"]+)"', header)
        style = style_match.group(1) if style_match else ''

        # Check if video already exists
        video_match = re.search(r'video\s*=\s*"([^"]+)"', header)
        has_video = bool(video_match)

        return title, composer, style, has_video
    except Exception as e:
        print(f"Error parsing {ly_file}: {e}")
        return None, None, None, False

def get_youtube_search_query(title, composer, style, folder):
    """Generate a good YouTube search query"""
    query_parts = [title]

    # Add instrument based on style or folder
    if 'folk' in folder.lower() or 'irish' in folder.lower() or 'scotland' in folder.lower():
        query_parts.append('fiddle')
    elif 'classical' in folder.lower():
        query_parts.append('violin')
    elif 'gypsy' in folder.lower() or 'jazz' in folder.lower():
        query_parts.append('violin jazz')

    # Add composer if notable
    if composer and not any(x in composer.lower() for x in ['traditional', 'trad', 'marc mouries', 'unknown']):
        # Extract just the composer name, not dates
        composer_name = re.sub(r'\([^)]*\)', '', composer).strip()
        if composer_name:
            query_parts.append(composer_name)

    return ' '.join(query_parts)

def add_video_to_file(ly_file, video_url):
    """Add video URL to LilyPond file header"""
    content = ly_file.read_text(encoding='utf-8', errors='ignore')

    # Find the header block
    header_match = re.search(r'(\\header\s*\{[^}]*)(tagline\s*=\s*"[^"]*")', content, re.DOTALL)

    if header_match:
        # Add video field before tagline
        before_tagline = header_match.group(1)
        tagline = header_match.group(2)

        # Check if video already exists
        if 'video =' in before_tagline:
            print(f"  ⚠️  Video already exists in {ly_file.name}")
            return False

        # Add video field with proper indentation
        new_header = before_tagline + f'  video = "{video_url}"\n  ' + tagline
        new_content = content.replace(header_match.group(0), new_header)

        ly_file.write_text(new_content, encoding='utf-8')
        print(f"  ✓ Added video to {ly_file.name}")
        return True
    else:
        print(f"  ⚠️  Could not find header/tagline in {ly_file.name}")
        return False

def main():
    # Collect all tunes
    tunes = []
    for ly_file in sorted(REPO_ROOT.rglob('*.ly')):
        if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
            continue

        title, composer, style, has_video = parse_header(ly_file)
        if title and not has_video:
            folder = str(ly_file.relative_to(REPO_ROOT).parent)
            search_query = get_youtube_search_query(title, composer, style, folder)

            tunes.append({
                'file': ly_file,
                'rel_path': str(ly_file.relative_to(REPO_ROOT)),
                'title': title,
                'composer': composer,
                'style': style,
                'folder': folder,
                'search_query': search_query
            })

    print(f"\n{'='*80}")
    print(f"TUNES NEEDING VIDEO LINKS")
    print(f"{'='*80}")
    print(f"\nTotal tunes without videos: {len(tunes)}\n")

    if len(sys.argv) > 1 and sys.argv[1] == '--list':
        # Just list all tunes with suggested search queries
        for i, tune in enumerate(tunes, 1):
            print(f"\n{i}. {tune['title']}")
            if tune['composer']:
                print(f"   Composer: {tune['composer']}")
            print(f"   File: {tune['rel_path']}")
            print(f"   YouTube search: {tune['search_query']}")
            print(f"   https://www.youtube.com/results?search_query={tune['search_query'].replace(' ', '+')}")

    elif len(sys.argv) > 1 and sys.argv[1] == '--batch':
        # Batch mode: provide video URLs for multiple tunes
        print("Enter video URLs for tunes (format: tune_number url)")
        print("Example: 1 https://youtube.com/watch?v=...")
        print("Type 'done' when finished\n")

        # Show first 20 tunes
        for i, tune in enumerate(tunes[:20], 1):
            print(f"{i}. {tune['title']} ({tune['folder']})")

        print("\n")
        while True:
            line = input("> ").strip()
            if line.lower() == 'done':
                break

            try:
                parts = line.split(maxsplit=1)
                if len(parts) == 2:
                    idx = int(parts[0]) - 1
                    url = parts[1]

                    if 0 <= idx < len(tunes):
                        if add_video_to_file(tunes[idx]['file'], url):
                            print(f"  Added video to tune {idx + 1}")
                    else:
                        print(f"  Invalid tune number: {idx + 1}")
            except Exception as e:
                print(f"  Error: {e}")

    else:
        # Show usage
        print("Usage:")
        print("  python3 add-videos.py --list     # List all tunes with YouTube search links")
        print("  python3 add-videos.py --batch    # Interactive mode to add videos")

if __name__ == '__main__':
    main()
