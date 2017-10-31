visiting-document
visitRaw: aRaw
	(aRaw isForType: self writerName)
		ifTrue: [ self writeRawDuring: [ super visitRaw: aRaw ] ]