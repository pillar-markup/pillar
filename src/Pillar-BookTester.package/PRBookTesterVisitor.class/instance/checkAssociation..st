others
checkAssociation: aCodeBlock
	"Asserts that the association created in any codeBlock has equal arguments"
	^ (self class compiler evaluate: aCodeBlock text) isPaired 
