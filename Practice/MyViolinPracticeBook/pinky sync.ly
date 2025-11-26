\version "2.19.15"
\language "english"
\header {
  title = ""
  composer = "Marc Mouries"
  style = "practice exercise"
}

chordNames = \chordmode {
  c1

}

melody_A = \relative c'' {
  g'8 bf  g  < ef-4 f -1>
  c   ef  c  <bf-1 af-4>
  f   af  f  <ef-1 df-4>
  bf  df  bf <ef-1 df-4>
  f   af  f  <bf-1 af-4>
  c   ef  c  < ef-4 f -1>
}
\score {    \new Staff { \melody_A }}
melody_B = \relative c'' {
  g'8   < ef-4 f -1>
  c     <bf-1 af-4>
  f     <ef-1 df-4>
  bf   <ef-1 df-4>
  f     <bf-1 af-4>
  c     < ef-4 f -1>
}
\score {    \new Staff { \melody_B }}
\relative c'' {
  bf  df  f bf
  f  af c f
f c af! f
bf f df bf
}


#(define ((shift offsets) grob)
(let ((note-heads (ly:grob-array->list (ly:grob-object grob
'note-heads))))
(map
  (lambda (p q)
    (set! (ly:grob-property p 'X-offset) q)   )
   note-heads offsets)))

displaceHeads =
#(define-music-function (parser location offsets) (list?)
#{
\once \override NoteColumn #'before-line-breaking = #(shift offsets)
#}
)

\relative c' {
  \time 6/8
  <a a'> g' f < e e'> d' c
  <b b'> a' g < f e>  d  c
  <b a>  g  f < e d>  c  b

  \break
    \time 4/4

  a16( a' g f   e  e' d c)
  b( b' a g   f  e  d  c)
  b( a  g  f  e d  c  b)

}


\relative c'' {
 % \key ef \major
  g'8 bf g
  \displaceHeads #'( -0.8 0.0 )  < f -1 ef-4 >
  g8 bf g
  \displaceHeads #'( -1 0.0 )  < f -1 ef-4 >
}

{
<c' e' g'>4
<d' f' a'>
}
{
\displaceHeads #'(0 1.2  )
<c' e' g'>4
\displaceHeads #'(0 1.2 1.2)
<d' f' a'>
}