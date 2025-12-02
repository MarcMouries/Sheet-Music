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

function getTuneData(tuneSlug) {
    // Search in both table and cards for the tune
    const allRows = document.querySelectorAll('#music-table tbody tr');

    for (let row of allRows) {
        const titleEl = row.querySelector('td:first-child strong');
        if (!titleEl) continue;

        const title = titleEl.textContent.trim();
        const slug = sanitizeTitleForUrl(title);

        if (slug === tuneSlug) {
            return {
                element: row,
                title: title,
                composer: row.cells[1].textContent.trim(),
                country: row.cells[2].textContent.trim(),
                category: row.cells[3].textContent.trim(),
                style: row.cells[4].textContent.trim(),
                key: row.cells[5].textContent.trim(),
                difficulty: row.dataset.difficulty,
                subtitle: row.querySelector('td:first-child small')?.textContent.trim() || '',
                tags: row.dataset.tags.split(',').filter(t => t),
                pdfPath: row.querySelector('.links a[title="View PDF"]')?.href,
                midiPath: extractMidiPath(row.querySelector('.links button[onclick*="playMidi"]')),
                videoUrl: row.querySelector('.links a[title="Watch video"]')?.href,
                thumbnailPath: findThumbnailForTune(tuneSlug)
            };
        }
    }
    return null;
}

function extractMidiPath(button) {
    if (!button) return null;

    // Get the onclick attribute as a string
    const onclickAttr = button.getAttribute('onclick');
    console.log('Extract MIDI - onclick attr:', onclickAttr);
    if (!onclickAttr) return null;

    // Extract the MIDI path from playMidi('path', 'title')
    const match = onclickAttr.match(/playMidi\('([^']+\.midi)'/);
    console.log('Extract MIDI - match result:', match);
    if (!match) return null;

    // Keep as relative path - absolute URLs don't work with file:// protocol
    const midiPath = match[1];
    console.log('Extract MIDI - extracted path:', midiPath);
    return midiPath;
}

function findThumbnailForTune(tuneSlug) {
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

function showTuneDetailView(tuneSlug) {
    const tuneData = getTuneData(tuneSlug);

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
            <a href="index.html" style="color: #667eea; text-decoration: none; font-weight: 600; font-size: 16px;">← Back to Collection</a>
        </div>

        <h1 style="font-size: 2.5em; color: #2c3e50; margin-bottom: 10px;">${tuneData.title}</h1>
        ${tuneData.subtitle ? `<p style="font-size: 1.1em; color: #7f8c8d; margin-bottom: 20px;">${tuneData.subtitle}</p>` : ''}

        <div style="display: flex; gap: 20px; margin: 20px 0; flex-wrap: wrap;">
            <span style="padding: 8px 16px; background: #667eea; color: white; border-radius: 6px; font-weight: 600;">${tuneData.category}</span>
            <span style="padding: 8px 16px; background: #f0f0f0; border-radius: 6px;">Difficulty: ${stars}</span>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin: 30px 0; padding: 20px; background: #f8f9fa; border-radius: 8px;">
            <div><strong>Composer:</strong><br>${tuneData.composer || '—'}</div>
            <div><strong>Country:</strong><br>${tuneData.country || '—'}</div>
            <div><strong>Style:</strong><br>${tuneData.style || '—'}</div>
            ${tuneData.key ? `<div><strong>Key:</strong><br>${tuneData.key}</div>` : ''}
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

    if (tuneData.pdfPath) {
        detailHTML += `
            <a href="${tuneData.pdfPath}" target="_blank"
               style="padding: 12px 24px; background: #667eea; color: white; text-decoration: none; border-radius: 6px; font-weight: 600; display: inline-flex; align-items: center; gap: 8px;">
                📄 View PDF
            </a>
        `;
    }

    if (tuneData.midiPath) {
        // Resolve relative path to absolute path for proper fetching
        const basePath = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/') + 1);
        const absolutePath = new URL(tuneData.midiPath, window.location.origin + basePath).href;

        const escapedMidiPath = escapeForJs(absolutePath);
        const escapedTitle = escapeForJs(tuneData.title);
        console.log('MIDI Debug - Original path:', tuneData.midiPath);
        console.log('MIDI Debug - Base path:', basePath);
        console.log('MIDI Debug - Absolute path:', absolutePath);
        console.log('MIDI Debug - Escaped path:', escapedMidiPath);
        console.log('MIDI Debug - Original title:', tuneData.title);
        console.log('MIDI Debug - Escaped title:', escapedTitle);
        detailHTML += `
            <button onclick="playMidi('${escapedMidiPath}', '${escapedTitle}')"
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

// Add share link buttons to each row/card
function addShareLinkButtons() {
    // Add to table rows
    const tableRows = document.querySelectorAll('#music-table tbody tr');
    tableRows.forEach(row => {
        const titleCell = row.querySelector('td:first-child strong');
        if (!titleCell) return;

        const title = titleCell.textContent.trim();
        const slug = sanitizeTitleForUrl(title);
        const linksCell = row.querySelector('.links');

        if (linksCell && !linksCell.querySelector('.share-link-btn')) {
            const btn = document.createElement('button');
            btn.className = 'btn share-link-btn';
            btn.innerHTML = '🔗 Link';
            btn.title = 'Direct link to this tune';
            btn.onclick = (e) => {
                e.stopPropagation();
                const url = window.location.origin + window.location.pathname + '?tune=' + slug;
                window.location.href = url;
            };
            linksCell.appendChild(btn);
        }
    });

    // Add to cards
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        const titleEl = card.querySelector('.card-title');
        if (!titleEl) return;

        const title = titleEl.textContent.trim();
        const slug = sanitizeTitleForUrl(title);
        const linksDiv = card.querySelector('.links');

        if (linksDiv && !linksDiv.querySelector('.share-link-btn')) {
            const btn = document.createElement('button');
            btn.className = 'btn share-link-btn';
            btn.innerHTML = '🔗';
            btn.title = 'Direct link';
            btn.onclick = (e) => {
                e.stopPropagation();
                const url = window.location.origin + window.location.pathname + '?tune=' + slug;
                window.location.href = url;
            };
            linksDiv.appendChild(btn);
        }
    });
}

// Enhanced URL parameter handling
function applyEnhancedURLFilters() {
    console.log('applyEnhancedURLFilters called');
    const params = new URLSearchParams(window.location.search);
    console.log('URL params:', Array.from(params.entries()));

    // Check for tune detail view FIRST
    if (params.has('tune')) {
        const tuneSlug = params.get('tune');
        console.log('Showing tune detail for:', tuneSlug);
        setTimeout(() => showTuneDetailView(tuneSlug), 100);
        return; // Don't process other filters if showing tune detail
    }

    // Hide detail view if no tune parameter
    hideDetailView();

    // Check for category filter (enhanced)
    if (params.has('category')) {
        const categoryParam = decodeURIComponent(params.get('category')).toLowerCase();
        console.log('Applying category filter:', categoryParam);

        // Check if this is a special category (wedding, christmas) that has a dedicated button
        if (categoryParam === 'wedding' && typeof showWedding === 'function') {
            console.log('Using showWedding() function');
            showWedding();
            return;
        } else if (categoryParam === 'christmas' && typeof showChristmas === 'function') {
            console.log('Using showChristmas() function');
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
                console.log('Category filter element value set to:', categoryFilter.value);

                // Check if filterItems function exists
                if (typeof filterItems === 'function') {
                    console.log('Calling filterItems()');
                    filterItems();
                } else {
                    console.error('filterItems function not found!');
                }
            } else {
                console.error('No matching category found for:', categoryParam);
                console.log('Available categories:', options.map(o => o.value));
            }
        } else {
            console.error('category-filter element not found!');
        }
    } else {
        console.log('No category parameter in URL');
    }
}

// Initialize on load
window.addEventListener('load', () => {
    console.log('Window load event fired');

    // Add share link buttons first
    addShareLinkButtons();

    // Apply enhanced filters - run after everything is loaded
    // Use load event instead of DOMContentLoaded to ensure scripts are ready
    setTimeout(() => {
        console.log('About to call applyEnhancedURLFilters');
        applyEnhancedURLFilters();
    }, 100);
});

console.log('Tune detail view support loaded');
