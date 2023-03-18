Extension { #name : #Trait }

{ #category : #'*Pillar-MicrodownToPillarConverter' }
Trait >> buildMicroDownUsing: aBuilder withComment: aString [
	
	aBuilder 
		header: [	aBuilder text: 'Trait: '.
					aBuilder text: self name] withLevel: 1;
		horizontalLine;
		text: aString
]
