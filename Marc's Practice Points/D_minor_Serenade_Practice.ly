\version "2.24.0"
%\language "english"

\header {
  title = "Schubert Serenade (Practice)"
  subtitle = "Fingered & positioned • Quarter‑note studies • Practical range"
  composer = "Marc Mouries"
  style = "practice exercise"
  tagline = ##f
}

common = {
  \time 4/4
  \tempo 4 = 56
}

slow = { \tempo 4 = 56 s1^\markup { \italic "slow" } }

posBox_OLD = #(define-music-function (parser location txt) (string?)
  #{ s1-\markup \box \small \bold $txt #})

posBox =
#(define-music-function (parser location txt) (string?)
   #{
     % Attach above the current note/head as a TextScript (no time consumed)
     ^\markup \box \small \bold $txt
   #})


posBoxB =
#(define-music-function (parser location txt) (string?)
  #{
    <>^\markup \box \small \bold $txt
  #})

% ===== Scales =====
dm_nat_scale = \relative d' {
  \key d \minor \common
  \posBoxB "posBoxB"
  d4-1 \posBox "Start 3rd→4th→5th pos"
  e-2 f-3 g-4 | a-1 bes-2 c-3 d-4 |
  e-1 f-2 g-3 a-4 | bes-1 c-2 d-3 d-4 |
  c-3 bes-2 a-1 g-4 | f-3 e-2 d-1 d-1 \bar "||"
}

dm_har_scale = \relative d' {
  \key d \minor \common
  d4-1   \posBox "Use 4th→5th pos (C♯ as leading tone)"

  e-2 f-3 g-4 | a-1 bes-2 c-3 cis-4 |
  d-1 e-2 f-3 g-4 | a-1 bes-2 c-3 cis-4 |
  d-4 c-3 bes-2 a-1 | g-4 f-3 e-2 d-1 \bar "||"
}

dm_mel_scale = \relative d' {
  \key d \minor \common
  d4-1   \posBox "Ascent: raised 6 & 7 (4th–5th pos) • Descent: natural minor"

  e-2 f-3 g-4 | a-1 bes-2 cis-3 d-4 |
  e-1 f-2 g-3 a-4 | bes-1 cis-2 d-3 d-4 |
  c-3 bes-2 a-1 g-4 | f-3 e-2 d-1 d-1 \bar "||"
}

% ===== Arpeggios =====
arp_pack = \relative d' {
  \key d \minor \common
  % Dm triad (2 bars)
  d4-1   \posBox "Dm arpeggio — 3rd→5th pos"
f-3 a-1 d-4 | a-1 f-3 d-1 d-1 \bar "||"
  % Dm7 color (2 bars)
  
  d4-1 \posBox "Dm7 color — keep hand relaxed"
  f-3 a-1 c-2 | d-4 c-2 a-1 f-3 \bar "||"
  % A7 arpeggio (split into two 4/4 bars — FIXED to avoid 5 beats)
  \posBoxB "A7 arpeggio — dominant prep (C♯ intonation)"
  a4-1 cis-2 e-1 g-2 | a-4 g-2 e-1 cis-2 \bar "||"
  a4-1 r4 r2 \bar "||"
  % F major arpeggio (2 bars, 4 beats each — FIXED)
  \key f \major
  \posBoxB "F major arpeggio — relative major frame"
  f4-1 a-3 c-1 f-4 | c-1 a-3 f-1 r4 \bar "||"
  \key d \minor
}

% ===== Position map =====
position_map = \relative g' {
  \key d \minor \common
  \posBoxB "3rd pos (g‑1): 1‑2‑3‑4"
  g4-1 a-2 bes-3 c-4 |
  \posBoxB "4th pos (a‑1)"
  a4-1 bes-2 c-3 d-4 |
  \posBoxB "5th pos (b♭‑1)"
  bes4-1 c-2 d-3 e!-4 |
  \posBoxB "6th pos (c‑1)"
  c4-1 d-2 e!-3 f-4 |
  \posBoxB "7th pos (d‑1)"
  d4-1 e!-2 f-3 g-4 \bar "||"
}

% ===== Shifting drills =====
shift_drills = \relative d'' {
  \key d \minor 
  %\common
  \posBoxB "Shift 4th→5th: a(1)→bes(2)→c(3)→d(4)"
  a4-1 bes-2 c-3 d-4 | c-3 d-4 c-3 bes-2 \bar "||"
  \posBoxB "5th→6th: bes(1)→c(2)→d(3)"
  bes4-1 c-2 d-3 c-2 | bes-1 a-1 a2 \bar "||"
  \posBoxB "6th→7th apex then relax"
  c4-1 d-2 e-3 d-2 | a-1 a-1 a2  \bar "||"
  \posBoxB "Leading tone target"
  cis4-2 d-1 d2 r2 \bar "||"
}

% ===== Leading tone studies (bars normalized to 4/4) =====
leading_tone = \relative d'' {
  \key d \minor \common
  \posBoxB "Tune C♯ slightly high → resolve to D"
  cis4-2 d-1 d2 r2 \bar "||"
  \relative a' { cis4-2 d-1 d2 r2 } \bar "||"
  b!4-1 cis-2 d4-1 e!-2 | cis4-2 d-1 d2 r2 \bar "||"
}

% ===== Bowing pack (mid register) =====
bow_pack = \relative d' {
  \key d \minor \common
  \posBoxB "Legato line — stay around d'–a''"
  d4( e) f( g) | a( g) f( e) \bar "||"
  \posBoxB "4 per bow — same register"
  d4 e f g | a g f e \bar "||"
  \posBoxB "8 per bow — keep within range"
  d8 e f g a g f e | d e f g a g f e \bar "||"
}

\paper { top-margin = 12 left-margin = 16 right-margin = 16 }
\layout { indent = 0 }

% ===== Text + Scores =====
\markup \column {
  \left-align \line { \bold \fontsize #2 "1) D minor Scales (natural • harmonic • melodic)" }
  \vspace #0.15
  \left-align \line { \italic "How: Quarter notes at ♩=56 — slow; even bow; relaxed vibrato." }
  \left-align \line { \italic "Why: Centers the ear on D; stabilizes the C♯ leading tone used in cadences." }
  \left-align \line { \italic "Helps: Opening phrase & cadences — mm. 5–12, 17–20." }
}
\score { \new Staff { \dm_nat_scale } }
\score { \new Staff { \dm_har_scale } }
\score { \new Staff { \dm_mel_scale } }

\markup \vspace #0.6
\markup \column {
  \left-align \line { \bold \fontsize #2 "2) Arpeggios: Dm • A7 • F" }
  \vspace #0.15
  \left-align \line { \italic "How: Quarter notes first, then slur 4/8 per bow; hand relaxed (3rd→5th pos)." }
  \left-align \line { \italic "Why: Dm (tonic) and A7 (dominant) are pillars; F major shapes a lyrical hand frame." }
  \left-align \line { \italic "Helps: Dominant→tonic resolutions & leaps — mm. 9–12, 21–24." }
}
\score { \new Staff { \arp_pack } }

\markup \vspace #0.6
\markup \column {
  \left-align \line { \bold \fontsize #2 "3) Position Map 3rd → 7th" }
  \vspace #0.15
  \left-align \line { \italic "How: 1–2–3–4 patterns in each position (no open strings). Add light vibrato." }
  \left-align \line { \italic "Why: Secures mid–high fingerboard so the cantabile line is in tune without hunting." }
  \left-align \line { \italic "Helps: Phrases sitting above 3rd position — mm. 8–16, 18–22." }
}
\score { \new Staff { \position_map } }

\markup \vspace #0.6
\markup \column {
  \left-align \line { \bold \fontsize #2 "4) Shifting Drills (portamento for vocal phrasing)" }
  \vspace #0.15
  \left-align \line { \italic "How: Shift with light finger weight; continuous bow. Ear leads the hand." }
  \left-align \line { \italic "Why: Serenade sings like a voice; elegant shifts connect phrase 'vowels'." }
  \left-align \line { \italic "Helps: Ascending appoggiaturas & rises — mm. 10–12, 18–20." }
}
\score { \new Staff { \shift_drills } }

\markup \vspace #0.6
\markup \column {
  \left-align \line { \bold \fontsize #2 "5) Leading Tone (C♯ → D) — Intonation Calibration" }
  \vspace #0.15
  \left-align \line { \italic "How: Tune C♯ a hair high; resolve to D; check resonance (open D if needed)." }
  \left-align \line { \italic "Why: Harmonic D minor cadences need a clean leading tone." }
  \left-align \line { \italic "Helps: Every cadence landing on D — mm. 7–8, 12, 20, closing." }
}
\score { \new Staff { \leading_tone } }

\markup \vspace #0.6
\markup \column {
  \left-align \line { \bold \fontsize #2 "6) Bowing Pack (legato • 4/slur • 8/slur) — Mid register only" }
  \vspace #0.15
  \left-align \line { \italic "How: Mezzo‑piano; steady bow speed; contact point slightly toward the fingerboard." }
  \left-align \line { \italic "Why: Stabilizes long lines and string crossings inside slurs without extreme range." }
  \left-align \line { \italic "Helps: Long phrases & evenness — mm. 5–12, 15–18." }
}
\score { \new Staff { \bow_pack } }

\markup \vspace #0.7
\markup \column {
  \left-align \line { \bold \fontsize #2 "Suggested Positions by Measure (adapt to your hand)" }
  \vspace #0.15
  \left-align \line { \italic "General: 3rd–5th for the opening (avoid opens); 6th–7th for apex phrases; retreat for warmth." }
  \left-align \line { \italic "mm. 5–8: 3rd → 4th (g‑1 → a‑1) • mm. 9–12: 4th → 5th (a‑1 → b♭‑1)" }
  \left-align \line { \italic "mm. 13–16: 5th → 6th (b♭‑1 → c‑1) • mm. 17–20: 6th → 7th (c‑1 → d‑1)" }
  \left-align \line { \italic "mm. 21–24: ease back to 5th–4th for closing phrases." }
}
