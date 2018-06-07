Class {
	#name : #PRMockAnnotationTest,
	#superclass : #PRAbstractAnnotationTest,
	#category : 'Pillar-Tests-Model-Document'
}

{ #category : #helpers }
PRMockAnnotationTest >> actualClass [
	^ PRMockAnnotation
]

{ #category : #helpers }
PRMockAnnotationTest >> referenceParameters [
	^ OrderedDictionary new
		add: 'value' -> 'Foo';
		add: 'number' -> '5';
		yourself
]

{ #category : #helpers }
PRMockAnnotationTest >> referenceString [
	^ 'mock:value=Foo|number=5'
]

{ #category : #tests }
PRMockAnnotationTest >> testParseUndclaredParametersShouldRaiseAnError [
	| input |
	input := '${mock:Foo|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.
	input := '${mock:Foo|option=bar|toto=4}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError.
	input := '${mock|option=bar}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError
]

{ #category : #tests }
PRMockAnnotationTest >> testParseWithBadInterpretation [
	| input |
	input := '${mock:Foo|number=cinq}$'.
	self should: [ PRDocument parser parse: input ] raise: Error
]

{ #category : #tests }
PRMockAnnotationTest >> testParseWithInterpretation [
	| input expected |
	input := '${mock:Foo|number=5}$'.
	expected := PRMockAnnotation new.
	expected parameters
		at: 'value' put: 'Foo';
		at: 'number' put: 5.
	self
		assert:
			(PRDocument parser parse: input startingAt: #annotation)
		equals: expected
]

{ #category : #tests }
PRMockAnnotationTest >> testParseWithoutARequiredParameter [
	| input |
	input := '${mock}$'.
	self should: [ PRDocument parser parse: input ] raise: PRError
]

{ #category : #tests }
PRMockAnnotationTest >> testParseWithoutFirstKey [
	"an annotation can have a default parameter name that the user does not have to be forced to specify.
	 ${mock:Foo|number=5}$ means  ${mock:value=Foo|number=5}$ since mock defines defaultParameterName as 'value'.
	"

	| input expected |
	input := '${mock:Foo}$'.
	expected := PRMockAnnotation new.
	expected hadAllKeys: false.
	expected parameters at: 'value' put: 'Foo'.
	self assert: (PRDocument parser parse: input startingAt: #annotation) equals: expected
]
