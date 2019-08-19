"
A script evaluator
"
Class {
	#name : #PRScriptEvaluationEnvironment,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'Pillar-CodeBlockEvaluator'
}

{ #category : #'initialize-release' }
PRScriptEvaluationEnvironment >> setStream: aStream [
	stream := aStream
]
