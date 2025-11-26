%=============================================
%   created by MuseScore Version: 1.3
%          September 8, 2014
%=============================================

\version "2.12.0"



#(set-default-paper-size "a4")

\paper {
  line-width    = 190\mm
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
    title = "Schindler's List"
    subtitle = "From Steven Spielberg's Motion Picture 'Schindler's List'"
    composer = "John Williams"
    poet = "arr. Caroline Jones"
    }

ASVlnvoiceAA = \relative c'{
    \set Staff.instrumentName = #"Solo Violin"
    \set Staff.shortInstrumentName = #"SVln."
    \clef treble
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 4/4 
    \tempo "Ballad" 4 = 60  R1 *4  | % 
    r4 r r a      | % 5
    a'8 \f d, a' d, bes' a f a,      | % 6
    f' g, f' g a2      | % 7
    a8 d, a' d, c' bes a g      | % 8
    c, bes e g bes a g f      | % 9
    g bes, g' bes, a' g f g      | % 10
    a2. a,4      | % 11
    g'8 bes, g' bes, a' g f e      | % 12
    d2 e      | % 13
    f8 g, f' g, a' g f e      | % 14
    d2. a'4      | % 15
    a'8 d, a' d, bes' a f a,      | % 16
    f' g, f' g a2      | % 17
    a8 d, a' d, c' bes a g      | % 18
    c, bes e g bes a g f      | % 19
    g bes, g' bes, a' g f g      | % 20
    a2. a,4      | % 21
    g'8 bes, g' bes, a' g f e      | % 22
    d2 e      | % 23
    f8 g, f' g, a' g f e      | % 24
    d1      | % 25
    r2 \mp bes,4~ bes8 a16 g      | % 26
    d'4 a a8. g16 a d f a      | % 27
    d2~ d16 g e d bes g e d      | % 28
    bes4 g'8 g, g'8. f16 e8 e'~      | % 29
    e \f e16 d f8 e b8. c16 d4~      | % 30
    d8 c16 d b8 a16 gis b8 a4.      | % 31
    r8 e'16 d g8 f b,8. c16 d4      | % 32
    r8 d,16 \< e f8 f16 g a8 a16 b ees fis,32 b dis fis b dis      | % 33
    e8 \! \f a, e' a, f' e c e,      | % 34
    c' d, c' d e2      | % 35
    e8 a, e' a, g' f e d      | % 36
    g, f b d f e d c      | % 37
    d f, d' f, e' d c d      | % 38
    e4~ e32 c b a e c b a e4~ e8 c'      | % 39
    d f, d' f, e' d \grace{\stemUp c16  [ d  ]  } \stemNeutral c8 b      | % 40
    a a, c16 e f a b2      | % 41
    \grace{\stemUp c16  [ b a b  ]  } \stemNeutral c8 d, c' d, e' d c b      | % 42
    a4. b,8 c16 e a c e a c d      | % 43
    e8 a, e' a, f' e c c,      | % 44
    g'' f e d c16 d c a g4 f64 \times 2/3{e4 d c  } \times 2/3{b a g  } f64 e4      | % 45
    d8 c b f' d' c b d,      | % 46
    f' \> e d b' d f, e gis' \bar "|."     | % 47
    a1 \! \mp \bar "|." 
}% end of last bar in partorvoice

 

AVlnsvoiceBA = \relative c'{
    \set Staff.instrumentName = #"Violins 1"
    \set Staff.shortInstrumentName = #"Vlns. 1"
    \clef treble
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 4/4 
    r2 \p r4 a'~      | % 1
    a2 a~      | % 2
    a4 a2.      | % 3
    e1~      | % 4
    e      | % 5
    a2 bes4 a      | % 6
    f4. g8 a2      | % 7
    a f      | % 8
    e f      | % 9
    g e      | % 10
    a1      | % 11
    g2 a      | % 12
    d, e      | % 13
    f a      | % 14
    a1      | % 15
    a2 d      | % 16
    d c      | % 17
    f f      | % 18
    c f      | % 19
    d e      | % 20
    f a,4 e'8 f      | % 21
    g2 a      | % 22
    a d4 e      | % 23
    f2 e4 cis      | % 24
    d1      | % 25
    r8 \mp a16 g bes8 a e8. f16 g4~      | % 26
    g8 f16 g e8 d16 cis e8 d4.      | % 27
    r8 \mf a'16 g c8 bes e,8. f16 g4      | % 28
    r8 g,16 a bes8 bes16 c d8 e16 f aes4      | % 29
    r r16 d \mp c b a4~ a16 f e d      | % 30
    f,4. \mf e8~ e8. f16 e d' c b      | % 31
    a2. r4      | % 32
    b2 \p d4 b      | % 33
    c1      | % 34
    c4 c8 d e2      | % 35
    e e8 d4.      | % 36
    d2. g,4      | % 37
    d' a' b2      | % 38
    e e,      | % 39
    d b      | % 40
    a b      | % 41
    c e      | % 42
    e1      | % 43
    c'      | % 44
    c,      | % 45
    b,      | % 46
    a'4 b d e \bar "|."     | % 47
    e1 \bar "|." 
}% end of last bar in partorvoice

 

AVlnsvoiceCA = \relative c'{
    \set Staff.instrumentName = #"Violins 2"
    \set Staff.shortInstrumentName = #"Vlns. 2"
    \clef treble
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 4/4 
    R1 \p  | % 
    a''2~ a8 r a4      | % 2
    r2 a      | % 3
    a1      | % 4
    R1  | % 
    f,1      | % 6
    d4. e8 f2      | % 7
    f d      | % 8
    c c      | % 9
    d d4 cis      | % 10
    e d e a,      | % 11
    d2 e      | % 12
    bes d4 cis      | % 13
    d2 e      | % 14
    f e      | % 15
    f bes8 a4.      | % 16
    bes2 a      | % 17
    d d      | % 18
    bes c      | % 19
    bes c4 des      | % 20
    d e f, a      | % 21
    d2 cis      | % 22
    d g      | % 23
    bes a      | % 24
    f1      | % 25
    d,4 a d bes      | % 26
    d bes d a      | % 27
    f' d e16 cis e bes e cis e bes      | % 28
    e d e d e d e bes e d e bes e d e8      | % 29
    c2 b      | % 30
    b c      | % 31
    r4 g'8 f a4 f'      | % 32
    a,2 a4 fis      | % 33
    a1      | % 34
    a4 a8 b b2      | % 35
    g f      | % 36
    f g      | % 37
    a4 f' e2      | % 38
    c' c,      | % 39
    a a4 gis      | % 40
    e8 e4 e8 a4 gis      | % 41
    a2 b      | % 42
    c1      | % 43
    a'      | % 44
    a,      | % 45
    a,      | % 46
    f'2 a4 gis \bar "|."     | % 47
    a1 \bar "|." 
}% end of last bar in partorvoice

 

AVlasvoiceDA = \relative c'{
    \set Staff.instrumentName = #"Violas"
    \set Staff.shortInstrumentName = #"Vlas."
    \clef alto
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 4/4 
    r2 \p r4 e8 d      | % 1
    f4 e c8 b d4      | % 2
    d8 c b d c4 b      | % 3
    d1      | % 4
    cis      | % 5
    R1 *2  | % 
    r4 d,~ d8 e f4~      | % 8
    f8 d4 e c8 g' a      | % 9
    r4 d, d' cis      | % 10
    e d2.      | % 11
    R1  | % 
    f,4 f g~ g8 a      | % 13
    d,4 a' g2      | % 14
    a1      | % 15
    d2 f      | % 16
    f g4 f      | % 17
    a2 c8 bes a g      | % 18
    f4 g bes a      | % 19
    r d,~ d8 a g f'      | % 20
    a, g c e e f a d,      | % 21
    d4. d8 e4~ e8 e      | % 22
    r4 a~ a8 g,16 bes a4      | % 23
    g f' d a'      | % 24
    d,2 e4 f      | % 25
    f8 f4 f8 d d4 d8~      | % 26
    d d4 d8 d d4 d8      | % 27
    f f4 f8 e e4 e8~      | % 28
    e e4 e e4.      | % 29
    c16 b c a c b c a d c d b d c d b      | % 30
    d c d b d c d e, c' b c e, c' b c e,      | % 31
    a4 g8 a b2      | % 32
    d2. ees4      | % 33
    c1      | % 34
    c4. d8 b2      | % 35
    c c      | % 36
    c8 b4. c2      | % 37
    d a'4 b,      | % 38
    e a,2 a4      | % 39
    f'2 d      | % 40
    a8 a4 a8 b2      | % 41
    c b      | % 42
    c1      | % 43
    c'      | % 44
    c,      | % 45
    f,      | % 46
    d'2 d \bar "|."     | % 47
    c1 \bar "|." 
}% end of last bar in partorvoice

 
AVlasvoiceDB = \relative c'{
    \voiceTwo

    s1      | % 1
    s2.. c'16 b      | % 2
    a2 a      | % 3
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
    s1      | % 17
    s1      | % 18
    s1      | % 19
    s1      | % 20
    s1      | % 21
    s1      | % 22
    s1      | % 23
    s1      | % 24
    a1      | % 25
    s1      | % 26
    s1      | % 27
    s1      | % 28
    s1      | % 29
    s1      | % 30
    s1      | % 31
    s1      | % 32
    s1      | % 33
    s1      | % 34
    s1      | % 35
    s1      | % 36
    s1      | % 37
    s1      | % 38
    s1      | % 39
    s1      | % 40
    s1      | % 41
    s1      | % 42
    s1      | % 43
    s1      | % 44
    s1      | % 45
    s1      | % 46
    s1 \bar "|."     | % 47
    s1 \bar "|." 
}% end of last bar in partorvoice

 
AVlaspartD =  << 
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn 
        \context Voice = AVlasvoiceDA{\voiceOne \AVlasvoiceDA}\\ 
        \context Voice = AVlasvoiceDB\AVlasvoiceDB
        >> 

 

AVlcsvoiceEA = \relative c{
    \set Staff.instrumentName = #"Violoncellos"
    \set Staff.shortInstrumentName = #"Vlcs."
    \clef bass
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 4/4 
    r2 \p r4 a'\laissezVibrer       | % 1
    R1  | % 
    a4 a2.      | % 3
    <a, e'>1~      | % 4
    <a e'>      | % 5
    R1 *2  | % 
    r2 g      | % 8
    c f,      | % 9
    R1  | % 
    r8 a f' a e'4 f      | % 11
    r bes, e, a,      | % 12
    bes2 a      | % 13
    g a      | % 14
    d1      | % 15
    r4 d,2.      | % 16
    r4 r8 c' c'4 c,      | % 17
    d2 g,      | % 18
    c f,      | % 19
    e a      | % 20
    bes'8 a4. a4 d,,      | % 21
    g8 d' bes'4 e, a      | % 22
    a2 d4 cis      | % 23
    d2 e4 cis      | % 24
    a' d,2.      | % 25
    R1  | % 
    r8 bes4 g8 f f4 f8      | % 27
    r2 bes8 bes4 bes8(      | % 28
    b) bes4 bes bes4.      | % 29
    a,8 e' r e a, f' r f      | % 30
    a, f' r d a e' a e      | % 31
    a,4 g'8 a b2      | % 32
    a2. b4      | % 33
    e,2 f4 e      | % 34
    d g, g2      | % 35
    a8 c' e, a, d, a' f' c'      | % 36
    g, d' g b d4~ d8 g,      | % 37
    a2 d8 d4 gis,8      | % 38
    c2 c      | % 39
    b, e      | % 40
    c a'4 gis      | % 41
    a2 gis      | % 42
    e1      | % 43
    e'      | % 44
    d,      | % 45
    R1  | % 
    a'4 aes f e \bar "|."     | % 47
    a,1 \bar "|." 
}% end of last bar in partorvoice

 
AVlcsvoiceEB = \relative c{
    \voiceTwo

    s1      | % 1
    a'2 a      | % 2
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
    s1      | % 17
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
    s1      | % 31
    s1      | % 32
    s1      | % 33
    s1      | % 34
    s1      | % 35
    s1      | % 36
    s1      | % 37
    s1      | % 38
    s1      | % 39
    s1      | % 40
    s1      | % 41
    s1      | % 42
    s1      | % 43
    s1      | % 44
    s1      | % 45
    s1      | % 46
    s1 \bar "|."     | % 47
    s1 \bar "|." 
}% end of last bar in partorvoice

 
AVlcspartE =  << 
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn 
        \context Voice = AVlcsvoiceEA{\voiceOne \AVlcsvoiceEA}\\ 
        \context Voice = AVlcsvoiceEB\AVlcsvoiceEB
        >> 


\score { 
    << 
        \context Staff = ASVlnpartA << 
            \context Voice = ASVlnvoiceAA \ASVlnvoiceAA
        >>


        \context Staff = AVlnspartB << 
            \context Voice = AVlnsvoiceBA \AVlnsvoiceBA
        >>


        \context Staff = AVlnspartC << 
            \context Voice = AVlnsvoiceCA \AVlnsvoiceCA
        >>


        \context Staff = AVlaspartD << 
            \AVlaspartD
        >>


        \context Staff = AVlcspartE << 
            \AVlcspartE
        >>




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
