"
I replace each script with ==eval=true== with the result of its evaluation.
"
Class {
	#name : #PRScriptEvaluator,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'visiting-document' }
PRScriptEvaluator >> visitCodeblock: aCodeBlock [
	aCodeBlock isEvaluated
		ifTrue: [ self replace: aCodeBlock evaluate ]
]
