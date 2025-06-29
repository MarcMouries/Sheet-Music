%==========================================================
%  twoByTwoBeaming
%
%  This snippet sets a custom beaming pattern in common time
%  (e.g., 2/4, 3/4, 4/4) so that eighth notes are grouped
%  in pairs instead of default larger groups.
%
%  Result:
%    ♪♪ ♪♪ ♪♪ instead of ♪♪♪♪ ♪♪♪♪
%
%  How it works:
%    (1 . 8) → One beat = quarter note; smallest note = eighth note
%    (2 2 2 2) → Beam eighth notes in groups of 2
%
%  This produces more consistent and readable beams in certain
%  rhythmic contexts, especially in early music.
%
%  Usage:
%    Add this to your layout block:
%
%      \context {
%        \Voice
%        \twoByTwoBeaming
%      }
%
%==========================================================

twoByTwoBeaming = {
  % Each entry maps a beat-unit/subdivision combination to a beaming pattern

  % Macro to beam eighth notes two by two in any quarter-note meter (e.g., 2/4, 3/4, 4/4)
  % (1 . 8): one quarter-note beat, with beams applied at eighth-note level
  %        : (beat-unit . smallest-note-value):
  %        : ( 1 = quarter note beat (used in 2/4, 3/4, 4/4, etc.)
  %        : ( 8 = eighth notes are the level of beaming we're targeting
  %  .     : Separator between the key and its value

  % (2 2 2 2): group eighth notes into 2-note beams
  %          : Beaming pattern: group eighth notes into groups of 2
  %          : In 3/4: gives ♪♪ ♪♪ ♪♪
  %          : In 4/4: gives ♪♪ ♪♪ ♪♪ ♪♪

  \set beamExceptions = #'(
                            (end .
                                 (
                                   ((1 . 8) . (2 2 2 2))
                                   )
                                 )
                            )
}
