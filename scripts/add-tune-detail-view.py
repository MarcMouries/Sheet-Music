#!/usr/bin/env python3
"""
Add tune detail view support to the index page.
This script adds the necessary JavaScript to support:
- ?tune=tune-slug - Show detailed view of a single tune
- ?category=name - Filter by category
- Direct shareable links for each tune
"""

import re

def sanitize_title_for_url(title):
    """Convert title to URL-safe slug"""
    slug = title.lower()
    slug = re.sub(r'[^a-z0-9]+', '-', slug)
    slug = slug.strip('-')
    return slug

def add_tune_detail_support():
    """Add JavaScript code for tune detail view"""

    # This is the JavaScript snippet to add
    tune_detail_js = """
        // Tune Detail View Support
        function sanitizeTitleForUrl(title) {
            return title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
        }

        function getTuneData(tuneSlug) {
            // Search in both table and cards for the tune
            const allItems = [
                ...document.querySelectorAll('#music-table tbody tr'),
                ...document.querySelectorAll('.card')
            ];

            for (let item of allItems) {
                const titleEl = item.querySelector('td:first-child strong, .card-title');
                if (!titleEl) continue;

                const title = titleEl.textContent.trim();
                const slug = sanitizeTitleForUrl(title);

                if (slug === tuneSlug) {
                    return {
                        element: item,
                        title: title,
                        dataset: item.dataset
                    };
                }
            }
            return null;
        }

        function showTuneDetailView(tuneSlug) {
            const tuneData = getTuneData(tuneSlug);

            if (!tuneData) {
                alert('Tune not found: ' + tuneSlug);
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
                detailView.style.cssText = 'max-width: 900px; margin: 40px auto; padding: 30px; background: white; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);';
                document.querySelector('.container').appendChild(detailView);
            }

            // Get tune metadata
            const element = tuneData.element;
            const isTable = element.tagName === 'TR';

            let composer, country, category, style, key, difficulty;
            let pdfPath, midiPath, thumbnailPath, videoUrl;

            if (isTable) {
                composer = element.cells[1].textContent.trim();
                country = element.cells[2].textContent.trim();
                category = element.cells[3].textContent.trim();
                style = element.cells[4].textContent.trim();
                key = element.cells[5].textContent.trim();
                difficulty = element.dataset.difficulty;

                // Extract links
                const links = element.querySelectorAll('.links a, .links button');
                links.forEach(link => {
                    if (link.textContent.includes('PDF')) {
                        pdfPath = link.href;
                    } else if (link.textContent.includes('Play')) {
                        midiPath = link.onclick.toString().match(/'([^']+)'/)[1];
                    } else if (link.textContent.includes('Video')) {
                        videoUrl = link.href;
                    }
                });
            } else {
                composer = element.querySelector('.card-composer').textContent.trim();
                country = element.querySelector('.card-country').textContent.trim();
                category = element.querySelector('.category').textContent.trim();
                difficulty = element.dataset.difficulty;

                const links = element.querySelectorAll('.links a, .links button');
                links.forEach(link => {
                    if (link.textContent.includes('PDF')) {
                        pdfPath = link.href;
                    } else if (link.textContent.includes('Play')) {
                        midiPath = link.onclick.toString().match(/'([^']+)'/)[1];
                    } else if (link.textContent.includes('Video')) {
                        videoUrl = link.href;
                    }
                });

                // Get thumbnail if exists
                const thumbnailImg = element.querySelector('.card-thumbnail img');
                if (thumbnailImg) {
                    thumbnailPath = thumbnailImg.src;
                }
            }

            // Generate difficulty stars
            const stars = '⭐'.repeat(parseInt(difficulty));

            // Build detail HTML
            let detailHTML = `
                <div style="margin-bottom: 20px;">
                    <a href="index.html" style="color: #667eea; text-decoration: none; font-weight: 600;">← Back to Collection</a>
                </div>

                <h1 style="font-size: 2.5em; color: #2c3e50; margin-bottom: 10px;">${tuneData.title}</h1>

                <div style="display: flex; gap: 20px; margin: 20px 0; flex-wrap: wrap;">
                    <span style="padding: 8px 16px; background: #667eea; color: white; border-radius: 6px; font-weight: 600;">${category}</span>
                    <span style="padding: 8px 16px; background: #f0f0f0; border-radius: 6px;">Difficulty: ${stars}</span>
                </div>

                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin: 30px 0; padding: 20px; background: #f8f9fa; border-radius: 8px;">
                    <div><strong>Composer:</strong><br>${composer || '—'}</div>
                    <div><strong>Country:</strong><br>${country || '—'}</div>
                    <div><strong>Style:</strong><br>${style || '—'}</div>
                    ${key ? `<div><strong>Key:</strong><br>${key}</div>` : ''}
                </div>
            `;

            // Add preview image if available
            if (thumbnailPath) {
                detailHTML += `
                    <div style="margin: 30px 0;">
                        <h2 style="color: #2c3e50; margin-bottom: 15px;">Preview</h2>
                        <img src="${thumbnailPath}" alt="${tuneData.title}"
                             style="width: 100%; max-width: 800px; border-radius: 8px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); cursor: pointer;"
                             onclick="openLightbox('${thumbnailPath}', '${tuneData.title}')">
                    </div>
                `;
            }

            // Add action buttons
            detailHTML += `
                <div style="display: flex; gap: 15px; margin: 30px 0; flex-wrap: wrap;">
            `;

            if (pdfPath) {
                detailHTML += `
                    <a href="${pdfPath}" target="_blank"
                       style="padding: 12px 24px; background: #667eea; color: white; text-decoration: none; border-radius: 6px; font-weight: 600; display: inline-flex; align-items: center; gap: 8px;">
                        📄 View PDF
                    </a>
                `;
            }

            if (midiPath) {
                detailHTML += `
                    <button onclick="playMidi('${midiPath}', '${tuneData.title}')"
                       style="padding: 12px 24px; background: #27ae60; color: white; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                        🎵 Play MIDI
                    </button>
                `;
            }

            if (videoUrl) {
                detailHTML += `
                    <a href="${videoUrl}" target="_blank"
                       style="padding: 12px 24px; background: #e74c3c; color: white; text-decoration: none; border-radius: 6px; font-weight: 600; display: inline-flex; align-items: center; gap: 8px;">
                        🎥 Watch Video
                    </a>
                `;
            }

            // Add copy link button
            const tuneUrl = window.location.origin + window.location.pathname + '?tune=' + tuneSlug;
            detailHTML += `
                <button onclick="navigator.clipboard.writeText('${tuneUrl}').then(() => alert('Link copied!'))"
                   style="padding: 12px 24px; background: #95a5a6; color: white; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 8px;">
                    🔗 Copy Link
                </button>
            `;

            detailHTML += `</div>`;

            detailView.innerHTML = detailHTML;
            detailView.style.display = 'block';

            // Update page title
            document.title = tuneData.title + ' - Marc\\'s Sheet Music Collection';
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
            document.title = 'Marc\\'s Sheet Music Collection 🎵';
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
                    btn.title = 'Direct link to this tune';
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
            const params = new URLSearchParams(window.location.search);

            // Check for tune detail view
            if (params.has('tune')) {
                const tuneSlug = params.get('tune');
                setTimeout(() => showTuneDetailView(tuneSlug), 100);
                return;
            }

            // Hide detail view if no tune parameter
            hideDetailView();

            // Check for category filter
            if (params.has('category')) {
                document.getElementById('category-filter').value = params.get('category');
                filterItems();
            }

            // Original filter handling
            applyURLFilters();
        }

        // Initialize on load
        window.addEventListener('DOMContentLoaded', () => {
            addShareLinkButtons();
            setTimeout(applyEnhancedURLFilters, 300);
        });
    """

    print("Enhanced tune detail view JavaScript code has been generated.")
    print("\nTo add this to your index page:")
    print("1. Copy the JavaScript code above")
    print("2. Add it to the <script> section of your generate-index-page.py")
    print("3. Or save it as a separate .js file and include it in the HTML")
    print("\nFeatures added:")
    print("- Direct links to individual tunes: index.html?tune=gary-owen")
    print("- Category filtering: index.html?category=wedding")
    print("- 🔗 Link buttons on each tune for easy sharing")

if __name__ == '__main__':
    add_tune_detail_support()
