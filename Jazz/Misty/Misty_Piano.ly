%=============================================
%   created by MuseScore Version: 1.3
%          September 1, 2014
%=============================================

\version "2.12.0"



#(set-default-paper-size "letter")

\paper {
  line-width    = 195.9\mm
  left-margin   = 10\mm
  top-margin    = 10\mm
  bottom-margin = 20\mm
  %%indent = 0 \mm 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t 
  ragged-bottom = ##f  
  %% in orchestral scores you probably want the two bold slashes 
  %% separating the systems: so uncomment the following line: 
  %% system-separator-markup = \slashSeparator 
  }

\header {
title = "Misty"
composer = "Erroll Garner"
poet = "Johnny Burke"
}

AVovoiceAA = \relative c'{
    \set Staff.instrumentName = #"Voice"
    \set Staff.shortInstrumentName = #"Vo."
    \clef treble
    %staffkeysig
    \key es \major 
    %barkeysig: 
    \key es \major 
    %bartimesig: 
    \time 4/4 
    \tempo "64 bpm" 4 = 64  R1  | % 
    r2 bes'4 g      | % 2
    d2. bes8 c      | % 3
    des c' c c c bes g ees      | % 4
    c2 \times 2/3{r8 aes aes  } \times 2/3{c ees g  }      | % 5
    bes8 bes bes aes bes4. aes8      | % 6
    g4~ \times 2/3{g8 aes bes  } ees,4~ \times 2/3{ees8 f g  }      | % 7
    aes8 c,4 c8 \times 2/3{d4 ees f  }      | % 8
    g1~      | % 9
    g2 r4 bes8 g      | % 10
    d2. bes8 c      | % 11
    des c' c c c bes g ees      | % 12
    c2 \times 2/3{r8 aes aes  } \times 2/3{c ees g  }      | % 13
    bes8 bes bes aes bes4. aes8      | % 14
    g4~ \times 2/3{g8 aes bes  } ees,4~ \times 2/3{ees8 f g  }      | % 15
    aes8 c,4 c8 \times 2/3{d4 ees f  }      | % 16
    ees1     \repeat volta 2 { %startrep 
     | % 17
    \times 2/3{r4 ees f  } \times 2/3{g bes c  }      | % 18
    \times 2/3{des des des  } des2      | % 19
    \times 2/3{r4 des ees  } \times 2/3{fes ees des  }      | % 20
    \times 2/3{c c c  } c2      | % 21
    \times 2/3{r4 ees, f  } \times 2/3{aes bes c  }      | % 22
    d8 d d c d2      | % 23
    r8 d d c \times 2/3{f4 d c  }      | % 24
    bes1~      | % 25
    bes4 r bes g      | % 26
    d2. bes8 c      | % 27
    des c' c c c bes g ees      | % 28
    c2 \times 2/3{r8 aes aes  } \times 2/3{c ees g  }      | % 29
    bes8 bes bes aes bes4. aes8      | % 30
    \times 2/3{g4 aes bes  } \times 2/3{ees, f g  } } % end of repeat except alternate endings
    \alternative{ {       | % 31
    aes8 c,4 c8 \times 2/3{d4 ees f  }      | % 32
    ees1~ } %close alt1
    {          | % 33
    ees4 ees8 f \times 2/3{g4 bes c  } } } %close alternatives
     | % 34
    bes1~ \bar "|."     | % 35
    bes1 \bar "|." 
}% end of last bar in partorvoice

 

APnovoiceBA = \relative c'{
    \set Staff.instrumentName = #"Piano"
    \set Staff.shortInstrumentName = #"Pno."
    \clef treble
    %staffkeysig
    \key es \major 
    %barkeysig: 
    \key es \major 
    %bartimesig: 
    \time 4/4 
    g'8( bes, b d c ees g d'      | % 1
    <c, ees g bes>2) r4 r      | % 2
    d2. r8 r      | % 3
    r r r r r r r r      | % 4
    <bes c>2~ \times 2/3{<bes c>8 r r  } \times 2/3{r r r  }      | % 5
    r8 r r r r4. aes'8      | % 6
    r4 \times 2/3{r8 r r  } r4 \times 2/3{r8 r r  }      | % 7
    <c, aes'>8 <aes c>4 <aes c>8 \times 2/3{<bes d>4 <c ees> <d f>  }      | % 8
    R1  | % 
    r2. <c ees>8 <ces des>      | % 10
    <f, g bes d>2. <f g bes>8 r      | % 11
    <f bes des> r r r r r r r      | % 12
    <bes c>2~ \times 2/3{<bes c>8 r r  } \times 2/3{r r r  }      | % 13
    bes'8 r r r bes4. r8      | % 14
    r4 \times 2/3{r8 r r  } r4 \times 2/3{r8 r r  }      | % 15
    aes8 c,4 c8 \times 2/3{d4 r r  }      | % 16
    ees4 r16 ees8 ees16 ees4 r16 ees8 ees16     \repeat volta 2 { %startrep 
     | % 17
    \times 2/3{ees4 <c ees> <d f>  } \times 2/3{<ees g> <g bes> <a c>  }      | % 18
    \times 2/3{r r r  } <f c' des>2~      | % 19
    \times 2/3{des'4 r r  } \times 2/3{r r r  }      | % 20
    \times 2/3{r r r  } c2~      | % 21
    \times 2/3{<bes c>4 r r  } \times 2/3{r r r  }      | % 22
    d8 d d c d2      | % 23
    r8 d d c \times 2/3{<d f>4 <b d> <a c>  }      | % 24
    bes1      | % 25
    <d, g bes>2 <c ees g bes>4 <g ces d g>      | % 26
    r2. r8 r      | % 27
    r r r r r r r r      | % 28
    <bes c>2~ \times 2/3{<bes c>8 aes aes  } \times 2/3{r r r  }      | % 29
    bes'8 r r r bes4. r8      | % 30
    \times 2/3{g4 aes bes  } \times 2/3{ees, f g  } } % end of repeat except alternate endings
    \alternative{ {       | % 31
    aes8 c,4 r8 \times 2/3{r4 r r  }      | % 32
    r4 r16 ees8 ees16 ees4 r16 ees8 ees16 } %close alt1
    {          | % 33
    ees4 ees8 f \times 2/3{<ees g>4 <g bes> <a c>  } } } %close alternatives
     | % 34
    <g, c f bes>1~ \bar "|."     | % 35
    <g c f bes>1 \bar "|." 
}% end of last bar in partorvoice

 
APnovoiceBB = \relative c'{
        s1      | % 1
    r2 <ces d>      | % 2
    <g bes>\laissezVibrer  r4 g)      | % 3
    r r fes'4. r8      | % 4
    s1      | % 5
    <ces ees>2 <ces ees>      | % 6
    r8 <bes d>4. r2      | % 7
    s1      | % 8
    ees4 d des c      | % 9
    des c ces r      | % 10
    s1      | % 11
    s1      | % 12
    s1      | % 13
    <ces ees>2 <ces ees>      | % 14
    r8 <bes d>4. r2      | % 15
    <c ees>8 aes4 aes8 ces2      | % 16
    r4 <g c>8 <fis b> <f bes>4 <f bes>8 <fis b>     \repeat volta 2 { %startrep 
     | % 17
    <g c>4 r r2      | % 18
    <f' bes> r      | % 19
    <f bes> <g ces>      | % 20
    <ees bes'> <des aes'>      | % 21
    c c      | % 22
    b'8 b b a <b d>2~(      | % 23
    <bes d>8) b b a r2      | % 24
    <ees g>4 ces8 d c ees g d'      | % 25
    s1      | % 26
    <fis,, a>2(\( <g bes>\))      | % 27
    <f bes>4 <d' fis> <des f> <g, d'>8 <g des'>      | % 28
    s1      | % 29
    <ces ees>2 <ces ees>      | % 30
    s1 } % end of repeat except alternate endings
    \alternative{ {       | % 31
    <c ees>8 aes4. c2      | % 32
    r4 <g c>8 <fis b> <f bes>4 <f bes>8 <fis b> } %close alt1
    {          | % 33
    <g c>2 r } } %close alternatives
     | % 34
    s1 \bar "|."     | % 35
    s1 \bar "|." 
}% end of last bar in partorvoice

 
APnovoiceBC = \relative c'{
        s1      | % 1
    s1      | % 2
    s1      | % 3
    r4 r des2      | % 4
    s1      | % 5
    s1      | % 6
    s1      | % 7
    s1      | % 8
    s1      | % 9
    s1      | % 10
    s1      | % 11
    s1      | % 12
    s1      | % 13
    s1      | % 14
    s1      | % 15
    s1      | % 16
    s1     \repeat volta 2 { %startrep 
     | % 17
    s1      | % 18
    s1      | % 19
    s1      | % 20
    s1      | % 21
    s1      | % 22
    s1      | % 23
    s1      | % 24
    s1      | % 25
    s1      | % 26
    s1      | % 27
    s1      | % 28
    s1      | % 29
    s1      | % 30
    s1 } % end of repeat except alternate endings
    \alternative{ {       | % 31
    s1      | % 32
    s1 } %close alt1
    {          | % 33
    s1 } } %close alternatives
     | % 34
    s1 \bar "|."     | % 35
    s1 \bar "|." 
}% end of last bar in partorvoice

 
APnopartB =  << 
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn 
        \context Voice = APnovoiceBA\APnovoiceBA\\ 
        \context Voice = APnovoiceBB\APnovoiceBB\\ 
        \context Voice = APnovoiceBC\APnovoiceBC
        >> 

 

AvoiceCA = \relative c{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef bass
    %staffkeysig
    \key es \major 
    %barkeysig: 
    \key es \major 
    %bartimesig: 
    \time 4/4 
    <bes f' g>1      | % 1
    <bes aes'>2 <bes aes'>      | % 2
    r4 r8 f' d2      | % 3
    <bes f' aes> <bes g'>      | % 4
    g'4. e8 f2      | % 5
    <aes, ges'> <aes f'>      | % 6
    r8 f'4. r8 <f aes>4.      | % 7
    r4 ees <bes aes'> <aes ges'>      | % 8
    b'2 bes      | % 9
    a aes4 r      | % 10
    r8 bes, b d c2      | % 11
    <bes aes'>2. ees,4      | % 12
    r8 ees' ees g f2      | % 13
    <aes, ges'> <des f>      | % 14
    r r8 <g bes>4.      | % 15
    r4 ees bes'2      | % 16
    r4 <ees,, bes'>8 <d a'> <d aes'>4 <d aes'>8 <d a'>     \repeat volta 2 { %startrep 
     | % 17
    <ees bes'>1      | % 18
    bes''2 \times 2/3{a4 a des  }      | % 19
    <bes, aes'>2\) <ees des'>      | % 20
    g \times 2/3{f4 bes aes  }      | % 21
    g2 \times 2/3{f4 fes ees  }      | % 22
    s1      | % 23
    r4 <fis c' e> <bes ees g> <a ees' g>      | % 24
    <f aes>1      | % 25
    <bes, aes'>2 <bes aes'>      | % 26
    <ees, bes'>1      | % 27
    aes'4 a aes r      | % 28
    r8 ees e g f2      | % 29
    <aes, ges'> <des f>      | % 30
    \times 2/3{r4 c' d  } \times 2/3{r ces bes  } } % end of repeat except alternate endings
    \alternative{ {       | % 31
    r4 ees, aes2      | % 32
    r4 <ees, bes'>8 <d a'> <des aes'>4 <des aes'>8 <d a'> } %close alt1
    {          | % 33
    <ees bes'>2 r } } %close alternatives
     | % 34
    <ees bes'>1~ \bar "|."     | % 35
    <ees bes'>1 \bar "|." 
}% end of last bar in partorvoice

 
AvoiceCB = \relative c{
        s1      | % 1
    s1      | % 2
    <ees, bes'>1      | % 3
    s1      | % 4
    aes1      | % 5
    s1      | % 6
    g2 c      | % 7
    f, r      | % 8
    <g f'> <c e>      | % 9
    <f, ees'> <bes d>4 <bes aes'>      | % 10
    ees,1      | % 11
    s1      | % 12
    aes1      | % 13
    s1      | % 14
    ees'2 c      | % 15
    f, bes      | % 16
    s1     \repeat volta 2 { %startrep 
     | % 17
    s1      | % 18
    bes1(      | % 19
    s1      | % 20
    aes1~      | % 21
    aes2 r      | % 22
    a2. d8 a      | % 23
    d,2 r      | % 24
    s1      | % 25
    s1      | % 26
    s1      | % 27
    bes'2. e,8 a      | % 28
    aes1      | % 29
    s1      | % 30
    ees'2 c } % end of repeat except alternate endings
    \alternative{ {       | % 31
    f,2 bes      | % 32
    s1 } %close alt1
    {          | % 33
    s1 } } %close alternatives
     | % 34
    s1 \bar "|."     | % 35
    s1 \bar "|." 
}% end of last bar in partorvoice

 
AvoiceCC = \relative c{
        s1      | % 1
    s1      | % 2
    s1      | % 3
    s1      | % 4
    s1      | % 5
    s1      | % 6
    s1      | % 7
    s1      | % 8
    s1      | % 9
    s1      | % 10
    s1      | % 11
    s1      | % 12
    s1      | % 13
    s1      | % 14
    s1      | % 15
    s1      | % 16
    s1     \repeat volta 2 { %startrep 
     | % 17
    s1      | % 18
    s1      | % 19
    s1      | % 20
    s1      | % 21
    s1      | % 22
    r4 <g' c e>2.      | % 23
    s1      | % 24
    s1      | % 25
    s1      | % 26
    s1      | % 27
    s1      | % 28
    s1      | % 29
    s1      | % 30
    s1 } % end of repeat except alternate endings
    \alternative{ {       | % 31
    s1      | % 32
    s1 } %close alt1
    {          | % 33
    s1 } } %close alternatives
     | % 34
    s1 \bar "|."     | % 35
    s1 \bar "|." 
}% end of last bar in partorvoice

 
ApartC =  << 
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn 
        \context Voice = AvoiceCA\AvoiceCA\\ 
        \context Voice = AvoiceCB\AvoiceCB\\ 
        \context Voice = AvoiceCC\AvoiceCC
        >> 

  AVopartAverseA = \lyricmode { \set stanza = " 1. " Look at me, I'm as help -- less  as a kit -- ten  up a tree, And I feel like I'm cling -- ing  to a cloud, I can't -- un -- der -- stand, -- I  get mist -- y  just hold -- ing  your hand. -- Walk my way and a thou -- sand  vi -- o -- lins  be -- gin  to play, Or it might be the sound of your hel -- lo,  That mu -- sic  I hear, -- I  get mist -- y,  the mo -- ment  your're near. You can say that you're lead -- ing  me on, But it's just what I want you to do. Don't you no -- tice  how hope -- less -- ly  I'm lost, That's why I'm fol -- low -- ing  you. -- On  my own, as I wan -- der  through this won -- der -- land  a -- lone,  Nev -- er  know -- ing  my right foot from my left, My hat from my glove I get mist -- y,  and too much in love. -- You  can say that you're love. -- }

\score { 
    << 
        \context PianoStaff <<
        \set PianoStaff.instrumentName="Piano" 
            \context Staff = AVopartA << 
                \context Voice = AVovoiceAA \AVovoiceAA
                \set Staff.instrumentName = #""
                \set Staff.shortInstrumentName = #""
            >>

             \context Lyrics = AVopartAverseA\lyricsto AVovoiceAA  \AVopartAverseA

            \context PianoStaff <<
            \set PianoStaff.instrumentName="Piano" 
                \context Staff = APnopartB << 
                    \APnopartB
                    \set Staff.instrumentName = #""
                    \set Staff.shortInstrumentName = #""
                >>


                \context Staff = ApartC << 
                    \ApartC
                    \set Staff.instrumentName = #""
                    \set Staff.shortInstrumentName = #""
                >>


            >> %end of PianoStaffA


      \set Score.skipBars = ##t
      %%\set Score.melismaBusyProperties = #'()
      \override Score.BarNumber #'break-visibility = #end-of-line-invisible %%every bar is numbered.!!!
      %% remove previous line to get barnumbers only at beginning of system.
       #(set-accidental-style 'modern-cautionary)
      \set Score.markFormatter = #format-mark-box-letters %%boxed rehearsal-marks
       \override Score.TimeSignature #'style = #'() %%makes timesigs always numerical
      %% remove previous line to get cut-time/alla breve or common time 
      \set Score.pedalSustainStyle = #'mixed 
       %% make spanners comprise the note it end on, so that there is no doubt that this note is included.
       \override Score.TrillSpanner #'(bound-details right padding) = #-2
      \override Score.TextSpanner #'(bound-details right padding) = #-1
      %% Lilypond's normal textspanners are too weak:  
      \override Score.TextSpanner #'dash-period = #1
      \override Score.TextSpanner #'dash-fraction = #0.5
      %% lilypond chordname font, like mscore jazzfont, is both far too big and extremely ugly (olagunde@start.no):
      \override Score.ChordName #'font-family = #'roman 
      \override Score.ChordName #'font-size =#0 
      %% In my experience the normal thing in printed scores is maj7 and not the triangle. (olagunde):
      \set Score.majorSevenSymbol = \markup {maj7}
  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {\context {\Score \consists Span_bar_engraver}}
}%% end of score-block 

#(set-global-staff-size 14)
