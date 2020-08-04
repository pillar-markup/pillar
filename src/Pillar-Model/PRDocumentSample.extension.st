Extension { #name : #PRDocumentSample }

{ #category : #'*Pillar-Model' }
PRDocumentSample >> superscript [
	^ self withFormat: PRSuperscriptFormat 
]

{ #category : #'*Pillar-Model' }
PRDocumentSample >> underline [
	^ self withFormat: PRUnderlineFormat 
]
