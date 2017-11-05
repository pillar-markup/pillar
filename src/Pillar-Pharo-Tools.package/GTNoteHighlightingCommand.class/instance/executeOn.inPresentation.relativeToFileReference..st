execute
executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference
	aText 
		addAttribute: (TextColor color: Color red muchDarker)
		from: self start 
		to: self stop