Extension { #name : #Path }

{ #category : #'*Pillar-ExporterCore' }
Path >> lookup: lookupBlock ifNone: noneBlock [
	"Detect a job that satisfies the lookupBlock, or value noneBlock if none satisfies. 
	The lookup starts at myself, following recursevely through my parent."

	(lookupBlock value: self) ifTrue: [ ^ self ].
		
	^ self isEmpty 
		ifTrue: noneBlock 
		ifFalse: [ self parent lookup: lookupBlock ifNone: noneBlock ]
]
