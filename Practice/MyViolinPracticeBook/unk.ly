\version "2.19.15"
\language "english"

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

\relative c'' {
  \key ef \major
  g'8 bf  g < f -1 ef-4 >
}


\relative c'' {
  \key ef \major
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