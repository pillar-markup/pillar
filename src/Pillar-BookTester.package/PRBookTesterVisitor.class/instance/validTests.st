testing
validTests
	"Returns all passed tests"
	^ allTestResults select: [ :each | each isValid ]