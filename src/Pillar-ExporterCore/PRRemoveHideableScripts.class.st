"
I visit a document and I hide scripts with ==hideable== parameter at ==true==.
"
Class {
	#name : #PRRemoveHideableScripts,
	#superclass : #PRNodeTransformer,
	#category : #'Pillar-ExporterCore-Transformers'
}

{ #category : #'visiting-document' }
PRRemoveHideableScripts >> visitCodeblock: aCodeBlock [
	(aCodeBlock isHideable)
		ifTrue: [ self delete ]
]
