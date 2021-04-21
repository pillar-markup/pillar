Class {
	#name : #PRParserMockAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : #'Pillar-Tests-Model-PetitPillar'
}

{ #category : #helpers }
PRParserMockAnnotationTest >> actualClass [
	^ PRMockAnnotation
]

{ #category : #helpers }
PRParserMockAnnotationTest >> referenceParameters [
	^ PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'value')
			valueNode: (PRParameterValue value: 'Foo').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 5) }
]

{ #category : #helpers }
PRParserMockAnnotationTest >> referenceString [
	^ 'mock:value=Foo|number=5'
]

{ #category : #tests }
PRParserMockAnnotationTest >> testParseUndclaredParametersShouldRaiseAnError [
	| input |
	input := '${mock:Foo|option=bar}$'.
	self should: [ self parser parse: input ] raise: PRError.
	input := '${mock:Foo|option=bar|toto=4}$'.
	self should: [ self parser parse: input ] raise: PRError.
	input := '${mock|option=bar}$'.
	self should: [ self parser parse: input ] raise: PRError
]

{ #category : #tests }
PRParserMockAnnotationTest >> testParseWithBadInterpretation [
	| input |
	input := '${mock:Foo|number=cinq}$'.
	self should: [ self parser parse: input ] raise: Error
]

{ #category : #tests }
PRParserMockAnnotationTest >> testParseWithInterpretation [
	| input expected |
	input := '${mock:value=Foo|number=5}$'.
	expected := PRMockAnnotation withParameters: (
		PRParameters withAll: { 
			PRParameter 
				keyNode: (PRParameterKey named: 'value')
				valueNode: (PRParameterValue value: 'Foo').
			PRParameter 
				keyNode: (PRParameterKey named: 'number')
				valueNode: (PRParameterValue value: 5) }).
	self
		assert:
			(self parser parse: input startingAt: #annotation)
		equals: expected
]

{ #category : #tests }
PRParserMockAnnotationTest >> testParseWithoutARequiredParameter [
	| input |
	input := '${mock}$'.
	self should: [ self parser parse: input ] raise: PRError
]

{ #category : #tests }
PRParserMockAnnotationTest >> testParseWithoutFirstKey [
	"an annotation can have a default parameter name that the user does not have to be forced to specify.
	 ${mock:Foo|number=5}$ means  ${mock:value=Foo|number=5}$ since mock defines defaultParameterName as 'value'.
	"

	| input expected |
	input := '${mock:value=Foo}$'.
	expected := PRMockAnnotation withParameters: (
		PRParameters withAll: { 
			PRParameter 
				keyNode: (PRParameterKey named: 'value')
				valueNode: (PRParameterValue value: 'Foo') }).
	expected hadAllKeys: false.
	self assert: (self parser parse: input startingAt: #annotation) equals: expected
]
