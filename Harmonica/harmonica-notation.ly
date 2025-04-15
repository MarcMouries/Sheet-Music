\version "2.12"
\include "english.ly"

#(define* (blow hole #:optional (bends 0)) 
  (markup (make-line-markup (make-list bends (make-flat-markup))) #:simple hole))
#(define* (draw hole #:optional (bends 0)) 
  (markup (make-line-markup (make-list bends (make-flat-markup))) #:circle hole))

#(define (harmonica-map semitones)
  (case semitones
    ((-12) (blow "1"))
    ((-11) (draw "1" 1))
    ((-10) (draw "1"))
    ;((-9) (overblow "1"))
    ((-8) (blow "2"))
    ((-7) (draw "2" 2))
    ((-6) (draw "2" 1))
    ((-5) (draw "2"))
    ;((-5) (blow "3"))
    ((-4) (draw "3" 3))
    ((-3) (draw "3" 2))
    ((-2) (draw "3" 1))
    ((-1) (draw "3"))
    ((0) (blow "4"))
    ((1) (draw "4" 1))
    ((2) (draw "4"))
    ;((3) (overblow "4"))
    ((4) (blow "5"))
    ((5) (draw "5"))
    ;((6) (overblow "5"))
    ((7) (blow "6"))
    ((8) (draw "6" 1))
    ((9) (draw "6"))
    ;((10) (overblow "6"))
    ((11) (draw "7"))
    ((12) (blow "7"))
    ;((13) (overdraw "7"))
    ((14) (draw "8"))
    ((15) (blow "8" 1))
    ((16) (blow "8"))
    ((17) (draw "9"))
    ((18) (blow "9" 1))
    ((19) (blow "9"))
    ;((20) (overdraw "9"))
    ((21) (draw "10"))
    ((22) (blow "10" 2))
    ((23) (blow "10" 1))
    ((24) (blow "10"))
    (else (blow " "))
))

#(define (add-harmonica m)
  (if (equal? (ly:music-property m 'name) 'NoteEvent)
      (make-music 'LyricEvent
        'duration (ly:music-property m 'duration)
        'text (harmonica-map (ly:pitch-semitones (ly:music-property m 'pitch))))
      m))

scale =\relative c' {
  c4 cs4 d4 ef4 
  e4 f4 fs4 g4 
  af4 a4 bf4 b4
}

notes = {
  \transpose c c   { \scale } \break
  \transpose c c'  { \scale } \break
  \transpose c c'' { \scale } c'''4
}

staffMelody = \new Staff {
  \context Voice = "melody" \notes
  \bar "|."
}

<<
  \staffMelody
  \context Lyrics = "newtab" \lyricmode { \applyMusic #(lambda (x) (music-map add-harmonica x)) \notes }
>>


