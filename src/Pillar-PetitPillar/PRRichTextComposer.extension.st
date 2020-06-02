Extension { #name : #PRRichTextComposer }

{ #category : #'*Pillar-PetitPillar' }
PRRichTextComposer class >> asText: aStreamOrString [
	^ self new
		start:
			(PRPillarParserMain
				initialize;
				parse: aStreamOrString asString)
]
