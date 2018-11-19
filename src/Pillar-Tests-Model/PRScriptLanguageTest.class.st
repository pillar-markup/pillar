Class {
	#name : #PRScriptLanguageTest,
	#superclass : #TestCase,
	#category : 'Pillar-Tests-Model-ScriptLanguage'
}

{ #category : #tests }
PRScriptLanguageTest >> testEquals [
	self assert: (PRAbstractScriptLanguage for: 'smalltalk') = (PRAbstractScriptLanguage for: 'smalltalk')
]

{ #category : #tests }
PRScriptLanguageTest >> testFinding [
	self assert: (PRAbstractScriptLanguage concreteClassFor: '') equals: PRNoScriptLanguage.
	self assert: (PRAbstractScriptLanguage concreteClassFor: '') default isSpecified.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'no language') equals: PRNoScriptLanguage.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'no language') default isSpecified.
	self assert: (PRAbstractScriptLanguage concreteClassFor: nil) equals: PRUnspecifiedScriptLanguage.
	self assert: (PRAbstractScriptLanguage concreteClassFor: nil) default isSpecified not.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'smalltalk') equals: PRSmalltalkScriptLanguage.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'smalltalk') default isSpecified.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'html') equals: PRHTMLScriptLanguage.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'html') default isSpecified.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'HTML') equals: PRHTMLScriptLanguage.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'HTML') default isSpecified.
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'non existing language foobar') equals: PRUnsupportedScriptLanguage .
	self assert: (PRAbstractScriptLanguage concreteClassFor: 'non existing language foobar') new isSpecified not.
]
