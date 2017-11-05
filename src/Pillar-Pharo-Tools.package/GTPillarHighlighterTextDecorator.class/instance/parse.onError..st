parsing
parse: aString onError: anError
	| result highlighter |
	result := aString asText.
	highlighter := GTPillarHighlighter new.
	highlighter parse: aString.
	highlighter commands do: [ :each | 
		each 
			executeOn: result 
			inPresentation: self presentation 
			relativeToFileReference: self fileReference ].
	^ result