*Pillar-ExporterLaTeX
sbaString

	"was ^ self printString but this prevents us to improve the printOn: for debugging purpose.
	
	
	[[[language=bash
	...
	]]]
	And that generated the following broken latex:
	\begin{displaycode}{a PRBashScriptLanguage[635751168] (bash)}
	Let us try with standardName
	"
	^ self standardName
	