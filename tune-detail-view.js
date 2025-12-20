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
        const fileKey = row.dataset.fileKey || '';

        // Check if slug matches using data-tune-slug attribute
        const rowTuneSlug = row.dataset.tuneSlug || '';

        if (rowTuneSlug === tuneSlug) {
            // Parse available keys and filename keys
            const availableKeys = JSON.parse(row.dataset.availableKeys || '[]');
            let filenameKeys = [];
            try {
                filenameKeys = JSON.parse(row.dataset.filenameKeys || '[]');
            } catch (e) {
                filenameKeys = [];
            }
            const baseName = row.dataset.baseName || '';
            const directory = row.dataset.directory || '';

            // If a key is selected and available, use it; otherwise use the first available key (default)
            const currentKey = selectedKey && availableKeys.includes(selectedKey) ? selectedKey : (availableKeys[0] || fileKey);

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
                csvGenre: row.dataset.csvGenre || '',
                csvSubgenre: row.dataset.csvSubgenre || '',
                key: currentKey || row.cells[4].textContent.trim(),
                difficulty: row.dataset.difficulty,
                subtitle: subtitle,
                tags: row.dataset.tags.split(',').filter(t => t),
                pdfPath: row.querySelector('.links a[title="View PDF"]')?.href,
                midiPath: extractMidiPath(row.querySelector('.links button[onclick*="playMidi"]')),
                videoUrl: row.querySelector('.links a[title="Watch video"]')?.href,
                thumbnailPath: findThumbnailForTune(tuneSlug, currentKey),
                availableKeys: availableKeys,
                filenameKeys: filenameKeys,
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
    const allRows = document.querySelectorAll('#music-table tbody tr');

    // If key is provided, determine the correct preview path
    if (key) {
        for (let row of allRows) {
            if (row.dataset.tuneSlug === tuneSlug) {
                const baseName = row.dataset.baseName || '';
                const directory = row.dataset.directory || '';
                // Parse filename_keys - these are keys that have _(Key) suffix in filename
                let filenameKeys = [];
                try {
                    filenameKeys = JSON.parse(row.dataset.filenameKeys || '[]');
                } catch (e) {
                    filenameKeys = [];
                }

                if (baseName && directory) {
                    const relativePath = directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
                    const encodedBaseName = encodeURIComponent(baseName);

                    // If the key has a filename suffix (is in filename_keys), use _(Key)-preview.svg
                    if (filenameKeys.includes(key)) {
                        const encodedKey = encodeURIComponent(key);
                        return `${relativePath}/${encodedBaseName}_(${encodedKey})-preview.svg`;
                    }
                    // Otherwise, key is from header - use base preview (no key suffix)
                    return `${relativePath}/${encodedBaseName}-preview.svg`;
                }
            }
        }
    }

    // Fall back to finding thumbnail via table row data-tune-slug (no key specified)
    for (let row of allRows) {
        if (row.dataset.tuneSlug === tuneSlug) {
            const baseName = row.dataset.baseName || '';
            const directory = row.dataset.directory || '';
            if (baseName && directory) {
                const relativePath = directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
                const encodedBaseName = encodeURIComponent(baseName);
                return `${relativePath}/${encodedBaseName}-preview.svg`;
            }
        }
    }

    // Final fallback to card-based thumbnail by title
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

function getCurrentCollection() {
    // Get all currently visible tunes based on active filters
    const visibleRows = Array.from(document.querySelectorAll('#music-table tbody tr'))
        .filter(row => row.style.display !== 'none');

    return visibleRows.map(row => {
        // Use data-tune-slug directly for consistent slug handling
        return row.dataset.tuneSlug || null;
    }).filter(slug => slug !== null);
}

function getNavigationInfo(tuneSlug) {
    const collection = getCurrentCollection();
    const currentIndex = collection.indexOf(tuneSlug);

    if (currentIndex === -1) {
        return { prev: null, next: null, position: 0, total: 0 };
    }

    return {
        prev: currentIndex > 0 ? collection[currentIndex - 1] : null,
        next: currentIndex < collection.length - 1 ? collection[currentIndex + 1] : null,
        position: currentIndex + 1,
        total: collection.length
    };
}

function showTuneDetailView(tuneSlug, selectedKey = null) {
    const tuneData = getTuneData(tuneSlug, selectedKey);

    if (!tuneData) {
        alert('Tune not found: ' + tuneSlug);
        window.location.href = 'index.html';
        return;
    }

    // Get navigation info based on current collection
    const navInfo = getNavigationInfo(tuneSlug);

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
        detailView.style.cssText = 'width: 100%; margin: 0; padding: 30px; background: var(--bg-container, white); color: var(--text-primary, #2d3842);';
        document.querySelector('.container').appendChild(detailView);
    }

    // Generate difficulty stars
    const stars = '⭐'.repeat(parseInt(tuneData.difficulty));

    // Build back link with preserved search/filter state
    const urlParams = new URLSearchParams(window.location.search);
    const backParams = new URLSearchParams();

    // Preserve search and filter parameters (exclude 'tune' and 'key')
    for (const [key, value] of urlParams.entries()) {
        if (key !== 'tune' && key !== 'key' && value) {
            backParams.set(key, value);
        }
    }

    const backUrl = backParams.toString() ? `index.html?${backParams.toString()}` : 'index.html';

    // Build navigation function to preserve filters
    function buildNavUrl(targetSlug) {
        const navUrl = new URL(window.location);
        navUrl.searchParams.set('tune', targetSlug);
        navUrl.searchParams.delete('key'); // Remove key when navigating to different tune

        // Ensure all filter parameters are preserved
        const currentParams = new URLSearchParams(window.location.search);
        for (const [key, value] of currentParams.entries()) {
            if (key !== 'tune' && key !== 'key') {
                navUrl.searchParams.set(key, value);
            }
        }

        return navUrl.toString();
    }

    // Build detail HTML
    let detailHTML = `
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; flex-wrap: wrap; gap: 15px;">
            <a href="${backUrl}" style="color: var(--ocean-mid, #2d8a9f); text-decoration: none; font-weight: 600; font-size: 16px;">← Back to Collection</a>`;

    // Add collection position info and navigation
    if (navInfo.total > 0) {
        // Debug logging
        console.log('Navigation Info:', navInfo);
        console.log('Current tune:', tuneSlug);

        detailHTML += `
            <div style="display: flex; align-items: center; gap: 15px;">
                <span style="color: #7f8c8d; font-size: 14px;">${navInfo.position} of ${navInfo.total}</span>
                <div style="display: flex; gap: 8px;">`;

        if (navInfo.prev) {
            const prevUrl = buildNavUrl(navInfo.prev);
            console.log('Previous URL:', prevUrl);
            detailHTML += `
                    <a href="${escapeHtml(prevUrl)}"
                       style="padding: 8px 16px; background: var(--ocean-mid, #2d8a9f); color: white; text-decoration: none; border-radius: 6px; font-weight: 600; font-size: 14px; display: inline-flex; align-items: center; gap: 6px;"
                       title="Previous tune in collection">
                        ← Previous
                    </a>`;
        }

        if (navInfo.next) {
            const nextUrl = buildNavUrl(navInfo.next);
            console.log('Next URL:', nextUrl);
            detailHTML += `
                    <a href="${escapeHtml(nextUrl)}"
                       style="padding: 8px 16px; background: var(--ocean-mid, #2d8a9f); color: white; text-decoration: none; border-radius: 6px; font-weight: 600; font-size: 14px; display: inline-flex; align-items: center; gap: 6px;"
                       title="Next tune in collection">
                        Next →
                    </a>`;
        }

        detailHTML += `
                </div>
            </div>`;
    }

    detailHTML += `
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

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin: 30px 0; padding: 20px; background: var(--bg-filter, #f8f9fa); border-radius: 8px;">
            <div><strong>Composer:</strong><br>${tuneData.composer || '—'}</div>
            <div><strong>Country:</strong><br>${tuneData.country || '—'}</div>
            <div><strong>Genre:</strong><br>${tuneData.csvGenre || '—'}${tuneData.csvSubgenre ? `<br><small style="color: #7f8c8d;">${tuneData.csvSubgenre}</small>` : ''}</div>
            <div><strong>Difficulty:</strong><br>${stars}</div>
        </div>
    `;

    // Add preview image if available
    if (tuneData.thumbnailPath) {
        const escapedThumbnailPath = escapeForJs(tuneData.thumbnailPath);
        const escapedTitle = escapeForJs(tuneData.title);
        detailHTML += `
            <div id="tune-preview-container" style="margin: 30px 0; width: 100%; color: var(--text-primary, #2c3e50);">
                <h2 style="color: var(--text-heading, #2c3e50); margin-bottom: 15px;">Preview</h2>
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

    // Add keyboard shortcuts hint
    if (navInfo.total > 0) {
        detailHTML += `
            <div style="margin-top: 40px; padding: 15px; background: var(--bg-filter, #f8f9fa); border-left: 4px solid var(--ocean-mid, #2d8a9f); border-radius: 4px; font-size: 13px; color: var(--text-primary, #7f8c8d);">
                <strong style="color: var(--text-heading, #2c3e50);">⌨️ Keyboard Shortcuts:</strong><br>
                <span style="display: inline-block; margin-top: 8px;">
                    ${navInfo.prev ? '<kbd style="padding: 2px 6px; background: var(--bg-input, white); border: 1px solid var(--border-color, #ccc); border-radius: 3px; font-family: monospace;">←</kbd> Previous tune &nbsp;&nbsp;' : ''}
                    ${navInfo.next ? '<kbd style="padding: 2px 6px; background: var(--bg-input, white); border: 1px solid var(--border-color, #ccc); border-radius: 3px; font-family: monospace;">→</kbd> Next tune &nbsp;&nbsp;' : ''}
                    <kbd style="padding: 2px 6px; background: var(--bg-input, white); border: 1px solid var(--border-color, #ccc); border-radius: 3px; font-family: monospace;">Esc</kbd> Back to collection
                </span>
            </div>
        `;
    }

    detailView.innerHTML = detailHTML;
    detailView.style.display = 'block';

    // Update page title
    document.title = tuneData.title + ' - Marc\'s Sheet Music Collection';

    // Set up keyboard navigation (arrow keys)
    setupKeyboardNavigation(navInfo);
}

function setupKeyboardNavigation(navInfo) {
    // Remove any existing keyboard listeners
    if (window.tuneNavigationKeyHandler) {
        document.removeEventListener('keydown', window.tuneNavigationKeyHandler);
    }

    // Create new handler
    window.tuneNavigationKeyHandler = function(e) {
        // Only handle if we're in detail view
        const detailView = document.getElementById('tune-detail-view');
        if (!detailView || detailView.style.display === 'none') {
            return;
        }

        // Ignore if user is typing in an input/textarea/select
        if (['INPUT', 'TEXTAREA', 'SELECT'].includes(e.target.tagName)) {
            return;
        }

        if (e.key === 'ArrowLeft' && navInfo.prev) {
            // Navigate to previous tune
            e.preventDefault();
            const newUrl = new URL(window.location);
            newUrl.searchParams.set('tune', navInfo.prev);
            newUrl.searchParams.delete('key');
            window.location.href = newUrl.toString();
        } else if (e.key === 'ArrowRight' && navInfo.next) {
            // Navigate to next tune
            e.preventDefault();
            const newUrl = new URL(window.location);
            newUrl.searchParams.set('tune', navInfo.next);
            newUrl.searchParams.delete('key');
            window.location.href = newUrl.toString();
        } else if (e.key === 'Escape') {
            // Go back to collection
            e.preventDefault();
            const newUrl = new URL(window.location);
            newUrl.searchParams.delete('tune');
            newUrl.searchParams.delete('key');
            window.location.href = newUrl.toString();
        }
    };

    document.addEventListener('keydown', window.tuneNavigationKeyHandler);
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

    // ALWAYS apply filters first (even if showing tune detail)
    // This ensures the collection is properly filtered before navigation
    applyFilterParameters(params);

    // Check for tune detail view
    if (params.has('tune')) {
        const tuneSlug = params.get('tune');
        const selectedKey = params.get('key'); // Get key from URL if present
        // Wait a bit longer to ensure filters are fully applied
        setTimeout(() => showTuneDetailView(tuneSlug, selectedKey), 200);
        return; // Don't process special category filters if showing tune detail
    }

    // Hide detail view if no tune parameter
    hideDetailView();
}

// Apply filter parameters from URL
function applyFilterParameters(params) {
    // Apply search query
    if (params.has('search')) {
        const searchBox = document.getElementById('search');
        if (searchBox) {
            searchBox.value = decodeURIComponent(params.get('search'));
        }
    }

    // Apply category filter
    if (params.has('category')) {
        const categoryParam = decodeURIComponent(params.get('category'));
        const categoryFilter = document.getElementById('category-filter');
        if (categoryFilter) {
            const options = Array.from(categoryFilter.options);
            const matchingOption = options.find(opt =>
                opt.value.toLowerCase() === categoryParam.toLowerCase()
            );
            if (matchingOption) {
                categoryFilter.value = matchingOption.value;
            }
        }
    }

    // Apply country filter
    if (params.has('country')) {
        const countryParam = decodeURIComponent(params.get('country'));
        const countryFilter = document.getElementById('country-filter');
        if (countryFilter) {
            countryFilter.value = countryParam;
        }
    }

    // Apply difficulty filter
    if (params.has('difficulty')) {
        const difficultyParam = params.get('difficulty');
        const difficultyFilter = document.getElementById('difficulty-filter');
        if (difficultyFilter) {
            difficultyFilter.value = difficultyParam;
        }
    }

    // Now trigger the filter function to apply all filters
    if (typeof filterItems === 'function') {
        filterItems();
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

    // Check if this key has a filename suffix (is in filenameKeys)
    const hasFilenameSuffix = tuneData.filenameKeys && tuneData.filenameKeys.includes(newKey);
    const encodedKey = encodeURIComponent(newKey);
    const encodedBaseName = encodeURIComponent(tuneData.baseName);

    // Update preview image
    const previewImg = document.querySelector('#tune-preview-container img');
    if (previewImg && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        if (hasFilenameSuffix) {
            previewImg.src = `${relativePath}/${encodedBaseName}_(${encodedKey})-preview.svg`;
        } else {
            // Key is from header, use base preview (no key suffix)
            previewImg.src = `${relativePath}/${encodedBaseName}-preview.svg`;
        }
    }

    // Update PDF link
    const pdfLink = document.getElementById('pdf-link');
    if (pdfLink && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        if (hasFilenameSuffix) {
            pdfLink.href = `${relativePath}/${encodedBaseName}_(${encodedKey}).pdf`;
        } else {
            pdfLink.href = `${relativePath}/${encodedBaseName}.pdf`;
        }
    }

    // Update MIDI button
    const midiButton = document.getElementById('midi-button');
    if (midiButton && tuneData.baseName && tuneData.directory) {
        const relativePath = tuneData.directory.replace('/Users/marc.mouries/projects/Sheet-Music/', '');
        let midiPath;
        if (hasFilenameSuffix) {
            midiPath = `${relativePath}/${encodedBaseName}_(${encodedKey}).midi`;
        } else {
            midiPath = `${relativePath}/${encodedBaseName}.midi`;
        }
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
