# Auto-Rebuild System Proposal for Sheet Music Catalog

## Problem Statement

Currently, maintaining the music catalog requires manual steps:
1. Edit a `.ly` file
2. Manually run `make-score-preview.sh` to regenerate the preview PNG
3. Manually run `generate-index-page.py` to update the index

This is time-consuming and easy to forget, leading to stale previews and index.

## Solution Options

### Option 1: File Watcher with Auto-Rebuild (Recommended)

**How it works:**
- A background script watches for changes to `.ly` files
- When a file is saved, automatically:
  1. Regenerate the preview PNG for that file
  2. Regenerate the index page
- Fast, incremental updates

**Implementation:**
```bash
# Install watchman (file watcher)
brew install watchman  # macOS
# or: apt-get install watchman  # Linux

# Create watch-and-rebuild.sh script
```

**Pros:**
- Instant updates when you save
- No manual commands needed
- Only rebuilds changed files (fast)
- Works while you edit

**Cons:**
- Requires watchman installation
- Background process uses some CPU
- Need to start/stop the watcher

**Startup:**
```bash
./scripts/start-auto-rebuild.sh  # Start watching
./scripts/stop-auto-rebuild.sh   # Stop watching
```

---

### Option 2: Git Pre-Commit Hook

**How it works:**
- Before each `git commit`, automatically:
  1. Find modified `.ly` files
  2. Regenerate their previews
  3. Regenerate the index
  4. Add the updated files to the commit

**Implementation:**
```bash
# Create .git/hooks/pre-commit script
```

**Pros:**
- No background process
- Guarantees index is always up-to-date in git
- Only runs when you commit

**Cons:**
- Slower commits (waits for LilyPond)
- Preview updates delayed until commit time
- Can't see updated preview while editing

---

### Option 3: Make-Based Build System

**How it works:**
- Use GNU Make to track dependencies
- Run `make` to rebuild only what changed
- Make detects which `.ly` files are newer than their `.png` previews

**Implementation:**
```makefile
# Makefile in repo root
all: index.html

index.html: tune_catalog_rich_schema.csv $(wildcard **/*.ly)
	python3 generate-index-page.py

%.preview.png: %.ly
	cd $(dir $<) && bash scripts/make-score-preview.sh $(notdir $<)
```

**Pros:**
- Standard build tool
- Only rebuilds what changed
- Easy to understand

**Cons:**
- Still requires manual `make` command
- Complex Makefile for large project
- Not automatic

---

### Option 4: VS Code Task + File Watcher

**How it works:**
- VS Code watches `.ly` files
- When saved, triggers a VS Code task
- Task runs preview generation + index rebuild

**Implementation:**
```json
// .vscode/tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Rebuild Preview and Index",
      "type": "shell",
      "command": "./scripts/auto-rebuild-on-save.sh ${file}",
      "group": "build",
      "problemMatcher": []
    }
  ]
}
```

**Pros:**
- Integrated with your editor
- No separate background process
- Easy to enable/disable

**Cons:**
- Only works in VS Code
- Requires VS Code configuration
- Manual setup needed

---

## Recommended Solution: Option 1 (File Watcher)

### Implementation Plan

**1. Create the watcher script:**

```bash
#!/bin/bash
# scripts/watch-and-rebuild.sh

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

echo "🎵 Starting Sheet Music auto-rebuild watcher..."
echo "   Watching: **/*.ly files"
echo "   Press Ctrl+C to stop"

watchman-make \
  -p '**/*.ly' \
  --run './scripts/rebuild-single-file.sh'
```

**2. Create the rebuild script:**

```bash
#!/bin/bash
# scripts/rebuild-single-file.sh

CHANGED_FILE="$1"
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "🔨 File changed: $CHANGED_FILE"

# Regenerate preview if it's a .ly file (not an include file)
if [[ "$CHANGED_FILE" == *.ly ]] && [[ "$CHANGED_FILE" != *common* ]]; then
  FILE_DIR="$(dirname "$CHANGED_FILE")"
  FILE_NAME="$(basename "$CHANGED_FILE")"

  echo "   → Regenerating preview: $FILE_NAME"
  (cd "$REPO_ROOT/$FILE_DIR" && bash "$REPO_ROOT/scripts/make-score-preview.sh" "$FILE_NAME")
fi

# Regenerate index
echo "   → Regenerating index page"
(cd "$REPO_ROOT" && python3 generate-index-page.py --quiet)

echo "✓ Rebuild complete"
```

**3. Startup/Shutdown scripts:**

```bash
#!/bin/bash
# scripts/start-auto-rebuild.sh

echo "Starting auto-rebuild watcher in background..."
nohup bash scripts/watch-and-rebuild.sh > .auto-rebuild.log 2>&1 &
echo $! > .auto-rebuild.pid
echo "✓ Watcher started (PID: $(cat .auto-rebuild.pid))"
echo "  View logs: tail -f .auto-rebuild.log"
```

```bash
#!/bin/bash
# scripts/stop-auto-rebuild.sh

if [ -f .auto-rebuild.pid ]; then
  PID=$(cat .auto-rebuild.pid)
  kill $PID
  rm .auto-rebuild.pid
  echo "✓ Watcher stopped"
else
  echo "No watcher running"
fi
```

### Alternative: Lightweight Python Watcher (No Dependencies)

If you don't want to install watchman, we can use Python's built-in `watchdog`:

```bash
# Install Python watchdog
pip3 install watchdog

# Create scripts/watch-with-python.py
```

```python
#!/usr/bin/env python3
"""
Auto-rebuild watcher for Sheet Music catalog
Watches .ly files and regenerates previews + index on change
"""
import sys
import time
import subprocess
from pathlib import Path
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class LilyPondFileHandler(FileSystemEventHandler):
    def __init__(self, repo_root):
        self.repo_root = Path(repo_root)

    def on_modified(self, event):
        if event.is_directory:
            return

        file_path = Path(event.src_path)

        # Only process .ly files (not includes)
        if file_path.suffix == '.ly' and 'common' not in str(file_path):
            print(f"🔨 File changed: {file_path.relative_to(self.repo_root)}")

            # Regenerate preview
            self.regenerate_preview(file_path)

            # Regenerate index
            self.regenerate_index()

            print("✓ Rebuild complete\n")

    def regenerate_preview(self, ly_file):
        """Regenerate preview PNG for a .ly file"""
        file_dir = ly_file.parent
        file_name = ly_file.name
        script_path = self.repo_root / 'scripts' / 'make-score-preview.sh'

        print(f"   → Regenerating preview: {file_name}")

        try:
            subprocess.run(
                ['bash', str(script_path), file_name],
                cwd=file_dir,
                capture_output=True,
                timeout=120
            )
        except subprocess.TimeoutExpired:
            print(f"   ⚠ Preview generation timed out")
        except Exception as e:
            print(f"   ⚠ Error generating preview: {e}")

    def regenerate_index(self):
        """Regenerate the index page"""
        print(f"   → Regenerating index page")

        try:
            subprocess.run(
                ['python3', 'generate-index-page.py'],
                cwd=self.repo_root,
                capture_output=True,
                timeout=30
            )
        except Exception as e:
            print(f"   ⚠ Error generating index: {e}")

def main():
    repo_root = Path(__file__).parent.parent

    print("🎵 Starting Sheet Music auto-rebuild watcher...")
    print(f"   Repository: {repo_root}")
    print("   Watching: **/*.ly files")
    print("   Press Ctrl+C to stop\n")

    event_handler = LilyPondFileHandler(repo_root)
    observer = Observer()

    # Watch the entire repository recursively
    observer.schedule(event_handler, str(repo_root), recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
        print("\n✓ Watcher stopped")

    observer.join()

if __name__ == "__main__":
    main()
```

**Usage:**
```bash
# Start the watcher
python3 scripts/watch-with-python.py

# Or run in background
nohup python3 scripts/watch-with-python.py > .auto-rebuild.log 2>&1 &
```

---

## Summary Table

| Option | Speed | Ease of Use | Dependencies | When it Updates |
|--------|-------|-------------|--------------|-----------------|
| **File Watcher** | ⚡⚡⚡ Fast | 🟢 Easy | watchman or watchdog | On save |
| **Git Hook** | ⚡ Slow | 🟢 Easy | None | On commit |
| **Make** | ⚡⚡ Medium | 🟡 Manual | make | When you run `make` |
| **VS Code** | ⚡⚡⚡ Fast | 🟢 Easy | VS Code | On save (VS Code only) |

## Next Steps

1. Choose which option you prefer
2. I'll implement the scripts
3. Test with one file
4. Deploy repository-wide

**My Recommendation:** Start with the Python watchdog solution (no external dependencies, cross-platform, easy to customize).

Would you like me to implement any of these options?
