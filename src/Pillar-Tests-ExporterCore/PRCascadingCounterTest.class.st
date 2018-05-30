"
I test the PRCascadingCounter class.
"
Class {
	#name : #PRCascadingCounterTest,
	#superclass : #TestCase,
	#category : 'Pillar-Tests-ExporterCore'
}

{ #category : #accessing }
PRCascadingCounterTest >> packageNamesUnderTest [
	^ #('Pillar-ExporterCore')
]

{ #category : #tests }
PRCascadingCounterTest >> testElementsForNonSimpleCounter [
	| counter |
	counter := PRCascadingCounter maxLevel: 5.
	self assert: counter elements equals: { 0 }.
	counter incrementAt: 2.
	self assert: counter elements equals: { 0 . 1 }
]

{ #category : #tests }
PRCascadingCounterTest >> testElementsForSimpleCounter [
	| counter |
	counter := PRCascadingCounter maxLevel: 5.
	self assert: counter elements equals: { 0 }.
	counter incrementAt: 1.
	self assert: counter elements equals: { 1 }
]

{ #category : #tests }
PRCascadingCounterTest >> testIsValidCounter [
	self assert: (PRCascadingCounter maxLevel: 5) isValidCounter.
	self deny: (PRNotFoundCounter maxLevel: 5) isValidCounter
]
