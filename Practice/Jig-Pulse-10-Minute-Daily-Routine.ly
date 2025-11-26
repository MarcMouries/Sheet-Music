\version "2.24.0"
\language "english"

\header {
  title = "Jig Rhythm: 10-Minute Daily Routine"
  subtitle = ""
    composer = "Marc Mouries"
  style = "practice exercise"
  tagline = ""
}

% Centered practice-plan line
\markup \fill-line { \null \vcenter "Practice plan for classical violinists learning Irish bowing" \null }

% ------------------------------------------------------------
% Article intro text (concise, from your sections)
% ------------------------------------------------------------

\markup \column {
  \vspace #1
  \bold "1) Framing & Analogy — Classical vs Irish Bowing"
  \line { "Classical training favors strong–weak bowing tied to meter and long, written slurs." }
  \line { "Irish looks plain on paper, but the bow carries the dance: pulse, lift, articulation." }
  \line { "Double jig is written in 6/8 but felt in two big beats: 1 and 4." }
  \line { "Siciliana vs Jig: Siciliana = smooth, legato; Jig = springy drive with subtle lift on 1 and 4." }
  \line { "Engine per bar: dotted-8th, 16th, 8th × 2 (hold – flick – land). Aim for lift, not swing." }
}

\markup \column {
  \vspace #1
  \bold "2) Rhythmic Feel & Accent Map"
  \line { "Feel the jig in two: ONE two three | FOUR five six." }
  \line { "Accent map: 1 = strong, 2–3 = light, 4 = strong, 5–6 = light." }
  \line { "Hold 1 & 4 gently; the 16th is a flick (micro-syllable), not an equal triplet." }
  \line { "Vary separates and selective slurs to avoid singsong; keep the groove alive." }
}

\markup \column {
  \vspace #1
  \bold "3) Speak the Rhythm Before You Play"
  \line { "Count: 'ONE-(and)-a | FOUR-(and)-a' (middle syllable tiny)." }
  \line { "Mnemonics (dotted–16th–8th): PUMP-kin pie • AP-ple tart • JUMP-ing jack • TIP-py toe • FIRM-ly now" }
  \line { "Mini drill: tap on 1 & 4, speak mnemonics, keep the flick light." }
}

% Your intro block
\markup \column {
  \vspace #1
  \bold "Introduction"
  \line { "Dotted-8th, 16th, 8th (×2 per bar) with lift on beats 1 and 4" }
  \line { "Feel > theory. Keep it springy; let the sixteenth be a flick." }
}

% ------------------------------------------------------------
% Reusable function (NOT a markup command) that returns markup
% ------------------------------------------------------------
#(define (exercise-block title how hint)
  #{ \markup \column {
       \vspace #1
       { \sans \fontsize #2 \bold #title }
       \line { \bold "How to practice: " #how }
       \line { #hint }
     } #})


% ===========================
% Exercises
% ===========================


% A — Slow_Practice duration feel (slow-motion)
exercise_Slow_Practice_A = {
  \time 6/8
  \tempo 8 = 120
  d'4.\accent d'8 d'4 d'4.\accent d'8 d'4 | d'4.\accent d'8 d'4 d'4.\accent d'8 d'4
}

\markup #(exercise-block
  "Exercise A — Slow practice"
  "Exaggerate LONG (dotted half), tiny SHORT (quarter), calm MEDIUM (half). Keep anchors on 1 and 4."
  "Relax the arm; magnify the engine so the groove imprints physically.")


counting_sicilian_words = \lyricmode {
  \override LyricText.font-size = #-1
  "1-2-3" "4" "5-6" "1-2-3" "4" "5-6" 
  "1-2-3" "4" "5-6" "1-2-3" "4" "5-6" 
  
}

\score { \new Staff { \exercise_Slow_Practice_A }
         \addlyrics { \counting_sicilian_words }
}

exercise_Slow_Practice_B = {
  \time 6/8
  \tempo 8 = 120
  d'4.\accent e'8 f'  4   g' 4.\accent f'8  e'4 
  a'4.\accent b'8 cs''4   d''4._\accent cs''8 b'4
}

\score { \new Staff { \exercise_Slow_Practice_B } \layout{} }

exercise_Slow_Practice_C = {
  \time 12/8
  \tempo 8 = 120
  d' 4._\accent  f' 8  a' 4   
  c''4._\accent  d''8  f''4 
  d''4._\accent  c''8  a' 4 
  f' 4._\accent  d' 8  c' 4 
}


\score { \new Staff { \exercise_Slow_Practice_C }
         \addlyrics { \counting_sicilian_words }
}



% F — Generic jig phrase (application)
exercise_phrase_generic = {
  \time 6/8
  \tempo 1. = 84
  \key d \major
  d'8. e'16 fs'8   g'8. a'16 b'8 |
  a'8. g'16 fs'8   e'8. d'16 d'8
}


% A — Open-string pulse (D string)
exercise_open_string_d = {
  \time 6/8
  \tempo 1. = 84
  % 4 bars of [8. 16 8] ×2 per bar on open D
  d'8. d'16 d'8  d'8. d'16 d'8 |
  d'8. d'16 d'8  d'8. d'16 d'8 |
  d'8. d'16 d'8  d'8. d'16 d'8 |
  d'8. d'16 d'8  d'8. d'16 d'8
}

\markup #(exercise-block
  "Exercise A — Open-string pulse (D string)"
  "Default bowing = Down (dotted) – Up (16th) – Up/Separate (8th). Keep 1 & 4 gently held; flick the 16th."
  "Mid–upper bow, light contact. Think spring, not weight.")

\score { \new Staff { \clef "treble" \exercise_open_string_d } \layout{} \midi{} }

% B — Metronome on 1 & 4
exercise_clicks_one_four = {
  \time 6/8
  \tempo 1. = 84
  % Bars one–two: play only on the “clicks” (beats 1 & 4).
  d'4.\accent r4. |
  d'4.\accent r4. |
  % Bars three–four: resume full jig engine with those anchors.
  d'8. d'16 d'8  d'8. d'16 d'8 |
  d'8. d'16 d'8  d'8. d'16 d'8
}

\markup #(exercise-block
  "Exercise B — Metronome on 1 & 4"
  "Clicks only on 1 and 4. First two bars: play just those beats; then resume full engine without losing the anchors."
  "Keep the 16th whisper-light; land the last 8th calmly.")

\score { \new Staff { \clef "treble" \exercise_clicks_one_four } \layout{} \midi{} }

% C — D major scale in jig rhythm
exercise_scale_d_jig = {
  \time 6/8
  \tempo 1. = 84
  \key d \major
  d'8. d'16 e'8   fs'8. fs'16 g'8 |
  a'8. a'16 b'8   cs''8. cs''16 d''8 |
  d''8. d''16 cs''8   b'8. b'16 a'8 |
  g'8. g'16 fs'8       e'8. e'16 d'8
}

\markup #(exercise-block
  "Exercise C — D major scale in jig rhythm"
  "Keep the same engine; the 16th is never accented—it's a flick. Use a D drone if possible."
  "Limit slurs; use them as phrasing spice, not default.")

\score { \new Staff { \clef "treble" \key d \major \exercise_scale_d_jig } \layout{} \midi{} }

% D — Bow-stop & micro-lift
exercise_bow_stop_lift = {
  \time 6/8
  \tempo 1. = 84
  d'8.-\tenuto d'16-\staccatissimo d'8  d'8.-\tenuto d'16-\staccatissimo d'8 |
  d'8.-\tenuto d'16-\staccatissimo d'8  d'8.-\tenuto d'16-\staccatissimo d'8 |
  d'8.\< d'16 d'8\!   d'8.\< d'16 d'8\! |
  d'8.-\tenuto d'16-\staccatissimo d'8  d'8.-\tenuto d'16-\staccatissimo d'8
}

\markup #(exercise-block
  "Exercise D — Bow-stop & micro-lift"
  "Let the bow settle after the dotted note, then release a tiny 16th flick."
  "LONG — flick — step. Buoyant, not percussive.")

\score { \new Staff { \clef "treble" \exercise_bow_stop_lift } \layout{} \midi{} }



\markup #(exercise-block
  "Exercise F — Generic jig phrase (apply the engine)"
  "Keep the long–short–medium profile identical. Transplant this into common jigs while preserving pulse on 1 and 4."
  "Groove first; add cuts/slides only after the pulse is solid.")

\score { \new Staff { \clef "treble" \exercise_phrase_generic } \layout{} \midi{} }
