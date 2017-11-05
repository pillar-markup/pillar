execute
executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference
	aText 
		addAttribute: (TextColor color: Color black twiceLighter)
		from: self start 
		to: self stop;
		addAttribute: (TextFontReference toFont: StandardFonts codeFont)
		from: self start
		to: self stop.