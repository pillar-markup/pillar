converting
asJson
	| result |
	result := '' writeStream.
	self properties jsonWriteOn: result.
	^ result contents