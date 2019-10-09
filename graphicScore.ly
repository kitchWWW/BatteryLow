
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
         "My Battery Is Low And It Is Getting Dark" }
subtitle ="  "
dedication=\markup{\column{\italic{"Commissioned as part of the Electronic Integration Project by Jordan Walsh"} "  " }}
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

%score1

\hspace #10

%score1

\hspace #10

%score1

}

\vspace %vspace



% line two
\concat{

%score1

\hspace #10

%score1

\hspace #10

%score1

}


\vspace %vspace

% line three
\concat{

%score1

\hspace #10

%score1

\hspace #10

%score1

}


\vspace %vspace

% line three
\concat{

%score1

\hspace #10

%score1

\hspace #10

%score1

}


\vspace %vspace

% line three
\concat{

%score1

\hspace #10

%score1

\hspace #10

%score1

}


\vspace %vspace

% line four
\concat{

%score1

\hspace #10

%score1

\hspace #10

%score1

}




}
}
}