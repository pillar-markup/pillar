Extension { #name : #PRRichTextComposer }

{ #category : #'*Pillar-PillarTextRichTextExporter' }
PRRichTextComposer class >> asText: aStreamOrString [
	^ self new
		start:
			(PRPillarParserMain
				initialize;
				parse: aStreamOrString asString)
]
