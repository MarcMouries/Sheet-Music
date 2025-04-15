\version "2.14.2"
\header { }
\paper { }
exampleA = \lyricmode
{
Aa Bb C D E F G A B C D E
}
exampleB = \lyricmode
{
Bb C D E F G A B C D E Ff
}
RHA = \relative c'
{
\clef treble
\key c \major
a^"Example A" b c d e f g a b c d e
}
LHA = \relative c
{
\clef bass
\key c \major
a b c d e f g a b c d e
}
RHB = \relative c'
{
\clef treble
\key c \major
b^"Example B" c d e f g a b c d e f
}
LHB = \relative c
{
\clef bass
\key c \major
b c d e f g a b c d e f
}

staffPianoA = \new PianoStaff
{
<<
\new Staff = "RH" {  \RHA	}
\new Voice = singer { \LHA  }
\new Lyrics  \lyricsto singer { \exampleA }
>>
}

staffPianoB = \new PianoStaff
{
<<
\new Staff = "RH" {  \RHB	}
\new Voice = singer { \LHB  }
\new Lyrics  \lyricsto singer { \exampleB }
>>
}
\score %exampleA
{
<<
\staffPianoA
>>
}
\score %exampleB
{
<<
\staffPianoB
>>
}

\layout
{
\context
{
\Staff
\remove "Time_signature_engraver" 
\remove "Clef_engraver"
}
}
