execute
executeOn: aText inPresentation: aPresentation relativeToFileReference: aFileReference
	| attribute targetFileReference fileNameWithoutPrefix |
	fileNameWithoutPrefix := self fileName.
	(fileNameWithoutPrefix beginsWith: 'file://') ifTrue: [ 
		fileNameWithoutPrefix := fileNameWithoutPrefix copyFrom: 'file://' size + 1 to: fileNameWithoutPrefix size ].
	targetFileReference := aFileReference parent resolveString: fileNameWithoutPrefix.
	attribute := targetFileReference exists 
		ifTrue: [ GTPillarFileTextLink new
									fileReference: targetFileReference;
									presentation: aPresentation ]
		ifFalse: [ TextColor red ].
	aText 
		addAttribute: attribute
		from: self start 
		to: self stop.