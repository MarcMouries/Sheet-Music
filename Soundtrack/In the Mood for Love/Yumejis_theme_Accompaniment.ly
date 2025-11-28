%=============================================
%   created by MuseScore Version: 1.3
%          December 17, 2015
%=============================================

\version "2.19.29"



#(set-default-paper-size "a4")

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
    title = "In The Mood For Love"
    subtitle = "Yumeji's Theme - Accompaniment"
    composer = "Shigeru Umebayashi"
  country = "Japan"
    arranger = "Arranged by Jias"
    style = "soundtrack"
    tagline = ""
    }

AVlnSolovoiceAA = \relative c'{
    \set Staff.instrumentName = #"Violin Solo"
    \set Staff.shortInstrumentName = #"Vln Solo"
    \clef treble
    %staffkeysig
    \key es \major
    %barkeysig:
    \key es \major
    %bartimesig:
    \time 3/4
    \tempo "Moderato" 4 = 112  r4 r2      | % 1
    R2. *7  | %
    bes'2.      | % 9
    bes4 aes g      | % 10
    aes2.~      | % 11
    aes4. r8 r4      | % 12
    aes2.(      | % 13
    aes4) g4. f8      | % 14
    g2.~      | % 15
    g4. r8 r4      | % 16
    ees2.      | % 17
    r2 r8 f(      | % 18
    ees2.)      | % 19
    ees4 d c      | % 20
    d2.~      | % 21
    d4. r8 r4      | % 22
    R2. *2  | %
    g4. f8 ees d~      | % 25
    d2.      | % 26
    d2.      | % 27
    r2 r8 aes'      | % 28
    g2.~      | % 29
    g4. r8 r4      | % 30
    g, b d      | % 31
    g2.      | % 32
    bes2.      | % 33
    bes4 aes g      | % 34
    aes2.~      | % 35
    aes4. r8 r4      | % 36
    aes2.      | % 37
    aes4 g4. f8      | % 38
    g2.~      | % 39
    g4. r8 r4      | % 40
    ees2.      | % 41
    r2 r8 f(      | % 42
    ees2.)      | % 43
    ees4 d c      | % 44
    d2.~      | % 45
    d4. r8 r4      | % 46
    R2. *2  | %
    g4. f8 ees d~      | % 49
    d2.      | % 50
    d2.      | % 51
    r2 r8 aes'      | % 52
    g2.~      | % 53
    g2.      | % 54
    R2. *2  | %
    r4 g c      | % 57
    c d ees      | % 58
    ees2 c4      | % 59
    g2.      | % 60
    r4 ees d      | % 61
    ees g c      | % 62
    c2 c,4      | % 63
    c2.      | % 64
    r4 r aes8 bes      | % 65
    c4 ees c'      | % 66
    c d ees      | % 67
    ees2.      | % 68
    r4 ees d      | % 69
    c2 g'4~      | % 70
    g8 aes( g)( f)( ees4)      | % 71
    c( g2)      | % 72
    r4 c16.( ees32)( d8)( c) d      | % 73
    g4 ees8( d)( d)( c)(      | % 74
    c)( g) g( ees) ees d(      | % 75
    d) c~ c2      | % 76
    r8 d( c)( d)( ees)( g)      | % 77
    d'4 c b8( c)      | % 78
    ees4( g) c~      | % 79
    c2.      | % 80
    c4 c,8 c c4~      | % 81
    c a'4. a8      | % 82
    aes4 c,8 c c4      | % 83
    g8 aes g f ees f      | % 84
    g4 c8 c c4      | % 85
    f,8 ges f ees d ees      | % 86
    g4 c, c~      | % 87
    c2.      | % 88
    r4 c8 d ees4      | % 89
    ees g c      | % 90
    c2 f,4      | % 91
    f2.      | % 92
    g4. aes8 g f      | % 93
    g4 f g      | % 94
    aes2 c,4~      | % 95
    c c c      | % 96
    bes'2.      | % 97
    aes2 g4      | % 98
    aes2 f4      | % 99
    c2 d4      | % 100
    ees g, ees'      | % 101
    g2 f8 ees      | % 102
    f2. \bar "|."     | % 103
    c2. \bar "|."
}% end of last bar in partorvoice



AVlnsyvoiceBA = \relative c'{


              \tempo 4 = 72


    \set Staff.instrumentName = #"Violins 1 y 2"
    \set Staff.shortInstrumentName = #"Vlns. 1 y 2"
    \set Staff.midiInstrument = #"pizzicato strings"

    \clef treble
    %staffkeysig
    \key es \major
    %barkeysig:
    \key es \major
    %bartimesig:
    \time 3/4
    r4 ees ^\markup {\upright  "Pizz"} g      | % 1
    r ees g      | % 2
    r f aes      | % 3
    r f aes      | % 4
    r ees g      | % 5
    r ees g      | % 6
    r f aes      | % 7
    r f aes      | % 8
    r ees g      | % 9
    r ees g      | % 10
    r f aes      | % 11
    r f aes      | % 12
    r f aes      | % 13
    r f aes      | % 14
    r ees g      | % 15
    r ees g      | % 16
    r f aes      | % 17
    r f aes      | % 18
    r f aes      | % 19
    r f aes      | % 20
    r d, g      | % 21
    r d g      | % 22
    r d g      | % 23
    r d g      | % 24
    r d g      | % 25
    r d g      | % 26
    r d g      | % 27
    r d g      | % 28
    r d g      | % 29
    r d g      | % 30
    r d g      | % 31
    r d g      | % 32
    r ees g      | % 33
    r ees g      | % 34
    r f aes      | % 35
    r f aes      | % 36
    r f aes      | % 37
    r f aes      | % 38
    r ees g      | % 39
    r ees g      | % 40
    r f aes      | % 41
    r f aes      | % 42
    r f aes      | % 43
    r f aes      | % 44
    r d, g      | % 45
    r d g      | % 46
    r d g      | % 47
    r d g      | % 48
    r d g      | % 49
    r d g      | % 50
    r d g      | % 51
    r d g      | % 52
    r d g      | % 53
    r d g      | % 54
    r d g      | % 55
    r d g      | % 56
    r ees g      | % 57
    r ees g      | % 58
    r ees g      | % 59
    r ees g      | % 60
    r ees g      | % 61
    r ees g      | % 62
    r ees g      | % 63
    r ees g      | % 64
    r ees g      | % 65
    r ees g      | % 66
    r ees g      | % 67
    r ees g      | % 68
    r ees g      | % 69
    r ees g      | % 70
    r ees g      | % 71
    r ees g      | % 72
    r ees g      | % 73
    r ees g      | % 74
    r ees g      | % 75
    r ees g      | % 76
    r ees g      | % 77
    r ees g      | % 78
    r ees g      | % 79
    r ees g      | % 80
    r ees g      | % 81
    r ees g      | % 82
    r ees g      | % 83
    r ees g      | % 84
    r ees g      | % 85
    r ees g      | % 86
    r ees g      | % 87
    r ees g      | % 88
    r ees g      | % 89
    r ees g      | % 90
    r f aes      | % 91
    r f aes      | % 92
    r ees g      | % 93
    r ees g      | % 94
    r f aes      | % 95
    r f aes      | % 96
    r ees g      | % 97
    r ees g      | % 98
    r f aes      | % 99
    r f aes      | % 100
    r ees g      | % 101
    r ees g      | % 102
    r f aes \bar "|."     | % 103
    r4 f aes \bar "|."
}% end of last bar in partorvoice



AVlasvoiceCA = \relative c'{
    \set Staff.instrumentName = #"Violas"
    \set Staff.shortInstrumentName = #"Vlas."
    \set Staff.midiInstrument = #"pizzicato strings"

    \clef alto
    %staffkeysig
    \key es \major
    %barkeysig:
    \key es \major
    %bartimesig:
    \time 3/4
    r4 ees, ^\markup {\upright  "Pizz"} g      | % 1
    r ees g      | % 2
    r f aes      | % 3
    r f aes      | % 4
    r ees g      | % 5
    r ees g      | % 6
    r f aes      | % 7
    r f aes      | % 8
    r ees g      | % 9
    r ees g      | % 10
    r f aes      | % 11
    r f aes      | % 12
    r f aes      | % 13
    r f aes      | % 14
    r ees g      | % 15
    r ees g      | % 16
    r f aes      | % 17
    r f aes      | % 18
    r f aes      | % 19
    r f aes      | % 20
    r d, g      | % 21
    r d g      | % 22
    r d g      | % 23
    r d g      | % 24
    r d g      | % 25
    r d g      | % 26
    r d g      | % 27
    r d g      | % 28
    r d g      | % 29
    r d g      | % 30
    r d g      | % 31
    r d g      | % 32
    r ees g      | % 33
    r ees g      | % 34
    r f aes      | % 35
    r f aes      | % 36
    r f aes      | % 37
    r f aes      | % 38
    r ees g      | % 39
    r ees g      | % 40
    r f aes      | % 41
    r f aes      | % 42
    r f aes      | % 43
    r f aes      | % 44
    r d, g      | % 45
    r d g      | % 46
    r d g      | % 47
    r d g      | % 48
    r d g      | % 49
    r d g      | % 50
    r d g      | % 51
    r d g      | % 52
    r d g      | % 53
    r d g      | % 54
    r d g      | % 55
    r d g      | % 56
    r ees g      | % 57
    r ees g      | % 58
    r ees g      | % 59
    r ees g      | % 60
    r ees g      | % 61
    r ees g      | % 62
    r ees g      | % 63
    r ees g      | % 64
    r ees g      | % 65
    r ees g      | % 66
    r ees g      | % 67
    r ees g      | % 68
    r ees g      | % 69
    r ees g      | % 70
    r ees g      | % 71
    r ees g      | % 72
    r ees g      | % 73
    r ees g      | % 74
    r ees g      | % 75
    r ees g      | % 76
    r ees g      | % 77
    r ees g      | % 78
    r ees g      | % 79
    r ees g      | % 80
    r ees g      | % 81
    r ees g      | % 82
    r ees g      | % 83
    r ees g      | % 84
    r ees g      | % 85
    r ees g      | % 86
    r ees g      | % 87
    r ees g      | % 88
    r ees g      | % 89
    r ees g      | % 90
    r f aes      | % 91
    r f aes      | % 92
    r ees g      | % 93
    r ees g      | % 94
    r f aes      | % 95
    r f aes      | % 96
    r ees g      | % 97
    r ees g      | % 98
    r f aes      | % 99
    r f aes      | % 100
    r ees g      | % 101
    r ees g      | % 102
    r f aes \bar "|."     | % 103
    r4 f aes \bar "|."
}% end of last bar in partorvoice



AVlcsyBassvoiceDA = \relative c{
    \set Staff.instrumentName = #"Violoncellos y Bass"
    \set Staff.shortInstrumentName = #"Vlcs y Bass"
    \set Staff.midiInstrument = #"pizzicato strings"

    \clef bass
    %staffkeysig
    \key es \major
    %barkeysig:
    \key es \major
    %bartimesig:
    \time 3/4
    c,2. ^\markup {\upright  "Pizz"}      | % 1
    c'2.      | % 2
    c,2.      | % 3
    c'2.      | % 4
    c,2.      | % 5
    c'2.      | % 6
    c,2.      | % 7
    c'2.      | % 8
    c,2.      | % 9
    c'2.      | % 10
    c,2.      | % 11
    c'2.      | % 12
    c,2.      | % 13
    c'2.      | % 14
    c,2.      | % 15
    c'2.      | % 16
    f,2.      | % 17
    f'2.      | % 18
    f,2.      | % 19
    f'2.      | % 20
    g,2.      | % 21
    g'2.      | % 22
    g,2.      | % 23
    g'2.      | % 24
    g,2.      | % 25
    g'2.      | % 26
    g,2.      | % 27
    g'2.      | % 28
    g,2.      | % 29
    g'2.      | % 30
    g,2.      | % 31
    g'2.      | % 32
    c,,2.      | % 33
    c'2.      | % 34
    c,2.      | % 35
    c'2.      | % 36
    c,2.      | % 37
    c'2.      | % 38
    c,2.      | % 39
    c'2.      | % 40
    f,2.      | % 41
    f'2.      | % 42
    f,2.      | % 43
    f'2.      | % 44
    g,2.      | % 45
    g'2.      | % 46
    g,2.      | % 47
    g'2.      | % 48
    g,2.      | % 49
    aes'2.      | % 50
    g,2.      | % 51
    g'2.      | % 52
    g,2.      | % 53
    g'2.      | % 54
    g,2.      | % 55
    g'2.      | % 56
    c,,2.      | % 57
    c'2.      | % 58
    c,2.      | % 59
    c'2.      | % 60
    c,2.      | % 61
    bes'2.      | % 62
    bes,2.      | % 63
    bes'2.      | % 64
    a,2.      | % 65
    a'2.      | % 66
    a,2.      | % 67
    a'2.      | % 68
    aes,2.      | % 69
    aes'2.      | % 70
    aes,2.      | % 71
    aes'2.      | % 72
    c,2.      | % 73
    aes'2.      | % 74
    c,2.      | % 75
    c'2.      | % 76
    bes,2.      | % 77
    bes'2.      | % 78
    bes,2.      | % 79
    bes'2.      | % 80
    a,2.      | % 81
    aes'2.      | % 82
    a,2.      | % 83
    a'2.      | % 84
    aes,2.      | % 85
    aes'2.      | % 86
    aes,2.      | % 87
    aes'2.      | % 88
    c,2.      | % 89
    aes'2.      | % 90
    c,2.      | % 91
    c'2.      | % 92
    c,2.      | % 93
    c'2.      | % 94
    c,2.      | % 95
    c'2.      | % 96
    c,2.      | % 97
    c'2.      | % 98
    c,2.      | % 99
    c'2.      | % 100
    c,2.      | % 101
    c'2.      | % 102
    c,2. \bar "|."     | % 103
    c'2. \bar "|."
}% end of last bar in partorvoice


\score {

    <<

%        \context Staff = AVlnSolopartA <<
%            \context Voice = AVlnSolovoiceAA \AVlnSolovoiceAA
%        >>


        \context Staff = AVlnsypartB <<
            \context Voice = AVlnsyvoiceBA \AVlnsyvoiceBA
        >>


        \context Staff = AVlaspartC <<
            \context Voice = AVlasvoiceCA \AVlasvoiceCA
        >>


        \context Staff = AVlcsyBasspartD <<
            \context Voice = AVlcsyBassvoiceDA \AVlcsyBassvoiceDA
        >>




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
  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {\context {\Score \consists Span_bar_engraver}}
  \midi {}
}%% end of score-block

#(set-global-staff-size 14)
