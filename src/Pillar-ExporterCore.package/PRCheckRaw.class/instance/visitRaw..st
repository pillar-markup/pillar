visiting-document
visitRaw: aRaw
	((PRDocumentWriter withAllConcreteClasses collect: [ :each | each writerName ])
		includes: aRaw type)
		ifTrue: [ ^ self ].
	PRWarning signal: aRaw type , ' is not a valid type for a raw.'.