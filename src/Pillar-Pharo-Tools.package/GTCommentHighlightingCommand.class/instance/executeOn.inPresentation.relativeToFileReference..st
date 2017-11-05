execute
executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference
	aText 
		addAttribute: (TextColor color: Color gray)
		from: self start 
		to: self stop