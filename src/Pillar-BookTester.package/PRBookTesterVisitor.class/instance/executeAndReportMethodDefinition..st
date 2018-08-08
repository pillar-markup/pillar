compiling
executeAndReportMethodDefinition: result
	| isCorrect currentClass |
	"Executes the method definition in the given class with the right name
	[[[methodDefinition
	Plop >> plop1
	^1
	]]]
	will define the method plop1 that returns 1 in the class Plop"
	result explanation: 'Method did not compile without raising an exception'.
	isCorrect := false.
	"fragmented text is composed of: 1) #(className 'class'(optional)) 
											  2) methodName 
											  3) method definition
						or is #('Method definition syntax not respected. Please use: YourClass>>yourMethod ...')"
	"Testing the second case by verifying the size of the array"
	[(result fragmentedText) second]
		on: Exception
		do: [ :ex | result explanation: result fragmentedText.
						isCorrect := false ].
	"Testing if the method is created on class side or not, aka the first component of fragmentedText is composed of one or two strings"			
	((result fragmentedText) size = 1)
		ifTrue: [ currentClass := (self class environment 
				at: ((result fragmentedText first) first trimBoth) asSymbol) ]
		ifFalse: [ currentClass := (self class environment 
				at: (((result fragmentedText first) first trimBoth) asSymbol) class
				ifAbsent: [result explanation: 'Class is not defined'. 
							  isCorrect := false] )].
	"Finally the method is compiled in the correct class"
	[ currentClass compile: (result fragmentedText second,'
	', result fragmentedText third).
	  isCorrect := true ]
		on: Exception
		do: [ :ex | result explanation: ex asString.
						isCorrect := false ].
	result status: isCorrect.
	isCorrect ifTrue: [ result explanation: 'Method compiled' ]