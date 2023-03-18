Extension { #name : #MicElement }

{ #category : #'*Pillar-MicrodownToPillarConverter' }
MicElement >> asPillar [

	^ self accept: MicMicrodownObjectToPillarObjectConverter new
]
