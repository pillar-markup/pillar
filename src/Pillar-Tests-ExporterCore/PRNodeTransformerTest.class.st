"
Abstract class that should be subclassed for all subclasses of PRNodeTransformer.
"
Class {
	#name : #PRNodeTransformerTest,
	#superclass : #PRVisitorTest,
	#category : 'Pillar-Tests-ExporterCore-Transformers'
}

{ #category : #testing }
PRNodeTransformerTest class >> isAbstract [
	^ self = PRNodeTransformerTest 
]

{ #category : #private }
PRNodeTransformerTest >> actualClass [
	^ PRNodeTransformer
]

{ #category : #accessing }
PRNodeTransformerTest >> configuration [
	^ self configurationClass new
]

{ #category : #accessing }
PRNodeTransformerTest >> configurationClass [
	^ ConfigurationForPillar
]

{ #category : #transformation }
PRNodeTransformerTest >> executePhase: anInput [
	^ self executePhase: anInput with: self configuration
]

{ #category : #transformation }
PRNodeTransformerTest >> executePhase: anInput with: aConfig [
	^ (self actualClass
		executeOn:
			(PRCompilationContext withDocument: anInput withConfiguration: aConfig))
		input
]
