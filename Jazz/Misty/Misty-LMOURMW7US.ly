\language "english"
\version "2.19.13"
#(set-default-paper-size "letter")
#(set-global-staff-size 21)

\paper {
  line-width    = 190\mm
  left-margin   = 10\mm
  top-margin    = 10\mm
  bottom-margin = 20\mm
  indent = 10\mm 
  ragged-last-bottom = ##t   %%set to ##t if your score is less than one page
  ragged-bottom = ##f  
  }

\header {
    title = "Misty"
    subtitle = "Music by Erroll Garner ★ Words by Johnny Burke"
    tagline = ""
 }
 

melody = \relative c'{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    \key ef \major 
    \time 4/4 
    \partial 4
    bf'8[ g]
    \repeat volta 2 {
      d2. bf8 c  df c' c bf c bf g ef
    c2 \tuplet 3/2{r8 g af  } \tuplet 3/2{c ef g  }      
    bf8 bf bf af bf4. af8      
    g4~ \tuplet 3/2{g8 af bf  } ef,4~ \tuplet 3/2{ef8 f g  }     
    af8 c,4 c8 \tuplet 3/2{d4 ef f  } 
    }
    \alternative {
      { g1~      
        g2 r4 bf8 g  }
      { ef1       }
    }
         
    %% PART B
    
    | \tuplet 3/2{r4 ef f  } \tuplet 3/2{g bf c }      
    | df8 df df df~ df2 ~   
    | df4 df8 ef \tuplet 3/2{ff4 ef df}
    | c8 c c c~ c2
    | \tuplet 3/2{r4 ef, f  } \tuplet 3/2{af bf c  }      
    d8 d d c d2~      
    d8 d d c \tuplet 3/2{f4 d c  }      
    bf1~      | % 23
    bf2 r4 
    
    % PART A
    bf8 g      | % 24
    d2. bf8 c      | % 25
    df c' c bf c bf g ef 
    \bar "||"     | % 26
    c2 \tuplet 3/2{r8 g af  } \tuplet 3/2{c ef g  }      | % 27
    bf8 bf bf af bf4. af8      | % 28
    g4~ \tuplet 3/2{g8 af bf  } ef,4~ \tuplet 3/2{ef8 f g  }      | % 29
    af8 c,4 c8 \tuplet 3/2{d4 ef f  }      | % 30
    ef2. r4   \bar "|." 
}



stanzaOne = \lyricmode { 
  \set stanza = " 1. " 
  Look at me, I'm as help -- less  as a kit -- ten  up a tree,
  And I feel like I'm cling -- ing  to a cloud;
  I can't__ un -- der -- stand__ I get mis -- ty just hold -- ing  your hand
  
   Walk my 
}
stanzaTwo = \lyricmode { 
  \set stanza = " 2. "
  
  \skip 1 \skip 1 way, And a thou -- sand  vi -- o -- lins  be -- gin  to play;
  Or it might be the sound of your hel -- lo;  
  That mu -- sic  I hear,__ 
  I get mis -- ty  the mo -- ment you're \skip 1 \skip 1 \skip 1 near.
  You can say that you're lea -- ding  me on,__ __ 
  But it's just what I want you to do.__ 
  Don't you no -- tice  how hope -- less -- ly  
  I'm lost,__ __
  That's why I'm fol -- low -- ing  you.__ __
  On my own, would I wan -- der  through this wond -- er -- lan  a -- lone,
  Nev -- er  know -- ing  my right foot from my left my hat__ from my glove;__
  I'm too mis -- ty  and too much in love. 
}  

chord_Part_A = \chordmode { 
      ef1:7  bf2:m7  ef2:7 af1:7 af2:m7 df2:9 ef2:7
      c2:m7 f2:m7 bf2:7 
}
chord_Part_B = \chordmode { 
    ef1:6
    bf1:m7 
    bf4:m7 ef2.:7 
    af2:7  af2:6
    af1:6
    a1:m7
    a2:dim  f2:7
    ef2:7   e2:dim
    f2:m7   bf2:7
  
}
chordNames = \chordmode {   
  \partial 4
    s4
    \repeat volta 2 {
      \chord_Part_A
    }
    \alternative {
      { g2:m   c2:m7
        f2:7   bf2:7  }
      { e4:m7  c4:m7  f4:m7  bf4:7  }
    }
    
    \chord_Part_B
    
    \chord_Part_A
    
    ef1
}


\score {
  <<
    \new ChordNames \chordNames
    \new Staff { \melody }
    \addlyrics { \stanzaOne  }
    \addlyrics { \stanzaTwo  }
  >>
  \layout { }

}




\pageBreak
\score {
  <<
    \new ChordNames{ \transpose ef c \chordNames }
    \new Staff     { \transpose ef c \melody     }
    \addlyrics     { \stanzaOne  }
    \addlyrics     { \stanzaTwo  }
  >>
  \layout { }
 \midi { }
}



%{
      \set Score.skipBars = ##t
      %%\set Score.melismaBusyProperties = #'()
      \override Score.BarNumber.break-visibility = #end-of-line-invisible %%every bar is numbered.!!!
      %% remove previous line to get barnumbers only at beginning of system.
       \accidentalStyle modern-cautionary
      \set Score.markFormatter = #format-mark-box-letters %%boxed rehearsal-marks
       \override Score.TimeSignature.style = #'() %%makes timesigs always numerical
      %% remove previous line to get cut-time/alla breve or common time 
      \set Score.pedalSustainStyle = #'mixed 
       %% make spanners comprise the note it end on, so that there is no doubt that this note is included.
       \override Score.TrillSpanner.bound-details.right.padding = #-2
      \override Score.TextSpanner.bound-details.right.padding = #-1
      %% Lilypond's normal textspanners are too weak:  
      \override Score.TextSpanner.dash-period = #1
      \override Score.TextSpanner.dash-fraction = #0.5
      %% lilypond chordname font, like mscore jazzfont, is both far too big and extremely ugly (olagunde@start.no):
      \override Score.ChordName.font-family = #'roman 
      \override Score.ChordName.font-size =#0 
      %% In my experience the normal thing in printed scores is maj7 and not the triangle. (olagunde):
      \set Score.majorSevenSymbol = \markup {maj7}
%}
