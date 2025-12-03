#!/usr/bin/env python3
"""
Generate an enhanced HTML index of all LilyPond sheet music files
with difficulty ratings, tags, MIDI player, and thumbnails
"""
import os
import re
import json
import html
from pathlib import Path
from datetime import datetime
from urllib.parse import quote

# Configuration
REPO_ROOT = Path(__file__).parent
OUTPUT_FILE = REPO_ROOT / "index.html"
METADATA_FILE = REPO_ROOT / ".music-metadata.json"
EXCLUDE_DIRS = {'.git', 'stylesheets', 'common', 'lilypong_how-to', 'Lilypond_How-to', 'node_modules', '__pycache__', 'Scales', 'Practice'}

# Country-to-flag emoji mapping
COUNTRY_FLAGS = {
    'Austria': '🇦🇹',
    'Brazil': '🇧🇷',
    'Canada': '🇨🇦',
    'Cuba': '🇨🇺',
    'Czech Republic': '🇨🇿',
    'England': '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
    'Finland': '🇫🇮',
    'France': '🇫🇷',
    'Germany': '🇩🇪',
    'Hungary': '🇭🇺',
    'Ireland': '🇮🇪',
    'Italy': '🇮🇹',
    'Japan': '🇯🇵',
    'Jewish': '✡️',
    'Norway': '🇳🇴',
    'Poland': '🇵🇱',
    'Romania': '🇷🇴',
    'Russia': '🇷🇺',
    'Scotland': '🏴󠁧󠁢󠁳󠁣󠁴󠁿',
    'Spain': '🇪🇸',
    'USA': '🇺🇸',
}

def get_country_display(country):
    """Return country name with flag emoji"""
    if not country:
        return '—'
    flag = COUNTRY_FLAGS.get(country, '🌍')
    return f"{flag} {country}"

# Dance type patterns
DANCE_TYPES = {
    'jig': ['jig', 'slip jig', 'hop jig'],
    'reel': ['reel'],
    'waltz': ['waltz', 'valse'],
    'polka': ['polka'],
    'march': ['march'],
    'mazurka': ['mazurka'],
    'tango': ['tango'],
    'bolero': ['bolero'],
    'swing': ['swing'],
    'blues': ['blues'],
    'ragtime': ['ragtime'],
    'hornpipe': ['hornpipe'],
    'strathspey': ['strathspey'],
    'schottische': ['schottische'],
}

# Genre patterns
GENRE_PATTERNS = {
    'classical': ['classical', 'baroque', 'romantic', 'sonata', 'concerto', 'symphony'],
    'folk': ['folk', 'traditional'],
    'jazz': ['jazz', 'swing', 'blues', 'bebop'],
    'gypsy jazz': ['gypsy jazz', 'gypsy'],
    'pop': ['pop'],
    'soundtrack': ['soundtrack', 'film', 'theme'],
}

# Occasion patterns
OCCASION_PATTERNS = {
    'christmas': ['christmas', 'noel', 'santa', 'jingle', 'silent night'],
    'wedding': ['wedding', 'bridal', 'canon in d'],
}

def extract_dimensional_tags(tune_title, category, style, country, tags):
    """Extract multi-dimensional tags: dance type, genre, occasion"""
    dimensions = {
        'dance_type': [],
        'genre': [],
        'occasion': []
    }

    # Combine search text
    search_text = f"{tune_title} {category} {style}".lower()

    # Extract dance types
    for dance_type, patterns in DANCE_TYPES.items():
        if any(pattern in search_text for pattern in patterns):
            dimensions['dance_type'].append(dance_type)

    # Extract genre
    for genre, patterns in GENRE_PATTERNS.items():
        if any(pattern in search_text for pattern in patterns):
            dimensions['genre'].append(genre)

    # Extract occasion
    for occasion, patterns in OCCASION_PATTERNS.items():
        if any(pattern in search_text for pattern in patterns):
            dimensions['occasion'].append(occasion)

    # Fallback: infer genre from category
    if not dimensions['genre']:
        if 'Classical' in category:
            dimensions['genre'].append('classical')
        elif 'Folk' in category or 'Celtic' in category:
            dimensions['genre'].append('folk')
        elif 'Jazz' in category or 'Gypsy' in category:
            dimensions['genre'].append('jazz')

    return dimensions

# Difficulty estimation based on file characteristics
def estimate_difficulty(ly_file):
    """Estimate difficulty level (1-5) based on musical content"""
    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read()

        score = 1  # Start at beginner

        # Check for position shifts
        if re.search(r'\\shift', content) or re.search(r'\\[0-9]', content):
            score += 1

        # Check for complex rhythms
        if re.search(r'\\tuplet', content) or '128' in content:
            score += 1

        # Check for double stops
        if '<' in content and '>' in content:
            score += 0.5

        # Check for high positions (very high notes)
        if re.search(r"[a-g]'''", content):
            score += 0.5

        # Check for many accidentals
        accidentals = len(re.findall(r'[is|es|sharp|flat]', content))
        if accidentals > 20:
            score += 0.5

        # Check for vibrato/ornaments
        if re.search(r'\\trill|\\mordent|\\turn', content):
            score += 0.5

        return min(5, int(round(score)))
    except:
        return 3  # Default to intermediate

def convert_key_to_standard(note, mode):
    """Convert LilyPond key notation to standard notation (e.g., 'C', 'Dm', 'F#')"""
    # Capitalize note and replace sharps/flats
    note = note.capitalize().replace('f', '♭').replace('s', '♯')

    # Convert mode to standard notation
    if mode == 'major':
        return note  # Just the note for major keys
    elif mode == 'minor':
        return note + 'm'  # Add 'm' for minor
    else:
        # For modal keys (dorian, mixolydian, etc.), include the mode
        return f"{note} {mode}"

def parse_lilypond_header(ly_file):
    """Extract metadata from LilyPond header"""
    metadata = {
        'title': ly_file.stem.replace('_', ' ').replace('-', ' '),
        'composer': '',
        'country': '',
        'style': '',
        'key': '',
        'subtitle': '',
        'tempo': '',
        'video': '',
        'tags': []
    }

    try:
        with open(ly_file, 'r', encoding='utf-8') as f:
            content = f.read(3000)  # Read first 3000 chars

            # Extract header section
            header_match = re.search(r'\\header\s*\{([^}]*)\}', content, re.DOTALL)
            if header_match:
                header = header_match.group(1)

                # Extract fields - try both simple string and \markup formats
                for field in ['title', 'composer', 'country', 'style', 'subtitle', 'video']:
                    # Try simple string format first: field = "value"
                    # Pattern handles escaped quotes: allows \" inside the string
                    pattern = rf'{field}\s*=\s*"((?:[^"\\]|\\.)*)"'
                    match = re.search(pattern, header)
                    if match:
                        # Unescape the string: replace \" with "
                        value = match.group(1).replace('\\"', '"')
                        metadata[field] = value
                    else:
                        # Try \markup format: field = \markup ... "value"
                        # Find the last quoted string in the markup (handles complex nested markup)
                        markup_pattern = rf'{field}\s*=\s*\\markup.*?"([^"]*)"'
                        markup_matches = re.findall(markup_pattern, header, re.DOTALL)
                        if markup_matches:
                            # Take the last match (usually the actual content)
                            metadata[field] = markup_matches[-1]

            # Extract key signature
            key_match = re.search(r'\\key\s+([a-g][sf]*)\s+\\(major|minor|dorian|mixolydian|lydian|phrygian|locrian)', content)
            if key_match:
                note = key_match.group(1)
                mode = key_match.group(2)
                metadata['key'] = convert_key_to_standard(note, mode)

            # Extract tempo
            tempo_match = re.search(r'\\tempo\s+.*?=\s*(\d+)', content)
            if tempo_match:
                metadata['tempo'] = tempo_match.group(1)

            # Auto-detect tags from content
            if 'jig' in content.lower() or metadata['style'] == 'jig':
                metadata['tags'].append('jig')
            if 'reel' in content.lower() or metadata['style'] == 'reel':
                metadata['tags'].append('reel')
            if 'waltz' in content.lower() or '3/4' in content:
                metadata['tags'].append('waltz')
            if 'swing' in content.lower():
                metadata['tags'].append('swing')
            if 'blues' in content.lower():
                metadata['tags'].append('blues')

    except Exception as e:
        print(f"Warning: Could not parse {ly_file}: {e}")

    return metadata

def get_category_and_tags(file_path):
    """Determine category and tags from folder structure"""
    parts = file_path.parts
    category = 'Other'
    tags = []

    if 'Christmas' in parts:
        category = 'Christmas'
        tags.append('christmas')
        tags.append('traditional')
    elif 'Celtic' in parts or 'Folk_Ireland' in parts:
        category = 'Celtic/Irish'
        tags.append('traditional')
        tags.append('celtic')
        tags.append('irish')
    elif 'Classical' in parts:
        category = 'Classical'
        tags.append('classical')
    elif 'Jazz' in parts:
        category = 'Jazz'
        tags.append('jazz')
    elif 'Gypsy-Jazz' in parts:
        category = 'Gypsy Jazz'
        tags.append('jazz')
        tags.append('gypsy')
    elif 'Folk_USA' in parts or 'Folk_Canada' in parts or 'Folk_French' in parts:
        if 'Folk_USA' in parts:
            category = 'Folk/USA'
            tags.append('american')
        elif 'Folk_Canada' in parts:
            category = 'Folk/Canada'
            tags.append('canadian')
        elif 'Folk_French' in parts:
            category = 'Folk/French'
            tags.append('french')
        tags.append('folk')
        tags.append('traditional')
    elif any('Trad_' in str(p) for p in parts):
        for p in parts:
            if str(p).startswith('Trad_'):
                country = str(p).replace('Trad_', '')
                category = f'Traditional/{country}'
                tags.append('traditional')
                tags.append(country.lower())
                break
    elif 'Pop' in parts:
        category = 'Pop/Modern'
        tags.append('pop')
    elif 'Latina' in parts:
        category = 'Latin'
        tags.append('latin')
    elif 'Wedding' in parts:
        category = 'Wedding'
        tags.append('wedding')
    elif 'Practice' in parts:
        category = 'Practice/Exercises'
        tags.append('practice')

    return category, tags

def load_custom_metadata():
    """Load custom metadata from JSON file"""
    if METADATA_FILE.exists():
        with open(METADATA_FILE, 'r') as f:
            return json.load(f)
    return {}

def save_metadata_template(tunes):
    """Create a template metadata file for manual editing"""
    template = {}
    for tune in tunes[:5]:  # Just show first 5 as examples
        template[tune['ly_path']] = {
            'difficulty': tune.get('difficulty', 3),
            'tags': tune.get('tags', []),
            'notes': 'Add your notes here'
        }

    template_file = REPO_ROOT / '.music-metadata-template.json'
    with open(template_file, 'w') as f:
        json.dump(template, f, indent=2)
    print(f"  Template created: {template_file}")

def scan_repository():
    """Scan repository for all .ly files"""
    tunes = []
    custom_metadata = load_custom_metadata()

    # Component files to exclude (not standalone pieces)
    EXCLUDE_FILENAMES = {'book.ly', 'book-1.ly', 'book-2.ly', 'guitar1.ly', 'guitar2.ly', 'guitar3.ly',
                         'guitar4.ly', 'dynamicsa.ly', 'dynamicsb.ly', 'dynamicsc.ly',
                         'blank.ly', 'blank1.ly', 'copyright.ly', 'spacing.ly',
                         'gymnopedie-2.ly', 'gymnopedie-3.ly', 'make-score-preview-lilypond-example.ly'}

    for ly_file in REPO_ROOT.rglob('*.ly'):
        # Skip excluded directories
        if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
            continue

        # Skip component files
        if ly_file.name in EXCLUDE_FILENAMES:
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
        png_path = ly_file.parent / (ly_file.stem + '-preview.png')

        # Get category and auto-tags
        category, auto_tags = get_category_and_tags(rel_path)

        # Combine auto-detected tags with header tags
        all_tags = list(set(metadata['tags'] + auto_tags))

        # Get custom metadata if exists
        custom = custom_metadata.get(str(rel_path), {})

        # Estimate difficulty
        difficulty = custom.get('difficulty', estimate_difficulty(ly_file))

        # Extract dimensional tags
        dimensions = extract_dimensional_tags(
            metadata['title'],
            category,
            metadata['style'],
            metadata['country'],
            all_tags
        )

        tune_info = {
            'title': metadata['title'],
            'composer': metadata['composer'],
            'country': metadata['country'],
            'category': category,
            'style': metadata['style'],
            'key': metadata['key'],
            'tempo': metadata['tempo'],
            'subtitle': metadata['subtitle'],
            'video': metadata['video'],
            'difficulty': difficulty,
            'tags': custom.get('tags', all_tags),
            'notes': custom.get('notes', ''),
            'modified': modified,
            'ly_path': quote(str(rel_path)),
            'pdf_exists': pdf_path.exists(),
            'midi_exists': midi_path.exists(),
            'thumbnail_exists': png_path.exists(),
            'pdf_path': quote(str(rel_path.with_suffix('.pdf'))),
            'midi_path': quote(str(rel_path.with_suffix('.midi'))),
            'thumbnail_path': quote(str(rel_path.parent / (ly_file.stem + '-preview.png'))),
            # Dimensional tags
            'dance_types': dimensions['dance_type'],
            'genres': dimensions['genre'],
            'occasions': dimensions['occasion']
        }

        # Skip files without proper title or composer
        if not metadata['title'] or not metadata['composer']:
            print(f"  Skipping (missing metadata): {rel_path}")
            continue

        tunes.append(tune_info)

    return sorted(tunes, key=lambda x: (x['category'], x['title']))

def is_christmas_song(title, category, style, tags):
    """Smart Christmas song detection"""
    # Known Christmas song titles (case-insensitive partial matching)
    christmas_keywords = {
        'noel', 'noël', 'christmas', 'xmas', 'jingle', 'bells',
        'silent night', 'holy night', 'deck the halls', 'joy to the world',
        'hark', 'herald', 'angels', 'we wish you', 'merry christmas',
        'santa', 'rudolph', 'frosty', 'snowman', 'sleigh', 'winter wonderland',
        'let it snow', 'white christmas', 'little drummer', 'twelve days',
        'carol', 'o come', 'adeste', 'away in a manger', 'good king wenceslas',
        'god rest', 'first noel', 'o holy', 'o tannenbaum', 'stille nacht'
    }

    title_lower = title.lower()

    # Check category
    if 'Christmas' in category:
        return True

    # Check style
    if 'christmas' in style.lower():
        return True

    # Check tags
    if any('christmas' in tag.lower() for tag in tags):
        return True

    # Check title against known Christmas keywords
    if any(keyword in title_lower for keyword in christmas_keywords):
        return True

    return False

def is_wedding_song(title, category, style, tags):
    """Smart Wedding song detection"""
    # Exclusion keywords - not wedding appropriate
    exclusion_keywords = {
        'exercise', 'drill', 'study', 'etude',
        'bach double', 'practice points', 'technical pack',
        'arpeggio', 'scale'
    }

    title_lower = title.lower()

    # Exclude practice exercises and technical studies
    if any(keyword in title_lower for keyword in exclusion_keywords):
        return False

    if 'practice exercise' in style.lower():
        return False

    # Known wedding song titles and keywords
    wedding_keywords = {
        'wedding', 'bridal', 'bride', 'marriage', 'married',
        'canon in d', 'pachelbel', 'wedding march', 'mendelssohn',
        'ave maria', 'hallelujah', 'cohen',
        'a thousand years', 'all of me', 'at last',
        'can\'t help falling', 'elvis', 'unforgettable',
        'wonderful tonight', 'clapton', 'thinking out loud',
        'perfect', 'ed sheeran', 'marry you', 'bruno mars',
        'bridal chorus', 'wagner', 'here comes the bride',
        'jesu joy', 'air on g string',
        'clair de lune', 'debussy', 'moonlight sonata',
        'trumpet voluntary', 'clarke', 'ode to joy'
    }

    # Check style
    if 'wedding' in style.lower():
        return True

    # Check tags
    if any('wedding' in tag.lower() for tag in tags):
        return True

    # Check title against known wedding keywords
    if any(keyword in title_lower for keyword in wedding_keywords):
        return True

    return False

def generate_html(tunes):
    """Generate enhanced HTML index with MIDI player and features"""

    # Define top 10 most famous tunes (by title for matching)
    top_10_titles = {
        "1ere. Gymnopédie",
        "Badinerie",
        "Minor Swing",
        "The Butterfly",
        "Wiegenlied (Lullaby / Berceuse)",
        "Swallowtail Jig",
        "Greensleeves Jig",
        "The First Noel",
        "Happy Birthday",
        "Sous le ciel de Paris"
    }

    # Get unique tags for filter
    all_tags = sorted(set(tag for tune in tunes for tag in tune['tags']))

    html_output = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marc's Sheet Music Collection 🎵</title>
    <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Ctext y='0.9em' font-size='90'%3E🎵%3C/text%3E%3C/svg%3E">
    <!-- Tone.js libraries for MIDI playback -->
    <script src="https://unpkg.com/tone"></script>
    <script src="https://unpkg.com/@tonejs/midi"></script>
    <!-- Tune detail view support -->
    <script src="tune-detail-view.js"></script>
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
            min-height: 100vh;
        }

        .container {
            max-width: 1600px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 10px;
            border-bottom: 4px solid #667eea;
            padding-bottom: 15px;
            font-size: 2.5em;
        }

        .stats {
            margin: 20px 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 8px;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .stat-item {
            text-align: center;
            padding: 10px 20px;
        }

        .stat-number {
            font-size: 2em;
            font-weight: bold;
            display: block;
        }

        .filters {
            margin: 20px 0;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            align-items: center;
        }

        .filters input, .filters select {
            padding: 10px 15px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }

        .filters input {
            flex: 1;
            min-width: 250px;
        }

        .filters input:focus, .filters select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .view-toggle {
            display: flex;
            gap: 5px;
        }

        .quick-filters {
            display: flex;
            gap: 10px;
            margin-left: auto;
        }

        .quick-filter-btn {
            padding: 10px 20px;
            border: 2px solid #667eea;
            background: white;
            color: #667eea;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .quick-filter-btn:hover {
            background: #667eea;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(102, 126, 234, 0.3);
        }

        .quick-filter-btn.active {
            background: #667eea;
            color: white;
        }

        .view-toggle button {
            padding: 10px 15px;
            border: 2px solid #667eea;
            background: white;
            color: #667eea;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .view-toggle button.active {
            background: #667eea;
            color: white;
        }

        .view-toggle button:hover {
            background: #667eea;
            color: white;
        }

        /* Table View */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: #34495e;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            position: sticky;
            top: 0;
            cursor: pointer;
            user-select: none;
            z-index: 10;
        }

        th:hover {
            background: #2c3e50;
        }

        th::after {
            content: ' ⇅';
            opacity: 0.5;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ecf0f1;
            vertical-align: middle;
        }

        tr:hover {
            background: #f8f9fa;
        }

        /* Card View */
        .cards-grid {
            display: none;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .cards-grid.active {
            display: grid;
        }

        .card {
            background: white;
            border: 2px solid #ecf0f1;
            border-radius: 8px;
            padding: 20px;
            transition: all 0.3s;
            cursor: pointer;
        }

        .card:hover {
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transform: translateY(-2px);
            border-color: #667eea;
        }

        .card-thumbnail {
            width: 100%;
            height: 200px;
            background: #f8f9fa;
            border-radius: 6px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3em;
            color: #ddd;
            position: relative;
            overflow: hidden;
        }

        .card-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 6px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .card-thumbnail img:hover {
            transform: scale(1.05);
        }

        .card-thumbnail::after {
            content: '🔍';
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.6);
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 16px;
            opacity: 0;
            transition: opacity 0.3s;
            pointer-events: none;
        }

        .card-thumbnail:hover::after {
            opacity: 1;
        }

        .card-title {
            font-size: 1.2em;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
        }

        .card-composer {
            color: #7f8c8d;
            font-size: 0.9em;
            margin-bottom: 10px;
        }

        .card-meta {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        .category {
            display: inline-block;
            padding: 5px 12px;
            background: #3498db;
            color: white;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .category.classical { background: #9b59b6; }
        .category.jazz { background: #e67e22; }
        .category.folk, .category.celtic { background: #27ae60; }
        .category.traditional { background: #16a085; }
        .category.pop { background: #e74c3c; }
        .category.practice { background: #95a5a6; }
        .category.latin { background: #c0392b; }

        .difficulty {
            display: inline-flex;
            align-items: center;
            gap: 2px;
            font-size: 14px;
        }

        .difficulty-star {
            color: #f39c12;
        }

        .difficulty-star.empty {
            color: #ddd;
        }

        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            margin: 8px 0;
        }

        .tag {
            padding: 3px 8px;
            background: #ecf0f1;
            color: #555;
            border-radius: 3px;
            font-size: 11px;
        }

        .links {
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
        }

        .links a, .btn {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 12px;
            background: #ecf0f1;
            color: #2c3e50;
            text-decoration: none;
            border-radius: 4px;
            font-size: 12px;
            transition: all 0.2s;
            border: none;
            cursor: pointer;
        }

        .links a:hover, .btn:hover {
            background: #667eea;
            color: white;
            transform: translateY(-1px);
        }

        .date {
            color: #7f8c8d;
            font-size: 13px;
        }

        .no-results {
            text-align: center;
            padding: 60px 20px;
            color: #7f8c8d;
            font-size: 1.2em;
        }

        /* MIDI Player Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: white;
            padding: 30px;
            border-radius: 12px;
            max-width: 500px;
            width: 90%;
            position: relative;
        }

        .modal-close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 28px;
            cursor: pointer;
            color: #999;
            background: none;
            border: none;
            padding: 5px 10px;
        }

        .modal-close:hover {
            color: #333;
        }

        .midi-player {
            margin-top: 20px;
        }

        .midi-player button {
            -webkit-tap-highlight-color: transparent;
            touch-action: manipulation;
        }

        /* MIDI Player Controls */
        #midi-controls {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            z-index: 1000;
            display: none;
            min-width: 300px;
        }

        #midi-controls.active {
            display: block;
        }

        #midi-controls h3 {
            margin: 0 0 10px 0;
            font-size: 16px;
            color: #2c3e50;
        }

        .tempo-control {
            margin-top: 15px;
        }

        .tempo-control label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        .tempo-slider {
            width: 100%;
            margin-bottom: 5px;
        }

        .tempo-value {
            text-align: center;
            font-size: 14px;
            color: #667eea;
            font-weight: 600;
        }

        .midi-controls-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .midi-controls-buttons button {
            flex: 1;
            padding: 8px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
        }

        .midi-stop-btn {
            background: #e74c3c;
            color: white;
        }

        .midi-close-btn {
            background: #95a5a6;
            color: white;
        }

        audio {
            width: 100%;
        }

        /* Image Lightbox Modal */
        #lightbox-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.95);
            z-index: 2000;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        #lightbox-modal.active {
            display: flex;
        }

        #lightbox-content {
            max-width: 90vw;
            max-height: 90vh;
            position: relative;
        }

        #lightbox-image {
            max-width: 100%;
            max-height: 90vh;
            object-fit: contain;
            border-radius: 8px;
            box-shadow: 0 10px 50px rgba(0,0,0,0.5);
        }

        #lightbox-close {
            position: absolute;
            top: -40px;
            right: 0;
            font-size: 36px;
            cursor: pointer;
            color: white;
            background: rgba(0,0,0,0.5);
            border: none;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }

        #lightbox-close:hover {
            background: rgba(255,255,255,0.2);
            transform: rotate(90deg);
        }

        #lightbox-title {
            position: absolute;
            bottom: -50px;
            left: 0;
            right: 0;
            color: white;
            text-align: center;
            font-size: 1.2em;
            text-shadow: 0 2px 4px rgba(0,0,0,0.8);
        }

        @media (max-width: 768px) {
            .modal-content {
                width: 95%;
                padding: 20px;
                max-height: 90vh;
                overflow-y: auto;
            }

            .modal-close {
                font-size: 32px;
                padding: 10px;
                top: 5px;
                right: 5px;
            }

            #lightbox-close {
                top: 10px;
                right: 10px;
                width: 44px;
                height: 44px;
                font-size: 28px;
            }

            #lightbox-title {
                bottom: 10px;
                font-size: 1em;
            }

            .midi-player button {
                padding: 12px 24px !important;
                font-size: 16px !important;
                min-height: 44px;
                display: block;
                width: 100%;
                margin: 8px 0 !important;
            }

            #volume-slider {
                width: 100% !important;
                max-width: 250px;
            }
            body {
                padding: 10px;
            }

            .container {
                padding: 15px;
                border-radius: 8px;
            }

            h1 {
                font-size: 1.5em;
                margin-bottom: 15px;
            }

            .stats {
                flex-direction: column;
                padding: 15px;
                gap: 10px;
            }

            .stat-item {
                padding: 8px 10px;
            }

            .stat-number {
                font-size: 1.5em;
            }

            .filters {
                flex-direction: column;
                padding: 15px;
                gap: 10px;
            }

            .filters input {
                min-width: 100%;
                width: 100%;
            }

            .filters select {
                width: 100%;
            }

            .view-toggle {
                width: 100%;
                justify-content: center;
            }

            .view-toggle .btn {
                flex: 1;
            }

            .quick-filters {
                width: 100%;
                margin-left: 0;
                flex-wrap: wrap;
                justify-content: center;
            }

            .quick-filter-btn {
                flex: 1;
                min-width: 120px;
                padding: 8px 12px;
                font-size: 13px;
            }

            /* Hide table view on mobile - force card view */
            table {
                display: none !important;
            }

            .cards-grid {
                grid-template-columns: 1fr;
                gap: 15px;
            }

            .card {
                padding: 15px;
            }

            .card-title {
                font-size: 1.1em;
            }

            .card-info {
                font-size: 0.9em;
            }

            .links {
                flex-wrap: wrap;
                gap: 8px;
            }

            .links .btn,
            .links a {
                flex: 1;
                min-width: calc(50% - 4px);
                font-size: 13px;
                padding: 8px;
                text-align: center;
            }

            .difficulty-stars {
                transform: scale(0.9);
            }

            .tags {
                flex-wrap: wrap;
            }

            .tag {
                font-size: 11px;
                padding: 3px 8px;
            }

            /* Modal improvements for mobile */
            .modal-content {
                width: 95%;
                max-width: 95%;
                padding: 20px;
                margin: 20px auto;
            }

            .modal-close {
                font-size: 32px;
            }

            /* Make sure viewport is properly set */
            #music-count {
                font-size: 0.9em;
            }
        }

        /* Extra small devices (phones in portrait) */
        @media (max-width: 480px) {
            h1 {
                font-size: 1.3em;
            }

            .stat-number {
                font-size: 1.3em;
            }

            .quick-filter-btn {
                font-size: 12px;
                padding: 6px 10px;
            }

            .card-title {
                font-size: 1em;
            }

            .card-info {
                font-size: 0.85em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Marc's Sheet Music Collection 🎵</h1>

        <div class="stats">
            <div class="stat-item">
                <span class="stat-number" id="total-count">""" + str(len(tunes)) + """</span>
                <span>Total Tunes</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">""" + str(len(set(t['category'] for t in tunes))) + """</span>
                <span>Categories</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">""" + str(sum(1 for t in tunes if t['pdf_exists'])) + """</span>
                <span>PDFs Available</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">""" + str(sum(1 for t in tunes if t['midi_exists'])) + """</span>
                <span>MIDI Files</span>
            </div>
        </div>

        <div class="filters">
            <input type="text" id="search" placeholder="🔍 Search by title, composer, key, or tag..." onkeyup="filterItems()">

            <select id="category-filter" onchange="filterItems()">
                <option value="">All Categories</option>
"""

    # Add categories
    categories = sorted(set(t['category'] for t in tunes))
    for cat in categories:
        html_output += f'                <option value="{cat}">{cat}</option>\n'

    html_output += """            </select>

            <select id="country-filter" onchange="filterItems()">
                <option value="">All Countries</option>
"""

    # Add countries
    countries = sorted(set(t['country'] for t in tunes if t['country']))
    for country in countries:
        flag = COUNTRY_FLAGS.get(country, '🌍')
        html_output += f'                <option value="{country}">{flag} {country}</option>\n'

    html_output += """            </select>

            <select id="difficulty-filter" onchange="filterItems()">
                <option value="">All Difficulties</option>
                <option value="1">⭐ Beginner</option>
                <option value="2">⭐⭐ Easy</option>
                <option value="3">⭐⭐⭐ Intermediate</option>
                <option value="4">⭐⭐⭐⭐ Advanced</option>
                <option value="5">⭐⭐⭐⭐⭐ Expert</option>
            </select>

            <select id="tag-filter" onchange="filterItems()">
                <option value="">All Tags</option>
"""

    for tag in all_tags:
        html_output += f'                <option value="{tag}">{tag}</option>\n'

    html_output += """            </select>

            <select id="dance-type-filter" onchange="filterItems()">
                <option value="">All Dance Types</option>
"""

    # Add dance types
    all_dance_types = sorted(set(dt for tune in tunes for dt in tune['dance_types']))
    for dance_type in all_dance_types:
        html_output += f'                <option value="{dance_type}">{dance_type.title()}</option>\n'

    html_output += """            </select>

            <select id="genre-filter" onchange="filterItems()">
                <option value="">All Genres</option>
"""

    # Add genres
    all_genres = sorted(set(g for tune in tunes for g in tune['genres']))
    for genre in all_genres:
        html_output += f'                <option value="{genre}">{genre.title()}</option>\n'

    html_output += """            </select>

            <select id="occasion-filter" onchange="filterItems()">
                <option value="">All Occasions</option>
"""

    # Add occasions
    all_occasions = sorted(set(o for tune in tunes for o in tune['occasions']))
    for occasion in all_occasions:
        html_output += f'                <option value="{occasion}">{occasion.title()}</option>\n'

    html_output += """            </select>

            <div class="view-toggle">
                <button id="table-view" class="active" onclick="switchView('table')">📋 Table</button>
                <button id="card-view" onclick="switchView('cards')">🎴 Cards</button>
            </div>

            <div class="quick-filters">
                <button class="quick-filter-btn" onclick="showTop10()">⭐ Top 10</button>
                <button class="quick-filter-btn" onclick="showChristmas()">🎄 Christmas</button>
                <button class="quick-filter-btn" onclick="showWedding()">💍 Wedding</button>
                <button class="quick-filter-btn" onclick="clearQuickFilters()">🔄 Show All</button>
            </div>
        </div>

        <div id="table-container">
            <table id="music-table">
                <thead>
                    <tr>
                        <th onclick="sortTable(0)">Title</th>
                        <th onclick="sortTable(1)">Composer</th>
                        <th onclick="sortTable(2)">Country</th>
                        <th onclick="sortTable(3)">Collection</th>
                        <th onclick="sortTable(4)">Style</th>
                        <th onclick="sortTable(5)">Key</th>
                        <th onclick="sortTable(5)">Difficulty</th>
                        <th onclick="sortTable(6)">Modified</th>
                        <th>Files</th>
                    </tr>
                </thead>
                <tbody>
"""

    # Generate table rows
    for tune in tunes:
        category_class = tune['category'].split('/')[0].lower().replace(' ', '-')

        # Generate difficulty stars
        stars = ''.join(['<span class="difficulty-star">★</span>' for _ in range(tune['difficulty'])])
        stars += ''.join(['<span class="difficulty-star empty">★</span>' for _ in range(5 - tune['difficulty'])])

        # Generate tags
        tags_html = ''.join([f'<span class="tag">{tag}</span>' for tag in tune['tags'][:3]])

        # Check if this tune is in top 10, is Christmas music, or is Wedding music
        is_top10 = tune['title'] in top_10_titles
        is_christmas = is_christmas_song(tune['title'], tune['category'], tune['style'], tune['tags'])
        is_wedding = is_wedding_song(tune['title'], tune['category'], tune['style'], tune['tags'])

        html_output += f"""                <tr data-category="{html.escape(tune['category'])}" data-difficulty="{tune['difficulty']}" data-tags="{html.escape(','.join(tune['tags']))}" data-style="{html.escape(tune['style'])}" data-country="{html.escape(tune['country']) if tune['country'] else ''}" data-dance-types="{html.escape(','.join(tune['dance_types']))}" data-genres="{html.escape(','.join(tune['genres']))}" data-occasions="{html.escape(','.join(tune['occasions']))}" data-top10="{str(is_top10).lower()}" data-christmas="{str(is_christmas).lower()}" data-wedding="{str(is_wedding).lower()}">
                    <td>
                        <strong>{html.escape(tune['title'])}</strong>"""
        if tune['subtitle']:
            html_output += f"""<br><small style="color: #7f8c8d;">{html.escape(tune['subtitle'])}</small>"""
        html_output += f"""</td>
                    <td>{html.escape(tune['composer']) if tune['composer'] else '—'}</td>
                    <td>{get_country_display(tune['country'])}</td>
                    <td><span class="category {category_class}">{html.escape(tune['category'])}</span></td>
                    <td>{html.escape(tune['style'].title()) if tune['style'] else '—'}</td>
                    <td>{html.escape(tune['key']) if tune['key'] else '—'}</td>
                    <td><div class="difficulty">{stars}</div></td>
                    <td class="date">{tune['modified'].strftime('%Y-%m-%d')}</td>
                    <td class="links">"""
        # Add video link if available
        if tune['video']:
            html_output += f"""
                        <a href="{tune['video']}" title="Watch video" target="_blank">🎥 Video</a>"""
        # Add PDF link
        if tune['pdf_exists']:
            html_output += f"""
                        <a href="{tune['pdf_path']}" title="View PDF" target="_blank">📄 PDF</a>"""
        # Add MIDI player
        if tune['midi_exists']:
            # Escape title for JavaScript string (use JSON encoding to handle quotes properly)
            safe_title = json.dumps(tune['title'])
            html_output += f"""
                        <button class="btn" onclick="playMidi('{tune['midi_path']}', {safe_title})" title="Play MIDI">🎵 Play</button>"""
        html_output += """
                    </td>
                </tr>
"""

    html_output += """                </tbody>
            </table>
        </div>

        <div id="cards-container" class="cards-grid">
"""

    # Generate cards
    for tune in tunes:
        category_class = tune['category'].split('/')[0].lower().replace(' ', '-')
        stars = ''.join(['<span class="difficulty-star">★</span>' for _ in range(tune['difficulty'])])
        stars += ''.join(['<span class="difficulty-star empty">★</span>' for _ in range(5 - tune['difficulty'])])

        # Check if this tune is in top 10, is Christmas music, or is Wedding music
        is_top10 = tune['title'] in top_10_titles
        is_christmas = is_christmas_song(tune['title'], tune['category'], tune['style'], tune['tags'])
        is_wedding = is_wedding_song(tune['title'], tune['category'], tune['style'], tune['tags'])

        html_output += f"""            <div class="card" data-category="{html.escape(tune['category'])}" data-difficulty="{tune['difficulty']}" data-tags="{html.escape(','.join(tune['tags']))}" data-country="{html.escape(tune['country']) if tune['country'] else ''}" data-dance-types="{html.escape(','.join(tune['dance_types']))}" data-genres="{html.escape(','.join(tune['genres']))}" data-occasions="{html.escape(','.join(tune['occasions']))}" data-top10="{str(is_top10).lower()}" data-christmas="{str(is_christmas).lower()}" data-wedding="{str(is_wedding).lower()}">
                <div class="card-thumbnail">
"""
        if tune['thumbnail_exists']:
            html_output += f"""                    <img src="{html.escape(tune['thumbnail_path'])}" alt="{html.escape(tune['title'])}" onclick="openLightbox('{html.escape(tune['thumbnail_path'], quote=True)}', '{html.escape(tune['title'], quote=True)}')">
"""
        else:
            html_output += """                    🎼
"""
        html_output += f"""                </div>
                <div class="card-title">{html.escape(tune['title'])}</div>
                <div class="card-composer">{html.escape(tune['composer']) if tune['composer'] else 'Traditional'}</div>
                <div class="card-country" style="font-size: 0.85em; color: #7f8c8d; margin: 4px 0;">{get_country_display(tune['country'])}</div>
                <div class="card-meta">
                    <span class="category {category_class}">{html.escape(tune['category'])}</span>
                    <div class="difficulty">{stars}</div>
                </div>
"""
        if tune['tags']:
            tags_html = ''.join([f'<span class="tag">{html.escape(tag)}</span>' for tag in tune['tags'][:5]])
            html_output += f"""                <div class="tags">{tags_html}</div>
"""
        html_output += """                <div class="links">
"""
        # Add video link if available
        if tune['video']:
            html_output += f"""                    <a href="{tune['video']}" title="Watch video" target="_blank">🎥 Video</a>
"""
        # Add PDF link
        if tune['pdf_exists']:
            html_output += f"""                    <a href="{tune['pdf_path']}" target="_blank">📄 PDF</a>
"""
        # Add MIDI player
        if tune['midi_exists']:
            safe_title = json.dumps(tune['title'])
            html_output += f"""                    <button class="btn" onclick="playMidi('{tune['midi_path']}', {safe_title})">🎵 Play</button>
"""
        html_output += """                </div>
            </div>
"""

    html_output += """        </div>

        <div id="no-results" class="no-results" style="display: none;">
            <div style="font-size: 3em; margin-bottom: 20px;">🎻</div>
            No tunes found matching your filters.
        </div>

        <!-- Image Lightbox Modal -->
        <div id="lightbox-modal">
            <div id="lightbox-content">
                <button id="lightbox-close" onclick="closeLightbox()">&times;</button>
                <img id="lightbox-image" src="" alt="">
                <div id="lightbox-title"></div>
            </div>
        </div>

        <!-- MIDI Player Controls -->
        <div id="midi-controls">
            <h3 id="midi-title">🎵 Now Playing</h3>
            <div class="tempo-control">
                <label for="tempo-slider">Tempo: <span id="tempo-value">100%</span></label>
                <input type="range" id="tempo-slider" class="tempo-slider" min="25" max="200" value="100" step="5">
            </div>
            <div class="midi-controls-buttons">
                <button class="midi-stop-btn" onclick="stopMidi()">⏹ Stop</button>
                <button class="midi-close-btn" onclick="closeMidiControls()">✕ Close</button>
            </div>
        </div>
    </div>

    <script>
        let currentView = 'table';

        function filterItems() {
            const searchInput = document.getElementById('search').value.toLowerCase();
            const categoryFilter = document.getElementById('category-filter').value;
            const countryFilter = document.getElementById('country-filter').value;
            const difficultyFilter = document.getElementById('difficulty-filter').value;
            const tagFilter = document.getElementById('tag-filter').value;
            const danceTypeFilter = document.getElementById('dance-type-filter').value;
            const genreFilter = document.getElementById('genre-filter').value;
            const occasionFilter = document.getElementById('occasion-filter').value;

            const items = currentView === 'table'
                ? document.querySelectorAll('#music-table tbody tr')
                : document.querySelectorAll('.card');

            let visibleCount = 0;

            items.forEach(item => {
                const title = item.querySelector(currentView === 'table' ? 'td:first-child' : '.card-title').textContent.toLowerCase();
                const composer = currentView === 'table'
                    ? item.querySelector('td:nth-child(2)').textContent.toLowerCase()
                    : item.querySelector('.card-composer').textContent.toLowerCase();
                const category = item.dataset.category;
                const country = item.dataset.country;
                const difficulty = item.dataset.difficulty;
                const tags = item.dataset.tags.toLowerCase();
                const danceTypes = item.dataset.danceTypes || '';
                const genres = item.dataset.genres || '';
                const occasions = item.dataset.occasions || '';

                const matchesSearch = title.includes(searchInput) ||
                                    composer.includes(searchInput) ||
                                    tags.includes(searchInput);
                const matchesCategory = !categoryFilter || category === categoryFilter;
                const matchesCountry = !countryFilter || country === countryFilter;
                const matchesDifficulty = !difficultyFilter || difficulty === difficultyFilter;
                const matchesTag = !tagFilter || tags.includes(tagFilter.toLowerCase());
                const matchesDanceType = !danceTypeFilter || danceTypes.includes(danceTypeFilter);
                const matchesGenre = !genreFilter || genres.includes(genreFilter);
                const matchesOccasion = !occasionFilter || occasions.includes(occasionFilter);

                if (matchesSearch && matchesCategory && matchesCountry && matchesDifficulty && matchesTag && matchesDanceType && matchesGenre && matchesOccasion) {
                    item.style.display = '';
                    visibleCount++;
                } else {
                    item.style.display = 'none';
                }
            });

            document.getElementById('total-count').textContent = visibleCount;
            document.getElementById('no-results').style.display = visibleCount === 0 ? 'block' : 'none';

            if (currentView === 'table') {
                document.getElementById('table-container').style.display = visibleCount === 0 ? 'none' : 'block';
            } else {
                document.getElementById('cards-container').style.display = visibleCount === 0 ? 'none' : 'grid';
            }
        }

        function sortTable(columnIndex) {
            const table = document.getElementById('music-table');
            const tbody = table.tBodies[0];
            const rows = Array.from(tbody.rows).filter(row => row.style.display !== 'none');

            rows.sort((a, b) => {
                let aVal = a.cells[columnIndex].textContent.trim();
                let bVal = b.cells[columnIndex].textContent.trim();

                // Handle difficulty stars specially
                if (columnIndex === 5) {
                    aVal = a.dataset.difficulty;
                    bVal = b.dataset.difficulty;
                    return parseInt(aVal) - parseInt(bVal);
                }

                return aVal.localeCompare(bVal);
            });

            rows.forEach(row => tbody.appendChild(row));
        }

        function switchView(view) {
            currentView = view;

            if (view === 'table') {
                document.getElementById('table-container').style.display = 'block';
                document.getElementById('cards-container').style.display = 'none';
                document.getElementById('table-view').classList.add('active');
                document.getElementById('card-view').classList.remove('active');
            } else {
                document.getElementById('table-container').style.display = 'none';
                document.getElementById('cards-container').style.display = 'grid';
                document.getElementById('cards-container').classList.add('active');
                document.getElementById('table-view').classList.remove('active');
                document.getElementById('card-view').classList.add('active');
            }

            filterItems(); // Reapply filters
        }

        function showTop10() {
            // Clear other filters
            document.getElementById('search').value = '';
            document.getElementById('category-filter').value = '';
            document.getElementById('difficulty-filter').value = '';
            document.getElementById('tag-filter').value = '';

            // Highlight active button
            document.querySelectorAll('.quick-filter-btn').forEach(btn => btn.classList.remove('active'));
            if (event && event.target) event.target.classList.add('active');

            // Filter items
            const items = currentView === 'table'
                ? document.querySelectorAll('#music-table tbody tr')
                : document.querySelectorAll('.card');

            let visibleCount = 0;

            items.forEach(item => {
                if (item.dataset.top10 === 'true') {
                    item.style.display = '';
                    visibleCount++;
                } else {
                    item.style.display = 'none';
                }
            });

            document.getElementById('total-count').textContent = visibleCount;
            document.getElementById('no-results').style.display = visibleCount === 0 ? 'block' : 'none';

            if (currentView === 'table') {
                document.getElementById('table-container').style.display = visibleCount === 0 ? 'none' : 'block';
            } else {
                document.getElementById('cards-container').style.display = visibleCount === 0 ? 'none' : 'grid';
            }
        }

        function showChristmas() {
            // Clear other filters
            document.getElementById('search').value = '';
            document.getElementById('category-filter').value = '';
            document.getElementById('difficulty-filter').value = '';
            document.getElementById('tag-filter').value = '';

            // Highlight active button
            document.querySelectorAll('.quick-filter-btn').forEach(btn => btn.classList.remove('active'));
            if (event && event.target) event.target.classList.add('active');

            // Filter items
            const items = currentView === 'table'
                ? document.querySelectorAll('#music-table tbody tr')
                : document.querySelectorAll('.card');

            let visibleCount = 0;

            items.forEach(item => {
                if (item.dataset.christmas === 'true') {
                    item.style.display = '';
                    visibleCount++;
                } else {
                    item.style.display = 'none';
                }
            });

            document.getElementById('total-count').textContent = visibleCount;
            document.getElementById('no-results').style.display = visibleCount === 0 ? 'block' : 'none';

            if (currentView === 'table') {
                document.getElementById('table-container').style.display = visibleCount === 0 ? 'none' : 'block';
            } else {
                document.getElementById('cards-container').style.display = visibleCount === 0 ? 'none' : 'grid';
            }
        }

        function showWedding() {
            // Clear other filters
            document.getElementById('search').value = '';
            document.getElementById('category-filter').value = '';
            document.getElementById('difficulty-filter').value = '';
            document.getElementById('tag-filter').value = '';

            // Update URL
            const url = new URL(window.location);
            url.searchParams.set('category', 'wedding');
            window.history.pushState({}, '', url);

            // Highlight active button
            document.querySelectorAll('.quick-filter-btn').forEach(btn => btn.classList.remove('active'));
            if (event && event.target) event.target.classList.add('active');

            // Filter items
            const items = currentView === 'table'
                ? document.querySelectorAll('#music-table tbody tr')
                : document.querySelectorAll('.card');

            let visibleCount = 0;

            items.forEach(item => {
                if (item.dataset.wedding === 'true') {
                    item.style.display = '';
                    visibleCount++;
                } else {
                    item.style.display = 'none';
                }
            });

            document.getElementById('total-count').textContent = visibleCount;
            document.getElementById('no-results').style.display = visibleCount === 0 ? 'block' : 'none';

            if (currentView === 'table') {
                document.getElementById('table-container').style.display = visibleCount === 0 ? 'none' : 'block';
            } else {
                document.getElementById('cards-container').style.display = visibleCount === 0 ? 'none' : 'grid';
            }
        }

        function clearQuickFilters() {
            // Remove active state from quick filter buttons
            document.querySelectorAll('.quick-filter-btn').forEach(btn => btn.classList.remove('active'));

            // Clear all filters
            document.getElementById('search').value = '';
            document.getElementById('category-filter').value = '';
            document.getElementById('difficulty-filter').value = '';
            document.getElementById('tag-filter').value = '';

            // Clear URL parameters
            const url = new URL(window.location);
            url.search = '';
            window.history.pushState({}, '', url);

            // Show all items
            filterItems();
        }

        // MIDI Player using Tone.js + @tonejs/midi
        let midiPlayer = {
            part: null,
            synth: null,
            isPlaying: false,
            currentFile: null,
            currentTitle: null,
            tempo: 1.0 // 1.0 = normal speed
        };

        async function playMidi(midiPath, title) {
            try {
                // Start audio context (required by browsers)
                await Tone.start();

                // Stop current playback if any
                if (midiPlayer.isPlaying) {
                    Tone.Transport.stop();
                    Tone.Transport.position = "0:0:0";
                    midiPlayer.isPlaying = false;
                }

                // Load new MIDI if different file
                if (midiPlayer.currentFile !== midiPath) {
                    console.log('Loading MIDI:', title);

                    // Load MIDI file
                    const midi = await Midi.fromUrl(midiPath);

                    // Create synth if not exists
                    if (!midiPlayer.synth) {
                        midiPlayer.synth = new Tone.PolySynth(Tone.Synth, {
                            volume: -8,
                            oscillator: { type: 'sine' },
                            envelope: {
                                attack: 0.005,
                                decay: 0.1,
                                sustain: 0.3,
                                release: 1
                            }
                        }).toDestination();
                    }

                    // Get notes from first track
                    const notes = midi.tracks[0].notes;

                    if (notes.length === 0) {
                        alert('No notes found in MIDI file');
                        return;
                    }

                    // Create part
                    midiPlayer.part = new Tone.Part((time, note) => {
                        midiPlayer.synth.triggerAttackRelease(
                            note.name,
                            note.duration,
                            time,
                            note.velocity
                        );
                    }, notes);

                    midiPlayer.part.loop = false;
                    midiPlayer.part.start(0);

                    midiPlayer.currentFile = midiPath;
                    midiPlayer.currentTitle = title;

                    console.log('MIDI loaded:', notes.length, 'notes');
                }

                // Apply tempo
                Tone.Transport.bpm.value = 120 * midiPlayer.tempo;

                // Start playback
                Tone.Transport.start();
                midiPlayer.isPlaying = true;
                console.log('Playing:', title);

                // Show MIDI controls
                const midiControls = document.getElementById('midi-controls');
                const midiTitle = document.getElementById('midi-title');
                midiTitle.textContent = '🎵 ' + title;
                midiControls.classList.add('active');

            } catch (err) {
                console.error('MIDI playback error:', err);
                alert('Error playing MIDI: ' + err.message);
            }
        }

        function closeMidiPlayer() {
            // Stop playback
            if (midiPlayer.isPlaying) {
                Tone.Transport.stop();
                Tone.Transport.position = "0:0:0";
                midiPlayer.isPlaying = false;
            }
        }

        function stopMidi() {
            closeMidiPlayer();
            closeMidiControls();
        }

        function closeMidiControls() {
            const midiControls = document.getElementById('midi-controls');
            midiControls.classList.remove('active');
        }

        // Tempo slider control
        document.addEventListener('DOMContentLoaded', () => {
            const tempoSlider = document.getElementById('tempo-slider');
            const tempoValue = document.getElementById('tempo-value');

            tempoSlider.addEventListener('input', (e) => {
                const tempo = e.target.value / 100;
                midiPlayer.tempo = tempo;
                tempoValue.textContent = e.target.value + '%';

                // Update BPM in real-time if playing
                if (midiPlayer.isPlaying) {
                    Tone.Transport.bpm.value = 120 * tempo;
                }
            });
        });

        // Close MIDI player on escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                if (midiPlayer.isPlaying) {
                    closeMidiPlayer();
                }
            }
        });

        // Auto-switch to card view on mobile
        function checkMobileView() {
            if (window.innerWidth <= 768) {
                showCards();
            }
        }

        // Check on load and on resize
        checkMobileView();
        window.addEventListener('resize', checkMobileView);

        // URL parameter support for shareable filter links
        function applyURLFilters() {
            try {
                const params = new URLSearchParams(window.location.search);

                if (params.has('filter')) {
                    const filter = params.get('filter').toLowerCase();

                    if (filter === 'christmas') {
                        setTimeout(() => {
                            try { showChristmas(); } catch(e) { console.error(e); }
                        }, 200);
                    } else if (filter === 'top10') {
                        setTimeout(() => {
                            try { showTop10(); } catch(e) { console.error(e); }
                        }, 200);
                    }
                }

                // Note: category and search filters are now handled by tune-detail-view.js
                // to avoid conflicts with enhanced URL filtering

                if (params.has('search')) {
                    document.getElementById('search').value = params.get('search');
                    filterItems();
                }
            } catch(e) {
                console.error('Error applying URL filters:', e);
            }
        }

        // Update URL when filters are applied
        function updateURL(filterType) {
            try {
                const url = new URL(window.location);
                url.searchParams.set('filter', filterType);
                window.history.pushState({}, '', url);
            } catch(e) {
                console.error('Error updating URL:', e);
            }
        }

        // Wrap functions to update URL
        const _originalShowChristmas = showChristmas;
        showChristmas = function() {
            _originalShowChristmas.call(this);
            updateURL('christmas');
        };

        const _originalShowTop10 = showTop10;
        showTop10 = function() {
            _originalShowTop10.call(this);
            updateURL('top10');
        };

        // Apply URL filters on page load
        setTimeout(applyURLFilters, 300);

        // Image Lightbox Functions
        function openLightbox(imageSrc, title) {
            const lightbox = document.getElementById('lightbox-modal');
            const image = document.getElementById('lightbox-image');
            const titleEl = document.getElementById('lightbox-title');

            image.src = imageSrc;
            image.alt = title;
            titleEl.textContent = title;
            lightbox.classList.add('active');

            // Prevent body scroll when lightbox is open
            document.body.style.overflow = 'hidden';
        }

        function closeLightbox() {
            const lightbox = document.getElementById('lightbox-modal');
            lightbox.classList.remove('active');

            // Re-enable body scroll
            document.body.style.overflow = 'auto';
        }

        // Close lightbox when clicking outside the image
        document.getElementById('lightbox-modal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeLightbox();
            }
        });

        // Close lightbox with Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                const lightbox = document.getElementById('lightbox-modal');
                if (lightbox.classList.contains('active')) {
                    closeLightbox();
                }
            }
        });
    </script>
</body>
</html>
"""

    return html_output

def main():
    print("🎵 Scanning repository for sheet music files...")
    tunes = scan_repository()
    print(f"   Found {len(tunes)} tunes")

    print("📊 Generating enhanced HTML index...")
    html = generate_html(tunes)

    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write(html)

    print(f"✓ Enhanced index generated: {OUTPUT_FILE}")
    print(f"  Open file://{OUTPUT_FILE.absolute()} in your browser")

    # Create metadata template
    save_metadata_template(tunes)

if __name__ == '__main__':
    main()
