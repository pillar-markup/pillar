"
I represent a pillar codeblock once it has been tested.

I am composed of a text, a result and an explanation.

The text shows the text of the codeblock I am linked to, the result is a boolean stating if the test has passed or not and the explanation is either 'Test passed', 'Test failed without raising an exception' or the exception raised by the test.

For example:
[[[example=true 
3+4
>>> 7
]]]

Given this codeblock, the associated PRBookTestResult's instance variable would be: 
text: ''3+4'
result: true 
explanation: 'Test passed'

The fragmentedText instance variable is used by method or test definitions to keep class and method names. For example:
[[[methodDefinition
Plop >> plop1
   ^ '1'
]]]

text: 'Plop >> plop1
		 ^ ''1'''
fragmentedText: #('Plop' 'plop1' '^ ''1''')


"
Class {
	#name : #PRBookTestResult,
	#superclass : #Object,
	#instVars : [
		'text',
		'fragmentedText',
		'status',
		'explanation'
	],
	#category : #'Pillar-BookTester-Visitor'
}

{ #category : #accessing }
PRBookTestResult >> characterizeMethodDefinition [
	"Precondition: fragmentedText should be filled in before using this method"

	self fragmentedText isString
		ifTrue: [ ^ 'wrongSyntax' ].
	self fragmentedText first size = 2
		& self fragmentedText first isArray
		ifTrue: [ ^ 'classSide' ].
	^ 'normalMethodDefinition'
]

{ #category : #accessing }
PRBookTestResult >> explanation [

	^ explanation
]

{ #category : #accessing }
PRBookTestResult >> explanation: anException [

	explanation := anException
]

{ #category : #accessing }
PRBookTestResult >> fragmentedText [

	^ fragmentedText
]

{ #category : #accessing }
PRBookTestResult >> fragmentedText: aText [
	"The Array contains: 
		-Class Name
		-Method Name
		-Method Body"
	fragmentedText := aText
]

{ #category : #initialization }
PRBookTestResult >> initialize [

	super initialize.
	status := true.
	explanation := 'Test failed without raising an exception'
]

{ #category : #testing }
PRBookTestResult >> isFailed [

	^ status not
]

{ #category : #testing }
PRBookTestResult >> isValid [

	^ status 
]

{ #category : #accessing }
PRBookTestResult >> status [ 
	"true means that the test is valid, false means that the test got a problem or failed"
	
	^ status
]

{ #category : #accessing }
PRBookTestResult >> status: aBoolean [
	"true means that the test is valid, false means that the test got a problem or failed"
	
	status := aBoolean
]

{ #category : #accessing }
PRBookTestResult >> text [

	^ text 
]

{ #category : #accessing }
PRBookTestResult >> text: aText [

	text := aText
]
