tests
testDocumentsSomeTransformers
	| result |
	result := String streamContents: [ :stream | PRTransformersDocumentation on: stream ].
	self assert: (result includesSubstring: 'numerating' caseSensitive: false).
	self assert: (result includesSubstring: 'slide').