# GitHub Pages Setup Guide
## Making Marc's Sheet Music Collection Available Online

---

## 📋 Overview

GitHub Pages can host your index.html directly from your repository. Since your repo is already on GitHub, we just need to configure it properly.

---

## 🎯 Option 1: Host from Root (Simplest)

### Current Structure:
Your `index.html` is already in the root directory ✅

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

## 🎯 Option 2: Use `docs/` Folder (Recommended for Organization)

This keeps your web files separate from your music source files.

### Steps:

#### 1. **Create Folder Structure**
```bash
Sheet-Music/
├── docs/                    # GitHub Pages content
│   ├── index.html          # Move here
│   ├── assets/             # Optional: for images, CSS, JS
│   └── previews/           # Optional: PDF previews, thumbnails
├── Classical/              # Keep music files here
├── Folk_Ireland/
└── ... (all other music folders)
```

#### 2. **Move index.html to docs/**
```bash
mkdir docs
mv index.html docs/
```

#### 3. **Update generate-index-enhanced.py**
Change the output path:
```python
OUTPUT_FILE = REPO_ROOT / "docs" / "index.html"
```

#### 4. **Update File Paths in index.html**
Since index.html is now in `docs/`, update all file references:
- From: `Classical/Bach/file.pdf`
- To: `../Classical/Bach/file.pdf`

Or use absolute GitHub raw URLs:
- `https://raw.githubusercontent.com/[user]/Sheet-Music/main/Classical/Bach/file.pdf`

#### 5. **Configure GitHub Pages**
1. Go to repository Settings → Pages
2. Select:
   - **Branch:** `main`
   - **Folder:** `/docs`
3. Save

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

## 🎯 **Recommended Approach**

### **For Your Use Case: Option 1 (Root)**

**Why:**
1. Your repo is already public (or will be)
2. index.html is already in root
3. PDF/MIDI files should be accessible
4. Simplest to maintain

**Action Plan:**
1. Commit current changes
2. Push to GitHub
3. Enable Pages in Settings
4. Access at: `https://[your-username].github.io/Sheet-Music/`

---

## 📝 Step-by-Step Implementation

### **Option 1 Implementation (Recommended)**

#### Step 1: Ensure Everything is Committed
```bash
cd /Users/marc.mouries/projects/Sheet-Music
git add .
git commit -m "Reorganize files and update index for GitHub Pages"
git push origin main
```

#### Step 2: Enable GitHub Pages
1. Go to: `https://github.com/[your-username]/Sheet-Music/settings/pages`
2. Under "Build and deployment":
   - Source: **Deploy from a branch**
   - Branch: **main** / **/ (root)**
   - Click **Save**

#### Step 3: Wait for Deployment
- Check the Actions tab to see deployment progress
- Usually takes 1-3 minutes

#### Step 4: Test Your Site
- Visit: `https://[your-username].github.io/Sheet-Music/`
- Verify all links work

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
3. Consider adding `.nojekyll` file (tells GitHub Pages not to process with Jekyll)
4. Update `generate-index-enhanced.py` to include GitHub Pages URL in output

---

**Let me know which option you prefer, and I'll help implement it!**
