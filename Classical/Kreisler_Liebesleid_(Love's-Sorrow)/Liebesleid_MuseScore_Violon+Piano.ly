\language "english"
\include "../common/violin-functions.ly"
%=============================================
%   created by MuseScore Version: 1.3
%          March 19, 2015
%=============================================

\version "2.19.11"

\markup \vspace #3

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
title = "Liebesleid"
composer = " Fritz Kreisler"
}

Violin = \relative c'{
    \set Staff.instrumentName = #"Violin"
    \set Staff.shortInstrumentName = #"Vln."
    \clef treble
    %staffkeysig
    \key c \major
    %bartimesig:
    \time 3/4
    \partial 4*1
    e4-"Tempo di Landler"   \p     a2 e'4~      | % 1
    e e4..~ e16-.       | % 2
    \grace{\stemUp e(  [ f  ]  } \stemNeutral e4)( d8)\laissezVibrer  r e-.  r      | % 3
    f2.      | % 4
    g,2 d'4~      | % 5
    d d4..( d16-. )      | % 6
    \grace{\stemUp d(  [ e  ]  } \stemNeutral d4)( c8)\laissezVibrer  r d-.  r      | % 7
    e2.      | % 8
    f,2 c'4~      | % 9
    c c4..( c16)      | % 10
    \grace{\stemUp c(  [ d  ]  } \stemNeutral c4)( bf8)\laissezVibrer  r c-.  r      | % 11
    d2.      | % 12
    e,4..( a16-. ) fs4~      | % 13
    fs8. a16 gs4-. ( e-. )      | % 14
    a2.~      | % 15
    a4 r e      | % 16
    a2 e'4~      | % 17
    e e4.( e8-. )      | % 18
    \grace{\stemUp e16(  [ f  ]  } \stemNeutral e4)( d8)\laissezVibrer  r e-.  r      | % 19
    f2.      | % 20
    g,2 d'4~      | % 21
    d d4.~ d8-.       | % 22
    \grace{\stemUp d16(  [ e  ]  } \stemNeutral d4)( c8)\laissezVibrer  r d-.  r      | % 23
    e2.      | % 24
    f,2 c'4~      | % 25
    c c4.~ c8      | % 26
    \grace{\stemUp c16(  [ d  ]  } \stemNeutral c4)( bf8)\laissezVibrer  r c-.  r      | % 27
    d2.      | % 28
    e,4.( a8) fs4~(      | % 29
    fs8.) a16 gs4 e-.       | % 30
    a2.~      | % 31
    a4 r8 a ^\markup {\upright  ""} ^\markup {\upright  ""} bf b      | % 32
    c2.      | % 33
    a'2. \<      | % 34
    g2.~ \!      | % 35
    g4 \< r8 c, c b      | % 36
    bf2. \!      | % 37
    f'2.      | % 38
    e2.~      | % 39
    e2.( \>      | % 40
    d4) \! ^\markup {\upright  ""} ^\markup {\italic\bold  "grazioso"} \p r d~(      | % 41
    d8) d-.  e4.( f8)      | % 42
    c4 r c~(      | % 43
    c8) c-.  d4.( e8)      | % 44
    b4 r b~(      | % 45
    b8) e,-.  e4-.  b'-.       | % 46
    a2.~      | % 47
    a4 r c(      | % 48
    a') ^\markup {\upright  ""} ^\markup {\italic\bold  "con passione"} r a~(      | % 49
    a8) a-.  b4.( c8)      | % 50
    g4 r g~      | % 51
    g r a,( _\markup{"diminuendo"}      | % 52
    f') r f~(      | % 53
    f8) f-.  g4.( af8)      | % 54
    e2.~( ^\markup {\italic\bold  "poco rit"} ^\markup {\upright  ""}      | % 55
    e2.)      | % 56
    d4 \> ^\markup {\italic\bold  "a tempo"} ^\markup {\italic\bold  "a tempo"} r d~( ^\markup {\italic\bold  "grazioso"}      | % 57
    d8) \! d-.  e4.( f8)      | % 58
    \break
    c4 r c~(      | % 59
    c8) c-.  d4.( e8)      | % 60
    d4 r b~(      | % 61
    b8) e,-.  e4-.  b'-.       | % 62
    a2.~      | % 63
    a2 e4\fermata       | % 64

%%%%%%%%%
\key a \major
    e'4..-2( fs16) e4 ~ \accent (
\break
\tieDown
    e8. fs16-.) e4..( cs16-1)
  \tieNeutral
    d2.~      | % 67
    d2 e,4-1 (
    d'4..-2 ) e16-. ( d4~) (
    d8. e16 ) d4..( b16-1)
    cs2.~      | % 71
    cs2 e,4(      | % 72
    cs'4..-2^\sulD d16-.)  cs4\accent  ~
\break
    cs8. d16-.  cs4..( as16-1)
    \tieDown
  b2. ~ (
  b8. cs16-.)  fs,4..-1( cs'16-3-. )
  b2. ~ (
  b8. cs16-.)  e,4..-1\accent ( cs'16-.-4 )
\tieNeutral
% 80
  a4..( cs16-. ) e4\accent  ~
  e2 e,4 -1(
\break
\tieDown
  e'4..-2 fs16-.)  e4 ~ (      | % 81
  e8. fs16 ) e4..( cs16-1)      | % 82
\tieNeutral
  d4 r d~->\ub       | % 83
  d2 e,4-1(      | % 84
\tieDown
  d'4..-2 e16-.)  d4~(
  d8. e16-.)  d4..\accent( b16-1)
\tieNeutral
cs4 r cs~->
\break
  cs2 e,4(
  cs'4..-2^\sulD d16-.)  cs4~\accent
  cs8. d16-. cs4..\accent( as16-1)
  \tieDown
  b2.~(
  b8. cs16-.)  e,4..-1( cs'16-.-3 )
  b2.~(
  b8. _\markup {\italic\bold  "poco rit"}
  cs16-.)  e,4..-1\accent( cs'16-.-4 )
  \break
  a2.~
  a4 r e\ub
  \key a \minor

  %% PART A
  a2 ^\markup {\upright \bold  "	Tempo I"} \p e'4~      | % 97
    e e4.. ~ e16-.
    \bar "||"     | % 98
    \grace{\stemUp e16(  [ f  ]  } \stemNeutral e4)( d8)\laissezVibrer  r e-.  r      | % 99
    f2.      | % 100
    g,2 d'4~      | % 101
    d d4..( d16-. )      | % 102
    \grace{\stemUp d(  [ e  ]  } \stemNeutral d4)( c8)\laissezVibrer  r d-.  r      | % 103
    e2.      | % 104
    f,2 c'4~      | % 105
    c c4.~ c8      | % 106
    \grace{\stemUp c16(  [ d  ]  } \stemNeutral c4)( bf8)\laissezVibrer  r c-.  r      | % 107
    d2.      | % 108
    e,4..( a16-. ) fs4~      | % 109
    fs8. a16 gs4-. ( e-. )      | % 110
    a2.~      | % 111
    a4 r c(      | % 112
    a') ^\markup {\italic\bold  "con passione"} r a~(      | % 113
    a8) a-.  b4.( c8)      | % 114
    g4 r g~      | % 115
    g r a,(      | % 116
    f') r f~(      | % 117
    f8) f-.  g4.( af8)      | % 118
    e2.~( ^\markup {\italic\bold  "poco rit"}      | % 119
    e2.) \>      | % 120
    d4 \! ^\markup {\italic\bold  "grazzioso"} r d~(      | % 121
    d8) d-.  e4.( f8)      | % 122
    c4 r c~(      | % 123
    c8) c-.  d4.( e8)      | % 124
    b4 r b~(      | % 125
    b8) e,-.  e4-.  b'-.       | % 126
    a2.~      | % 127
    a2 e4\fermata       | % 128
    %barkeysig:
    \key a \major
    e'4..( \pp fs16) e4~      | % 129
    e8. fs16 e4..( cs16)      | % 130
    d4 r d~      | % 131
    d2 e,4(      | % 132
    d'4..) e16-.  d4~      | % 133
    d8. e16 d4..( b16)      | % 134
    cs4 r cs~      | % 135
    cs2 e,4(      | % 136
    cs'4..) d16-.  cs4~(      | % 137
    cs8.) d16-.  cs4..( as16)      | % 138
    b2.~(      | % 139
    b8.) cs16-.  fs,4..( cs'16-. )      | % 140
    b2.~(      | % 141
    b8.) cs16-.  e,4..( cs'16-. )      | % 142
    a4..( cs16) e4~->       | % 143
    e2 e,4      | % 144
    e'4.. fs16-.  e4~-> (      | % 145
    e8. fs16-. ) e4..( a16-. )      | % 146
    d,4 r d~      | % 147
    d2 e,4      | % 148
    d'4.. e16-.  d4~(      | % 149
    d8.) e16-.  d4..( gs16-. )
    cs,4 r cs~      | % 151
    cs2 e,4      | % 152
    cs'4.. d16 cs4~(      | % 153
    cs8.) d16-.  cs4.. fs16-.     |
    b,2.~                         | % 155
    b8. cs16 a4.. ( cs16-. )      |
    b2.~                          |
    b8. cs16( a4..) b16(          |
    a2~) a8. cs16                 |
    b2~( b8.) cs16                | % 160
    b2~ b8. cs16                  |
    a2.~      | % 162
    a2.~ ^\markup {\italic\bold  "perdendosi"}
    a2.~      | % 164
    a2 a8 gs16 a      | % 165
    a'8 r r4 r \bar "|."
}% end of last bar in partorvoice



APnovoiceBA = \relative c'{
    \set Staff.instrumentName = #"Piano"
    \set Staff.shortInstrumentName = #"Pno."
    \clef treble
    %staffkeysig
    \key c \major
    %bartimesig:
    \time 3/4
    \partial 4*1
    r4     r \p <e, a c> <a c e>      | % 1
    r <a c e> <c e a>      | % 2
    r <d f a> <f a d>      | % 3
    r <d f a> <c f a>      | % 4
    r <g d' f> <d' f g>      | % 5
    r <d f g> <b f' g>      | % 6
    r <g c e> <c e g>      | % 7
    r <c e g> <b e g>      | % 8
    r <f c' f> <c' f a>      | % 9
    r <c e g> <c e a>      | % 10
    r <f, bf d> <d' f a>      | % 11
    r <f, a d> <a d f>      | % 12
    r <e a c> <c' e>      | % 13
    r <b d e> <b d e>      | % 14
    r <a c e a>2~      | % 15
    <a c e a>4 r r      | % 16
    <c a'>2.      | % 17
    <b gs'>2 <bf g'>4      | % 18
    <a f'>2.      | % 19
    r4 <f' a> <a c>      | % 20
    <g b>2.      | % 21
    <f a>2.      | % 22
    <e g>2.      | % 23
    r4 <e g> <g b>      | % 24
    <f a>2.      | % 25
    <e g>2.      | % 26
    <d f>2.      | % 27
    r4 <d f> <f a>      | % 28
    <c e>2 <c e>4~->       | % 29
    <c e> <b d e>2->       | % 30
    <a c e>2.~      | % 31
    <a c e>4 r _\markup{"espressivo"} _\markup{"espressivo"} r      | % 32
    <a' c>2( \< c,4)      | % 33
    r \! c'4.-> ( b8)      | % 34
    d2( c4~)      | % 35
    c r r      | % 36
    <f, bf>2( bf,4)      | % 37
    r <f' a>4.-> ( <b, gs'>8)      | % 38
    b'2 \> a4~      | % 39
    a \! <b, gs'>( <bf g'>)      | % 40
    r <a d f>8-.  r <d f a>-.  r      | % 41
    r4 <d f a>8-.  r <f a d>-.  r      | % 42
    r4 <c e g>8-.  r <c e a>-.  r      | % 43
    r4 <c fs a>8-.  r <fs a c>-.  r      | % 44
    r4 <a, d f>8 r <d f a> r      | % 45
    r4 <gs, d' e>8-.  r <d' e b'>-.  r      | % 46
    <c e a>2.~      | % 47
    <c e a>4 r r      | % 48
    c'2.      | % 49
    r4 \< <a c> <gs b>      | % 50
    d'2 \! \> c4~      | % 51
    c \! g( fs) _\markup{"diminuendo"}      | % 52
    bf2.      | % 53
    r4 <f a> <b, gs'>      | % 54
    b'2( ^\markup {\italic\bold  "poco rit"} a4)      | % 55
    a <b, gs'>( <bf g'>)      | % 56
    <a d fs>2.->  \p      | % 57
    <a d f>2.->       | % 58
    <a c e>2->  <c e a>4~      | % 59
    <c e a> <b gs'> <bf g'>->       | % 60
    <ds fs>2-> ( <d f>4-> )      | % 61
    <gs, d' e>2.->       | % 62
    <a c e a>2.~      | % 63
    <a c e a>4 r r \fermata      | % 64
    %barkeysig:
    \key a \major
    <a cs e>2.~      | % 65
    <a cs e>4 <a cs e>2
    \bar "||"     | % 66
    <gs d' e>4 fs''16 <gs, d' e>4~      | % 67
    <gs d' e>8. fs'16 <gs, d' e>4 r      | % 68
    <gs, d' e>2.~      | % 69
    <gs d' e>4 <gs d' e>2      | % 70
    <a cs e>4 fs''16 <a, cs e>4~      | % 71
    <a cs e>8. fs'16( <a, cs e>4) r      | % 72
    <cs, e>2.~->       | % 73
    <cs e>2.      | % 74
    r4 r8. gs''16 <b, d fs>4      | % 75
    <a, d fs>2.      | % 76
    r4 r8. fs''16 <gs, d' e>4~      | % 77
    <gs d' e>8 r r4 r      | % 78
    r r8. <e a>16 <a cs>4~      | % 79
    <a cs>8. <cs e a>16 <e a cs>8 r r4      | % 80
    <a,, cs e>2->  <gs cs e>4~      | % 81
    <gs cs e> <fs cs' e>2->       | % 82
    <fs b d>->  \tuplet 3/2{fs'8( a) fs  }      | % 83
    gs2. \fz      | % 84
    <b, d fs>2 <a d fs>4~->       | % 85
    <a d fs> <gs d' fs>2->       | % 86
    <a cs e>->  \tuplet 3/2{e'8( gs) e  }      | % 87
    fs2.      | % 88
    <a, cs e>2->  <gs cs e>4~->       | % 89
    <gs cs e> <g as cs e>2->       | % 90
    r4 r8. gs''16 <b, d fs>4~      | % 91
    <b d fs>8 r r4 r      | % 92
    r r8. fs'16 <gs, d' e>4~      | % 93
    <gs d' e>8 ^\markup {\upright  ""} ^\markup {\italic\bold  "poco rit"} r r4 r      | % 94
    r <a cs>8 r <a cs e> r      | % 95
    <a cs a'> r r4 r      | % 96
    %barkeysig:
    \key c \major
    <c, e a>2->  ^\markup {\upright \bold  "Tempo I"} <b e gs>4~->       | % 97
    <b e g> <bf cs g'>2->
    \bar "||"     | % 98
    <a d f>2->  <f' a d>4~->       | % 99
    <f a d> \< \> <f a cs>->  <f a c>->       | % 100
    <f g b>2->  \! \! <b, f' a>4~      | % 101
    <b f' a> <b f' af>2->       | % 102
    <c e g>->  \< <e g c>4~      | % 103
    <e g c> \! <e g b>->  <e g bf>->       | % 104
    <c f a>2 <c e g>4~      | % 105
    <c e g> <c e g>2      | % 106
    <d f> <d f bf>4~      | % 107
    <d f bf> <c f a>( <b fs' g>)      | % 108
    <c e a>2 <c e>4~      | % 109
    <c e> <b d e>2      | % 110
    <c e g>2.~      | % 111
    <c e g>4 r r      | % 112
    c'2. ^\markup {\italic\bold  "con passione"}      | % 113
    r4 <a c> <gs b>      | % 114
    d'2 c4~      | % 115
    c g fs _\markup{"diminuendo"}      | % 116
    bf2.      | % 117
    r4 <f a>( <b, gs'>)      | % 118
    b'2( ^\markup {\italic\bold  "poco rit"} a4)      | % 119
    a \> <b, gs'>( <bf g'>)      | % 120
    <a d fs>2.->  \! \p ^\markup {\upright \bold  "a tempo"}      | % 121
    <a d f>2.->       | % 122
    <a c e>2->  <c e a>4~->       | % 123
    <c e a> <b gs'>->  <bf g'>->       | % 124
    <ds fs>2-> ( <d f>4-> )      | % 125
    <gs, d' e>2.      | % 126
    <a c e>2.~      | % 127
    <a c e>4 r r \fermata      | % 128
    %barkeysig:
    \key a \major
    <a cs e>2.~      | % 129
    <a cs e>4 <a cs e>2      | % 130
    <gs d' e> \tuplet 3/2{fs'8( a) fs  }      | % 131
    gs2.      | % 132
    <gs, d' e>2.~      | % 133
    <gs cs e>4 <gs cs e>2      | % 134
    <cs e> \tuplet 3/2{e8 gs e  }      | % 135
    fs2.      | % 136
    <a, cs e>2.~      | % 137
    <a cs e>4 <gs cs e>2      | % 138
    r4 r8. gs''16 <b, d fs>4~      | % 139
    <b d fs> <d, e>2->       | % 140
    r4 r8. fs'16 <b, d e>4~      | % 141
    e8 r <d, e>2      | % 142
    <a cs e>2.~      | % 143
    <a cs e>2.      | % 144
    <cs e a>2->  <cs e gs>4~->       | % 145
    <cs e gs> <cs e fs>2->       | % 146
    <b d fs>4->  fs'16 <d a'>4~->       | % 147
    <d a'>8. fs16( <d e gs>4-> ) e16      | % 148
    <b d fs>2 <a d fs>4~      | % 149
    <a d fs> <gs d' fs>2->       | % 150
    <a cs e>4 e'16 <cs gs'>4~      | % 151
    <cs gs'>8. e16( <a, cs fs>4-> ) d16      | % 152
    <a cs e>2->  <gs cs e>4~->       | % 153
    <gs cs e> <fs cs' e>2->       | % 154
    r8. fs''16( e4~) e8 r      | % 155
    r4 <d, e>2      | % 156
    r8. fs'16 e4~ e8 r      | % 157
    r r <d, e>2      | % 158
    r4 <e' e'>~ <e e'>8 r      | % 159
    r4 <e e'>~ <e e'>8 r      | % 160
    r4 <e e'>~ <e e'>8 r      | % 161
    r4 a,2~      | % 162
    a8 r cs2      | % 163
    a8 r a2~      | % 164
    a8 r a2~      | % 165
    a8 r r4 r \bar "|."
}% end of last bar in partorvoice


APnovoiceBB = \relative c'{
        s4     s2.      | % 1
    s2.      | % 2
    s2.      | % 3
    s2.      | % 4
    s2.      | % 5
    s2.      | % 6
    s2.      | % 7
    s2.      | % 8
    s2.      | % 9
    s2.      | % 10
    s2.      | % 11
    s2.      | % 12
    s2.      | % 13
    s2.      | % 14
    s2.      | % 15
    s2.      | % 16
    s2.      | % 17
    s2.      | % 18
    s2.      | % 19
    s2.      | % 20
    r4 d8-.  r d-.  r      | % 21
    r4 d8-.  r d-.  r      | % 22
    r4 c8-.  r c-.  r      | % 23
    s2.      | % 24
    r4 c8-.  r c-.  r      | % 25
    r4 c8-.  r c-.  r      | % 26
    s2.      | % 27
    s2.      | % 28
    s2.      | % 29
    s2.      | % 30
    s2.      | % 31
    s2.      | % 32
    s2.      | % 33
    r4 a'2      | % 34
    g2.~      | % 35
    g4 g( fs)      | % 36
    s2.      | % 37
    s2.      | % 38
    e2.~      | % 39
    e4 s2      | % 40
    s2.      | % 41
    s2.      | % 42
    s2.      | % 43
    s2.      | % 44
    s2.      | % 45
    s2.      | % 46
    s2.      | % 47
    s2.      | % 48
    a2( c,4)      | % 49
    s2.      | % 50
    g'2.~      | % 51
    g4 s2      | % 52
    f2( bf,4)      | % 53
    s2.      | % 54
    e2.~      | % 55
    e4 s2      | % 56
    s2.      | % 57
    s2.      | % 58
    s2.      | % 59
    s2.      | % 60
    a,2.      | % 61
    s2.      | % 62
    s2.      | % 63
    s2.      | % 64
    s2.
    \bar "||"     | % 65
    s2.      | % 66
    s2.      | % 67
    s2.      | % 68
    s2.      | % 69
    s2.      | % 70
    s2.      | % 71
    s2.      | % 72
    gs2 gs4~      | % 73
    gs <g as>2->       | % 74
    <fs b d fs>2.      | % 75
    s2.      | % 76
    <gs d' e>2.~      | % 77
    <gs d' e>2.      | % 78
    <a cs e>2.~      | % 79
    <a cs e>2.      | % 80
    s2.      | % 81
    s2.      | % 82
    s2 <b d>4~      | % 83
    <b d e>2.      | % 84
    s2.      | % 85
    s2.      | % 86
    s2 <a cs>4~      | % 87
    <a cs>2.      | % 88
    s2.      | % 89
    s2.      | % 90
    <fs b d fs>2.~      | % 91
    <fs b d fs>4 <b d fs>2      | % 92
    <gs d' e>2.~      | % 93
    <gs d' e>4 <b d fs>2      | % 94
    <a cs e>2.~      | % 95
    <a cs e>4 r r      | % 96
    s2.
    \bar "||"     | % 97
    s2.      | % 98
    s2.      | % 99
    s2.      | % 100
    s2.      | % 101
    s2.      | % 102
    s2.      | % 103
    s2.      | % 104
    s2.      | % 105
    s2.      | % 106
    c4( bf8) r s4      | % 107
    s2.      | % 108
    s2.      | % 109
    s2.      | % 110
    s2.      | % 111
    s2.      | % 112
    a'2( c,4)      | % 113
    s2.      | % 114
    g'2.~      | % 115
    g4 s2      | % 116
    f2( bf,4)      | % 117
    s2.      | % 118
    e2.~      | % 119
    e4 s2      | % 120
    s2.      | % 121
    s2.      | % 122
    s2.      | % 123
    s2.      | % 124
    a,2.      | % 125
    s2.      | % 126
    s2.      | % 127
    s2.      | % 128
    s2.      | % 129
    s2.      | % 130
    s2 d4~      | % 131
    <d e>2.      | % 132
    s2.      | % 133
    s2.      | % 134
    s2 cs4~      | % 135
    cs2.      | % 136
    s2.      | % 137
    s2.      | % 138
    <fs, d' e>2.      | % 139
    r8. a16 fs4.->  a16 s16      | % 140
    <gs d' e>2.~      | % 141
    <gs d' e>8. a16 fs4 gs16      | % 142
    s2.      | % 143
    r8. <cs' a'>16( <e cs'>8) r r4      | % 144
    s2.      | % 145
    s2.      | % 146
    s2.      | % 147
    s2.      | % 148
    s2.      | % 149
    s2.      | % 150
    s2.      | % 151
    s2.      | % 152
    s2.      | % 153
    s2.      | % 154
    <gs,, d' e>2.      | % 155
    r8. a16 fs4 a16      | % 156
    <gs d' e>2.~      | % 157
    <gs d' e>8. a16 fs4->  gs16      | % 158
    <a cs e>2~->  a8. fs16      | % 159
    <gs d' e>2~->  a8 s16 gs16      | % 160
    <gs d' e>2->  a8 s8      | % 161
    s2.      | % 162
    s2.      | % 163
    s2.      | % 164
    s2.      | % 165
    s2. \bar "|."
}% end of last bar in partorvoice


APnopartB =  <<
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
        \context Voice = APnovoiceBA\APnovoiceBA\\
        \context Voice = APnovoiceBB\APnovoiceBB
        >>



AvoiceCA = \relative c{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef bass
    %staffkeysig
    \key c \major
    %bartimesig:
    \time 3/4
    \partial 4*1
    r4     <a, a'> r r      | % 1
    <c c'> r r      | % 2
    <d d'> r r      | % 3
    <d d'> r r      | % 4
    <b b'> a'2      | % 5
    <g, g'>4 r r      | % 6
    <c c'> r r      | % 7
    <e c'> r r      | % 8
    a2.      | % 9
    f2.      | % 10
    d4 r r      | % 11
    d r r      | % 12
    e r r      | % 13
    <e, e'>2.      | % 14
    <a a'>2 e'4-.       | % 15
    <a, a'>-.  r2      | % 16
    a'4( e'8) r e r      | % 17
    a,4( e'8) r cs,4      | % 18
    d( a'8) r a r      | % 19
    d, r r4 r      | % 20
    <g, g'> g''8-.  r g-.  r      | % 21
    g,4 <f' b>8-.  r <f b>-.  r      | % 22
    <c, g'>4 e'8-.  r e-.  r      | % 23
    c, r r4 r      | % 24
    <f c'> <f' a>8-.  r <f a>-.  r      | % 25
    a,4 g'8-.  r g-.  r      | % 26
    d,4 <d' f>8 r <d f> r      | % 27
    d, r r4 r      | % 28
    e e'8-.  r e-.  r      | % 29
    e,4 e'8-.  r e-.  r      | % 30
    a,4 e'8-.  r e,4-.       | % 31
    <f, a'>-.  r r      | % 32
    f' c' a'      | % 33
    f,( c') d      | % 34
    e,( c') g'      | % 35
    e, r r      | % 36
    d( bf') f'      | % 37
    d,( bf') d      | % 38
    c,( a') e'      | % 39
    c,2( cs4)      | % 40
    d-.  \p r r      | % 41
    <b b'>-.  r r      | % 42
    <e e'>-.  r r      | % 43
    <e e'>-.  r r      | % 44
    <c e'>-.  r r      | % 45
    <c e'>-.  r r      | % 46
    <a' e'> a' e,      | % 47
    <a, a'> r r      | % 48
    f'( c') a'      | % 49
    f,( c') d      | % 50
    e,( c') g'      | % 51
    e, r r      | % 52
    d( bf') f'      | % 53
    d,( bf') d      | % 54
    c,( a') e'      | % 55
    c,2( cs4)      | % 56
    d \p a'-.  a-.       | % 57
    b, a'-.  a-.       | % 58
    e e'-.  e-.       | % 59
    e, e'-.  e-.       | % 60
    e,-.  e'-.  e-.       | % 61
    e,-.  e'-.  e-.       | % 62
    a,-.  e'-.  e,-.       | % 63
    <a, a'>-.  r r \fermata      | % 64
    %barkeysig:
    \key a \major
    <a' cs>4( \p e'8) r e4      | % 65
    <e, cs'> e'8 r e4
    \bar "||"     | % 66
    <b d>4( e8) r e4      | % 67
    <e, d'>( e'8) r e4      | % 68
    <b d> e8 r e4      | % 69
    <fs, d'>( e'8) r e4      | % 70
    <a, cs>( e'8) r e4      | % 71
    <e, cs'> e'8 r e4      | % 72
    <a, cs> e'8 r e4      | % 73
    <e, cs'> e'8 r e4      | % 74
    <d, b'>( d'8) r d4      | % 75
    <b, b'>( d'8) r d4      | % 76
    <e, d'> e'8 r e4      | % 77
    <e, d'>( e'8) r e4      | % 78
    <a, cs>( e'8) r e4      | % 79
    <e, cs'> e'8 r e4      | % 80
    <a, cs> e' e      | % 81
    <e, cs'> e' e      | % 82
    <b d> e e      | % 83
    <e, d'> e' e      | % 84
    <b d> e e      | % 85
    <e, d'> e' e      | % 86
    <a, cs> e' e      | % 87
    <e, cs'> \fz e' e      | % 88
    a, e' e      | % 89
    <e, cs'> e' e      | % 90
    <d, b'>( d'8) r d4      | % 91
    d, b' b      | % 92
    <e, d'> e'8 r e4      | % 93
    <e, d'> e'8 r e4      | % 94
    a, e' e      | % 95
    <a,, a'> r r      | % 96
    %barkeysig:
    \key c \major
    a4( \p e') e      | % 97
    a,( a') a
    \bar "||"     | % 98
    d,4( a') a      | % 99
    d,( d') d      | % 100
    g,,( g') g      | % 101
    g,( g') g      | % 102
    c, g' g      | % 103
    c, \> c' c      | % 104
    f,( \! f') f      | % 105
    a,, a' a      | % 106
    d,( d') d      | % 107
    d, d'( d)      | % 108
    e,-.  e'-.  e-.       | % 109
    e,-.  e'-.  e-.       | % 110
    a,-.  e'-.  e,-.       | % 111
    a,-.  r r      | % 112
    f'( c') a'      | % 113
    f,( c') d      | % 114
    e,( c') g'      | % 115
    e, r r      | % 116
    d( _\markup{"diminuendo"} bf') f'      | % 117
    d,( bf') d      | % 118
    c,( a') e'      | % 119
    c,2( cs4)      | % 120
    d-.  \p a'-.  a-.       | % 121
    b,-.  a'-.  a-.       | % 122
    e-.  e'-.  e-.       | % 123
    e,-.  e'-.  e-.       | % 124
    e,-.  e'-.  e-.       | % 125
    e,-.  e'-.  e-.       | % 126
    a,-.  e'-.  e,-.       | % 127
    <a, a'>-.  r r \fermata      | % 128
    %barkeysig:
    \key a \major
    <e' cs'>4-.  e'-.  e-.       | % 129
    <e, cs'>-.  e'-.  e-.       | % 130
    <e, d'>-.  e'-.  e-.       | % 131
    <e, d'>-.  e'-.  e-.       | % 132
    <e, d'>-.  e'-.  e-.       | % 133
    <e, d'>-.  e'-.  e-.       | % 134
    <e, cs'>-.  e'-.  e-.       | % 135
    <e, cs'>-.  e'-.  e-.       | % 136
    <e, cs'>-.  e'-.  e-.       | % 137
    <e, cs'>-.  e'-.  e-.       | % 138
    <e, d'>-.  e'-.  e-.       | % 139
    <e, d'>-.  e'-.  e-.       | % 140
    <e, d'>-.  e'-.  e-.       | % 141
    <e, d'>-.  e'-.  e-.       | % 142
    <e, cs'>-.  e'-.  e-.       | % 143
    <e, cs'>-.  e'-.  e-.       | % 144
    <e, cs'>-.  e'-.  e-.       | % 145
    <e, cs'>-.  e'-.  e-.       | % 146
    <e, d'>-.  e'-.  e-.       | % 147
    <e, d'>-.  e'-.  e-.       | % 148
    <e, d'>-.  e'-.  e-.       | % 149
    <e, d'>-.  e'-.  e-.       | % 150
    <e, cs'>-.  e'-.  e-.       | % 151
    <e, cs'>-.  e'-.  e-.       | % 152
    <e, cs'>-.  e'-.  e-.       | % 153
    <e, cs'>-.  e'-.  e-.       | % 154
    <e, d'>-.  e'-.  e-.       | % 155
    <e, d'>-.  e'-.  e-.       | % 156
    <e, d'>-.  e'-.  e-.       | % 157
    <e, d'>-.  e'-.  e-.       | % 158
    <e, cs'>-.  e'-.  e-.       | % 159
    <e, d'>-.  e'-.  e-.       | % 160
    <e, d'>-.  e'-.  e-.       | % 161
    <a,, a'>->  e' e      | % 162
    <a, a'>->  e' e      | % 163
    <a, a'>->  e' e      | % 164
    <a, a'>->  e' e      | % 165
    <e' cs'>8 r r4 r \bar "|."
}% end of last bar in partorvoice


AvoiceCB = \relative c{
        s4     s2.      | % 1
    s2.      | % 2
    s2.      | % 3
    s2.      | % 4
    s2.      | % 5
    s2.      | % 6
    s2.      | % 7
    s2.      | % 8
    s2.      | % 9
    s2.      | % 10
    s2.      | % 11
    s2.      | % 12
    s2.      | % 13
    s2.      | % 14
    s2.      | % 15
    s2.      | % 16
    s2.      | % 17
    s2.      | % 18
    s2.      | % 19
    s2.      | % 20
    s2.      | % 21
    s2.      | % 22
    s2.      | % 23
    s2.      | % 24
    s2.      | % 25
    s2.      | % 26
    s2.      | % 27
    s2.      | % 28
    s2.      | % 29
    s2.      | % 30
    s2.      | % 31
    s2.      | % 32
    s2.      | % 33
    s2.      | % 34
    s2.      | % 35
    s2.      | % 36
    s2.      | % 37
    s2.      | % 38
    s2.      | % 39
    s2.      | % 40
    s2.      | % 41
    s2.      | % 42
    s2.      | % 43
    s2.      | % 44
    s2.      | % 45
    s2.      | % 46
    s2.      | % 47
    s2.      | % 48
    s2.      | % 49
    s2.      | % 50
    s2.      | % 51
    s2.      | % 52
    s2.      | % 53
    s2.      | % 54
    s2.      | % 55
    s2.      | % 56
    s2.      | % 57
    s2.      | % 58
    s2.      | % 59
    s2.      | % 60
    s2.      | % 61
    s2.      | % 62
    s2.      | % 63
    s2.      | % 64
    s2.
    \bar "||"     | % 65
    s2.      | % 66
    s2.      | % 67
    s2.      | % 68
    s2.      | % 69
    s2.      | % 70
    s2.      | % 71
    s2.      | % 72
    s2.      | % 73
    s2.      | % 74
    s2.      | % 75
    s2.      | % 76
    s2.      | % 77
    s2.      | % 78
    s2.      | % 79
    s2.      | % 80
    s2.      | % 81
    s2.      | % 82
    s2.      | % 83
    s2.      | % 84
    s2.      | % 85
    s2.      | % 86
    s2.      | % 87
    s2.      | % 88
    s2.      | % 89
    s2.      | % 90
    s2.      | % 91
    s2.      | % 92
    s2.      | % 93
    s2.      | % 94
    s2.      | % 95
    s2.      | % 96
    s2.
    \bar "||"     | % 97
    s2.      | % 98
    s2.      | % 99
    s2.      | % 100
    s2.      | % 101
    s2.      | % 102
    s2.      | % 103
    s2.      | % 104
    s2.      | % 105
    s2.      | % 106
    s2.      | % 107
    s2.      | % 108
    s2.      | % 109
    s2.      | % 110
    s2.      | % 111
    s2.      | % 112
    s2.      | % 113
    s2.      | % 114
    s2.      | % 115
    s2.      | % 116
    s2.      | % 117
    s2.      | % 118
    s2.      | % 119
    s2.      | % 120
    s2.      | % 121
    s2.      | % 122
    s2.      | % 123
    s2.      | % 124
    s2.      | % 125
    s2.      | % 126
    s2.      | % 127
    s2.      | % 128
    s2.      | % 129
    s2.      | % 130
    s2.      | % 131
    s2.      | % 132
    s2.      | % 133
    s2.      | % 134
    s2.      | % 135
    s2.      | % 136
    s2.      | % 137
    s2.      | % 138
    s2.      | % 139
    s2.      | % 140
    s2.      | % 141
    s2.      | % 142
    s2.      | % 143
    s2.      | % 144
    s2.      | % 145
    s2.      | % 146
    s2.      | % 147
    s2.      | % 148
    s2.      | % 149
    s2.      | % 150
    s2.      | % 151
    s2.      | % 152
    s2.      | % 153
    s2.      | % 154
    s2.      | % 155
    s2.      | % 156
    s2.      | % 157
    s2.      | % 158
    s2.      | % 159
    s2.      | % 160
    s4 <gs' e'>16      | % 161
    <e cs'>2~( <e cs'>8.) <fs a>16      | % 162
    <e cs'>2~( <e cs'>8.) <fs d'>16      | % 163
    <e cs'>2~-> ( <e cs'>8.) <fs a>16      | % 164
    <e cs'>2~-> ( <e cs'>8.) <fs d'>16      | % 165
    <a,, a'>8 r s2 \bar "|."
}% end of last bar in partorvoice


ApartC =  <<
    \mergeDifferentlyHeadedOn
    \mergeDifferentlyDottedOn
        \context Voice = AvoiceCA\AvoiceCA\\
        \context Voice = AvoiceCB\AvoiceCB
        >>


\score {
  <<
   % \new ChordNames \chordNames
   % \new FretBoards \chordNames
    \new Staff { \Violin }
   % \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}