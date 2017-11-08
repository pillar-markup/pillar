I represent a programming language that can be referenced from a PRScript to get syntax highlighting.

Check the method  visitScript: for example on PRLatexWriter.  

...
	(self languageForScript: aScript) isSyntaxHighlightingPossible
		ifTrue: [ parameters add: 'language=' , (self languageForScript: aScript) printString ].
...