\version "2.19.49"
% automatically converted by musicxml2ly from /Users/Marc/OneDrive/As Time Goes By/As_Time_Goes_By_with_chords.xml
\pointAndClickOff

\header {
}

PartPOneVoiceOne =  \relative a' {
  \clef "treble" \key f \major \numericTimeSignature\time 4/4 | % 1
  \stemUp a4 s2. \repeat volta 2 {
    | % 2
    \stemUp bes8 \stemUp a8 \stemUp g8 \stemUp f8 \stemUp g4.
    \stemUp a8 | % 3
    \stemUp c8 \stemUp bes8 \stemUp a8 \stemUp g8 \stemDown bes4.
    \stemDown c8 | % 4
    \stemDown f8 \stemDown e8 \stemDown d8 \stemDown c8 \stemDown d2
    | % 5
    r2 r4 \stemDown e4 | % 6
    \stemDown g8 \stemDown f8 \stemDown e8 \stemDown d8 \stemDown e4
    \stemDown f4 | % 7
    \stemDown c4 \stemDown c4 \stemUp f,4 \stemUp g4
  }
  \alternative {
    {
      | % 8
      a1 ~ | % 9
      \stemUp a2 r8 r8 r8 \stemUp a8
    }
    {
      | \barNumberCheck #10
      f1 ~ | % 11
      \stemUp f2 r2
    }
  } \bar "||"
  \stemUp f8 \stemUp g8 \stemUp f8 \stemUp d'8 ~ \stemDown d4
  \stemDown d4 | % 13
  \stemDown d8 \stemDown es8 \stemDown d8 \stemDown cis8 \stemDown d2
  | % 14
  \stemDown g,8 \stemDown a8 \stemDown g8 \stemDown d'8 ~ \stemDown d4
  \stemDown d4 | % 15
  \stemDown d8 \stemDown e8 \stemDown d8 \stemDown cis8 \stemDown d2 | % 16
  \stemDown a8 \stemDown bes8 \stemDown a8 \stemDown f'8 ~ \stemDown f4
  \stemDown f4 | % 17
  \stemDown f8 \stemDown e8 \stemDown f8 \stemDown e8 \stemDown g4
  \stemDown e4 | % 18
  \stemDown d4 \stemDown d4 \stemUp a4 \stemUp a4 | % 19
  \stemDown c2. r8 \stemUp a8 | \barNumberCheck #20
  \stemUp bes8 \stemUp a8 \stemUp g8 \stemUp f8 \stemUp g8 \stemUp g4
  \stemUp a8 | % 21
  \stemUp c8 \stemUp bes8 \stemUp a8 \stemUp g8 \stemDown bes8
  \stemDown bes4 \stemDown c8 | % 22
  \stemDown f8 \stemDown e8 \stemDown d8 \stemDown c8 \stemDown d2 | % 23
  r2 r4 \stemDown e4 | % 24
  \stemDown g8 \stemDown f8 \stemDown e8 \stemDown d8 \stemDown e4
  \stemDown f4 | % 25
  \stemDown c4 \stemDown c2 \stemUp a4 | % 26
  \stemDown c2 \stemDown c2 | % 27
  \stemDown f2. r4 \bar "||"
}