// Tune Detail View Support
// This adds URL parameter support for direct tune links and detail views

function sanitizeTitleForUrl(title) {
    return title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
}

function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function escapeForJs(text) {
    return text.replace(/\\/g, '\\\\').replace(/'/g, "\\'").replace(/"/g, '\\"').replace(/\n/g, '\\n').replace(/\r/g, '\\r');
}

function getTuneData(tuneSlug, selectedKey = null) {
    // Search in both table and cards for the tune
    const allRows = document.querySelectorAll('#music-table tbody tr');

    for (let row of allRows) {
        const titleEl = row.querySelector('td:first-child strong');
        if (!titleEl) continue;

        const title = titleEl.textContent.trim();
        const slug = sanitizeTitleForUrl(title);

        if (slug === tuneSlug) {
            // Parse available keys
            const availableKeys = JSON.parse(row.dataset.availableKeys || '[]');
            const baseName = row.dataset.baseName || '';
            const fileKey = row.dataset.fileKey || '';
            const directory = row.dataset.directory || '';

            // If a key is selected and available, use it; otherwise use the file's key
            const currentKey = selectedKey && availableKeys.includes(selectedKey) ? selectedKey : fileKey;

            // Get subtitle and filter out key information
            let subtitle = row.querySelector('td:first-child small')?.textContent.trim() || '';
            // Remove "Key: X" pattern from subtitle
            subtitle = subtitle.replace(/^Key:\s*[A-G][#b]?\s*(minor|major|m)?$/i, '').trim();

            return {
                element: row,
                title: title,
                composer: row.cells[1].textContent.trim(),
                country: row.cells[2].textContent.trim(),
                category: row.cells[3].textContent.trim(),
                style: row.cells[4].textContent.trim(),
                key: currentKey || row.cells[5].textContent.trim(),
                difficulty: row.dataset.difficulty,
                subtitle: subtitle,
                tags: row.dataset.tags.split(',').filter(t => t),
                pdfPath: row.querySelector('.links a[title="View PDF"]')?.href,
                midiPath: extractMidiPath(row.querySelector('.links button[onclick*="playMidi"]')),
                videoUrl: row.querySelector('.links a[title="Watch video"]')?.href,
                thumbnailPath: findThumbnailForTune(tuneSlug, currentKey),
                availableKeys: availableKeys,
                baseName: baseName,
                fileKey: fileKey,
                directory: directory,
                currentKey: currentKey
            };
        }
    }
    return null;
}

function extractMidiPath(button) {
    if (!button) return null;

    // Get the onclick attribute as a string
    const onclickAttr = button.getAttribute('onclick');
    if (!onclickAttr) return null;

    // Extract the MIDI path from playMidi('path', 'title')
    const match = onclickAttr.match(/playMidi\('([^']+\.midi)'/);
    if (!match) return null;

    // Keep as relative path - absolute URLs don't work with file:// protocol
    return match[1];
}

function findThumbnailForTune(tuneSlug, key = null) {
    // First try to find key-specific preview
    if (key) {
        const allRows = document.querySelectorAll('#music-table tbody tr');
        for (let row of allRows) {
            const titleEl = row.querySelector('td:first-child strong');
            if (!titleEl) continue;

            const title = titleEl.textContent.trim();
            const slug = sanitizeTitleForUrl(title);

            if (slug === tuneSlug) {
                const baseName = row.dataset.baseName || '';
                const directory = row.dataset.directory || '';
                if (baseName && directory) {
                    // Construct path to key-specific preview
                    const relativePath = directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
                    // Encode the key part properly (handles F#m -> F%23m)
                    const encodedKey = encodeURIComponent(key);
                    return `${relativePath}/${baseName}_(${encodedKey})-preview.png`;
                }
            }
        }
    }

    // Fall back to card-based thumbnail
    const cards = document.querySelectorAll('.card');
    for (let card of cards) {
        const titleEl = card.querySelector('.card-title');
        if (!titleEl) continue;

        const slug = sanitizeTitleForUrl(titleEl.textContent.trim());
        if (slug === tuneSlug) {
            const img = card.querySelector('.card-thumbnail img');
            return img ? img.src : null;
        }
    }
    return null;
}

function showTuneDetailView(tuneSlug, selectedKey = null) {
    const tuneData = getTuneData(tuneSlug, selectedKey);

    if (!tuneData) {
        alert('Tune not found: ' + tuneSlug);
        window.location.href = 'index.html';
        return;
    }

    // Hide the normal view
    document.getElementById('table-container').style.display = 'none';
    document.getElementById('cards-container').style.display = 'none';
    document.querySelector('.filters').style.display = 'none';
    document.querySelector('.stats').style.display = 'none';

    // Create detail view if it doesn't exist
    let detailView = document.getElementById('tune-detail-view');
    if (!detailView) {
        detailView = document.createElement('div');
        detailView.id = 'tune-detail-view';
        detailView.style.cssText = 'width: 100%; margin: 0; padding: 30px; background: white;';
        document.querySelector('.container').appendChild(detailView);
    }

    // Generate difficulty stars
    const stars = '⭐'.repeat(parseInt(tuneData.difficulty));

    // Build detail HTML
    let detailHTML = `
        <div style="margin-bottom: 20px;">
            <a href="index.html" style="color: var(--ocean-mid, #2d8a9f); text-decoration: none; font-weight: 600; font-size: 16px;">← Back to Collection</a>
        </div>

        <div style="display: flex; align-items: center; gap: 20px; margin: 20px 20px 20px 0; padding: 5px; border-bottom: 3px solid var(--ocean-mid, #2d8a9f);">
            <h1 style="font-size: 2.5em; color: var(--ocean-deep, #1a5c6e); margin: 20px 20px 20px 0; padding: 5px; line-height: 1; font-family: 'Crimson Pro', serif;">${tuneData.title}</h1>`;

    // Add inline key selector if multiple keys available
    if (tuneData.availableKeys && tuneData.availableKeys.length > 1) {
        detailHTML += `
            <select id="key-selector"
                    style="margin: 20px; padding: 5px; font-size: 1.1rem; border: 2px solid var(--ocean-mid, #2d8a9f); border-radius: 6px; background: white; color: var(--ocean-deep, #1a5c6e); font-weight: 600; cursor: pointer; font-family: 'Work Sans', sans-serif; align-self: center;"
                    onchange="switchKey('${tuneSlug}', this.value)"
                    title="Select a key">`;

        // Sort keys musically (C, C#, D, D#, E, F, F#, G, G#, A, A#, B) with minor variants
        const keyOrder = ['C', 'C#', 'Db', 'D', 'D#', 'Eb', 'E', 'F', 'F#', 'Gb', 'G', 'G#', 'Ab', 'A', 'A#', 'Bb', 'B'];
        const sortedKeys = tuneData.availableKeys.sort((a, b) => {
            const rootA = a.replace(/m$/, '');
            const rootB = b.replace(/m$/, '');
            const indexA = keyOrder.indexOf(rootA);
            const indexB = keyOrder.indexOf(rootB);
            if (indexA !== indexB) return indexA - indexB;
            // If same root, major before minor
            return a.endsWith('m') ? 1 : -1;
        });
        for (const key of sortedKeys) {
            const selected = key === tuneData.currentKey ? 'selected' : '';
            detailHTML += `<option value="${key}" ${selected}>Key: ${key}</option>`;
        }

        detailHTML += `</select>`;
    } else if (tuneData.key && tuneData.key !== '—') {
        // Single key - show as badge
        detailHTML += `
            <span style="padding: 12px 20px; background: var(--ocean-light, #e8f5f8); color: var(--ocean-deep, #1a5c6e); border-radius: 8px; font-weight: 600; font-size: 1.3rem;">Key: ${tuneData.key}</span>`;
    }

    detailHTML += `
        </div>
        ${tuneData.subtitle ? `<p style="font-size: 1.1em; color: #7f8c8d; margin-bottom: 20px; margin-top: 5px;">${tuneData.subtitle}</p>` : ''}

        <div style="display: flex; gap: 20px; margin: 20px 0; flex-wrap: wrap;">
            <span style="padding: 8px 16px; background: #667eea; color: white; border-radius: 6px; font-weight: 600;">${tuneData.category}</span>
            <span style="padding: 8px 16px; background: #f0f0f0; border-radius: 6px;">Difficulty: ${stars}</span>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin: 30px 0; padding: 20px; background: #f8f9fa; border-radius: 8px;">
            <div><strong>Composer:</strong><br>${tuneData.composer || '—'}</div>
            <div><strong>Country:</strong><br>${tuneData.country || '—'}</div>
            <div><strong>Style:</strong><br>${tuneData.style || '—'}</div>
        </div>
    `;

    // Add tags if available
    if (tuneData.tags && tuneData.tags.length > 0) {
        detailHTML += `
            <div style="margin: 20px 0;">
                <strong>Tags:</strong>
                <div style="display: flex; gap: 8px; flex-wrap: wrap; margin-top: 10px;">
                    ${tuneData.tags.map(tag => `<span style="padding: 4px 12px; background: #ecf0f1; border-radius: 4px; font-size: 13px;">${tag}</span>`).join('')}
                </div>
            </div>
        `;
    }

    // Add preview image if available
    if (tuneData.thumbnailPath) {
        const escapedThumbnailPath = escapeForJs(tuneData.thumbnailPath);
        const escapedTitle = escapeForJs(tuneData.title);
        detailHTML += `
            <div id="tune-preview-container" style="margin: 30px 0; width: 100%;">
                <h2 style="color: #2c3e50; margin-bottom: 15px;">Preview</h2>
                <img src="${tuneData.thumbnailPath}" alt="${escapeHtml(tuneData.title)}"
                     style="width: 100%; max-width: 100%; height: auto; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); cursor: pointer;"
                     onclick="openLightbox('${escapedThumbnailPath}', '${escapedTitle}')">
            </div>
        `;
    }

    // Add action buttons
    detailHTML += `
        <div style="display: flex; gap: 15px; margin: 30px 0; flex-wrap: wrap;">
    `;

    // Generate key-specific paths if needed
    let pdfPath = tuneData.pdfPath;
    let midiPath = tuneData.midiPath;

    if (tuneData.currentKey && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        // Encode key properly for URLs (handles F#m)
        const encodedKey = encodeURIComponent(tuneData.currentKey);
        pdfPath = `${relativePath}/${tuneData.baseName}_(${encodedKey}).pdf`;
        midiPath = `${relativePath}/${tuneData.baseName}_(${encodedKey}).midi`;
    }

    if (pdfPath) {
        detailHTML += `
            <a id="pdf-link" href="${pdfPath}" target="_blank"
               style="padding: 12px 24px; background: var(--ocean-mid, #2d8a9f); color: white; text-decoration: none; border-radius: 6px; font-weight: 600; display: inline-flex; align-items: center; gap: 8px;">
                📄 View PDF
            </a>
        `;
    }

    if (midiPath) {
        // Resolve relative path to absolute path for proper fetching
        const basePath = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/') + 1);
        const absolutePath = new URL(midiPath, window.location.origin + basePath).href;

        const escapedMidiPath = escapeForJs(absolutePath);
        const escapedTitle = escapeForJs(tuneData.title);
        detailHTML += `
            <button id="midi-button" onclick="playMidi('${escapedMidiPath}', '${escapedTitle}')"
               style="padding: 12px 24px; background: #27ae60; color: white; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                🎵 Play MIDI
            </button>
        `;
    }

    if (tuneData.videoUrl) {
        detailHTML += `
            <a href="${tuneData.videoUrl}" target="_blank"
               style="padding: 12px 24px; background: #e74c3c; color: white; text-decoration: none; border-radius: 6px; font-weight: 600; display: inline-flex; align-items: center; gap: 8px;">
                🎥 Watch Video
            </a>
        `;
    }

    // Add copy link button
    const tuneUrl = window.location.origin + window.location.pathname + '?tune=' + tuneSlug;
    const escapedTuneUrl = escapeForJs(tuneUrl);
    detailHTML += `
        <button onclick="navigator.clipboard.writeText('${escapedTuneUrl}').then(() => alert('Link copied to clipboard!'))"
           style="padding: 12px 24px; background: #95a5a6; color: white; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
            🔗 Copy Link
        </button>
    `;

    detailHTML += `</div>`;

    detailView.innerHTML = detailHTML;
    detailView.style.display = 'block';

    // Update page title
    document.title = tuneData.title + ' - Marc\'s Sheet Music Collection';
}

function hideDetailView() {
    const detailView = document.getElementById('tune-detail-view');
    if (detailView) {
        detailView.style.display = 'none';
    }

    // Show normal view
    document.getElementById('table-container').style.display = 'block';
    document.querySelector('.filters').style.display = 'flex';
    document.querySelector('.stats').style.display = 'flex';

    // Reset page title
    document.title = 'Marc\'s Sheet Music Collection 🎵';
}

// Enhanced URL parameter handling
function applyEnhancedURLFilters() {
    const params = new URLSearchParams(window.location.search);

    // Check for tune detail view FIRST
    if (params.has('tune')) {
        const tuneSlug = params.get('tune');
        const selectedKey = params.get('key'); // Get key from URL if present
        setTimeout(() => showTuneDetailView(tuneSlug, selectedKey), 100);
        return; // Don't process other filters if showing tune detail
    }

    // Hide detail view if no tune parameter
    hideDetailView();

    // Check for category filter (enhanced)
    if (params.has('category')) {
        const categoryParam = decodeURIComponent(params.get('category')).toLowerCase();

        // Check if this is a special category (wedding, christmas) that has a dedicated button
        if (categoryParam === 'wedding' && typeof showWedding === 'function') {
            showWedding();
            return;
        } else if (categoryParam === 'christmas' && typeof showChristmas === 'function') {
            showChristmas();
            return;
        }

        // Otherwise, use the regular category filter
        const categoryFilter = document.getElementById('category-filter');
        if (categoryFilter) {
            // Find matching option (case-insensitive)
            const options = Array.from(categoryFilter.options);
            const matchingOption = options.find(opt =>
                opt.value.toLowerCase() === categoryParam
            );

            if (matchingOption) {
                categoryFilter.value = matchingOption.value;

                // Check if filterItems function exists
                if (typeof filterItems === 'function') {
                    filterItems();
                }
            }
        }
    }
}

// Switch between different keys for the same tune
function switchKey(tuneSlug, newKey) {
    // Update URL with new key parameter
    const url = new URL(window.location);
    url.searchParams.set('key', newKey);
    window.history.pushState({}, '', url);

    // Get updated tune data for the new key
    const tuneData = getTuneData(tuneSlug, newKey);
    if (!tuneData) return;

    // Update only the elements that change with the key
    const encodedKey = encodeURIComponent(newKey);

    // Update preview image
    const previewImg = document.querySelector('#tune-preview-container img');
    if (previewImg && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        previewImg.src = `${relativePath}/${tuneData.baseName}_(${encodedKey})-preview.png`;
    }

    // Update PDF link
    const pdfLink = document.getElementById('pdf-link');
    if (pdfLink && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        pdfLink.href = `${relativePath}/${tuneData.baseName}_(${encodedKey}).pdf`;
    }

    // Update MIDI button
    const midiButton = document.getElementById('midi-button');
    if (midiButton && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        const midiPath = `${relativePath}/${tuneData.baseName}_(${encodedKey}).midi`;
        const basePath = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/') + 1);
        const absolutePath = new URL(midiPath, window.location.origin + basePath).href;
        const escapedMidiPath = escapeForJs(absolutePath);
        const escapedTitle = escapeForJs(tuneData.title);
        midiButton.setAttribute('onclick', `playMidi('${escapedMidiPath}', '${escapedTitle}')`);
    }
}

// Initialize on load
window.addEventListener('load', () => {
    // Apply enhanced filters - run after everything is loaded
    // Use load event instead of DOMContentLoaded to ensure scripts are ready
    setTimeout(() => {
        applyEnhancedURLFilters();
    }, 100);
});
