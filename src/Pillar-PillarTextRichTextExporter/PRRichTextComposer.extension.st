Extension { #name : #PRRichTextComposer }

{ #category : #'*Pillar-PillarTextRichTextExporter' }
PRRichTextComposer class >> asText: aStreamOrString [
	self flag: #toBeFixed.
	"we do not want to go from pillar text to richText." 
	^ self new
		start:
			(PRPillarParserMain
				initialize;
				parse: aStreamOrString asString)
]
