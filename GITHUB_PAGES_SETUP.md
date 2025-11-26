# GitHub Pages Setup Guide
## Making Marc's Sheet Music Collection Available Online

---

## 📋 Overview

GitHub Pages can host your index.html directly from your repository. Since your repo is already on GitHub, we just need to configure it properly.

**✅ CURRENT SETUP: Using `docs/` folder** (Option 2 implemented)

---

## 🎯 Option 2: Use `docs/` Folder ✅ (IMPLEMENTED)

Your setup now uses the `docs/` folder, which keeps web files separate from music source files.

### Current Structure:
```
Sheet-Music/
├── docs/                    # ✅ GitHub Pages content
│   └── index.html          # ✅ Generated here
├── generate-index-page.py  # ✅ Generates to docs/
├── Classical/              # Music source files
├── Folk_Ireland/
└── ... (all other music folders)
```

### Steps:

#### 1. **Configure Repository Settings**
1. Go to your GitHub repository: `https://github.com/[your-username]/Sheet-Music`
2. Click **Settings** tab
3. Scroll down to **Pages** section (left sidebar)
4. Under **Source**, select:
   - **Branch:** `main` (or `master`)
   - **Folder:** `/ (root)`
5. Click **Save**

#### 2. **Wait for Deployment**
- GitHub will automatically deploy
- Takes 1-3 minutes
- Your site will be available at: `https://[your-username].github.io/Sheet-Music/`

#### 3. **Access Your Page**
- URL: `https://[your-username].github.io/Sheet-Music/index.html`
- Or just: `https://[your-username].github.io/Sheet-Music/` (index.html is default)

### ✅ **Advantages:**
- No reorganization needed
- Simplest setup
- Works immediately

### ⚠️ **Considerations:**
- All files in repo are accessible via URL
- Music files (.ly, .pdf, .midi) are publicly accessible
- Repository structure remains as-is

---

## 🎯 Option 1: Host from Root (Alternative)

If you prefer to host from root instead:

### Steps:
1. Move index.html back to root
2. Update `generate-index-page.py`:
   ```python
   OUTPUT_FILE = REPO_ROOT / "index.html"
   ```
3. Remove `../` prefixes from file paths
4. Configure Pages: Branch `main`, Folder `/ (root)`

### ✅ **Advantages:**
- Clean separation of web content and source files
- Can add additional web assets (CSS, images)
- Easier to manage web-specific files

### ⚠️ **Trade-offs:**
- Requires updating file paths
- More setup work

---

## 🎯 Option 3: Separate Branch (Most Isolated)

Keep your music files private, only publish the index.

### Steps:

#### 1. **Create gh-pages Branch**
```bash
git checkout --orphan gh-pages
git rm -rf .
# Keep only web files
cp ../index.html .
git add index.html
git commit -m "Initial GitHub Pages commit"
git push origin gh-pages
```

#### 2. **Configure GitHub Pages**
- Settings → Pages
- Source: `gh-pages` branch, `/ (root)`

### ✅ **Advantages:**
- Complete separation
- Can make gh-pages branch public while keeping main private
- No accidental exposure of source files

### ⚠️ **Trade-offs:**
- More complex setup
- Need to manually update gh-pages when index changes
- PDF/MIDI links won't work (files not in gh-pages branch)

---

## 🎯 **Current Setup (IMPLEMENTED)**

### **Using: `docs/` Folder (Option 2)**

**Structure:**
- ✅ `docs/index.html` - Generated web page
- ✅ `generate-index-page.py` - Outputs to docs/
- ✅ All file paths use `../` prefix to access music files
- ✅ Clean separation between web and source files

**Action Plan:**
1. Commit current changes
2. Push to GitHub
3. Enable Pages in Settings (Branch: main, Folder: /docs)
4. Access at: `https://[your-username].github.io/Sheet-Music/`

---

## 📝 Step-by-Step Implementation

### **Implementation Steps (Current Setup)**

#### Step 1: Ensure Everything is Committed
```bash
cd /Users/marc.mouries/projects/Sheet-Music
git add .
git commit -m "Move to docs/ folder for GitHub Pages"
git push origin main
```

#### Step 2: Enable GitHub Pages
1. Go to: `https://github.com/[your-username]/Sheet-Music/settings/pages`
2. Under "Build and deployment":
   - Source: **Deploy from a branch**
   - Branch: **main**
   - Folder: **/docs**  ⚠️ Important: Select /docs not / (root)
   - Click **Save**

#### Step 3: Wait for Deployment
- Check the Actions tab to see deployment progress
- Usually takes 1-3 minutes

#### Step 4: Test Your Site
- Visit: `https://[your-username].github.io/Sheet-Music/`
- Verify all links work (PDFs, MIDIs should load via ../ paths)

---

## 🔧 Fix File Paths for GitHub Pages

### Current Issue:
Your index.html has links like:
```html
<a href="Classical/Bach/file.pdf">PDF</a>
```

These work locally but need adjustment for GitHub Pages.

### Solution:
No changes needed for Option 1! Relative paths work fine.

For Options 2 or 3, you'd need to update paths or use GitHub raw URLs.

---

## 🎨 Optional Enhancements

### 1. **Custom Domain** (Optional)
- Buy a domain (e.g., marcsmusicsheets.com)
- Add CNAME file to root (or docs/)
- Configure in Settings → Pages → Custom domain

### 2. **Add Favicon**
```html
<link rel="icon" href="favicon.ico" type="image/x-icon">
```

### 3. **Add Social Meta Tags**
```html
<meta property="og:title" content="Marc's Sheet Music Collection">
<meta property="og:description" content="436 classical, folk, and jazz pieces">
<meta property="og:image" content="[link to preview image]">
```

---

## 🚀 **Quick Start - Do This Now**

If you want to go live immediately with Option 1:

```bash
# 1. Commit and push
git add .
git commit -m "Prepare for GitHub Pages"
git push origin main

# 2. Then go to GitHub:
# Settings → Pages → Source: main / (root) → Save

# 3. Wait 1-3 minutes, then visit:
# https://[your-username].github.io/Sheet-Music/
```

---

## ❓ Questions to Answer:

1. **Is your repo already on GitHub?** (If yes, what's the URL?)
2. **Is it public or private?** (GitHub Pages requires public repo for free tier)
3. **Do you want PDF/MIDI files accessible via web?** (Yes = Option 1, No = Option 3)
4. **Do you have a custom domain?** (Optional)

---

## 📌 Next Steps After Going Live

1. Update `TODO.md` with GitHub Pages URL
2. Add `README.md` with link to live site
3. Consider adding `.nojekyll` file to docs/ (tells GitHub Pages not to process with Jekyll)
4. Regenerate index when adding new music: `python3 generate-index-page.py`

---

**✅ Setup Complete! Follow the implementation steps above to go live.**
