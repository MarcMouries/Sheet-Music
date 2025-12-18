\include "english.ly"
%=============================================
%   created by MuseScore Version: 1.2
%          Monday, February 04, 2013
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
    title = "Ievan Polkka"
    subtitle = "As sung by Loituma a cappella"
    composer = "Arr: Benjamin Tayehanpour"
  country = "Finland"
    poet = "www.sandslott.org"
    }

AAvoiceAA = \relative c''{
    \set Staff.instrumentName = #"Alto"
    \set Staff.shortInstrumentName = #"A."
    \clef treble
    %staffkeysig
    \key e \major 
    %barkeysig: 
    \key e \major 
    %bartimesig: 
    \time 2/4 
    \tempo "" 4 = 120  r8 <a cs>16 <a cs> r8 <a cs>      | % 1
    r _\markup{""} <a cs>16 <a cs> r8 <a cs>      | % 2
    r <a cs>16 <a cs> r8 <a cs>      | % 3
    r <a cs>16 <a cs> r8 <a cs>      | % 4
    r <a cs>16 <a cs> r8 <a cs>      | % 5
    r <a cs>16 <a cs> r8 <a cs>      | % 6
    r <a cs>16 <a cs> r8 <a cs>      | % 7
    r <a cs>16 <a cs> r8 <a cs>      | % 8
    r <a cs>16 <a cs> r8 <a cs>      | % 9
    r <a cs> r <a cs>      | % 10
    r <gs b>16 <gs b> r8 <gs b>      | % 11
    r <a cs> r <a cs>      | % 12
    r <a cs> r <a cs>16 <a cs>      | % 13
    r8 <a cs>16 <a cs> r8 <a cs>16 <a cs>      | % 14
    r8 <gs b>16 <gs b> r8 <gs b>16 <gs b>      | % 15
    <a cs>4 <a cs>8 r      | % 16
    r <a cs>16 <a cs> r8 <a cs>      | % 17
    r <gs b> r <gs b>      | % 18
    r <gs b> r <gs b>16 <gs b>      | % 19
    r8 <a cs>16 <a cs> r8 <a cs>      | % 20
    r <a cs>16 <a cs> r8 <a cs>      | % 21
    r <gs b> r <gs b>      | % 22
    r <gs b> r <gs b>      | % 23
    <a cs>16 <a cs> <a cs>8 <a cs> r      | % 24
    r <a cs>16 <a cs> r8 <a cs>      | % 25
    r <a cs>16 <a cs> r8 <a cs>      | % 26
    r <a cs>16 <a cs> r8 <a cs>      | % 27
    r <a cs>16 <a cs> r8 <a cs>      | % 28
    r <gs b>16 <gs b> r8 <gs b>      | % 29
    r <a cs>16 <a cs> r8 <a cs>      | % 30
    r <a cs>16 <a cs> r8 <a cs>      | % 31
    r <a cs>16 <a cs> r8 <a cs>      | % 32
    r <gs b>16 <gs b> r8 <gs b>16 <gs b>      | % 33
    <a cs>8 <a cs> <a cs> <gs bs>-> (      | % 34
    <a cs>16) <a cs> <a cs> <a cs> r8 <a cs>      | % 35
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 36
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 37
    r16 <a cs> <a cs> <a cs> r8 <a cs>      | % 38
    r16 <a cs> <a cs> <a cs> r8 <a cs>      | % 39
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 40
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 41
    <a cs>16 <a cs> <a cs>8 <a cs> r      | % 42
    <cs, a'>2(      | % 43
    <cs a'>      | % 44
    <b gs'>      | % 45
    <cs a'>)      | % 46
    <cs a'>(      | % 47
    <cs a'>      | % 48
    <b gs'>)      | % 49
    <cs a'>8 <cs a'> <cs a'> r      | % 50
    <cs a'>2(      | % 51
    <b gs'>      | % 52
    <b gs'>      | % 53
    <cs a'>)      | % 54
    <cs a'>(      | % 55
    <b gs'>      | % 56
    <b gs'>)     \repeat volta 2 { %startrep 
     | % 57
    <cs a'>16 <cs a'> <cs a'>8 <cs a'> r      | % 58
    r <a' cs> r <a cs>      | % 59
    r <a cs> r <a cs>      | % 60
    r <gs b> r <gs b>      | % 61
    r <a cs> r <a cs>      | % 62
    r <a cs> r <a cs>      | % 63
    r <a cs> r <a cs>      | % 64
    r <gs b> r <gs b>      | % 65
    r <a cs> r <a cs>      | % 66
    r <a cs> r <a cs>      | % 67
    r <gs b> r <gs b>      | % 68
    r <gs b> r <gs b>      | % 69
    r <a cs> r <a cs>      | % 70
    r <a cs> r <a cs>      | % 71
    r <gs b> r <gs b>      | % 72
    r <gs b> r <gs b> } % end of repeatactive
         | % 73
    <a cs>4 <a cs>8 r      | % 74
    r <a cs>16 <a cs> r8 <a cs>      | % 75
    r <a cs>16 <a cs> r8 <a cs>      | % 76
    r <gs b>16 <gs b> r8 <gs b>      | % 77
    r <a cs>16 <a cs> r8 <a cs>      | % 78
    r <a cs>16 <a cs> r8 <a cs>      | % 79
    r <a cs>16 <a cs> r8 <a cs>      | % 80
    r <gs b>16 <gs b> r8 <gs b>      | % 81
    <a cs>4 <a cs>8 r      | % 82
    r <a cs>16 <a cs> r8 <a cs>      | % 83
    r <gs b>16 <gs b> r8 <gs b>      | % 84
    r <gs b>16 <gs b> r8 <gs b>      | % 85
    r <a cs>16 <a cs> r8 <a cs>      | % 86
    r <a cs>16 <a cs> r8 <a cs>      | % 87
    r <gs b>16 <gs b> r8 <gs b>      | % 88
    r <gs b>16 <gs b> r8 <gs b>      | % 89
    <a cs>4 <a cs>8 r      | % 90
    r <a cs>16 <a cs> <a cs>8 <a cs>      | % 91
    r <a cs>16 <a cs> <a cs>8 <a cs>      | % 92
    r <gs b>16 <gs b> <gs b>8 <gs b>16 <gs b>      | % 93
    <a cs>8 <a cs> <a cs> r      | % 94
    r <a cs>16 <a cs> <a cs>8 <a cs>      | % 95
    r <a cs>16 <a cs> <a cs>8 <a cs>      | % 96
    r <gs b>16 <gs b> <gs b>8 <gs b>      | % 97
    <a cs> <a cs> <a cs> r      | % 98
    a16 a a a gs gs fs fs      | % 99
    e e b b b8 e      | % 100
    gs gs16 gs fs fs e e      | % 101
    e8 fs16 fs fs8 a      | % 102
    a16 a a a gs8-.  fs-.       | % 103
    e-.  b-.  b-.  e16 gs~-.       | % 104
    gs8-.  gs-.  fs-.  e-.       | % 105
    fs16 fs fs8 fs r      | % 106
    r <cs a'>16 <cs a'> <cs a'>8 r      | % 107
    r <cs a'>16 <cs a'> <cs a'>8 r      | % 108
    r <b gs'>16 <b gs'> <b gs'>8 r      | % 109
    r <cs a'>16 <cs a'> <cs a'>8 r      | % 110
    r <cs a'>16 <cs a'> <cs a'>8 r      | % 111
    r <cs a'>16 <cs a'> <cs a'>8 r      | % 112
    r <b gs'>16 <b gs'> <b gs'>8 r      | % 113
    r <cs a'> <cs a'> <b gs'>(      | % 114
    <a' cs>16) <a cs> <a cs> <a cs> r8 <a cs>      | % 115
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 116
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 117
    r16 <a cs> <a cs> <a cs> r8 <a cs>      | % 118
    r16 <a cs> <a cs> <a cs> r8 <a cs>      | % 119
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 120
    r16 <gs b> <gs b> <gs b> r8 <gs b>      | % 121
    <a cs>16 <a cs> <a cs>8 <a cs> r      | % 122
    r4 cs,~(      | % 123
    cs a'~      | % 124
    a2~      | % 125
    a)      | % 126
    r4 cs,~(      | % 127
    cs a'~      | % 128
    a2~      | % 129
    a4.) fs16 a      | % 130
    cs8 cs16 cs b8 a      | % 131
    gs e e gs      | % 132
    b b16 b a8 gs      | % 133
    gs fs16 fs fs8 a      | % 134
    cs16 cs cs cs b8-.  a-.       | % 135
    gs-.  e-.  e-.  gs16 b~-.       | % 136
    b8-.  b-.  a-.  gs-.  \bar "|."     | % 137
    a16 a fs8 fs4 \bar "|." 
}% end of last bar in partorvoice

 
AAvoiceAB = \relative c'{
    \voiceTwo

    s2      | % 1
    s2      | % 2
    s2      | % 3
    s2      | % 4
    s2      | % 5
    s2      | % 6
    s2      | % 7
    s2      | % 8
    s2      | % 9
    s2      | % 10
    s2      | % 11
    s2      | % 12
    s2      | % 13
    s2      | % 14
    s2      | % 15
    s2      | % 16
    s2      | % 17
    s2      | % 18
    s2      | % 19
    s2      | % 20
    s2      | % 21
    s2      | % 22
    s2      | % 23
    s2      | % 24
    s2      | % 25
    s2      | % 26
    s2      | % 27
    s2      | % 28
    s2      | % 29
    s2      | % 30
    s2      | % 31
    s2      | % 32
    s2      | % 33
    s2      | % 34
    s2      | % 35
    s2      | % 36
    s2      | % 37
    s2      | % 38
    s2      | % 39
    s2      | % 40
    s2      | % 41
    s2      | % 42
    s2      | % 43
    s2      | % 44
    s2      | % 45
    s2      | % 46
    s2      | % 47
    s2      | % 48
    s2      | % 49
    s2      | % 50
    s2      | % 51
    s2      | % 52
    s2      | % 53
    s2      | % 54
    s2      | % 55
    s2      | % 56
    s2     \repeat volta 2 { %startrep 
     | % 57
    s2      | % 58
    s2      | % 59
    s2      | % 60
    s2      | % 61
    s2      | % 62
    s2      | % 63
    s2      | % 64
    s2      | % 65
    s2      | % 66
    s2      | % 67
    s2      | % 68
    s2      | % 69
    s2      | % 70
    s2      | % 71
    s2      | % 72
    s2 } % end of repeatactive
         | % 73
    s2      | % 74
    s2      | % 75
    s2      | % 76
    s2      | % 77
    s2      | % 78
    s2      | % 79
    s2      | % 80
    s2      | % 81
    s2      | % 82
    s2      | % 83
    s2      | % 84
    s2      | % 85
    s2      | % 86
    s2      | % 87
    s2      | % 88
    s2      | % 89
    s2      | % 90
    s2      | % 91
    s2      | % 92
    s2      | % 93
    s2      | % 94
    s2      | % 95
    s2      | % 96
    s2      | % 97
    s2      | % 98
    s2      | % 99
    s2      | % 100
    s2      | % 101
    s2      | % 102
    s2      | % 103
    s2      | % 104
    s2      | % 105
    s2      | % 106
    s2      | % 107
    s2      | % 108
    s2      | % 109
    s2      | % 110
    s2      | % 111
    s2      | % 112
    s2      | % 113
    s2      | % 114
    s2      | % 115
    s2      | % 116
    s2      | % 117
    s2      | % 118
    s2      | % 119
    s2      | % 120
    s2      | % 121
    s2      | % 122
    R2  | % 
    fs2      | % 124
    cs'~      | % 125
    cs      | % 126
    R2  | % 
    fs,2      | % 128
    cs'~      | % 129
    cs4. s8      | % 130
    s2      | % 131
    s2      | % 132
    s2      | % 133
    s2      | % 134
    s2      | % 135
    s2      | % 136
    s2 \bar "|."     | % 137
    s2 \bar "|." 
}% end of last bar in partorvoice

 
AApartA =  << 
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn 
        \context Voice = AAvoiceAA{\voiceOne \AAvoiceAA}\\ 
        \context Voice = AAvoiceAB\AAvoiceAB
        >> 

 

ATvoiceBA = \relative c'{
    \set Staff.instrumentName = #"Tenor"
    \set Staff.shortInstrumentName = #"T."
    \clef "treble_8"
    %staffkeysig
    \key e \major 
    %barkeysig: 
    \key e \major 
    %bartimesig: 
    \time 2/4 
    R2 *8  | % 
    cs8 fs16 fs fs8 fs16 gs      | % 9
    a a fs8 fs a      | % 10
    gs16 e e e e8 gs      | % 11
    a fs fs r      | % 12
    cs fs fs fs16 gs      | % 13
    a8 fs16 fs fs8 a16 a      | % 14
    cs8 b16 b a8 gs16 gs      | % 15
    a8 fs fs fs16 a      | % 16
    cs8 cs16 cs b8 a      | % 17
    gs e e gs      | % 18
    b b16 b a8 gs16 gs      | % 19
    a8 fs16 fs fs8 a      | % 20
    cs16 cs cs cs b8-.  a-.       | % 21
    gs-.  e-.  e-.  gs16 b~-.       | % 22
    b8-.  b-.  a-.  gs-.       | % 23
    a16 a fs8 fs r      | % 24
    R2 *2  | % 
    cs8 fs fs fs16 gs      | % 27
    a8 fs fs fs16 a      | % 28
    gs8 e16 e e8 gs      | % 29
    a fs fs r      | % 30
    cs fs16 fs fs8 fs16 gs      | % 31
    a8 fs16 fs fs8 fs16 a      | % 32
    cs8 b16 b a8 gs16 gs      | % 33
    a8 fs fs r      | % 34
    cs'16 cs cs cs b8 a      | % 35
    gs e e gs      | % 36
    b b16 b a8 gs      | % 37
    a fs16 fs fs8 a      | % 38
    cs16 cs cs cs b8-.  a-.       | % 39
    gs-.  e-.  e-.  gs16 b~-.       | % 40
    b8-.  b-.  a-.  gs-.       | % 41
    a16 a fs8 fs r      | % 42
    cs fs fs fs16 gs      | % 43
    a8 fs fs fs16( a)      | % 44
    gs8 e16 e e8 gs16 gs      | % 45
    a8 fs fs r      | % 46
    cs fs16 fs fs8 gs      | % 47
    a fs fs a      | % 48
    cs b a gs      | % 49
    a fs fs r      | % 50
    cs'16 cs cs cs b8 a      | % 51
    gs e e gs      | % 52
    b b16 b a8 gs      | % 53
    gs fs16 fs fs8 a      | % 54
    cs16 cs cs cs b8-.  a-.       | % 55
    gs-.  e-.  e-.  gs16 b~-.       | % 56
    b8-.  b-.  a-.  gs-.      \repeat volta 2 { %startrep 
     | % 57
    a16 a fs8 fs r      | % 58
    cs ^\markup {\upright  ""} _\markup{"(improvise!)"} fs fs gs      | % 59
    a fs fs a      | % 60
    gs e e gs      | % 61
    a fs fs r      | % 62
    cs fs fs gs      | % 63
    a fs fs a      | % 64
    cs b a gs      | % 65
    a fs fs a      | % 66
    cs cs b a      | % 67
    gs e e gs      | % 68
    b b a gs      | % 69
    a fs fs a      | % 70
    cs cs b a      | % 71
    gs e e gs      | % 72
    b b a gs 
    } % end of repeatactive
         | % 73
    a8 fs fs r      | % 74
    cs fs fs gs      | % 75
    a fs fs a      | % 76
    gs e e gs      | % 77
    a fs fs r      | % 78
    cs fs fs gs      | % 79
    a fs fs a      | % 80
    cs b a gs      | % 81
    a fs fs a      | % 82
    cs cs b a      | % 83
    gs e e gs      | % 84
    b b a gs      | % 85
    a fs fs a      | % 86
    cs cs b a      | % 87
    gs e e gs      | % 88
    b b a gs      | % 89
    a fs fs r      | % 90
    cs16 fs fs fs fs8 fs16 gs      | % 91
    a8 fs fs16 fs fs a      | % 92
    gs8 e16 e e8 gs      | % 93
    a fs fs r      | % 94
    cs fs16 fs fs8 fs16 gs      | % 95
    a8 fs16 fs fs8 fs16 a      | % 96
    cs cs b b a a gs8      | % 97
    a fs fs r      | % 98
    cs'16 cs cs cs b b a a      | % 99
    gs gs e e e8 gs      | % 100
    b b16 b a a gs gs      | % 101
    gs8 fs16 fs fs8 a      | % 102
    cs16 cs cs cs b8-.  a-.       | % 103
    gs-.  e-.  e-.  gs16 b~-.       | % 104
    b8-.  b-.  a-.  gs-.       | % 105
    a16 a fs8 fs r      | % 106
    cs fs16 fs fs fs fs gs      | % 107
    a8 fs fs fs16 a      | % 108
    gs8 fs16 fs fs8 gs16 gs      | % 109
    a8 fs fs r      | % 110
    cs fs16 fs fs8 fs16 gs      | % 111
    a8 fs fs fs16 a      | % 112
    cs8 b16 b a8 gs      | % 113
    a fs fs r      | % 114
    cs' cs16 cs b8 a      | % 115
    gs e e e16 gs      | % 116
    b8 b16 b a8 gs      | % 117
    a fs16 fs fs8 a      | % 118
    cs16 cs cs cs b8-.  a-.       | % 119
    gs-.  e-.  e-.  gs16 b~-.       | % 120
    b8-.  b-.  a-.  gs-.       | % 121
    a16 a fs8 fs r      | % 122
    cs fs16 fs fs fs fs gs      | % 123
    a8 fs fs a      | % 124
    gs e16 e e8 gs16 gs      | % 125
    a8 fs fs r      | % 126
    cs16 fs fs fs fs fs fs gs      | % 127
    a8 fs16 fs fs8 fs16 a      | % 128
    cs cs b8 a gs      | % 129
    a fs fs fs16 a      | % 130
    cs8 cs16 cs b8 a      | % 131
    gs e e gs      | % 132
    b b16 b a8 gs      | % 133
    gs fs16 fs fs8 a      | % 134
    cs16 cs cs cs b8-.  a-.       | % 135
    gs-.  e-.  e-.  gs16 b~-.       | % 136
    b8-.  b-.  a-.  gs-.  \bar "|."     | % 137
    a16 a fs8 fs4 \bar "|." 
}% end of last bar in partorvoice

 

ABvoiceCA = \relative c{
    \set Staff.instrumentName = #"Bass"
    \set Staff.shortInstrumentName = #"B."
    \clef bass
    %staffkeysig
    \key e \major 
    %barkeysig: 
    \key e \major 
    %bartimesig: 
    \time 2/4 
    fs4-.  cs-.       | % 1
    fs-.  cs-.       | % 2
    fs-.  cs-.       | % 3
    fs-.  cs-.       | % 4
    fs-.  cs-.       | % 5
    fs-.  cs-.       | % 6
    fs-.  cs-.       | % 7
    fs-.  cs-.       | % 8
    fs-.  cs-.       | % 9
    fs-.  cs-.       | % 10
    cs-.  e-.       | % 11
    fs-.  cs-.       | % 12
    fs-.  cs-.       | % 13
    fs-.  cs-.       | % 14
    cs-.  e-.       | % 15
    fs fs8 r      | % 16
    fs4-.  cs-.       | % 17
    cs-.  e-.       | % 18
    cs-.  e-.       | % 19
    fs-.  cs-.       | % 20
    fs-.  cs-.       | % 21
    cs-.  e-.       | % 22
    cs-.  e-.       | % 23
    fs16 fs fs8 fs r      | % 24
    fs4-.  cs-.       | % 25
    fs-.  cs-.       | % 26
    fs-.  cs-.       | % 27
    fs-.  cs-.       | % 28
    cs-.  e-.       | % 29
    fs-.  cs-.       | % 30
    fs-.  cs-.       | % 31
    fs-.  cs-.       | % 32
    cs-.  e-.       | % 33
    fs8 fs fs es-> (      | % 34
    fs4-. ) cs-.       | % 35
    cs-.  e-.       | % 36
    cs-.  e-.       | % 37
    fs-.  cs-.       | % 38
    fs-.  cs-.       | % 39
    cs-.  e-.       | % 40
    cs-.  e-.       | % 41
    fs16 fs fs8 fs r      | % 42
    fs2-- (      | % 43
    fs--       | % 44
    e--       | % 45
    fs-- )      | % 46
    fs-- (      | % 47
    fs--       | % 48
    e4--  es-- )      | % 49
    fs8 fs fs r      | % 50
    fs2-- (      | % 51
    e--       | % 52
    e--       | % 53
    fs-- )      | % 54
    fs-- (      | % 55
    e--       | % 56
    e4--  es)     \repeat volta 2 { %startrep 
     | % 57
    fs16 fs fs8 fs r      | % 58
    fs4-.  cs-.       | % 59
    fs-.  cs-.       | % 60
    cs-.  e-.       | % 61
    fs-.  cs-.       | % 62
    fs-.  cs-.       | % 63
    fs-.  cs-.       | % 64
    cs-.  e-.       | % 65
    fs-.  cs-.       | % 66
    fs-.  cs-.       | % 67
    cs-.  e-.       | % 68
    cs-.  e-.       | % 69
    fs-.  cs-.       | % 70
    fs-.  cs-.       | % 71
    cs-.  e-.       | % 72
    cs-.  e-.  } % end of repeatactive
         | % 73
    fs4 fs8 r      | % 74
    fs4-.  cs-.       | % 75
    fs-.  cs-.       | % 76
    cs-.  e-.       | % 77
    fs-.  cs-.       | % 78
    fs-.  cs-.       | % 79
    fs-.  cs-.       | % 80
    cs-.  e-.       | % 81
    fs fs8 r      | % 82
    fs4-.  cs-.       | % 83
    cs-.  e-.       | % 84
    cs-.  e-.       | % 85
    fs-.  cs-.       | % 86
    fs-.  cs-.       | % 87
    cs-.  e-.       | % 88
    cs-.  e-.       | % 89
    fs fs8 r      | % 90
    fs4-.  cs-.       | % 91
    fs-.  cs-.       | % 92
    cs-.  e-.       | % 93
    fs-.  cs-.       | % 94
    fs-.  cs-.       | % 95
    fs-.  cs-.       | % 96
    cs-.  e-.       | % 97
    fs8 fs fs r      | % 98
    R2 *8  | % 
    r8 fs16 fs fs8 r      | % 107
    r fs16 fs fs8 r      | % 108
    r e16 e e8 r      | % 109
    r fs16 fs fs8 r      | % 110
    r fs16 fs fs8 r      | % 111
    r fs16 fs fs8 r      | % 112
    r e16 e e8 r      | % 113
    r fs fs e(      | % 114
    fs4-. ) cs-.       | % 115
    cs-.  e-.       | % 116
    cs-.  e-.       | % 117
    fs-.  cs-.       | % 118
    fs-.  cs-.       | % 119
    cs-.  e-.       | % 120
    cs-.  e-.       | % 121
    fs16 fs fs8 fs r      | % 122
    fs2(      | % 123
    fs      | % 124
    fs      | % 125
    fs)      | % 126
    fs~      | % 127
    fs~      | % 128
    fs~      | % 129
    fs4. fs16 a      | % 130
    cs8 cs16 cs b8 a      | % 131
    gs e e gs      | % 132
    b b16 b a8 gs      | % 133
    gs fs16 fs fs8 a      | % 134
    cs16 cs cs cs b8-.  a-.       | % 135
    gs-.  e-.  e-.  gs16 b~-.       | % 136
    b8-.  b-.  a-.  gs-.  \bar "|."     | % 137
    a16 a fs8 fs4 \bar "|." 
}% end of last bar in partorvoice

      AApartAverseA = \lyricmode { \set stanza = " 1. " Ka -- ti  ka ka -- ti  ka... Pol -- ka.  Ka -- ti  ka... hi -- li -- jal -- leen.  Tä -- tä  ko... voe vot -- ti  sa  _ li -- vi -- li  po li -- vi -- li  po... hi -- li -- jal -- leen. Hujuuju ujuuju... Hujuuju ujuuju... nuij -- juut -- ti. Hujuuju ujuuju... Hujuuju ujuuju... hi -- li -- jal -- leen. Ka ka... pol -- ka. -- ka -- ti  ka ka -- ti  ka... pol -- ka. -- ka -- ti  ka ka -- ti  ka... pol -- ka. -- o -- li  lys -- ti  o -- li  lys -- ti  o -- li  lys -- ti  ran syt -- kyyt -- tee.  tiin ko män -- tii  tiin ko män -- tti  tiin ko män -- tii  nyyh -- kyyt -- teek.  Mi -- nä  sa -- non  I -- e -- val -- le  mi -- tä -- pä se hait -- taa  laks -- em -- ma  vi -- e -- lä -- hi  lai -- a -- sta  lait -- taa.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt  tip -- put  hi -- li -- jal -- leen. -- Tuk -- kee  suus  tuk -- kee  suus  tuk -- kee  suus  tuk -- kee  suus  kor -- jaa luus kor -- jaa luus kor -- jaa luus koo -- maa -- saa  _ li -- vi -- li  po li -- vi -- li  po... hi -- li -- jal -- leen. -- Doo  _ Doo  _ Doo  _ Doo  _ Sil -- lä ei tä -- tä  poi -- koo  kai -- nous  hait -- taa  sil -- lon  ko tans -- sii  lai -- a -- sta  lai -- taan.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt -- tip -- put  hi -- li -- jal -- leen! -- }
      ATpartBverseA = \lyricmode { \set stanza = " 1. " Nua -- puri -- sta -- kuu -- lu  se po -- lo -- kan tah -- ti  ja -- la -- ka -- ni poh -- ji  kut -- kut -- ti.  Ie -- van  äi -- ti  se tyt -- töö -- sä vah -- ti  vaan kyl -- lä -- hän  Ie -- va  sen jut -- kut -- ti,  sil -- lä  ei mei -- tä  sil -- loin kiel -- lot  hait -- taa  kun my -- ö  tans -- sim -- me  la -- ia -- sta  lai -- taan.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt -- tip -- put  hi -- li -- jal -- leen.  Ie -- van  suu o -- li  veh -- nä -- sel -- lä  ko im -- mei -- set  on -- nee  toe -- vot -- ti.  Peä o -- li  mär -- kä -- nä  jo -- ka -- i -- sel -- la  ja viu -- lu  se vin -- ku  ja voe vot -- ti. E -- i  tä -- tä  poi -- ko  mär -- kyys  hait -- ta  sil -- lon  ko las -- ko  lai -- a -- sta  lai -- taan.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- äp -- pyt -- tip -- put  hi -- li -- jal -- leen.  Ie -- van  äi -- ti  se kam -- ma -- ris -- sa   _ vir -- si -- ä  vei -- sa -- ta  huij -- jut -- ti,  kun tä -- mä  poi -- ka  naa -- pu -- ris -- sa  äm -- män  tyt -- töä  nuij -- juut -- ti.  Ei -- kä  tä -- tä  poi -- koo  äm -- mät  hait -- taa  sil -- lon  ko las -- koo  lai -- a -- sta  lai -- taan.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- äp -- pyt -- tip -- put  hi -- li -- jal -- leen.  Siel -- lä  o -- li  lys -- ti -- ä  soi -- ton  jä -- lä -- ke -- en  sain mi -- nä  ker -- ran  syt -- kyyt -- tee.  Kot -- tiin  ko män -- tii  ni äm -- mä  se rii -- telj  ja I -- e -- va  jo a -- la -- ko  nyyh -- kyyt -- teek.  Mi -- nä  sa -- non  I -- e -- val -- le  mi -- tä -- pä  se hait -- taa  lask -- em -- ma  vi -- e -- lä -- hi  lai -- a -- sta  lait -- taa.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt -- tip -- put  hi -- li -- jal -- leen.  Muo -- ril -- le  sa -- non  jot -- ta  tuk -- kee  suu -- si  en rup -- pee  sen ter -- veyt -- täs  tak -- koo -- maa.  Ter -- vee -- nä  peä -- set  ku kor -- joot  luu -- si  ja määt sii -- tä  mur -- juus  mak -- koo -- maa.  Ei tä -- tä  poi -- koo  hel -- lyys  hait -- taa  ko ak -- ko -- ja  huh -- ki  lai -- a -- sta lai -- taan.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt -- tip -- put  hi -- li -- jal -- leen. -- Sen mi -- nä  sa -- non  jot -- ta  pur -- ra  pit -- tää  ei mu -- a  niin vo -- an nie la -- sta.  Su -- at  män -- nä  i -- te  vaik -- ka  län -- ne -- stä  it -- tään -- vaan  mi -- nä  en luo -- vu  le -- va -- sta.  Sil -- lä  ei tä -- tä  poi -- koo  kai -- nous  hait -- taa  sil -- lon  ko tans -- sii  lai -- a -- sta  lai -- taan.  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt -- tip -- put  hi -- li -- jal -- leen! -- }
      ABpartCverseA = \lyricmode { \set stanza = " 1. " Pol pol pol... Pol -- ka. Pol pol... hi -- li -- jal -- leen. Ei poi... voe vot -- ti  sa  _ ka sa ka... hi -- li -- jal -- leen. Hujuuju ujuuju... Hujuuju ujuuju... nuij -- juut -- ti.  Hujuuju ujuuju... Hujuuju ujuuju... hi -- li -- jal -- leen. Pol pol... pol -- ka. -- Pol pol pol pol... pol -- ka  Pol pol pol pol... pol -- ka. -- Tuk -- kee  suus  tuk -- kee  suus  tuk -- kee  suus  tuk -- kee  suus  kor -- jaa luus kor -- jaa luus kor -- jaa luus koo -- maa -- saa   _ ka sa ka... hi -- li -- jal -- leen. Doo  _ Doo  _ Sil -- lä  ei tä -- tä  poi -- koo  kai -- nous  hait -- taa  sil -- loon  ko tans -- sii  lai -- a -- sta  lai -- taan  Sa -- li -- vi -- li  hip -- put  tup -- put  täp -- pyt äp -- pyt -- tip -- put  hi -- li -- jal -- leen! -- }

\score { 
    << 
        %\context Staff = AApartA << 
          %  \AApartA
       %>>

        % \context Lyrics = AApartAverseA\lyricsto AAvoiceAA  \AApartAverseA

        
        \context Staff = ATpartB << 
            \context Voice = ATvoiceBA     \ATvoiceBA
        >>

       %  \context Lyrics = ATpartBverseA\lyricsto ATvoiceBA  \ATpartBverseA

       % \context Staff = ABpartC << 
         %   \context Voice = ABvoiceCA \ABvoiceCA
        %>>

         %\context Lyrics = ABpartCverseA\lyricsto ABvoiceCA  \ABpartCverseA



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
  \midi {}
}%% end of score-block 

#(set-global-staff-size 14)
