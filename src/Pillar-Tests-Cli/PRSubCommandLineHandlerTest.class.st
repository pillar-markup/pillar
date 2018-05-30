Class {
	#name : #PRSubCommandLineHandlerTest,
	#superclass : #TestCase,
	#category : 'Pillar-Tests-Cli'
}

{ #category : #tests }
PRSubCommandLineHandlerTest >> testAddingBaseDirectoryWithADash [
	|cli arguments |
	cli := PRSubCommandLineHandler new.
	arguments := Dictionary new.
	cli add: '--baseDirectory=/foo/bar-baz' to: arguments.
	self assert: (arguments at: 'baseDirectory') equals: '/foo/bar-baz'
]

{ #category : #tests }
PRSubCommandLineHandlerTest >> testAddingBaseDirectoryWithAnEqual [
	|cli arguments |
	cli := PRSubCommandLineHandler new.
	arguments := Dictionary new.
	cli add: '--baseDirectory=/foo/bar=baz' to: arguments.
	self assert: (arguments at: 'baseDirectory') equals: '/foo/bar=baz'
]
