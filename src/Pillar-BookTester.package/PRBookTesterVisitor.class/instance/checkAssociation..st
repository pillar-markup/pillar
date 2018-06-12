others
checkAssociation: aCodeBlock
	"Asserts that the association created in any codeBlock has equal arguments"
	^ (Compiler evaluate: aCodeBlock text) isPaired 
