#!/usr/bin/env python3
"""
Clean up tune_catalog_rich_schema.csv by:
1. Consolidating genre variations into main genres (e.g., "Gypsy jazz" → "Jazz")
2. Splitting slash-combined genres into genre + subgenre
3. Moving type indicators (song, standard, exercise) to Type field

BACKUP: Creates tune_catalog_rich_schema.csv.backup before modifying
"""

import csv
import shutil
from datetime import datetime

CSV_FILE = 'tune_catalog_rich_schema.csv'
BACKUP_FILE = f'{CSV_FILE}.backup.{datetime.now().strftime("%Y%m%d_%H%M%S")}'

# Main genre consolidation rules
# Maps current genre → (new genre, subgenre to add)
GENRE_CONSOLIDATION = {
    # Jazz variations → Jazz
    'Gypsy jazz': ('Jazz', 'Gypsy Jazz'),
    'Gypsy jazz / musette': ('Jazz', 'Gypsy Jazz'),
    'Jazz standard': ('Jazz', ''),  # 'standard' goes to Type
    'Jazz ballad': ('Jazz', 'Ballad'),

    # Fiddle variations → Folk
    'Fiddle tune': ('Folk', 'Fiddle'),

    # Keep these as-is but note them
    'Exercise': ('Exercise', ''),
    'Christmas': ('Christmas', ''),
}

# Slash splitting rules
# For "Genre / X" patterns, specify what X becomes
SLASH_SPLIT_RULES = {
    # Christmas variations - suffix becomes subgenre
    'Christmas / carol': ('Christmas', 'Carol'),
    'Christmas / folk': ('Christmas', 'Folk Carol'),
    'Christmas / hymn': ('Christmas', 'Hymn'),
    'Christmas / lullaby': ('Christmas', 'Lullaby'),
    'Christmas / traditional': ('Christmas', 'Traditional'),

    # Folk variations - check if suffix is Type or Subgenre
    'Folk / song': ('Folk', ''),  # 'song' is Type, not subgenre
    'Folk / children': ('Folk', 'Children\'s'),
    'Folk / arrangement': ('Folk', ''),  # 'arrangement' is Type
    'Folk / Klezmer': ('Folk', 'Klezmer'),
    'Folk / Irish': ('Folk', 'Irish'),
    'Folk / Scottish': ('Folk', 'Scottish'),
    'Folk / French': ('Folk', 'French'),
    'Folk / English': ('Folk', 'English'),
    'Folk / Welsh': ('Folk', 'Welsh'),
    'Folk / gypsy': ('Folk', 'Gypsy'),
    'Folk / Eastern European': ('Folk', 'Eastern European'),
    'Folk / waltz': ('Folk', 'Waltz'),
    'Folk / dance': ('Folk', ''),  # 'dance' is Type

    # Jazz variations
    'Jazz / exercise': ('Jazz', ''),  # 'exercise' is Type
    'Jazz / lick': ('Jazz', ''),  # 'lick' is Type
    'Jazz / etude': ('Jazz', ''),  # 'etude' is Type
    'Jazz / swing': ('Jazz', 'Swing'),
    'Jazz / bebop': ('Jazz', 'Bebop'),
    'Jazz / standard': ('Jazz', ''),  # 'standard' is Type

    # Film variations - suffix becomes subgenre
    'Film / neo-romantic': ('Film', 'Neo-Romantic'),
    'Film / romantic': ('Film', 'Romantic'),
    'Film / contemporary': ('Film', 'Contemporary'),
    'Film / classical': ('Film', 'Classical'),
    'Film / baroque': ('Film', 'Baroque'),
    'Film / minimalist': ('Film', 'Minimalist'),
    'Film / adventure': ('Film', 'Adventure'),
    'Film / fantasy': ('Film', 'Fantasy'),

    # Classical variations
    'Classical / baroque': ('Classical', 'Baroque'),
    'Classical / romantic': ('Classical', 'Romantic'),
    'Classical / contemporary': ('Classical', 'Contemporary'),

    # Exercise variations
    'Exercise / classical': ('Exercise', 'Classical'),
    'Exercise / finger': ('Exercise', 'Finger Exercise'),
    'Exercise / jazz': ('Exercise', 'Jazz'),
    'Exercise / technique': ('Exercise', 'Technique'),

    # Pop variations
    'Pop / ballad': ('Pop', 'Ballad'),
    'Pop / standard': ('Pop', ''),  # 'standard' is Type

    # Latin variations
    'Latin / bossa nova': ('Latin', 'Bossa Nova'),
    'Latin / tango': ('Latin', 'Tango'),

    # World variations
    'World / gypsy': ('World', 'Gypsy'),
    'World / Middle Eastern': ('World', 'Middle Eastern'),
}

# Type indicators that should NOT be subgenres
TYPE_INDICATORS = {
    'song', 'standard', 'arrangement', 'exercise', 'lick', 'etude', 'dance'
}

def cleanup_genre(genre, subgenre, type_field):
    """
    Clean up a genre entry and return (new_genre, new_subgenre, new_type).

    Returns:
        (genre, subgenre, type) tuple
    """
    genre = genre.strip()
    subgenre = subgenre.strip()
    type_field = type_field.strip()

    # First check consolidation rules
    if genre in GENRE_CONSOLIDATION:
        new_genre, additional_subgenre = GENRE_CONSOLIDATION[genre]

        # Check if original genre had a type indicator
        for type_word in TYPE_INDICATORS:
            if type_word in genre.lower():
                if not type_field:
                    type_field = type_word.title()
                break

        # Merge subgenres if both exist
        if additional_subgenre and subgenre:
            # Keep existing subgenre, ignore additional
            return (new_genre, subgenre, type_field)
        elif additional_subgenre:
            return (new_genre, additional_subgenre, type_field)
        else:
            return (new_genre, subgenre, type_field)

    # Check slash splitting rules
    if genre in SLASH_SPLIT_RULES:
        new_genre, new_subgenre = SLASH_SPLIT_RULES[genre]

        # Check if this was a type indicator case
        suffix = genre.split(' / ')[-1].lower()
        if suffix in TYPE_INDICATORS:
            if not type_field:
                type_field = suffix.title()

        # If we already have a subgenre in the CSV, keep it unless empty
        if subgenre:
            return (new_genre, subgenre, type_field)
        else:
            return (new_genre, new_subgenre, type_field)

    # No changes needed
    return (genre, subgenre, type_field)

def cleanup_csv(dry_run=False):
    """Clean up the CSV file."""

    print("=" * 80)
    print("CSV GENRE CLEANUP")
    print("=" * 80)

    # Read CSV
    with open(CSV_FILE, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = list(reader)
        fieldnames = reader.fieldnames

    print(f"\nLoaded {len(rows)} tunes from {CSV_FILE}")

    # Track changes
    changes = []
    updated_rows = []

    for row in rows:
        title = row.get('Title', '')
        old_genre = row.get('Style/Genre', '').strip()
        old_subgenre = row.get('Sub-Genre/Tradition', '').strip()
        old_type = row.get('Type of Piece', '').strip()

        # Clean up
        new_genre, new_subgenre, new_type = cleanup_genre(old_genre, old_subgenre, old_type)

        # Record change
        if (old_genre != new_genre) or (old_subgenre != new_subgenre) or (old_type != new_type):
            changes.append({
                'title': title,
                'old': f"{old_genre} / {old_subgenre} / {old_type}",
                'new': f"{new_genre} / {new_subgenre} / {new_type}"
            })

        # Update row
        row['Style/Genre'] = new_genre
        row['Sub-Genre/Tradition'] = new_subgenre
        row['Type of Piece'] = new_type
        updated_rows.append(row)

    # Print changes
    print(f"\n## CHANGES TO BE MADE ({len(changes)} tunes)")
    print("-" * 80)

    for change in changes:
        print(f"\n{change['title']}")
        print(f"  OLD: {change['old']}")
        print(f"  NEW: {change['new']}")

    if not changes:
        print("No changes needed!")
        return

    # Write back
    if dry_run:
        print("\n" + "=" * 80)
        print("DRY RUN - No changes written")
        print("=" * 80)
    else:
        # Create backup
        print(f"\nCreating backup: {BACKUP_FILE}")
        shutil.copy2(CSV_FILE, BACKUP_FILE)

        # Write updated CSV
        with open(CSV_FILE, 'w', encoding='utf-8', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(updated_rows)

        print(f"\n✓ Updated {CSV_FILE}")
        print(f"✓ Backup saved as {BACKUP_FILE}")
        print(f"✓ {len(changes)} tunes modified")
        print("\n" + "=" * 80)
        print("SUMMARY")
        print("=" * 80)

        # Count genre distribution
        genre_counts = {}
        for row in updated_rows:
            genre = row['Style/Genre']
            genre_counts[genre] = genre_counts.get(genre, 0) + 1

        print("\nGenre distribution:")
        for genre in sorted(genre_counts.keys()):
            print(f"  {genre}: {genre_counts[genre]} tunes")

if __name__ == "__main__":
    import sys

    dry_run = '--dry-run' in sys.argv

    if dry_run:
        print("Running in DRY RUN mode (no changes will be written)\n")

    cleanup_csv(dry_run=dry_run)
