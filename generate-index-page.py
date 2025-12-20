#!/usr/bin/env python3
"""
Generate an enhanced HTML index of all LilyPond sheet music files
with difficulty ratings, tags, MIDI player, and thumbnails
"""
import os
import re
import json
import html
import csv
from pathlib import Path
from datetime import datetime
from urllib.parse import quote

# Configuration
REPO_ROOT = Path(__file__).parent
OUTPUT_FILE = REPO_ROOT / "index.html"
METADATA_FILE = REPO_ROOT / ".music-metadata.json"
CSV_METADATA_FILE = REPO_ROOT / "tune_catalog_rich_schema.csv"
EXCLUDE_DIRS = {'.git', 'stylesheets', 'common', 'lilypong_how-to', 'Lilypond_How-to', 'node_modules', '__pycache__', 'Scales', 'Practice'}

# Country-to-flag emoji mapping
COUNTRY_FLAGS = {
    'Austria': '🇦🇹',
    'Brazil': '🇧🇷',
    'Canada': '🇨🇦',
    'China': '🇨🇳',
    'Cuba': '🇨🇺',
    'Czech Republic': '🇨🇿',
    'England': '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
    'Finland': '🇫🇮',
    'France': '🇫🇷',
    'Germany': '🇩🇪',
    'Hungary': '🇭🇺',
    'Ireland': '🇮🇪',
    'Israel': '🇮🇱',
    'Italy': '🇮🇹',
    'Japan': '🇯🇵',
    'Jewish': '✡️',
    'Mexico': '🇲🇽',
    'New Zealand': '🇳🇿',
    'Norway': '🇳🇴',
    'Poland': '🇵🇱',
    'Romania': '🇷🇴',
    'Russia': '🇷🇺',
    'Scotland': '🏴󠁧󠁢󠁳󠁣󠁴󠁿',
    'Spain': '🇪🇸',
    'Ukraine': '🇺🇦',
    'USA': '🇺🇸',
    'Wales': '🏴󠁧󠁢󠁷󠁬󠁳󠁿',
}

def get_country_display(country):
    """Return country name with flag emoji"""
    if not country:
        return '—'
    flag = COUNTRY_FLAGS.get(country, '🌍')
    return f"{flag} {country}"

def extract_moods(primary_tags, secondary_tags):
    """Extract mood values from Primary and Secondary Tags fields.

    Returns list of mood strings (may be empty).
    """
    import re
    moods = []

    # Extract mood from primary tags
    match = re.search(r'mood:\s*([^;]+)', primary_tags, re.IGNORECASE)
    if match:
        mood_text = match.group(1).strip()
        # Split on commas to get individual moods
        for mood in mood_text.split(','):
            mood = mood.strip()
            if mood and mood not in ['N/A', 'neutral', 'practice-focused', 'technical']:
                moods.append(mood)

    # Also check secondary tags
    match = re.search(r'mood:\s*([^;]+)', secondary_tags, re.IGNORECASE)
    if match:
        mood_text = match.group(1).strip()
        for mood in mood_text.split(','):
            mood = mood.strip()
            if mood and mood not in ['N/A', 'neutral', 'practice-focused', 'technical']:
                moods.append(mood)

    return moods

def load_csv_metadata():
    """Load rich metadata from CSV file

    Returns dict mapping tune title to metadata dict with fields:
    - composer, genre, subgenre, period, type, key, time_sig, difficulty,
    - ensemble, country, use_case, session_friendliness, primary_tags,
    - secondary_tags, notes
    """
    csv_data = {}

    if not CSV_METADATA_FILE.exists():
        print(f"  Warning: CSV metadata file not found: {CSV_METADATA_FILE}")
        return csv_data

    try:
        with open(CSV_METADATA_FILE, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                title = row.get('Title', '').strip()
                if title:
                    primary_tags = row.get('Primary Tags', '')
                    secondary_tags = row.get('Secondary Tags', '')
                    moods = extract_moods(primary_tags, secondary_tags)

                    csv_data[title] = {
                        'composer': row.get('Composer', ''),
                        'genre': row.get('Style/Genre', ''),
                        'subgenre': row.get('Sub-Genre/Tradition', ''),
                        'period': row.get('Musical Period / Era', ''),
                        'type': row.get('Type of Piece', ''),
                        'key': row.get('Key Signature (common)', ''),
                        'time_sig': row.get('Time Signature', ''),
                        'difficulty': row.get('Difficulty (Violin)', ''),
                        'ensemble': row.get('Ensemble Type', ''),
                        'country': row.get('Country / Region of Origin', ''),
                        'use_case': row.get('Primary Use Case', ''),
                        'session_friendliness': row.get('Session Friendliness (if folk)', ''),
                        'primary_tags': primary_tags,
                        'secondary_tags': secondary_tags,
                        'notes': row.get('Notes', ''),
                        'moods': moods,  # Extracted mood list
                    }
        print(f"  Loaded CSV metadata for {len(csv_data)} tunes")
    except Exception as e:
        print(f"  Warning: Could not load CSV metadata: {e}")

    return csv_data

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

def extract_key_from_filename(filename):
    """Extract key from filename pattern: Tune-Name_(Key).ly
    Returns tuple: (base_name, key) or (filename, None) if no key pattern found

    Examples:
        'Erev-shel-Shoshanim_(Em).ly' -> ('Erev-shel-Shoshanim', 'Em')
        'Misty.ly' -> ('Misty', None)
    """
    # Pattern: anything followed by _(Key) where Key is like Em, F#m, C, etc.
    match = re.match(r'^(.+?)_\(([A-G][#b]?m?)\)(?:\.ly)?$', filename)
    if match:
        return (match.group(1), match.group(2))
    return (filename.replace('.ly', ''), None)

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
    tunes_by_base = {}  # Group tunes by base name to collect multiple keys
    custom_metadata = load_custom_metadata()
    csv_metadata = load_csv_metadata()  # Load CSV rich metadata

    # Component files to exclude (not standalone pieces)
    EXCLUDE_FILENAMES = {'book.ly', 'book-1.ly', 'book-2.ly', 'guitar1.ly', 'guitar2.ly', 'guitar3.ly',
                         'guitar4.ly', 'dynamicsa.ly', 'dynamicsb.ly', 'dynamicsc.ly',
                         'blank.ly', 'blank1.ly', 'copyright.ly', 'spacing.ly',
                         'gymnopedie-2.ly', 'gymnopedie-3.ly', 'make-score-preview-lilypond-example.ly',
                         'music.ily'}  # Exclude include files that contain only music definitions

    for ly_file in REPO_ROOT.rglob('*.ly'):
        # Skip excluded directories
        if any(excluded in ly_file.parts for excluded in EXCLUDE_DIRS):
            continue

        # Skip component files
        if ly_file.name in EXCLUDE_FILENAMES:
            continue

        # Skip _music.ily files (they're include files, not standalone scores)
        if ly_file.name.endswith('_music.ily'):
            continue

        # Skip preview wrapper files (identified by the comment marker)
        try:
            with open(ly_file, 'r', encoding='utf-8') as f:
                first_lines = f.read(500)
                if 'PREVIEW WRAPPER' in first_lines or 'preview wrapper' in first_lines.lower():
                    continue
        except:
            pass

        # Extract key from filename (if exists)
        base_name, file_key = extract_key_from_filename(ly_file.name)

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
            'file_key': file_key,  # Key from filename pattern
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
            'occasions': dimensions['occasion'],
            # For grouping multi-key versions
            'base_name': base_name,
            'directory': str(ly_file.parent)
        }

        # Merge CSV metadata if available (CSV takes priority for rich metadata)
        csv_data = csv_metadata.get(metadata['title'])
        if csv_data:
            tune_info['csv_genre'] = csv_data['genre']
            tune_info['csv_subgenre'] = csv_data['subgenre']
            tune_info['csv_period'] = csv_data['period']
            tune_info['csv_type'] = csv_data['type']
            tune_info['csv_key'] = csv_data['key']
            tune_info['csv_ensemble'] = csv_data['ensemble']
            tune_info['csv_use_case'] = csv_data['use_case']
            tune_info['csv_session'] = csv_data['session_friendliness']
            tune_info['csv_primary_tags'] = csv_data['primary_tags']
            tune_info['csv_secondary_tags'] = csv_data['secondary_tags']
            tune_info['csv_notes'] = csv_data['notes']
            tune_info['csv_moods'] = csv_data['moods']  # Extracted mood list
            # Override difficulty if CSV has it
            if csv_data['difficulty']:
                # Parse difficulty: "Beginner", "Intermediate", "Advanced", etc.
                diff_map = {
                    'beginner': 1,
                    'early intermediate': 2,
                    'intermediate': 3,
                    'advanced': 4,
                    'professional': 5,
                    'expert': 5
                }
                csv_diff_lower = csv_data['difficulty'].lower()
                for key, val in diff_map.items():
                    if key in csv_diff_lower:
                        tune_info['difficulty'] = val
                        break

        # Skip files without proper title or composer
        if not metadata['title'] or not metadata['composer']:
            print(f"  Skipping (missing metadata): {rel_path}")
            continue

        # IMPORTANT RULE: Multi-key tunes must be counted only once
        # Group tunes by directory + base_name to collect multiple keys
        # Examples:
        #   - Let-It-Snow_(F).ly and Let-It-Snow_(G).ly -> counted as 1 tune with 2 keys
        #   - Gary-Owen_(G).ly, Gary-Owen_(D).ly, etc. -> counted as 1 tune with 4 keys
        #   - Korobeiniki_(Am).ly, Korobeiniki_(Dm).ly, etc. -> counted as 1 tune with 5 keys
        group_key = f"{ly_file.parent}/{base_name}"
        if group_key not in tunes_by_base:
            # First time seeing this tune - add it with its key
            tune_info['available_keys'] = [file_key] if file_key else []
            tunes_by_base[group_key] = tune_info
            tunes.append(tune_info)
        else:
            # We've seen this tune before - just add the key to the existing entry
            # This ensures multi-key tunes are counted only once
            if file_key:
                tunes_by_base[group_key]['available_keys'].append(file_key)

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
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Pro:wght@400;600;700&family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <!-- Dark Mode Toggle -->
    <div class="theme-toggle" id="theme-toggle">
        <button class="theme-toggle-btn" id="theme-toggle-btn" onclick="toggleTheme()" title="Toggle dark mode">
            🌙
        </button>
        <span class="theme-toggle-label" id="theme-toggle-label">Dark</span>
        <span class="theme-toggle-auto" id="theme-auto-indicator"></span>
    </div>

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
                <span class="stat-number">""" + str(len(set(t['composer'] for t in tunes if t['composer']))) + """</span>
                <span>Composers</span>
            </div>
            <div class="stat-item">
                <span class="stat-number">""" + str(len(set(t['country'] for t in tunes if t['country']))) + """</span>
                <span>Countries</span>
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
            <input type="search" id="search" placeholder="🔍 Search by title, composer, key, or tag..." onkeyup="filterItems()">

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

    # Add countries with tune counts
    country_counts = {}
    for tune in tunes:
        if tune['country']:
            country_counts[tune['country']] = country_counts.get(tune['country'], 0) + 1

    for country in sorted(country_counts.keys()):
        flag = COUNTRY_FLAGS.get(country, '🌍')
        count = country_counts[country]
        html_output += f'                <option value="{country}">{flag} {country} ({count})</option>\n'

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

    # Add CSV genres from rich metadata (these are the proper genre classifications)
    csv_genres = sorted(set(tune.get('csv_genre', '') for tune in tunes if tune.get('csv_genre')))
    for genre in csv_genres:
        html_output += f'                <option value="{genre}">{genre}</option>\n'

    html_output += """            </select>

            <select id="subgenre-filter" onchange="filterItems()">
                <option value="">All Subgenres</option>
"""

    # Add CSV subgenres from rich metadata
    csv_subgenres = sorted(set(tune.get('csv_subgenre', '') for tune in tunes if tune.get('csv_subgenre')))
    for subgenre in csv_subgenres:
        html_output += f'                <option value="{subgenre}">{subgenre}</option>\n'

    html_output += """            </select>

            <select id="period-filter" onchange="filterItems()">
                <option value="">All Periods</option>
"""

    # Add musical periods from CSV in chronological order
    period_order = [
        'Renaissance (c. 1400–1600)',
        'Baroque (c. 1600–1750)',
        'Classical (c. 1730–1820)',
        'Romantic (c. 1800–1910)',
        'Late Romantic (c. 1850–1920)',
        '20th century (c. 1900–2000)',
        'Contemporary (c. 1975–present)',
        'Traditional (pre-modern)'
    ]
    csv_periods_set = set(tune.get('csv_period', '') for tune in tunes if tune.get('csv_period'))
    # Sort by chronological order
    csv_periods = [p for p in period_order if p in csv_periods_set]
    for period in csv_periods:
        html_output += f'                <option value="{period}">{period}</option>\n'

    html_output += """            </select>

            <select id="type-filter" onchange="filterItems()">
                <option value="">All Types</option>
"""

    # Add type of piece from CSV
    csv_types = sorted(set(tune.get('csv_type', '') for tune in tunes if tune.get('csv_type')))
    for piece_type in csv_types:
        html_output += f'                <option value="{piece_type}">{piece_type}</option>\n'

    html_output += """            </select>

            <select id="key-filter" onchange="filterItems()">
                <option value="">All Keys</option>
"""

    # Add keys from CSV in circle-of-fifths order with counts
    # Circle of Fifths order: C, then sharps (G,D,A,E,B,F#,C#), then flats (F,Bb,Eb,Ab,Db,Gb,Cb)
    # Note: major and minor keys with the same key signature are combined
    # Format: "C Major / A minor (34)"
    key_signature_groups = [
        ('C', 'A', 0),      # 0 sharps/flats
        ('G', 'E', 1),      # 1 sharp
        ('D', 'B', 2),      # 2 sharps
        ('A', 'F#', 3),     # 3 sharps
        ('E', 'C#', 4),     # 4 sharps
        ('B', 'G#', 5),     # 5 sharps
        ('F#', 'D#', 6),    # 6 sharps
        ('C#', 'A#', 7),    # 7 sharps
        ('F', 'D', -1),     # 1 flat
        ('Bb', 'G', -2),    # 2 flats
        ('Eb', 'C', -3),    # 3 flats
        ('Ab', 'F', -4),    # 4 flats
        ('Db', 'Bb', -5),   # 5 flats
        ('Gb', 'Eb', -6),   # 6 flats
        ('Cb', 'Ab', -7)    # 7 flats
    ]

    # Count tunes per key signature group
    all_keys = [tune.get('csv_key', '') for tune in tunes if tune.get('csv_key') and tune.get('csv_key') not in ['N/A', 'Various', 'Varies', '']]

    def normalize_key_name(key_str):
        """Normalize key: 'F-sharp major' → 'F#', 'B-flat minor' → 'Bb'"""
        key_str = key_str.replace('-sharp', '#').replace('-flat', 'b')
        key_str = key_str.split(' (')[0].strip()  # Remove parenthetical notes
        # Extract just the note name (remove major/minor)
        key_str = key_str.replace(' major', '').replace(' minor', '').strip()
        return key_str

    # Count keys by signature group
    sig_group_counts = {}  # (major_note, minor_note) -> count
    sig_group_filter = {}  # (major_note, minor_note) -> first full key value for filtering

    for key in all_keys:
        key_note = normalize_key_name(key)

        # Match to signature group
        for major_note, minor_note, _ in key_signature_groups:
            if key_note == major_note or key_note == minor_note:
                sig_key = (major_note, minor_note)
                sig_group_counts[sig_key] = sig_group_counts.get(sig_key, 0) + 1
                if sig_key not in sig_group_filter:
                    sig_group_filter[sig_key] = key
                break

    # Output keys in circle-of-fifths order with "Major / minor" format
    for major_note, minor_note, _ in key_signature_groups:
        sig_key = (major_note, minor_note)
        if sig_key in sig_group_counts:
            count = sig_group_counts[sig_key]
            filter_value = sig_group_filter[sig_key]
            display_name = f"{major_note} Major / {minor_note} minor"
            html_output += f'                <option value="{filter_value}">{display_name} ({count})</option>\n'

    html_output += """            </select>

            <select id="ensemble-filter" onchange="filterItems()">
                <option value="">All Ensembles</option>
"""

    # Add ensemble types from CSV
    csv_ensembles = sorted(set(tune.get('csv_ensemble', '') for tune in tunes if tune.get('csv_ensemble')))
    for ensemble in csv_ensembles:
        # Simplify display
        display_ensemble = ensemble.replace('Solo violin', 'Solo')
        html_output += f'                <option value="{ensemble}">{display_ensemble}</option>\n'

    html_output += """            </select>

            <select id="use-case-filter" onchange="filterItems()">
                <option value="">All Use Cases</option>
"""

    # Add use cases from CSV
    csv_use_cases = sorted(set(tune.get('csv_use_case', '') for tune in tunes if tune.get('csv_use_case')))
    for use_case in csv_use_cases:
        html_output += f'                <option value="{use_case}">{use_case}</option>\n'

    html_output += """            </select>

            <select id="mood-filter" onchange="filterItems()">
                <option value="">All Moods</option>
"""

    # Add moods from CSV with counts
    # Collect all moods from all tunes
    all_moods = []
    for tune in tunes:
        moods = tune.get('csv_moods', [])
        if moods:
            all_moods.extend(moods)

    # Count mood occurrences
    from collections import Counter
    mood_counts = Counter(all_moods)

    # Sort moods by frequency (most common first)
    for mood, count in mood_counts.most_common():
        html_output += f'                <option value="{html.escape(mood)}">{html.escape(mood.title())} ({count})</option>\n'

    html_output += """            </select>

            <select id="session-filter" onchange="filterItems()" style="display: none;">
                <option value="">All Session Levels</option>
"""

    # Add session friendliness from CSV (only for folk tunes)
    csv_session = sorted(set(tune.get('csv_session', '') for tune in tunes if tune.get('csv_session') and tune.get('csv_session') != 'N/A'))
    for session in csv_session:
        html_output += f'                <option value="{session}">{session}</option>\n'

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
                        <th onclick="sortTable(3)">Genre</th>
                        <th onclick="sortTable(4)">Key</th>
                        <th onclick="sortTable(5)">Difficulty</th>
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

        # Generate tune slug for URL
        tune_slug = tune['title'].lower()
        tune_slug = re.sub(r'[^a-z0-9]+', '-', tune_slug)
        tune_slug = tune_slug.strip('-')

        # Prepare key-related data
        available_keys_json = json.dumps(tune.get('available_keys', []))
        base_name = html.escape(tune.get('base_name', ''))
        file_key = html.escape(tune.get('file_key') or '')
        directory = html.escape(tune.get('directory', ''))

        # Get CSV genre/subgenre if available
        display_genre = tune.get('csv_genre', tune['style']) or '—'
        display_subgenre = tune.get('csv_subgenre', '')

        # Get moods as comma-separated string for data attribute
        moods_str = ','.join(tune.get('csv_moods', []))

        html_output += f"""                <tr data-category="{html.escape(tune['category'])}" data-difficulty="{tune['difficulty']}" data-tags="{html.escape(','.join(tune['tags']))}" data-style="{html.escape(tune['style'])}" data-country="{html.escape(tune['country']) if tune['country'] else ''}" data-dance-types="{html.escape(','.join(tune['dance_types']))}" data-genres="{html.escape(','.join(tune['genres']))}" data-occasions="{html.escape(','.join(tune['occasions']))}" data-csv-genre="{html.escape(tune.get('csv_genre', ''))}" data-csv-subgenre="{html.escape(display_subgenre)}" data-csv-period="{html.escape(tune.get('csv_period', ''))}" data-csv-type="{html.escape(tune.get('csv_type', ''))}" data-csv-key="{html.escape(tune.get('csv_key', ''))}" data-csv-ensemble="{html.escape(tune.get('csv_ensemble', ''))}" data-csv-use-case="{html.escape(tune.get('csv_use_case', ''))}" data-csv-session="{html.escape(tune.get('csv_session', ''))}" data-csv-moods="{html.escape(moods_str)}" data-top10="{str(is_top10).lower()}" data-christmas="{str(is_christmas).lower()}" data-wedding="{str(is_wedding).lower()}" data-tune-slug="{tune_slug}" data-available-keys='{available_keys_json}' data-base-name="{base_name}" data-file-key="{file_key}" data-directory="{directory}" onclick="navigateToTune(event, '{tune_slug}')">
                    <td>
                        <strong>{html.escape(tune['title'])}</strong>"""
        if tune['subtitle']:
            html_output += f"""<br><small style="color: #7f8c8d;">{html.escape(tune['subtitle'])}</small>"""
        html_output += f"""</td>
                    <td>{html.escape(tune['composer']) if tune['composer'] else '—'}</td>
                    <td>{get_country_display(tune['country'])}</td>
                    <td>{html.escape(display_genre.title())}{f'<br><small style="color: #7f8c8d;">{html.escape(display_subgenre)}</small>' if display_subgenre else ''}</td>
                    <td>{html.escape(tune['key']) if tune['key'] else '—'}</td>
                    <td><div class="difficulty">{stars}</div></td>
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

        # Get CSV genre/subgenre
        display_genre = tune.get('csv_genre', tune['style']) or tune['category']
        display_subgenre = tune.get('csv_subgenre', '')

        # Get moods as comma-separated string for data attribute
        moods_str = ','.join(tune.get('csv_moods', []))

        html_output += f"""            <div class="card" data-category="{html.escape(tune['category'])}" data-difficulty="{tune['difficulty']}" data-tags="{html.escape(','.join(tune['tags']))}" data-country="{html.escape(tune['country']) if tune['country'] else ''}" data-dance-types="{html.escape(','.join(tune['dance_types']))}" data-genres="{html.escape(','.join(tune['genres']))}" data-occasions="{html.escape(','.join(tune['occasions']))}" data-csv-genre="{html.escape(tune.get('csv_genre', ''))}" data-csv-subgenre="{html.escape(display_subgenre)}" data-csv-period="{html.escape(tune.get('csv_period', ''))}" data-csv-type="{html.escape(tune.get('csv_type', ''))}" data-csv-key="{html.escape(tune.get('csv_key', ''))}" data-csv-ensemble="{html.escape(tune.get('csv_ensemble', ''))}" data-csv-use-case="{html.escape(tune.get('csv_use_case', ''))}" data-csv-session="{html.escape(tune.get('csv_session', ''))}" data-csv-moods="{html.escape(moods_str)}" data-top10="{str(is_top10).lower()}" data-christmas="{str(is_christmas).lower()}" data-wedding="{str(is_wedding).lower()}">
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
                    <span class="category {category_class}">{html.escape(display_genre)}</span>
                    {f'<div style="font-size: 0.75em; color: #95a5a6; margin-top: 2px;">{html.escape(display_subgenre)}</div>' if display_subgenre else ''}
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
        // Dark Mode Management
        const themeManager = {
            STORAGE_KEY: 'theme-preference',
            AUTO_KEY: 'theme-auto',

            init() {
                // Check if user has a saved preference
                const savedTheme = localStorage.getItem(this.STORAGE_KEY);
                const isAuto = localStorage.getItem(this.AUTO_KEY) !== 'false';

                if (savedTheme && !isAuto) {
                    // Use saved preference
                    this.setTheme(savedTheme, false);
                } else {
                    // Auto-detect based on time
                    this.autoDetectTheme();
                }

                this.updateToggleUI();
            },

            autoDetectTheme() {
                const hour = new Date().getHours();
                // Dark mode between 7 PM (19:00) and 7 AM (07:00)
                const isDarkTime = hour >= 19 || hour < 7;
                this.setTheme(isDarkTime ? 'dark' : 'light', true);
            },

            setTheme(theme, isAuto = false) {
                document.documentElement.setAttribute('data-theme', theme);
                localStorage.setItem(this.STORAGE_KEY, theme);
                localStorage.setItem(this.AUTO_KEY, isAuto ? 'true' : 'false');
                this.updateToggleUI();
            },

            toggleTheme() {
                const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                this.setTheme(newTheme, false); // Manual toggle disables auto
            },

            updateToggleUI() {
                const btn = document.getElementById('theme-toggle-btn');
                const label = document.getElementById('theme-toggle-label');
                const autoIndicator = document.getElementById('theme-auto-indicator');
                const currentTheme = document.documentElement.getAttribute('data-theme') || 'light';
                const isAuto = localStorage.getItem(this.AUTO_KEY) !== 'false';

                if (btn) btn.textContent = currentTheme === 'dark' ? '☀️' : '🌙';
                if (label) label.textContent = currentTheme === 'dark' ? 'Light' : 'Dark';
                if (autoIndicator) autoIndicator.textContent = isAuto ? '(auto)' : '';
            },

            enableAuto() {
                localStorage.setItem(this.AUTO_KEY, 'true');
                this.autoDetectTheme();
            }
        };

        function toggleTheme() {
            themeManager.toggleTheme();
        }

        // Initialize theme on page load
        themeManager.init();

        // Re-check theme every minute for auto mode
        setInterval(() => {
            if (localStorage.getItem(themeManager.AUTO_KEY) !== 'false') {
                themeManager.autoDetectTheme();
            }
        }, 60000);

        let currentView = 'table';

        function filterItems() {
            const searchInput = document.getElementById('search').value.toLowerCase();
            const categoryFilter = document.getElementById('category-filter').value;
            const countryFilter = document.getElementById('country-filter').value;
            const difficultyFilter = document.getElementById('difficulty-filter').value;
            const tagFilter = document.getElementById('tag-filter').value;
            const danceTypeFilter = document.getElementById('dance-type-filter').value;
            const genreFilter = document.getElementById('genre-filter').value;
            const subgenreFilter = document.getElementById('subgenre-filter').value;
            const periodFilter = document.getElementById('period-filter').value;
            const typeFilter = document.getElementById('type-filter').value;
            const keyFilter = document.getElementById('key-filter').value;
            const ensembleFilter = document.getElementById('ensemble-filter').value;
            const useCaseFilter = document.getElementById('use-case-filter').value;
            const moodFilter = document.getElementById('mood-filter').value;
            const sessionFilter = document.getElementById('session-filter').value;

            // Save filter state to URL
            const params = new URLSearchParams(window.location.search);
            if (searchInput) params.set('search', searchInput);
            else params.delete('search');
            if (categoryFilter) params.set('category', categoryFilter);
            else params.delete('category');
            if (countryFilter) params.set('country', countryFilter);
            else params.delete('country');
            if (difficultyFilter) params.set('difficulty', difficultyFilter);
            else params.delete('difficulty');
            if (tagFilter) params.set('tag', tagFilter);
            else params.delete('tag');
            if (danceTypeFilter) params.set('danceType', danceTypeFilter);
            else params.delete('danceType');
            if (genreFilter) params.set('genre', genreFilter);
            else params.delete('genre');
            if (subgenreFilter) params.set('subgenre', subgenreFilter);
            else params.delete('subgenre');
            if (periodFilter) params.set('period', periodFilter);
            else params.delete('period');
            if (typeFilter) params.set('type', typeFilter);
            else params.delete('type');
            if (keyFilter) params.set('key', keyFilter);
            else params.delete('key');
            if (ensembleFilter) params.set('ensemble', ensembleFilter);
            else params.delete('ensemble');
            if (useCaseFilter) params.set('useCase', useCaseFilter);
            else params.delete('useCase');
            if (moodFilter) params.set('mood', moodFilter);
            else params.delete('mood');
            if (sessionFilter) params.set('session', sessionFilter);
            else params.delete('session');

            const newUrl = params.toString() ? `?${params.toString()}` : window.location.pathname;
            window.history.replaceState({}, '', newUrl);

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
                const csvGenre = item.dataset.csvGenre || '';
                const csvSubgenre = item.dataset.csvSubgenre || '';
                const csvPeriod = item.dataset.csvPeriod || '';
                const csvType = item.dataset.csvType || '';
                const csvKey = item.dataset.csvKey || '';
                const csvEnsemble = item.dataset.csvEnsemble || '';
                const csvUseCase = item.dataset.csvUseCase || '';
                const csvMoods = item.dataset.csvMoods || '';
                const csvSession = item.dataset.csvSession || '';

                const matchesSearch = title.includes(searchInput) ||
                                    composer.includes(searchInput) ||
                                    tags.includes(searchInput);
                const matchesCategory = !categoryFilter || category === categoryFilter;
                const matchesCountry = !countryFilter || country === countryFilter;
                const matchesDifficulty = !difficultyFilter || difficulty === difficultyFilter;
                const matchesTag = !tagFilter || tags.includes(tagFilter.toLowerCase());
                const matchesDanceType = !danceTypeFilter || danceTypes.includes(danceTypeFilter);
                const matchesGenre = !genreFilter || csvGenre === genreFilter;
                const matchesSubgenre = !subgenreFilter || csvSubgenre === subgenreFilter;
                const matchesPeriod = !periodFilter || csvPeriod === periodFilter;
                const matchesType = !typeFilter || csvType === typeFilter;
                const matchesKey = !keyFilter || csvKey === keyFilter;
                const matchesEnsemble = !ensembleFilter || csvEnsemble === ensembleFilter;
                const matchesUseCase = !useCaseFilter || csvUseCase === useCaseFilter;
                const matchesMood = !moodFilter || csvMoods.includes(moodFilter);
                const matchesSession = !sessionFilter || csvSession === sessionFilter;

                if (matchesSearch && matchesCategory && matchesCountry && matchesDifficulty && matchesTag && matchesDanceType && matchesGenre && matchesSubgenre && matchesPeriod && matchesType && matchesKey && matchesEnsemble && matchesUseCase && matchesMood && matchesSession) {
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
                // Sort visible rows alphabetically by title after filtering
                sortVisibleRows();
            } else {
                document.getElementById('cards-container').style.display = visibleCount === 0 ? 'none' : 'grid';
            }
        }

        function sortVisibleRows() {
            const table = document.getElementById('music-table');
            const tbody = table.tBodies[0];
            const visibleRows = Array.from(tbody.rows).filter(row => row.style.display !== 'none');

            // Sort visible rows by title (first column)
            visibleRows.sort((a, b) => {
                const titleA = a.cells[0].textContent.trim().toLowerCase();
                const titleB = b.cells[0].textContent.trim().toLowerCase();
                return titleA.localeCompare(titleB);
            });

            // Reorder rows in tbody
            visibleRows.forEach(row => tbody.appendChild(row));
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
            document.getElementById('country-filter').value = '';
            document.getElementById('difficulty-filter').value = '';
            document.getElementById('tag-filter').value = '';
            document.getElementById('dance-type-filter').value = '';
            document.getElementById('genre-filter').value = '';
            document.getElementById('subgenre-filter').value = '';
            document.getElementById('period-filter').value = '';
            document.getElementById('type-filter').value = '';
            document.getElementById('key-filter').value = '';
            document.getElementById('ensemble-filter').value = '';
            document.getElementById('use-case-filter').value = '';
            document.getElementById('mood-filter').value = '';
            document.getElementById('session-filter').value = '';

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

        // Restore filter state from URL on page load
        function restoreFilterState() {
            const params = new URLSearchParams(window.location.search);

            if (params.has('search')) {
                document.getElementById('search').value = params.get('search');
            }
            if (params.has('category')) {
                document.getElementById('category-filter').value = params.get('category');
            }
            if (params.has('country')) {
                document.getElementById('country-filter').value = params.get('country');
            }
            if (params.has('difficulty')) {
                document.getElementById('difficulty-filter').value = params.get('difficulty');
            }
            if (params.has('tag')) {
                document.getElementById('tag-filter').value = params.get('tag');
            }
            if (params.has('danceType')) {
                document.getElementById('dance-type-filter').value = params.get('danceType');
            }
            if (params.has('genre')) {
                document.getElementById('genre-filter').value = params.get('genre');
            }
            if (params.has('subgenre')) {
                document.getElementById('subgenre-filter').value = params.get('subgenre');
            }
            if (params.has('mood')) {
                document.getElementById('mood-filter').value = params.get('mood');
            }

            // Apply filters if any were restored
            if (params.toString()) {
                filterItems();
            }
        }

        // Tempo slider control
        document.addEventListener('DOMContentLoaded', () => {
            // Restore filter state from URL
            restoreFilterState();

            // Add event listener for search input clear button
            const searchInput = document.getElementById('search');
            searchInput.addEventListener('search', () => {
                // The 'search' event fires when the clear button is clicked
                filterItems();
            });

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

        // Navigate to tune detail page when clicking on a row
        function navigateToTune(event, tuneSlug) {
            // Don't navigate if clicking on links, buttons, or links column
            if (event.target.closest('.links') ||
                event.target.tagName === 'A' ||
                event.target.tagName === 'BUTTON' ||
                event.target.closest('a') ||
                event.target.closest('button')) {
                return;
            }

            // Update URL without page reload
            const url = new URL(window.location);
            url.searchParams.set('tune', tuneSlug);
            window.history.pushState({}, '', url);

            // Show tune detail view (function from tune-detail-view.js)
            if (typeof showTuneDetailView === 'function') {
                showTuneDetailView(tuneSlug);
            }
        }

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
