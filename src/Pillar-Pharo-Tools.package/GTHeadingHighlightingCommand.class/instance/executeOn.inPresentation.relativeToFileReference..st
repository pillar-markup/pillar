execute
executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference
	aText 
		addAttribute: (TextColor color: Color blue darker)
		from: self start 
		to: self stop