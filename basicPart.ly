\concat{\huge{
%number
}
  \hspace #1
\score {\new Staff \absolute {
\override Staff.TimeSignature #'stencil = ##f 
%part
}
\layout {indent = 0.0\cm}}
}
