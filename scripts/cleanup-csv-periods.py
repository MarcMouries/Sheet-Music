#!/usr/bin/env python3
"""
Clean up redundant Musical Period values in tune_catalog_rich_schema.csv

Consolidates period values and adds standard date ranges for clarity.

Standard periods with dates:
- Renaissance (c. 1400–1600)
- Baroque (c. 1600–1750)
- Classical (c. 1730–1820)
- Romantic (c. 1800–1910)
- Late Romantic (c. 1850–1920)
- 20th century (c. 1900–2000)
- Contemporary (c. 1975–present)
- Traditional (pre-modern, varies by culture)
"""

import csv
import shutil
from datetime import datetime

CSV_FILE = 'tune_catalog_rich_schema.csv'
BACKUP_FILE = f'{CSV_FILE}.backup.{datetime.now().strftime("%Y%m%d_%H%M%S")}'

# Period consolidation mapping (old value → new standardized value with dates)
PERIOD_CONSOLIDATION = {
    # Century abbreviations → full names with dates
    '18th c.': 'Baroque (c. 1600–1750)',
    '18–19th c.': 'Classical (c. 1730–1820)',
    '19th c.': 'Romantic (c. 1800–1910)',
    '19th century': 'Romantic (c. 1800–1910)',
    '19–20th c.': 'Late Romantic (c. 1850–1920)',

    # Early 20th century variations
    'Early 20th c.': '20th century (c. 1900–2000)',
    'Romantic / early 20th c.': 'Late Romantic (c. 1850–1920)',
    'Late Romantic / early 20th c.': 'Late Romantic (c. 1850–1920)',

    # Existing values that need dates added
    'Baroque': 'Baroque (c. 1600–1750)',
    'Classical': 'Classical (c. 1730–1820)',
    'Romantic': 'Romantic (c. 1800–1910)',
    'Late Romantic': 'Late Romantic (c. 1850–1920)',
    '20th century': '20th century (c. 1900–2000)',
    'Contemporary': 'Contemporary (c. 1975–present)',
    'Traditional': 'Traditional (pre-modern)',
    'Renaissance': 'Renaissance (c. 1400–1600)',

    # Special case variations
    'Baroque / arranged': 'Baroque (c. 1600–1750)',
    '20th century (Baroque style)': '20th century (c. 1900–2000)',
    'Renaissance–Traditional': 'Renaissance (c. 1400–1600)',
    'Traditional / modern': 'Contemporary (c. 1975–present)',
    'Contemporary folk': 'Contemporary (c. 1975–present)',
}

def cleanup_periods(dry_run=False):
    """Clean up period values in CSV."""

    print("=" * 80)
    print("CSV PERIOD CONSOLIDATION")
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
        old_period = row.get('Musical Period / Era', '').strip()

        # Check if consolidation needed
        if old_period in PERIOD_CONSOLIDATION:
            new_period = PERIOD_CONSOLIDATION[old_period]

            # Only record as change if actually different
            if old_period != new_period:
                changes.append({
                    'title': title,
                    'old': old_period,
                    'new': new_period
                })

            row['Musical Period / Era'] = new_period

        updated_rows.append(row)

    # Print changes
    print(f"\n## CHANGES TO BE MADE ({len(changes)} tunes)")
    print("-" * 80)

    if not changes:
        print("No changes needed!")
        return

    # Group by transformation
    transformations = {}
    for change in changes:
        key = f"{change['old']} → {change['new']}"
        if key not in transformations:
            transformations[key] = []
        transformations[key].append(change['title'])

    for transform, titles in sorted(transformations.items()):
        print(f"\n{transform}")
        print(f"  ({len(titles)} tunes)")
        for title in titles[:3]:
            print(f"    - {title}")
        if len(titles) > 3:
            print(f"    ... and {len(titles) - 3} more")

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

        # Show consolidated period distribution
        print("\n" + "=" * 80)
        print("CONSOLIDATED PERIOD DISTRIBUTION")
        print("=" * 80)

        period_counts = {}
        for row in updated_rows:
            period = row['Musical Period / Era'].strip()
            if period:
                period_counts[period] = period_counts.get(period, 0) + 1

        for period in sorted(period_counts.keys()):
            print(f"  {period:45s}: {period_counts[period]:3d} tunes")

if __name__ == "__main__":
    import sys

    dry_run = '--dry-run' in sys.argv

    if dry_run:
        print("Running in DRY RUN mode (no changes will be written)\n")

    cleanup_periods(dry_run=dry_run)
