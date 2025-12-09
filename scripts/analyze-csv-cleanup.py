#!/usr/bin/env python3
"""
Analyze tune_catalog_rich_schema.csv and identify cleanup opportunities:
1. Redundant country+genre combinations
2. Genres that should be split into genre + subgenre
3. Genres that should be split into genre + type
"""

import csv
from collections import defaultdict

CSV_FILE = 'tune_catalog_rich_schema.csv'

def analyze_genres():
    """Analyze genres and propose simplifications"""

    print("=" * 80)
    print("CSV GENRE CLEANUP ANALYSIS")
    print("=" * 80)

    with open(CSV_FILE, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    # Group tunes by genre pattern
    slash_genres = defaultdict(list)
    clean_genres = defaultdict(list)

    for row in rows:
        title = row.get('Title', '')
        genre = row.get('Style/Genre', '').strip()
        subgenre = row.get('Sub-Genre/Tradition', '').strip()
        country = row.get('Country / Region of Origin', '').strip()

        if '/' in genre:
            slash_genres[genre].append((title, subgenre, country))
        else:
            clean_genres[genre].append((title, subgenre, country))

    print("\n## GENRES WITH SLASHES (Need Splitting)")
    print("-" * 80)

    recommendations = []

    for genre in sorted(slash_genres.keys()):
        tunes = slash_genres[genre]
        print(f"\n### {genre} ({len(tunes)} tunes)")

        # Analyze pattern and suggest cleanup
        if genre.startswith('Christmas /'):
            suffix = genre.replace('Christmas / ', '')
            rec = f"  → Genre: Christmas, Subgenre: {suffix.title()}"
            recommendations.append((genre, "Christmas", suffix.title()))

        elif genre.startswith('Folk /'):
            suffix = genre.replace('Folk / ', '')
            if suffix in ['song', 'children', 'arrangement']:
                rec = f"  → Genre: Folk ('{suffix}' is Type, not subgenre)"
                recommendations.append((genre, "Folk", ""))
            else:
                rec = f"  → Genre: Folk, Subgenre: {suffix.title()}"
                recommendations.append((genre, "Folk", suffix.title()))

        elif genre.startswith('Film /'):
            suffix = genre.replace('Film / ', '')
            rec = f"  → Genre: Film, Subgenre: {suffix.title()}"
            recommendations.append((genre, "Film", suffix.title()))

        elif ' / ' in genre:
            parts = genre.split(' / ')
            rec = f"  → Genre: {parts[0]}, Subgenre: {parts[1].title()}"
            recommendations.append((genre, parts[0], parts[1].title()))

        else:
            rec = f"  → REVIEW MANUALLY"
            recommendations.append((genre, "MANUAL", ""))

        print(rec)
        for title, existing_subgenre, country in tunes[:3]:  # Show first 3 examples
            print(f"    - {title} (current subgenre: '{existing_subgenre}', country: {country})")
        if len(tunes) > 3:
            print(f"    ... and {len(tunes) - 3} more")

    print("\n\n## CLEAN GENRES (Already Simple)")
    print("-" * 80)
    for genre in sorted(clean_genres.keys()):
        if genre:  # Skip empty
            print(f"  {genre}: {len(clean_genres[genre])} tunes")

    print("\n\n## RECOMMENDED ACTIONS")
    print("=" * 80)
    print("\nUse this mapping for cleanup script:")
    print("\nGENRE_CLEANUP_MAP = {")
    for old_genre, new_genre, new_subgenre in sorted(recommendations):
        if new_genre != "MANUAL":
            print(f'    "{old_genre}": ("{new_genre}", "{new_subgenre}"),')
    print("}")

if __name__ == "__main__":
    analyze_genres()
