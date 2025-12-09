# Catalog Schema Explanation

This document explains the purpose and usage of each column in your violin sheet‑music cataloging system.  
The goal: help musicians, teachers, and students quickly find the right piece based on style, difficulty, technique, tradition, and use case.

---

## 1. Title
**What it is:**  
The name of the piece exactly as it appears.

**Used for:**  
- Basic lookup  
- Alphabetical sorting  
- Matching to printed folders

---

## 2. Composer
**What it is:**  
Composer, songwriter, or “Traditional / Unknown” for folk music.

**Used for:**  
- Searching by composer (Bach, Django, Paganini…)  
- Distinguishing originals vs arrangements  
- Grouping by musical lineage

---

## 3. Style/Genre
**What it is:**  
Top‑level style category (Classical, Jazz, Gypsy Jazz, Folk, Film, Pop, Exercise, Christmas…).

**Used for:**  
- “Show me classical pieces”  
- “I want only jazz today”  
- Separating performance music from technical studies

---

## 4. Sub-Genre / Tradition
**What it is:**  
More precise stylistic origin.

Examples:  
- Irish jig  
- Finnish waltz  
- Klezmer  
- Roma/Hungarian folk  
- French Chanson  
- Bossa nova  
- Baroque concerto

**Used for:**  
- Finding tunes from a specific cultural or stylistic tradition  
- Organizing sessions (Irish vs Scottish vs Old‑Time)

---

## 5. Musical Period / Era
**What it is:**  
Historical/artistic period, primarily for classical music.

Examples:  
- Renaissance  
- Baroque  
- Classical  
- Romantic  
- 20th Century  
- Contemporary  
- Traditional

**Used for:**  
- Building balanced recital programs  
- Educational context (style interpretation)

---

## 6. Type of Piece
**What it is:**  
Functional form or category.

Examples:  
- Waltz  
- Jig  
- Reel  
- Aria  
- Concerto movement  
- Étude  
- Lick  
- Carol  
- Anthem  
- Slow Air  
- Theme

**Used for:**  
- Finding music by form  
- Selecting repertoire appropriate for setting (waltz for dance, aria for recital)

---

## 7. Key Signature (Common)
**What it is:**  
Most common or canonical key for the piece.

**Used for:**  
- Identifying fiddle‑friendly keys (G, D, A, Em)  
- Planning setlists with compatible keys  
- Technical practice (keys that challenge intonation)

---

## 8. Time Signature
**What it is:**  
Primary meter of the piece (4/4, 3/4, 6/8, 9/8…).

**Used for:**  
- Filtering by groove (jig vs reel vs waltz)  
- Teaching simple vs compound meter  
- Matching dance requirements

---

## 9. Difficulty (Violin)
**What it is:**  
General violin difficulty level.

Levels:  
- Beginner  
- Early Intermediate  
- Intermediate  
- Advanced  
- Professional

**Used for:**  
- Student repertoire planning  
- Self‑assessment (“What can I play right now?”)  
- Building progressive technique paths

---

## 10. Ensemble Type
**What it is:**  
How the piece is intended to be performed.

Examples:  
- Solo violin  
- Violin + piano  
- Fiddle tune (melody only)  
- Violin + band/backing  
- Orchestral excerpt

**Used for:**  
- Knowing whether accompaniment is required  
- Choosing recital‑ready vs solo playable material

---

## 11. Country / Region of Origin
**What it is:**  
Cultural/geographic background.

Examples:  
Ireland, Finland, Hungary/Roma, France, Israel, Russia, USA.

**Used for:**  
- Cultural programs  
- Authentic stylistic practice  
- Searching by regional tradition

---

## 12. Primary Use Case
**What it is:**  
Real‑world scenario where this piece fits best.

Examples:  
- Recital  
- Practice  
- Technique  
- Wedding  
- Christmas  
- Session tune  
- Warm‑up  
- Film theme  
- Children’s piece  
- Background music

**Used for:**  
- Curating event programs  
- Structuring practice sessions

---

## 13. Session Friendliness (Folk Only)
**What it is:**  
Likelihood that a tune appears in jam/session culture.

Values:  
- Very common  
- Moderately common  
- Occasional  
- Less common  
- N/A (non‑folk)

**Used for:**  
- Prioritizing which tunes to learn for sessions  
- Building “session readiness” sets

---

## 14. Primary Tags
**What it is:**  
Readable high‑level classification string combining genre + mood.

Examples:  
- “Folk › Irish jig; mood: energetic”  
- “Jazz › Gypsy swing; mood: driving”  
- “Classical › Baroque concerto; mood: dramatic”

**Used for:**  
- Fast scanning  
- Quick filtering  
- Searching by mood or style

---

## 15. Secondary Tags
**What it is:**  
Extra descriptors that don’t fit in other columns.

Examples:  
- good for vibrato practice  
- includes double‑stop variation  
- slow ballad  
- contest tune  
- children’s sing‑along

**Used for:**  
- Advanced filtering  
- Personal teacher notes  
- Fine‑grained recommendations

---

## 16. Notes
**What it is:**  
Free‑form field for anything unique.

Examples:  
- “My arrangement is in G, not the original F.”  
- “Used in the movie Swing (2002).”  
- “Duplicate title spelling; merge with entry X.”  
- “Free‑rhythm intro required.”

**Used for:**  
- Capturing context that helps future you  
- Disambiguating duplicates  
- Recording arrangement‑specific quirks

---

## Summary

This schema gives musicians multiple ways to find the right piece:

- by style  
- by cultural tradition  
- by difficulty  
- by key  
- by groove  
- by purpose  
- by mood  
- by technique  

It is optimized for **practical music use**, not just bibliographic metadata.

