\version "2.24.0"
\language "english"


\paper {

  indent = 0 \mm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  %% in orchestral scores you probably want the two bold slashes
  %% separating the systems: so uncomment the following line:
  %% system-separator-markup = \slashSeparator
}

\header {
  title = "Joy to the World"
}

melody = \relative c'{
  \clef treble
  \key d \major
  \time 2/4
  <fs d'>4 \ff <a cs>8. <g b>16      | % 1
  <fs a>4. <e g>8      | % 2
  <d fs>4 <cs e>      | % 3
  d4. <d a'>8      | % 4
  <g b>4. <g b>8      | % 5
  <e cs'>4. <e cs'>8      | % 6
  <fs d'>4.\fermata  <fs d'>8      | % 7
  <fs d'> <a cs> <g b> <fs a>      | % 8
  <fs a>8. <e g>16 <d fs>8 <fs d'>      | % 9
  <fs d'> <a cs> <g b> <fs a>      | % 10
  <fs a>8. <e g>16 <d fs>8 <d fs>      | % 11
  <d fs> <d fs> <d fs> <d fs>16 <e g>      | % 12
  <fs a>4. <e g>16 <d fs>      | % 13
  <cs cs cs e>8 <cs e> <cs e> <cs e>16 <d fs>      | % 14
  <e g>4. <d fs>16 <cs e>      | % 15
  d8 <fs d'>4 <g b>8      | % 16
  <fs a>8. <e g>16 <d fs>8 <e g>      | % 17
  <d fs>4 <cs e>
  \bar "||"     | % 18
  d2      | % 19
  <fs d'>4 <a cs>8. <g b>16      | % 20
  <fs a>4. <e g>8      | % 21
  <d fs>4 <cs e>      | % 22
  d4. <d a'>8      | % 23
  <g b>4. <g b>8      | % 24
  <e cs'>4. <e cs'>8      | % 25
  <fs d'>4.\fermata  <fs d'>8      | % 26
  <fs d'> <a cs> <g b> <fs a>      | % 27
  <fs a>8. <e g>16 <d fs>8 <fs d'>      | % 28
  <fs d'> <a cs> <g b> <fs a>      | % 29
  <fs a>8. <e g>16 <d fs>8 <d fs>      | % 30
  <d fs> <d fs> <d fs> <d fs>16 <e g>      | % 31
  <fs a>4. <e g>16 <d fs>      | % 32
  <cs cs cs e>8 <cs e> <cs e> <cs e>16 <d fs>      | % 33
  <e g>4. <d fs>16 <cs e>      | % 34
  d8 <fs d'>4 <g b>8      | % 35
  <fs a>8. <e g>16 <d fs>8 <e g>      | % 36
  <d fs>4 <cs e>
  \bar "||"     | % 37
  d2      | % 38
  <fs d'>4 <a cs>8. <g b>16      | % 39
  <fs a>4. <e g>8      | % 40
  <d fs>4 <cs e>      | % 41
  d4. <d a'>8      | % 42
  <g b>4. <g b>8      | % 43
  <e cs'>4. <e cs'>8      | % 44
  <fs d'>4.\fermata  <fs d'>8      | % 45
  <fs d'> <a cs> <g b> <fs a>      | % 46
  <fs a>8. <e g>16 <d fs>8 <fs d'>      | % 47
  <fs d'> <a cs> <g b> <fs a>      | % 48
  <fs a>8. <e g>16 <d fs>8 <d fs>      | % 49
  <d fs> <d fs> <d fs> <d fs>16 <e g>      | % 50
  <fs a>4. <e g>16 <d fs>      | % 51
  <cs cs cs e>8 <cs e> <cs e> <cs e>16 <d fs>      | % 52
  <e g>4. <d fs>16 <cs e>      | % 53
  d8 <fs d'>4 <g b>8      | % 54
  <fs a>8. <e g>16 <d fs>8 <e g>      | % 55
  <d fs>4 <cs e> \bar "|."     | % 56
  d2 \bar "|."
}% end of last bar in partorvoice


words = \lyricmode {
  Joy to the world

}

\score {
  <<
    \new Staff { \melody }
   % \addlyrics { \words }
  >>
  \layout { }
  \midi { \tempo 4 = 90}
}
