utilities
assertWiki: aString equalsTree: aDocument
	"Assert that parsing aString results in aDocument."

	self
		assert: (self parser parse: aString) = aDocument
		description: aString resumable: true