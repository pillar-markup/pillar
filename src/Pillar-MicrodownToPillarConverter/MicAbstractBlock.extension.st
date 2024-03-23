Extension { #name : 'MicAbstractBlock' }

{ #category : '*Pillar-MicrodownToPillarConverter' }
MicAbstractBlock >> pillarFrom: aCollectionOfMicElements [
	
	^ aCollectionOfMicElements collect: [ :e | e accept: MicMicrodownObjectToPillarObjectConverter new ]
]

{ #category : '*Pillar-MicrodownToPillarConverter' }
MicAbstractBlock >> pillarFromString: aString [
	
	^ MicInlineParser new pillarFrom: aString
]
