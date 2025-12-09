#!/bin/bash

# Generate a catalog of all tunes with their composers
# Excludes: scales, exercises, common files, test files, and duplicates
# Output: CSV file with format "Title,Composer"

output_file="tune_catalog.csv"
temp_file="tune_catalog_temp.csv"

# Write CSV header
echo "Title,Composer" > "$temp_file"

# Find all .ly files, excluding common files, test files, and scales/exercises
find . -name "*.ly" -type f \
  ! -path "*/common/*" \
  ! -path "*/Scales/*" \
  ! -path "*/Exercises/*" \
  ! -path "*/scales/*" \
  ! -path "*/exercises/*" \
  ! -name "test-*.ly" \
  ! -name "*scale*.ly" \
  ! -name "*Scale*.ly" \
  ! -name "*exercise*.ly" \
  ! -name "*Exercise*.ly" \
  | sort | while read -r file; do

  # Extract title and composer from the file
  title=$(grep -m 1 'title' "$file" | perl -ne 'print $1 if /title\s*=\s*"([^"]*)"/')
  composer=$(grep -m 1 'composer' "$file" | perl -ne 'print $1 if /composer\s*=\s*"([^"]*)"/')

  # Skip if title contains "scale", "exercise", "warm-up", or "arpeggio" (case insensitive)
  if [[ "$title" =~ [Ss]cale ]] || [[ "$title" =~ [Ee]xercise ]] || \
     [[ "$title" =~ [Ww]arm.*[Uu]p ]] || [[ "$title" =~ [Aa]rpeggio ]]; then
    continue
  fi

  # Only add to CSV if both title and composer are found and not empty
  if [ -n "$title" ] && [ -n "$composer" ]; then
    # Escape any commas in the fields by wrapping in quotes
    echo "\"$title\",\"$composer\"" >> "$temp_file"
  fi
done

# Remove duplicates while preserving order, sort by title
(head -n 1 "$temp_file" && tail -n +2 "$temp_file" | sort -u -t',' -k1,1) > "$output_file"

# Clean up temp file
rm "$temp_file"

echo "CSV file created: $output_file"
echo "Total unique tunes: $(($(wc -l < "$output_file") - 1))"
