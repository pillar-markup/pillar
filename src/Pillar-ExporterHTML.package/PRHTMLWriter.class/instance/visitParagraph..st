visiting-document
visitParagraph: aParagraph
	(aParagraph children size = 1 and: [ aParagraph children first isKindOf: PRRaw ])
		ifTrue: [ 
			self
				flag:
					'TODO: ugly fix. The idea is that you don''t want the <p> when using a Raw that potentially displays a <div>, because this is not HTML compliant'.
			self visitRaw: aParagraph children first ]
		ifFalse: [ 
			canvas tag
				name: 'p';
				with: [ 
							canvas newLine.
							super visitParagraph: aParagraph.
							canvas newLine ] ]