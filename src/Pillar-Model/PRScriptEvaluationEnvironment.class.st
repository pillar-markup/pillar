"
A script evaluator
"
Class {
	#name : #PRScriptEvaluationEnvironment,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : 'Pillar-Model-Visitor'
}

{ #category : #'initialize-release' }
PRScriptEvaluationEnvironment >> setStream: aStream [
	stream := aStream
]
