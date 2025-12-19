 \version "2.19.1" 
\language "english"


Rhythm  = { c8. [c16  c16  c16] }

\score {
    \new Staff { 
      c16 c c c c c c d}  
  \layout { indent=0}
  \midi { }
}

\relative c'' { 
  \time 4/4
    a 8[ b   c  d]    e 8[ fs  gs e]
    a 8[ c   b  a]    gs8[ f   e  d]
    c 8[ d   c  b]    a 8[ g   f  e] 
}
\relative c'' { 
  \time 4/4
    b 8[ cs   d  e]    fs 8[ gs  as fs]
    b 8[ d   cs  b]    as8[ g   fs  e]
    d 8[ e   d  cs]    b 8[ a   g  fs] 
}
\relative c'' { 
  \time 4/4
    g 8[ a   bf  c]    d 8[ e  fs d]
    g 8[ bf   a  g]    fs8[ ef   d  c]
    bf 8[ c   bf  a]    g 8[ f   ef  d] 
}


{
  # (display "============================================\n")
  # (display ": Current directory: = ")
  # (display (getcwd))
  # (display "\n")
  # (display "============================================\n")
}


{
  #(with-output-to-file "display.txt"
      (lambda () #{ \displayMusic { c'4\f } #}))
}