\version "2.18.2"

\paper {
%	annotate-spacing = ##t
	print-page-number = ##t
	print-first-page-number = ##t
%	page-count = #2
	first-page-number = #3

	#(set-paper-size "arch a")

	oddFooterMarkup = \markup \column { \null \null \fromproperty #'header:copyright }
}

\header {
  genre = "Classical"
}

global = {
	\key a \minor
	\clef "G_8"
	\time 3/4 
	\set Staff.connectArpeggios = ##t
}

\pointAndClickOn

SDnl =  \shape #'((0.0 . 0.0)(2.0 . 2.0)(2.0 . 1.0)(-0.0 . -0.8)) Slur
SDnm =  \shape #'((0.0 . -0.3)(0.0 . -0.0)(0.0 . -0.0)(-0.0 . 0.0)) Slur

SUpj= \shape #'(
	   ((0.0 . -0.0)(0.0 . 1.0)(0.0 . 1.0)(-0.0 . 1.2))
           (( 0.0 . 0.0) (0 . 1.0) (0 . 1.0) (0 . -0.6))
         ) Slur

SUpk= \shape #'(
	   ((0.0 . -0.0)(0.0 . 0.8)(0.0 . 0.8)(-0.0 . 0.4))
           (( 0.0 . 0.0) (0 . 1.0) (0 . 1.4) (0 . -1.2))
         ) Slur

TUpe =  \shape #'((0.2 . -0.2)(0.0 . 0.3)(0.0 . 0.3)(-0.4 . -0.2)) Tie
TDnd = \shape #'((0.0 . -0.3)(-0.0 . -0.3)(0.0 . -0.3)(-0.0 . -0.3)) Tie
TDne = \shape #'((0.2 . -0.2)(-0.0 . 0.2)(0.0 . 0.2)(-0.2 . -0.2)) Tie

SMna= \shape #'(
	   ((0.0 . -0.0)(0.0 . 0.0)(0.0 . 0.8)(-0.0 . 0.4))
           (( 0.0 . 0.2) (0 . 0.2) (0 . 0.2) (0 . 0.2))
         ) Slur

SMnd= \shape #'(
	   ((0.0 . 0.3)(0.0 . 0.9)(0.0 . -0.4)(-0.0 . -0.0))
           (( 0.0 . 0.0) (0 . 0.0) (0 . 0.8) (0 . -1.2))
         ) Slur

SMni= \shape #'(
	   ((0.0 . 0.0)(0.0 . 0.8)(0.0 . 0.8)(-0.0 . -0.0))
           (( 0.0 . 0.0) (0 . 0.0) (0 . 1.3) (0 . -0.8))
         ) Slur

SMnh= \shape #'(
	   ((0.5 . 2.4)(0.0 . 0.4)(0.0 . 0.0)(-0.0 . -0.6))
           (( 0.0 . 0.0) (0 . -0.6) (0 . -0.6) (0 . 0.2))
         ) Slur

SMng= \shape #'(
	   ((0.0 . -0.0)(0.0 . 0.8)(0.0 . 0.8)(-0.0 . 1.4))
           (( 0.0 . 0.0) (0 . 0.4) (0 . 0.4) (0 . -0.2))
         ) Slur

SMnb =  \shape #'((0.0 . -0.4)(0.0 . -2.8)(0.0 . -0.4)(-0.0 . 0.0)) Slur
SMnc =  \shape #'((0.0 . -0.7)(0.0 . -1.4)(0.0 . -0.8)(-0.0 . 0.7)) Slur
SMne =  \shape #'((0.0 . -1.1)(0.0 . -1.7)(0.0 . -1.5)(-0.0 . -0.8)) Slur
SMnf =  \shape #'((0.0 . -0.3)(0.0 . -0.4)(0.0 . -0.4)(-0.0 . -0.4)) Slur

%\include "toc.ly"
\include "score/book-2.ly"
%\include "gtr1-2/book.ly"
%\include "gtr1-3/book.ly"
%\include "gtr1-4/book.ly"
%\include "blank.ly"
%\include "copyright.ly"

