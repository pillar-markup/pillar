Extension { #name : #PRCodeblock }

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> isClassDefinition [
	"a codeblock may be a class definition. It does not need to be be classDefinition=true, classDefinition alone is enough.
	
	[[[classDefinition
			
	]]]
	"
	
	^ (self hasParameter: 'classDefinition')
]

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> isExample [
	"a code may be testable annotation. It does not need to be be example=true, example alone is enough.
	
	[[[example
			
	]]]
	"
	
	^ (self hasParameter: 'example')
]

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> isExpectedFailure [
	"a codeblock may be an expected failure, you can state it by using the parameter as follows
	
	[[[expectedFailure=true
			
	]]]
	"
	
	^ (self hasParameter: 'expectedFailure')
]

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> isMethodDefinition [
	"a codeblock may be a method definition. It does not need to be methodDefinition=true, methodDefinition alone is enough.
	
	[[[methodDefinition
			
	]]]
	"
	
	^ (self hasParameter: 'methodDefinition')
]

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> isTestDefinition [
	"a codeblock may be a test definition. It does not need to be be testDefinition=true, testDefinition alone is enough.
	
	[[[testDefinition
			
	]]]
	"
	self flag: 'it looks like testdefinition was replaced by example'.
	^ self hasParameter: 'testDefinition'
]

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> textForExample [
	"returns a preformated text for codeblock testing"

	"(PRCodeblock content: ' 3+4 >>> 7 ' parameters: (OrderedDictionary newFromKeys: #('example') andValues: #(true))) textForExample 
	  >>> '(3+4)>>>7'"

	^ ('*>>>*' match: self text)
		ifTrue: [ '(' , (self text splitOn: '>>>') first trimBoth , ')' , '>>>' , (self text splitOn: '>>>') second trimBoth ]
		ifFalse: [ self text ]
]

{ #category : #'*Pillar-BookTester' }
PRCodeblock >> textForMethodDefinition [
	"returns an Array of preformated text for MethodDefinition testing
	The Array contains: 
		-Class Name
		-Method Name
		-Method Body"

	"(PRCodeblock content: 'classname >> methodName
blabla
blabla' parameters: nil) textForMethodDefinitionParameter >>>  #('classname' 'methodName' 'blabla
blabla') "

	^ ('*>>*' match: self text)
		ifTrue: [ Array
				with: ((self text splitOn: '>>') first trimBoth splitOn: ' ') asArray
				with:
					((self text splitOn: '>>') second
						splitOn:
							'
') first trimBoth
				with:
					('
'
						join:
							((self text splitOn: '>>') second
								splitOn:
									'
') allButFirst) trimBoth ]
		ifFalse: [ 'Method definition syntax not respected. Please use: YourClass>>yourMethod ...' ]
]
