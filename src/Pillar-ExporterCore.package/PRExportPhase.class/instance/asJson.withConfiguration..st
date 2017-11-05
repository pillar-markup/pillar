private
asJson: anOutput withConfiguration: aConfig
	| output config |
	output := '' writeStream.

	config := aConfig metadata properties.
	aConfig flatProperties: config.

	config jsonWriteOn: output.
	^ output contents.