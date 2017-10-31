execute
executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference
	| styler styledText |
	self isSmalltalk
		ifTrue: [ 
			styler := SHTextStylerST80 new.
			styler classOrMetaClass: nil.
			styledText := styler styledTextFor: (aText copyFrom: self start to: self stop).
			aText replaceFrom: self start to: self stop with: styledText ]
		ifFalse: [ 
			aText 
				addAttribute: TextColor black
				from: self start 
				to: self stop ].
	aText 
		addAttribute: (TextFontReference toFont: StandardFonts codeFont)
		from: self start
		to: self stop.