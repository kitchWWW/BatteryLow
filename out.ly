
\paper{

  print-page-number = ##f
	#(set-paper-size "letter" 'landscape)
  left-margin = 1\cm
  right-margin = 1\cm
  top-margin = .5\cm
  bottom-margin = .5\cm
  system-separator-markup = \slashSeparator
}


\header{
title =\markup { 
         \override #'(font-name . "Avenir Light")
		\fontsize #5 
         "My battery is low and it is getting dark" }
subtitle ="  "
subsubtitle =  \markup { 
         \override #'(font-name . "Avenir Light")
		\fontsize #3 
         "For Solo Keyboard Percussion and Live Electronics" }
tagline = \markup{\center-column{
	"  "
	"  "
	\italic{"A fresh score should be generated for every performance at"} 	"www.brianellissound.com/batterylow"}}


composer = \markup { 
         \override #'(font-name . "Avenir Light")
		\fontsize #1 
         "Brian Ellis" }
arranger = "   "
}


\override #'(font-series . medium)

\markup{
\concat{
\hspace #17

\center-column{
\vspace #1

% line one
\concat{

\concat{\huge{
1
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium "very uneven"} 4 = 55 
\bar ".|:"
\xNotesOn
a'4\ppp
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
2
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium "very uneven"} 4 = 90 
\bar ".|:"
\xNotesOff
f''4\ppp
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
3
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium "very uneven"} 4 = 55 
\bar ".|:"
\xNotesOn
e'4\pp
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

}

\vspace #1



% line two
\concat{

\concat{\huge{
4
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\bar ".|:"
\xNotesOn
b''1:32\fermata\mp_"long, even sustain"
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
5
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\bar ".|:"
\xNotesOn
g''1:32\fermata\mf_"long, even sustain"
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
6
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\bar ".|:"
\xNotesOff
\time 1/4
d'''16->\pp^"alternate among patterns freely" [d''' d''' d'''] 
\time 3/16
\bar "||"
d'''-> [d''' d''']
\bar "||"
\time 2/16
d'''-> [d''']
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

}


\vspace #1

% line three
\concat{

\concat{\huge{
7
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo 4 = 40
\bar ".|:"
\xNotesOff
\times 2/3 {b''8\p [b''8 ^\markup{\italic"heartbeat"} r]} r4 
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
8
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo 4 = 70
\bar ".|:"
\xNotesOn
\times 2/3 {a'8\f [a'8 ^\markup{\italic"heartbeat"} r]} 
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
9
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo 4 = 70
\bar ".|:"
\xNotesOn
\times 2/3 {g8\fff [g8 ^\markup{\italic"heartbeat"} r]} 
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

}


\vspace #1

% line three
\concat{

\concat{\huge{
10
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\bar ".|:"
\xNotesOff
c'1:32\fermata\mp_"long, even sustain"
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
11
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium "very uneven"} 4 = 55 
\bar ".|:"
\xNotesOff
c''4\mf
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
12
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\bar ".|:"
\xNotesOff
d'1:32\fermata\f_"long, even sustain"
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

}


\vspace #1

% line three
\concat{

\concat{\huge{
13
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium "very uneven"} 4 = 90 
\bar ".|:"
\xNotesOff
f'''4\ff
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
14
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium "very uneven"} 4 = 90 
\bar ".|:"
\xNotesOff
e'4\fff
\bar ":|."


}
\layout {indent = 0.0\cm}}
}

\hspace #10

\concat{\huge{
End
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
\tempo \markup{\medium \italic "bombastic"}
\xNotesOff
f4\fff  \glissando s4 f'''

\bar "|."
}
\layout {indent = 0.0\cm}}
}

}


\vspace #1

% line four
\concat{


\hspace #10


\hspace #10


}




}
}
}