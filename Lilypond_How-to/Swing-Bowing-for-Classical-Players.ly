\version "2.24.0"

\header{
  title = "Swing Bowing for Classical Players"
  subtitle = "Slur-to-offbeat + triplet-feel drills (violin, 1st position)"
  tagline = ##f
}

\paper { indent = 0 }

% ─────────────────────────────────────────────────────────────────────────
% HELPERS
% ─────────────────────────────────────────────────────────────────────────
swingTempo = { \tempo 4 = 108 }
downB = ^\downbow
upB   = ^\upbow

% ==== Auto-numbered "Exercise N — Title" headers ====
#(define exercise-num 0)

#(define-markup-command (exerciseTitle layout props text) (string?)
  (set! exercise-num (+ exercise-num 1))
  (interpret-markup layout props
    (markup
      #:vspace 0.8
      #:box #:bold #:larger
      (format #f "Exercise ~a — ~a" exercise-num text))))

% ─────────────────────────────────────────────────────────────────────────
% INTRO MARKUP
% ─────────────────────────────────────────────────────────────────────────
\markup \box \bold \larger "Core Idea"
\markup \wordwrap {
  Slur the long note (on the beat) into the short note (the upbeat). That delays the bow change
  to the “&”, which gives a natural micro-accent without forcing. Keep the downbeat warm,
  let the bow change on the upbeat give the “pop.”
}

% ─────────────────────────────────────────────────────────────────────────
% SWING MORPHING EXERCISE — 3/4 to 4/4
% Trains the swing ratio by starting in 3/4 at a slow tempo and gradually speeding up.
% No tuplets needed — the long-short feel emerges naturally as tempo increases.
% ─────────────────────────────────────────────────────────────────────────

\markup \vspace #0.8
\markup \exerciseTitle "Waltz-to-Swing Morphing (3/4 → 4/4)"
\markup \column {
  \line { "1. Start at a slow tempo (♩ = 60–70) in 3/4. Play long-short as written (quarter tied to eighth)." }
  \line { "2. Gradually increase the tempo. Around ♩ = 110–130, the rhythm begins to feel like triplet swing." }
  \line { "3. Without changing bowing or phrasing, switch to 4/4 and keep the same feel." }
  \line { "4. This ‘tricks’ the bow arm into internalizing swing ratio naturally." }
}

Waltz-to-Swing_Morphing = \relative d' {
\key g \major
\time 3/4
  % one bow for the tie, new bow for the short note
  d4^\downbow ~ d e4^\upbow
  d4^\downbow ~ d e4^\upbow
  d4^\downbow ~ d e4^\upbow
  d4^\downbow ~ d e4^\upbow   \bar "|."
}

\score {
  \new Staff {
    \clef "treble"
    \Waltz-to-Swing_Morphing
  }
  \layout { }
}
\markup \italic \smaller "Tip: do not force the ratio. Let the bow speed and weight naturally shift the feel as you accelerate."

% ─────────────────────────────────────────────────────────────────────────
% 1) FIXED + PLAYABLE: Open-string slur-to-offbeat (D–E on D string)
%    Why: You need two different pitches for a slur to mean something in the bow.
% ─────────────────────────────────────────────────────────────────────────
\markup \vspace #0.8
\markup \exerciseTitle "Open D with E (1st finger): slur to the upbeat"
\markup \column {
  \line { "Goal: Feel the bow ride through the upbeat. Use more bow on the long note (~70%)," }
  \line { "clean bow change on the short note (~30%). Start down-bow so most \"&\" land on up-bow." }
  \line { "Fingering: D string = d, e(1), fis(2), g(3) as you expand. Start just with d–e." }
}

exOne = \relative d' {
  \key g \major \time 4/4 \swingTempo
  % Each beat = long–short (swing). We notate as straight 8ths but PLAY long–short.
  % Slur always connects beat to upbeat; bow change happens on the next beat's short note.
  % Bar 1–2: d–e pairs on D string
  d8\downB ( e) d( e)  d( e) d( e)
  d8\upB   ( e) d( e)  d( e) d( e)
  \bar "||"
  % Bar 3–4: expand to d–fis, then d–g (still 1st position, D string)
  d8\downB ( fis) d( fis)  d( fis) d( fis)
  d8\upB   ( g)   d( g)    d( g)   d( g)
  \bar "|."
}

\score { \new Staff { \clef treble \exOne } \layout{} }

% Practice notes (printed)
\markup \italic \smaller
"Tip: keep the downbeat soft at the string, let the off-beat speak when the bow changes."

% ─────────────────────────────────────────────────────────────────────────
% 2) TRIPLET-FEEL DRILLS — make 3-in-the-space-of-2 automatic
%    A) Even triplets with accent map
%    B) Long–short within a triplet (tie) to feel swing explicitly
%    C) Triplet pickup into the beat (common jazz articulation)
% ─────────────────────────────────────────────────────────────────────────
\markup \vspace #0.8
\markup \exerciseTitle "Triplet-feel factory"
\markup \column {
   \line { A) Train even triplets with controlled accents. }
   \line { B) Shape long–short inside the triplet by tying the first two 8ths (≈ quarter + 8th inside the triplet).} 
   \line { C) Practice the classic “triplet pickup” into the beat to make the upbeat speak.}
}

% A) Even triplets, accents on 1..a map (D string)
tripletEven = \relative d' {
  \key g \major \time 4/4 \swingTempo
  % Bar 1: accent 1 of each triplet
  \tuplet 3/2 { d8^\markup { \bold "1" } ( e fis) } \tuplet 3/2 { d8^\markup { \bold "1" } ( e fis) }
  \tuplet 3/2 { d8^\markup { \bold "1" } ( e fis) } \tuplet 3/2 { d8^\markup { \bold "1" } ( e fis) }
  % Bar 2: accent the 3rd triplet (the upbeat before next beat) to wake up your “&”
  \tuplet 3/2 { d8( e fis^\markup { \bold "3" }) } \tuplet 3/2 { d8( e fis^\markup { \bold "3" }) }
  \tuplet 3/2 { d8( e fis^\markup { \bold "3" }) } \tuplet 3/2 { d8( e fis^\markup { \bold "3" }) }
  \bar "||"
}

% B) Inside a triplet, tie 1–2 (long) then short 3rd note = explicit swing
tripletLongShort = \relative d' {
  \key g \major \time 4/4 \swingTempo
  % Tie first two 8ths of the triplet (same pitch) to create a quarter+eighth inside the triplet.
  % Then put the bow change on the 3rd triplet 8th (the "short"): off-beat speaks.
  \tuplet 3/2 { d8~ d e }  \tuplet 3/2 { d8~ d e }  \tuplet 3/2 { d8~ d e }  \tuplet 3/2 { d8~ d e }
  \bar "||"
  % Do it across a tiny fragment (d–e–fis), long on d, short on e/fis alternately:
  \tuplet 3/2 { d8~ d e }  \tuplet 3/2 { e8~ e fis }  \tuplet 3/2 { d8~ d e } \tuplet 3/2 { e8~ e fis }
  \bar "|."
}

% C) Triplet pickup into the beat (slur the two prep notes, change on the landing note)
tripletPickup = \relative d' {
  \key g \major \time 4/4 \swingTempo
  % Pattern per beat: (a b) slurred as pickup, land on c with a clear, tiny bow change.
  % Keep it in 1st position on D and A strings.
  \tuplet 3/2 { d8( e) fis } \tuplet 3/2 { e( fis) g } \tuplet 3/2 { fis( g) a } \tuplet 3/2 { g( a) b }
  \tuplet 3/2 { b( a) g }   \tuplet 3/2 { a( g) fis } \tuplet 3/2 { g( fis) e } \tuplet 3/2 { fis( e) d }
  \bar "|."
}

\score { \new Staff { \clef treble \tripletEven } \layout{} }
\markup \italic \smaller "A) Even triplets: practice pp to mf; keep all three equal unless marked."

\score { \new Staff { \clef treble \tripletLongShort } \layout{} }
\markup \italic \smaller "B) Long–short inside a triplet (tie 1–2): bow change lands on the 3rd triplet 8th."

\score { \new Staff { \clef treble \tripletPickup } \layout{} }
\markup \italic \smaller "C) Triplet pickup: slur the prep, articulate the landing."

% ─────────────────────────────────────────────────────────────────────────
% 3) LOWER REG: Charleston rhythm in 1st position (no high notes)
%    Pattern: 1-& (rest) 2-& 3 (rest) 4-& ; keep it on D/A strings.
% ─────────────────────────────────────────────────────────────────────────
\markup \vspace #0.8
\markup \exerciseTitle "Charleston (low register, 1st position)"
\markup \wordwrap {
  Keep everything on D/A strings. Plush quarters, crisp upbeats. Stay relaxed; let the upbeat
  speak via bow change. Count: “ONE-& (rest) TWO-&  THREE (rest) FOUR-&”.
}

charlestonLow = \relative d' {
  \key g \major \time 4/4 \swingTempo
  % Bar 1: D–E–F#–A–G figures, never above B on A string
  % Beat 1 long–short (slur), rest 8th; Beat 2 short; Beat 3 quarter; Beat 4 short
  % 1-&      (r)  2-&   3      (r)  4-&
  d8\downB( e) r8 fis8  a4     r8   g8
  % Bar 2: move stepwise; still first position (D/A strings)
  e8\upB( fis) r8 g8    fis4   r8   e8
  \bar "||"
  % Bar 3–4: simple variation, same range
  d8\downB( fis) r8 e8  g4     r8   d8
  e8\upB( g)   r8 fis8  e4     r8   d8
  \bar "|."
}

\score { \new Staff { \clef treble \charlestonLow } \layout{} }

% ─────────────────────────────────────────────────────────────────────────
% 4) PUTTING IT TOGETHER — tiny ii–V–I lick (still low)
%    Uses triplet pickups + slur-to-offbeat, confined to D/A strings.
% ─────────────────────────────────────────────────────────────────────────
\markup \vspace #0.8
\markup \exerciseTitle "ii–V–I (Am7–D7–Gmaj6) in low register"
\markup \wordwrap {
  Apply the feel in a tiny line that stays in 1st position. Keep the off-beat alive with
  slurs and triplet pickups; de-emphasize the downbeat.
}

iiVILow = \relative d' {
  \key g \major \time 4/4 \swingTempo
  % Am7
  \tuplet 3/2 { e8( fis) g } \tuplet 3/2 { a( g) e } \tuplet 3/2 { g( a) b } \tuplet 3/2 { a( g) e }
  % D7
  \tuplet 3/2 { fis8( g) a } \tuplet 3/2 { g( fis) e } \tuplet 3/2 { fis( e) d } \tuplet 3/2 { e( fis) g }
  % Gmaj6 resolution
  d8( e) d( e)  d( g) d( e) \bar "|."
}

\score { \new Staff { \clef treble \iiVILow } \layout{} }

% ─────────────────────────────────────────────────────────────────────────
% PRACTICE NOTES
% ─────────────────────────────────────────────────────────────────────────
\markup \vspace #0.6
\markup \box \bold \larger "Practice Notes"
\markup \column {
  \line { "• Bow plan: ~70% of the stroke on the long note, ~30% on the short/upbeat." }
  \line { "• The 'accent' comes from the bow change on the upbeat. Don’t punch the string." }
  \line { "• Metronome hack: set click on 2 & 4. Count aloud: “ONE-and TWO-and…”, or “tri-po-let”." }
  \line { "• Triplet drills: keep all three equal in A); exaggerate long–short in B)." }
  \line { "• Stay in 1st position; use mirror practice to watch a tiny, clean bow change on upbeats." }
}
