Class {
	#name : #GTMonospaceFormatHighlightingCommand,
	#superclass : #GTHighlightingCommand,
	#category : 'Pillar-Pharo-Tools-Editor'
}

{ #category : #execute }
GTMonospaceFormatHighlightingCommand >> executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference [
	aText 
		addAttribute: (TextColor color: Color black twiceLighter)
		from: self start 
		to: self stop;
		addAttribute: (TextFontReference toFont: StandardFonts codeFont)
		from: self start
		to: self stop.
]
