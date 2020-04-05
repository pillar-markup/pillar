"
This is not clear that forking also the PRPillarGrammarTest was a good idea. 
But let us start somewhere. 
"
Class {
	#name : #PRMicroDownGrammarTest,
	#superclass : #PP2CompositeNodeTest,
	#instVars : [
		'factory'
	],
	#category : #'Pillar-PetitMicroDown'
}

{ #category : #accessing }
PRMicroDownGrammarTest >> factory [

	^ factory
]

{ #category : #accessing }
PRMicroDownGrammarTest >> factory: aFactory [

	factory := aFactory
]

{ #category : #accessing }
PRMicroDownGrammarTest >> parserClass [
	^ PRMicroDownGrammar
]

{ #category : #running }
PRMicroDownGrammarTest >> setUp [ 
	super setUp.
	self factory: MicroDownSnippetFactory new.
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel1 [
	self parse: factory headerLevel1Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel2 [
	self parse: factory headerLevel2Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel3 [
	self parse: factory headerLevel3Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel4 [
	self parse: factory headerLevel4Sample rule: #header
]

{ #category : #'tests - header' }
PRMicroDownGrammarTest >> testHeaderLevel5 [
	self parse: factory headerLevel5Sample rule: #header
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScript [
	self parse: factory scriptSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameter [
	self
		parse: factory scriptParameterSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterEscape [
	self
		parse: factory scriptParameterEscapeSample
		rule: #parameterUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterTrueByDefault [
	self 
		parse: factory scriptParameterTrueByDefaultSample 
		rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterValue [
	self
		parse: factory scriptParameterValueSample
		rule: #parameterValueUntilNewline
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithFloat [
	self parse: factory scriptParameterWithFloatSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithNoValues [
	self parse: factory scriptParameterWithNoValuesSample rule: #script
]

{ #category : #'tests - codeblock' }
PRMicroDownGrammarTest >> testScriptParameterWithSpacesBeforeAndAfter [
	self
		parse: factory scriptParameterWithSpacesBeforeAndAfterSample
		rule: #scriptParameters
]
