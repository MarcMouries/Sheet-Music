#!/usr/bin/env python3
"""
Batch generate preview images for all LilyPond files in the repository.

This script:
1. Scans for all .ly files (excluding tutorial/practice/template folders)
2. Checks if preview exists and compares timestamps with PDF
3. Only generates preview if:
   - No preview exists, OR
   - Preview is older than the PDF file

Excluded directories:
- Template/library dirs: Scales/, common/, stylesheets/
- Tutorial dirs: lilypong_how-to/, Harmonica/, etc.
- Practice dirs: 8-Step_Warm-Up_Plan/, Marc's Practice Points/

Usage:
    python3 batch-generate-previews.py [--force] [--percent N] [--resolution N]

Options:
    --force         Regenerate all previews regardless of timestamps
    --percent N     Crop percentage (default: 40)
    --resolution N  PNG resolution DPI (default: 300)
    --dry-run       Show what would be done without doing it
    --parallel N    Number of parallel jobs (default: 4)
"""

import os
import sys
import subprocess
import argparse
from pathlib import Path
from datetime import datetime
import concurrent.futures
from typing import List, Tuple, Optional

# Directories to exclude (same as generate-index-page.py)
EXCLUDE_DIRS = {
    'lilypong_how-to',
    'Harmonica',
    'Learn Violin with Famous Themes',
    'Marc\'s Practice Points',
    'Gypsy-Jazz/Blues-en-Mineur',
    'Gypsy-Jazz/Swing-Licks',
    'Gypsy-Jazz/Si-Tu-Savais',
    'Gypsy-Jazz/Grappelli-Licks',
    'Gypsy-Jazz/Rythmes-gitans',
    '8-Step_Warm-Up_Plan',
    'Classical/Erik_Satie_Gymnopédie',
    'Classical/Mozart_Rondo_Alla_Turca',
}

# Template/library directories to exclude (not standalone pieces)
TEMPLATE_DIRS = {
    'Scales',
    'common',
    'stylesheets',
}

class PreviewGenerator:
    def __init__(self, root_dir: Path, percent: int = 40, resolution: int = 300,
                 force: bool = False, dry_run: bool = False):
        self.root_dir = root_dir
        self.percent = percent
        self.resolution = resolution
        self.force = force
        self.dry_run = dry_run
        self.script_path = root_dir / "scripts" / "make-score-preview.sh"

        if not self.script_path.exists():
            raise FileNotFoundError(f"Preview script not found: {self.script_path}")

    def should_exclude(self, ly_file: Path) -> bool:
        """Check if file should be excluded based on directory."""
        rel_path = ly_file.relative_to(self.root_dir)
        parts = rel_path.parts

        # Check if file is in a template/library directory
        for template_dir in TEMPLATE_DIRS:
            if template_dir in parts:
                return True

        # Check if any part of the path matches exclusion patterns
        for exclude_dir in EXCLUDE_DIRS:
            if exclude_dir in str(rel_path):
                return True

        # Exclude files starting with underscore
        if ly_file.name.startswith('_'):
            return True

        # Exclude test files
        if 'test' in ly_file.name.lower() and ly_file.name.startswith('test'):
            return True

        return False

    def find_ly_files(self) -> List[Path]:
        """Find all .ly files that should have previews."""
        ly_files = []

        for ly_file in self.root_dir.rglob("*.ly"):
            if not self.should_exclude(ly_file):
                ly_files.append(ly_file)

        return sorted(ly_files)

    def get_preview_path(self, ly_file: Path) -> Path:
        """Get the expected preview file path."""
        return ly_file.with_name(f"{ly_file.stem}-preview.png")

    def get_pdf_path(self, ly_file: Path) -> Path:
        """Get the expected PDF file path."""
        return ly_file.with_suffix('.pdf')

    def needs_regeneration(self, ly_file: Path) -> Tuple[bool, str]:
        """
        Check if preview needs to be generated.

        Returns:
            (needs_regen, reason)
        """
        if self.force:
            return (True, "forced regeneration")

        preview_path = self.get_preview_path(ly_file)
        pdf_path = self.get_pdf_path(ly_file)

        # Check if preview exists
        if not preview_path.exists():
            return (True, "preview does not exist")

        # Check if PDF exists
        if not pdf_path.exists():
            return (False, "PDF does not exist (skipping)")

        # Compare timestamps
        preview_mtime = preview_path.stat().st_mtime
        pdf_mtime = pdf_path.stat().st_mtime

        if pdf_mtime > preview_mtime:
            pdf_date = datetime.fromtimestamp(pdf_mtime).strftime('%Y-%m-%d %H:%M:%S')
            preview_date = datetime.fromtimestamp(preview_mtime).strftime('%Y-%m-%d %H:%M:%S')
            return (True, f"PDF newer (PDF: {pdf_date}, Preview: {preview_date})")

        return (False, "preview is up to date")

    def generate_preview(self, ly_file: Path) -> Tuple[bool, str]:
        """
        Generate preview for a single file.

        Returns:
            (success, message)
        """
        try:
            # Change to the directory containing the .ly file
            work_dir = ly_file.parent
            ly_filename = ly_file.name

            cmd = [
                str(self.script_path),
                "--percent", str(self.percent),
                "--resolution", str(self.resolution),
                ly_filename
            ]

            if self.dry_run:
                return (True, f"DRY RUN: would run {' '.join(cmd)}")

            # Run the script
            result = subprocess.run(
                cmd,
                cwd=work_dir,
                capture_output=True,
                text=True,
                timeout=120  # 2 minute timeout per file
            )

            if result.returncode == 0:
                preview_path = self.get_preview_path(ly_file)
                if preview_path.exists():
                    return (True, "✓ Generated")
                else:
                    return (False, "Script succeeded but preview not found")
            else:
                error_msg = result.stderr.strip() or result.stdout.strip()
                return (False, f"Script failed: {error_msg[:100]}")

        except subprocess.TimeoutExpired:
            return (False, "Timeout (>120s)")
        except Exception as e:
            return (False, f"Error: {str(e)[:100]}")

    def process_file(self, ly_file: Path) -> dict:
        """Process a single file and return results."""
        rel_path = ly_file.relative_to(self.root_dir)

        needs_regen, reason = self.needs_regeneration(ly_file)

        result = {
            'file': str(rel_path),
            'needed': needs_regen,
            'reason': reason,
            'success': None,
            'message': None
        }

        if needs_regen:
            success, message = self.generate_preview(ly_file)
            result['success'] = success
            result['message'] = message

        return result

    def run(self, parallel_jobs: int = 4) -> dict:
        """
        Run the batch preview generation.

        Returns:
            Statistics dictionary
        """
        print("🎵 Scanning for LilyPond files...")
        ly_files = self.find_ly_files()
        print(f"   Found {len(ly_files)} files to check")

        stats = {
            'total': len(ly_files),
            'skipped': 0,
            'generated': 0,
            'failed': 0,
            'up_to_date': 0
        }

        # Process files in parallel
        with concurrent.futures.ThreadPoolExecutor(max_workers=parallel_jobs) as executor:
            futures = {executor.submit(self.process_file, ly_file): ly_file
                      for ly_file in ly_files}

            for future in concurrent.futures.as_completed(futures):
                result = future.result()

                if not result['needed']:
                    if 'does not exist' in result['reason']:
                        stats['skipped'] += 1
                        print(f"⊘  {result['file']}: {result['reason']}")
                    else:
                        stats['up_to_date'] += 1
                        if '--verbose' in sys.argv:
                            print(f"✓  {result['file']}: {result['reason']}")
                else:
                    if result['success']:
                        stats['generated'] += 1
                        print(f"✓  {result['file']}: {result['message']}")
                    else:
                        stats['failed'] += 1
                        print(f"✗  {result['file']}: {result['message']}")

        return stats


def main():
    parser = argparse.ArgumentParser(
        description="Batch generate preview images for LilyPond files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    parser.add_argument('--force', action='store_true',
                       help='Regenerate all previews regardless of timestamps')
    parser.add_argument('--percent', type=int, default=40,
                       help='Crop percentage (default: 40)')
    parser.add_argument('--resolution', type=int, default=300,
                       help='PNG resolution DPI (default: 300)')
    parser.add_argument('--dry-run', action='store_true',
                       help='Show what would be done without doing it')
    parser.add_argument('--parallel', type=int, default=4,
                       help='Number of parallel jobs (default: 4)')
    parser.add_argument('--verbose', action='store_true',
                       help='Show all files including up-to-date ones')

    args = parser.parse_args()

    # Find repository root
    root_dir = Path(__file__).resolve().parent.parent

    try:
        generator = PreviewGenerator(
            root_dir=root_dir,
            percent=args.percent,
            resolution=args.resolution,
            force=args.force,
            dry_run=args.dry_run
        )

        print(f"\n{'='*70}")
        print(f"Batch Preview Generation")
        print(f"{'='*70}")
        print(f"Root directory: {root_dir}")
        print(f"Crop percent: {args.percent}%")
        print(f"Resolution: {args.resolution} DPI")
        print(f"Parallel jobs: {args.parallel}")
        if args.force:
            print("Mode: FORCE (regenerate all)")
        if args.dry_run:
            print("Mode: DRY RUN (no changes)")
        print(f"{'='*70}\n")

        stats = generator.run(parallel_jobs=args.parallel)

        print(f"\n{'='*70}")
        print(f"Summary")
        print(f"{'='*70}")
        print(f"Total files:     {stats['total']}")
        print(f"Up to date:      {stats['up_to_date']}")
        print(f"Generated:       {stats['generated']}")
        print(f"Failed:          {stats['failed']}")
        print(f"Skipped (no PDF): {stats['skipped']}")
        print(f"{'='*70}\n")

        if stats['failed'] > 0:
            print("⚠️  Some previews failed to generate. Check errors above.")
            sys.exit(1)
        else:
            print("✓ All previews generated successfully!")
            sys.exit(0)

    except KeyboardInterrupt:
        print("\n\n⚠️  Interrupted by user")
        sys.exit(130)
    except Exception as e:
        print(f"\n\n✗ Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
