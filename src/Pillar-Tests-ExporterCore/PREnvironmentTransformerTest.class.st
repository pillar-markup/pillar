Class {
	#name : #PREnvironmentTransformerTest,
	#superclass : #PRNodeTransformerTest,
	#category : #'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #private }
PREnvironmentTransformerTest >> actualClass [
	^ PREnvironmentTransformer
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testAbsenceOfEnvironment [
	"there is not environment so nothing happens."
	| input |
	input := PRDocument new
		add: (PRParagraph new
						add: (PRText content: 'Foo');
						yourself);
		add: (PRParagraph with: (PRText content: 'Bar') yourself);
		yourself.
	self assert: (self executePhase: input with: self configuration) equals: input
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testBasicTextInsideAnEnvironment [
	| input expected |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'card');
		yourself.
	expected := PRDocument new
		add: ((PREnvironment named: 'card')
						add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
						add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
						yourself);
		yourself.
	self assert: (self executePhase: input) equals: expected
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testBeginEnvironmentWithoutEnd [
	| input |
	input := PRDocument
		withAll: {
			PRBeginEnvironmentAnnotation named: 'card'.
			(PRParagraph with: (PRText content: 'First paragraph inside environment') yourself) }.

	self
		should: [ self executePhase: input ]
		raise: PRError
		whoseDescriptionIncludes: 'Missing end of environment ''card'''
		description: 'Missing end of environment ''card'''
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testEndEnvironmentWithoutBegin [
	| input |
	input := PRDocument with: (PREndEnvironmentAnnotation named: 'card').

	self
		should: [ (self executePhase: input with: self configuration) ]
		raise: PRError
		whoseDescriptionIncludes: 'Missing begin of environment ''card'''
		description: 'Missing begin environment'
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testEndEnvironmentWithoutBeginAfterCorrectEnvironment [
	| input |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'anotherCard');
		yourself.

	self
		should: [ (self executePhase: input with: self configuration) ]
		raise: PRError
		whoseDescriptionIncludes: 'Missing begin of environment ''anotherCard'''
		description: 'Missing begin environment'
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testEnvironmentHasBeginAnnotationProperties [
	| input node |
	input := PRDocument new
		add: ((PRBeginEnvironmentAnnotation named: 'cards')
			parameterAt: 'boolean' put: true;
			parameterAt: 'string' put: 'a string';
			yourself);
		add: (PREndEnvironmentAnnotation named: 'cards');
		yourself.
		
	node := self executePhase: input.
	
	self assert: (node children first propertyAt: 'boolean').
	self assert: (node children first propertyAt: 'string') equals: 'a string'.
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testEnvironmentWithManyNestedEnvironments [
	| input expected |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'cards');
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'cards');
		yourself.

	expected := PRDocument new
		add: ((PREnvironment named: 'cards')
			add: ((PREnvironment named: 'card')
				add: (PRParagraph with: (PRText content: 'First paragraph inside environment'));
				yourself);
			add: ((PREnvironment named: 'card')
				add: (PRParagraph with: (PRText content: 'Second paragraph inside environment'));
				yourself);
			yourself);
		yourself.

	self assert: (self executePhase: input) equals: expected
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testMismatchEnvironments [
	| input |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'magic');
		yourself.
	
	self
		should: [ (self executePhase: input with: self configuration) ]
		raise: PRError
		whoseDescriptionIncludes: 'Mismatching environments: closing ''magic'' while ''card'' environment is open'
		description: 'Mismatch Environments'
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testMissingNameInBeginAnnotationFails [
	| input |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation new);
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'card');
		yourself.

	self should: [ self executePhase: input ] raise: PREnvironmentMissedNamed
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testMissingNameInEndAnnotationFails [
	| input |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation new);
		yourself.

	self should: [ self executePhase: input ] raise: PREnvironmentMissedNamed
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testMixedEnvironments [
	| input |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRBeginEnvironmentAnnotation named: 'anotherCard');
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'anotherCard');
		yourself.

	self
		should: [ (self executePhase: input with: self configuration) ]
		raise: PRError
		whoseDescriptionIncludes: 'Mismatching environments: closing ''card'' while ''anotherCard'' environment is open'
		description: 'Mismatch Environments'
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testNestedEnvironments [
	| input expected |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'cards');
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'cards');
		yourself.
		
	expected := PRDocument new
		add: ((PREnvironment named: 'cards')
			add: (PREnvironment named: 'card');
			yourself).
			
	self assert: (self executePhase: input) equals: expected
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testNestedEnvironmentsWithTextInsideDeepest [
	| input expected |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'cards');
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'cards');
		yourself.
		
	expected := PRDocument new
		add: ((PREnvironment named: 'cards')
			add: ((PREnvironment named: 'card')
				add: (PRParagraph with: (PRText content: 'First paragraph inside environment'));
				yourself);
			yourself);
		yourself.

	self assert: (self executePhase: input) equals: expected
]

{ #category : #'tests environment' }
PREnvironmentTransformerTest >> testNestedEnvironmentsWithTextSiblingOfEnvironment [
	| input expected |
	input := PRDocument new
		add: (PRBeginEnvironmentAnnotation named: 'cards');
		add: (PRParagraph with: (PRText content: 'First paragraph inside environment') yourself);
		add: (PRBeginEnvironmentAnnotation named: 'card');
		add: (PREndEnvironmentAnnotation named: 'card');
		add: (PRParagraph with: (PRText content: 'Second paragraph inside environment') yourself);
		add: (PREndEnvironmentAnnotation named: 'cards');
		yourself.
		
	expected := PRDocument new
		add: ((PREnvironment named: 'cards')
			add: (PRParagraph with: (PRText content: 'First paragraph inside environment'));
			add: (PREnvironment named: 'card');
			add: (PRParagraph with: (PRText content: 'Second paragraph inside environment'));
			yourself);
		yourself.

	self assert: (self executePhase: input) equals: expected
]
