# LilyPond Header Best Practices

## Problem

Using `\markup` in header fields makes it difficult to parse metadata programmatically:

```lilypond
% ❌ BAD - Complex markup in header
\header {
  title = \markup{\override #'(font-name . "Garamond") { \abs-fontsize #15 \smallCaps"My Title"}}
  composer = \markup\oldStyleNum"John Doe"
}
```

Issues:
- Hard to extract plain text for indexing
- Mixing presentation with data
- Requires complex regex parsing

## Solution

Keep header fields as simple strings and apply formatting in the `\paper` block:

```lilypond
% ✅ GOOD - Simple strings in header
\header {
  title = "My Title"
  composer = "John Doe"
  style = "folk"
  tagline = ""
}

\paper {
  % Apply formatting to the title using \fromproperty
  bookTitleMarkup = \markup {
    \column {
      \fill-line {
        \override #'(font-name . "Garamond Premier Pro Semibold")
        \abs-fontsize #15
        \smallCaps \fromproperty #'header:title
      }
      \fill-line {
        \large \fromproperty #'header:composer
      }
    }
  }

  % Optional: Format headers on subsequent pages
  oddHeaderMarkup = \markup {
    \fill-line {
      \fromproperty #'page:page-number-string
      \smallCaps \fromproperty #'header:title
    }
  }
}
```

## Benefits

1. **Easy parsing**: Scripts can extract plain text with simple regex
2. **Separation of concerns**: Data vs. presentation
3. **Reusability**: Same formatting can be applied to multiple files
4. **Maintainability**: Change formatting without touching every header

## Available Properties

In `\paper` block markup, you can access header fields with `\fromproperty`:

- `#'header:title` - The title
- `#'header:composer` - The composer
- `#'header:poet` - The poet/lyricist
- `#'header:subtitle` - Subtitle
- `#'page:page-number-string` - Current page number

## Common Formatting Options

```lilypond
\paper {
  % Title page formatting
  bookTitleMarkup = \markup {
    \column {
      \vspace #2
      \fill-line {
        \fontsize #5
        \bold
        \fromproperty #'header:title
      }
      \vspace #1
      \fill-line {
        \fontsize #2
        \fromproperty #'header:composer
      }
    }
  }

  % Page headers (odd pages)
  oddHeaderMarkup = \markup {
    \fill-line {
      \on-the-fly #not-first-page
      \fromproperty #'page:page-number-string
      ""
      \on-the-fly #not-first-page
      \italic \fromproperty #'header:title
    }
  }

  % Page headers (even pages)
  evenHeaderMarkup = \markup {
    \fill-line {
      \on-the-fly #not-first-page
      \italic \fromproperty #'header:composer
      ""
      \on-the-fly #not-first-page
      \fromproperty #'page:page-number-string
    }
  }
}
```

## Migration Tool

Use `fix-markup-headers.py` to automatically extract text from markup headers:

```bash
# Dry run (preview changes)
python3 fix-markup-headers.py

# Apply changes
python3 fix-markup-headers.py --apply
```

## References

- [LilyPond Documentation: Custom titles headers and footers](http://lilypond.org/doc/v2.24/Documentation/notation/custom-titles-headers-and-footers)
- [LilyPond Snippet Repository: Titles](http://lsr.di.unimi.it/LSR/Search?q=title)
