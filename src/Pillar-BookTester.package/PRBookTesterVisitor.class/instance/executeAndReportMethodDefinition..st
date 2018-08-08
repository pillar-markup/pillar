compiling
executeAndReportMethodDefinition: result
	| isCorrect typeString |
	"Executes the method definition in the given class with the right name
	[[[methodDefinition
	Plop >> plop1
	^1
	]]]
	will define the method plop1 that returns 1 in the class Plop"
	result explanation: 'Method did not compile without raising an exception'.
	isCorrect := false.
	"The method definition can be either 'classSide', 'wrongSyntax' or 'normalMethodDefinition'"
	typeString := result characterizeMethodDefinition.
	(typeString = 'wrongSyntax')
		ifTrue: [ isCorrect := self compileWrongSyntaxMethodDefinition: result ].
	(typeString = 'classSide')
		ifTrue: [ isCorrect := self compileClassSideMethod: result ].
	(typeString = 'normalMethodDefinition')
		ifTrue: [ isCorrect := self compileMethod: result ].
	result status: isCorrect.
	isCorrect ifTrue: [ result explanation: 'Method compiled' ]