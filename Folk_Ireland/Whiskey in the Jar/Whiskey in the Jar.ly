\version "2.24.0"
\language "english"

\include "../../stylesheets/stylesheet_fiddle.ly"
\header {
  title = "Whiskey in the Jar"
  composer = "Traditional Irish"
  country = "Ireland"
    video = ""
    style = "folk song"
}

\include "../../common/common-header.ily"

melody = \relative d' {
    \tempo 4 = 120
    \clef treble
    \key c \major
    \time 4/4
    \autoBeamOff
    \partial 8

    \repeat volta 2 { 
	e8 | g4 g8 a g g e e | a4 a8 b a e~e e |
        a4 a8 b c c b a | g8 g c b a16 e8. e8
    } 
    e8 |
    e16 d8. d16 d8. d2 | e8 e8. e16 e16 f16 g2 |
    a8 a8. a16 a16 b16 c4. a8 | g8. e16 d8. e16 c2
}
texta = \lyricmode {
    As I was a -- wal -- king 'round _ Kil -- ga -- ry Moun -- tain
    I met Colo -- nel Pep -- per and his mo -- ney he was coun -- tin'. _
}
textb = \lyricmode {
    I ratt -- led me pis -- tols and I drew forth me sa -- ber, sayin'
    "\"Stand" and de -- li -- ver, for I am the bold de -- cei -- "ver.\""
    Mu -- sha ri -- gum da rum -- da, whack fol the dad -- dy O, 
    whack fol the dad -- dy O, 
    there's whis -- ky in the jar.
}
harmonies = \chordmode {
    \set ChordNames.midiInstrument = #"orchestral strings"
    \repeat volta 2 {
	s8 | c1 | a:min | f | c2 a4.:min~  
    }
    \set ChordNames.midiInstrument = #"voice oohs"
    a8:min | g1:7 | g1:7 | f | c4 g4:7 c2 | 
}
music = {
    <<
    \new ChordNames  {
    \set chordChanges = ##f
    \harmonies
    }
    \new Voice = "one" { 
    \set Staff.midiInstrument = #"accordion"
    \melody 
    }
    \new Lyrics \lyricsto "one" { \texta } % See lilypond-learning.pdf p.54 ff
    \new Lyrics \lyricsto "one" { \textb }
    >>
}

\score {
    \music
    \layout { }
}

\score {
    \unfoldRepeats \music
    \midi { }
}

% Creating MIDI files: p. 324
% Tested MIDI instruments for accompanyment (harmonies); lilypond.pdf p. 444 f
% "guitar harmonics"			no warning, but no sound
% "acoustic guitar (nylon)"		works, but too weak and too short
% "guitar"				warning: no such MIDI instrument: `guitar'
% "acoustic bass"			works, but too weak and too short
% "glockenspiel"			works, but not suited for accompaniment
% "string ensemble 1"			works, quite loud
% "orchestral strings"			works, softer
% "string ensemble 2"			no warning, but no sound
% "church organ"			works, very loud and clear
% "flute"				works, good for melody
% "recorder"				works, good for melody
% "choir aahs"				no warning, but no sound
% "banjo"				no warning, but no sound
% "fiddle"				no warning, but no sound
% "bagpipe"				no warning, but no sound
% "contrabass"				no warning, but no sound
% "whistle"				no warning, but no sound
% "voice oohs"				works, sounds "interesting"
% "trumpet"				works, sounds very good
% "piccolo"				works
% "synth voice"				no warning, but no sound


% If there is "no such MIDI instrument: ..." then piano is used.
% If there is no warning, but no sound, then maybe the MIDI player is to blame.

% For Printing stanzas at the end,
% see lilypond.pdf page 197 ff.
\markup{
  \fill-line{  
    \column {
      \line { " " }
      \hspace #0.1
      \line { \bold "2. "
	\column {
	  "The shining golden coins did look so bright and jolly,"
	  "I took 'em with me home and gave 'em to my Molly;"
	  "she promised and she vowed that she never would deceive me,"
	  "but the devil's in the women and they never can be easy."
        }
      }
      \line { " " }
      \hspace #0.1
      \line { \bold "3. "
	\column {
	  "When I was awakened between six and seven,"
	  "the guards were all around me in numbers odd and even;"
	  "I flew my pistols, but alas, I was mistaken,"
	  "for Molly'd drawn my pistols and a prisoner I was taken."
        }
      } % \line
      \line { " " }
      \hspace #0.1
      \line { \bold "4. "
	\column {
	  "They put me in jail without judge or writin',"
	  "for robbing Colonel Pepper in Kilgary Mountain,"
	  "but they didn't take my fists so I knocked the sentry down,"
	  "and bid a fond farewell to the jail in Slaigo town."
        }
      }
      \line { " " }
      \hspace #0.1
      \line { \bold "5. "
	\column {
	  "Now, some take delight in fishin' and bowlin',"
	  "and others take delight in their carriages a-rollin',"
	  "but I take delight in the juice of the barley,"
	  "and courtin' pretty girls in the mornin' so early."
        }
      }
    } % \column
  } % \fill-line
} % \markup
