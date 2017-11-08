visiting-document
visitRaw: aRaw
	((PRDocumentWriter withAllConcreteClasses collect: [ :each | each writerName ])
		includes: aRaw type)
		ifTrue: [ ^ self ].
	PRWarning signal: aRaw type , ' is not a supported valid type for a raw. You may need to load an extra document writer to be able to handle this type.'.