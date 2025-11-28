\language "english"
%=============================================
%   created by MuseScore Version: 1.3
%          July 15, 2013
%=============================================

\version "2.19.32"
%% #(set-global-staff-size 14)
%#(set-global-staff-size 24)
#(set-default-paper-size "letter")


\paper {
%  line-width    = 190\mm
%  left-margin   = 10\mm
%  top-margin    = 10\mm
%  bottom-margin = 20\mm
  %%indent = 0 \mm
  %%set to ##t if your score is less than one page:
%  ragged-last-bottom = ##t
%  ragged-bottom = ##f
  %% in orchestral scores you probably want the two bold slashes
  %% separating the systems: so uncomment the following line:
  %% system-separator-markup = \slashSeparator
  }

\header {
    title = "Theme from Schindler's List"
    composer = "John Williams"
  country = "USA"
    dedication = "For Itzhak Perlman"
}

violinSolo = \relative c'{

    % Can be put in a stylesheet
  \compressFullBarRests
  \override MultiMeasureRest.expand-limit = #3


    \set Staff.instrumentName = #"Solo Violin"
    \set Staff.shortInstrumentName = #"SVln."
    \clef treble
    \key d \minor
     \time 3/4
     \tempo "Slowly" 4 = 60
    R1 *3  | %
    \time 4/4
    |    R1
    |
   %{  5 %}   r2 r4  a\upbow\mp
    a'8 ( d,  a'  d, ) bf'( a f a,)
    f'8 ( g,  f'  g  ) a2
    a8  ( d,  a'  d, ) c' (bf  a  g)      | % 8
    c,8 ( bf  e   g  ) bf ( a  g  f)      | % 9
    g8  ( bf, g' bf, ) a' ( g  f  g)      | % 10
    a2.   a,4
    g'8-4\flageolet ( bf, g'-2 bf, ) a'-2 ( g  f  e)
    d2-2 \glissando e2      | % 13
    f8 g, f' g, a' g f e      | % 14
    d2. a'4      | % 15
    a'8-4\flageolet d,-1 a' d, bf'^"4 ?" a f a,      | % 16
    f' g, f' g a2      | % 17
    a8 d, a' d, c' bf a g      | % 18
    c, bf e g bf a g f      | % 19
    g bf, g' bf, a' g f g      | % 20
    a2. a,4      | % 21
    g'8 bf, g' bf, a' g f e      | % 22
    d2 e      | % 23
    f8 g, f' g, a' g f e      | % 24
    d1
    r2 \mp bf,4~ bf8 a16 g
    d'4 a a8. g16 a d f a
    d2~ d16 g e d bf g e d
    bf4 g'8 g, g'8. f16 e8 e'~      | % 29
    e \f e16 d f8 e b8. c16 d4~      | % 30
    d8 c16 d b8 a16 gs b8 a4.      | % 31
    r8 e'16 d g8 f b,8. c16 d4      | % 32
    r8 d,16 \< e f8 f16 g a8 a16 b ds fs,32 b ds fs b ds      | % 33
    e8 \! \f a, e' a, f' e c e,      | % 34
    c' d, c' d e2      | % 35
    e8 a, e' a, g' f e d      | % 36
    | g, f b d f e d c
    | d f, d' f, e' d c d
    e4~ e32 c b a e c b a e4~ e8 c'
    d f, d' f, e' d \grace{\stemUp c16  [ d  ]  } \stemNeutral c8 b
    a a, c16 e f a b2      | % 41
    | \grace{\stemUp c16  [ b a b  ]  } \stemNeutral c8 d, c' d, e' d c b
    | a4.( b,8)   c16( e a c)  e( a c d)
    | e8 a, e' a, f' e c c,
    | g'' f e d c16 d c a
       \tuplet 10/8  {g32[ f e d c  b a g  f e]}
    |
    d8 c b f' d' c b d,      | % 46
    f' \> e d b' d f, e gs' \bar "|."     | % 47
    a1 \! \mp \bar "|."
}% end of last bar in partorvoice



AVlnsvoiceBA = \relative c'{
    \set Staff.instrumentName = #"Violins 1"
   % \set Staff.shortInstrumentName = #"Vlns. 1"
    \clef treble
    \key c \major
    \time 4/4
    r2 \p r4 a'~      | % 1
    a2 a~      | % 2
    a4 a2.      | % 3
    e1~      | % 4
    e      | % 5
    a2 bf4 a      | % 6
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
    f2 e4 cs      | % 24
    d1      | % 25
    r8 \mp a16 g bf8 a e8. f16 g4~      | % 26
    g8 f16 g e8 d16 cs e8 d4.      | % 27
    r8 \mf a'16 g c8 bf e,8. f16 g4      | % 28
    r8 g,16 a bf8 bf16 c d8 e16 f af4      | % 29
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
    d d4 cs      | % 10
    e d e a,      | % 11
    d2 e      | % 12
    bf d4 cs      | % 13
    d2 e      | % 14
    f e      | % 15
    f bf8 a4.      | % 16
    bf2 a      | % 17
    d d      | % 18
    bf c      | % 19
    bf c4 df      | % 20
    d e f, a      | % 21
    d2 cs      | % 22
    d g      | % 23
    bf a      | % 24
    f1      | % 25
    d,4 a d bf      | % 26
    d bf d a      | % 27
    f' d e16 cs e bf e cs e bf      | % 28
    e d e d e d e bf e d e bf e d e8      | % 29
    c2 b      | % 30
    b c      | % 31
    r4 g'8 f a4 f'      | % 32
    a,2 a4 fs      | % 33
    a1      | % 34
    a4 a8 b b2      | % 35
    g f      | % 36
    f g      | % 37
    a4 f' e2      | % 38
    c' c,      | % 39
    a a4 gs      | % 40
    e8 e4 e8 a4 gs      | % 41
    a2 b      | % 42
    c1      | % 43
    a'      | % 44
    a,      | % 45
    a,      | % 46
    f'2 a4 gs \bar "|."     | % 47
    a1 \bar "|."
}% end of last bar in partorvoice





\score {
      \violinSolo

}

%{
convert-ly (GNU LilyPond) 2.19.38  convert-ly: Processing `'...
Applying conversion: 2.19.16, 2.19.22, 2.19.24, 2.19.28, 2.19.29,
2.19.32
%}
