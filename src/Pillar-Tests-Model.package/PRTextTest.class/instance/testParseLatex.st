tests-parsing
testParseLatex
	| wiki text tree |
	wiki := '\\begin{foo}[bar]$zork$\\end{foo}'.
	text := '\begin{foo}[bar]$zork$\end{foo}'.
	tree := PRDocument new
		add: (PRParagraph new
			add: (PRText content: '\begin{foo}[bar]$zork$\end{foo}');
			yourself);
		yourself.
	self assertWiki: wiki equalsTree: tree.
	self assertTree: tree equalsWiki: wiki.
	self assertTree: tree equalsText: text