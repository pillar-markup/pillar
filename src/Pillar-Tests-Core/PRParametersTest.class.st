Class {
	#name : #PRParametersTest,
	#superclass : #TestCase,
	#category : #'Pillar-Tests-Core'
}

{ #category : #tests }
PRParametersTest >> testAsDictionary [
	| p dict |
	p :=  PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'name')
			valueNode: (PRParameterValue value: 'card').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 10).
		PRParameter 
			keyNode: (PRParameterKey named: 'string')
			valueNode: (PRParameterValue value: 'a string').
		PRParameter 
			keyNode: (PRParameterKey named: 'boolean')
			valueNode: (PRParameterValue value: true).
		}.
	dict := p asDictionary. 
	self assert: (dict at: 'name') equals: 'card'.
	self assert: (dict at: 'number') equals: 10.
]

{ #category : #tests }
PRParametersTest >> testParameters [
	| p |
	p :=  PRParameters withAll: { 
		PRParameter 
			keyNode: (PRParameterKey named: 'name')
			valueNode: (PRParameterValue value: 'card').
		PRParameter 
			keyNode: (PRParameterKey named: 'number')
			valueNode: (PRParameterValue value: 10).
		PRParameter 
			keyNode: (PRParameterKey named: 'string')
			valueNode: (PRParameterValue value: 'a string').
		PRParameter 
			keyNode: (PRParameterKey named: 'boolean')
			valueNode: (PRParameterValue value: true).
		}.
	self assert: p parameters size equals: 4
]
