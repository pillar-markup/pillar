private
write: aDocument using: aWriter
	| output cocoonConfiguration |
	cocoonConfiguration := self extractDataFrom: aDocument using: aWriter.
	output := aWriter write: aDocument.
	cocoonConfiguration metadata propertyAt: 'content' put: output.
	^ self
		outputStreamDuring: [ :outStream | 
			self
				writeOutput: (self asJson: output withConfiguration: cocoonConfiguration)
				toStream: outStream ]