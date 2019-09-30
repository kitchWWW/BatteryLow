global= {
  \time 4/4
  \key c \major
}


\score {
  \new StaffGroup <<
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"1"

  c2 d
  e1

  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"2"

  c2 d
  e1

  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"3"

    R1* 2
\xNotesOn
	c1:32
	\repeat unfold 9 {b1:32}


  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c' {
  \set Staff.instrumentName = #"4"
\xNotesOn
\repeat unfold 12 {\times 4/5 {e4 r e r r}}



} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"5"

  R1* 1
\xNotesOn
	\repeat unfold 11 {\times 2/3 {g4 g4 r} r2}


  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"6"

  c2 d
  e1

  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"7"

 	R1 * 4
	\repeat unfold 8 {f4 f f f}


  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"8"

  c2 d
  e1

  \bar "|."
} >>
    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"9"

  c2 d
  e1

  \bar "|."
} >>    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"10"

  c2 d
  e1

  \bar "|."
} >>    \new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"11"

  c2 d
  e1

  \bar "|."
} >>
\new Staff << \global \new Voice \relative c'' {
  \set Staff.instrumentName = #"12"

  c2 d
  e1

  \bar "|."
} >>
  >>
  \layout { }
  \midi { }
}