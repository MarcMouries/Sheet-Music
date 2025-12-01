\language "english"



\version "2.19.5"

%\header {
%   title    = "L'Apprenti Sorcier / The Sorcerer's Apprentice"
%  subtitle = "Scherzo after a ballad by Goethe"
%  composer = "Paul Dukas"
  country = "France"
%
%}

\include "../common/common-header.ily"


%% Paul Dukas: The Sorcerer’s Apprentice (Measures 66-92)


soli = \markup { \upright Soli }

The_Sorcerers_Apprentice = \relative c' {
  \key f \minor
  \time 3/8
  f8-. r r   |  r4. |
  f8-. r r   |  r4. |
  f8-. r c'  |
  f, r8 r8   | r4.  |
  f8-. r c'  |
  f,8-. r r  |  r4. |  
  \repeat unfold 6 {  f8-. r af-.|  }
% 7
  f4-.\mf-\tag #'part ^\soli r8 |
  c'4-. r8 |
  c,8-. d-. e-. |
  % 7-8
  \repeat unfold 2 {
    f8-. r af-. |  f8-. r af-. |    g8-. f-. e-. |
  }
  % 7-8
  f8-. r af-. |
  f8-. af-. g-. |
  f8-. g-. af-. |
  % 7-8
  \repeat unfold 2 {
    g8-. bf-. af-. |
    g8-. r b-. |
    f8-. r af-. |
  }
  % 7-8
  g8-._"poco cresc." af-. bf!-. |
  \repeat unfold 2 { c8-. c-. c-. | }
  c8-. bf-. af-. |
  g8-. bf-. af-. |
  % 7-8
  g8-. f-. ef-. |
  \acciaccatura f8 ef-. d-. c-. |
  bf!8-. af-. g-. |
  
  r8 r r |
}


%\score {
%    \new Staff { \The_Sorcerers_Apprentice }
%  \layout { }
%}